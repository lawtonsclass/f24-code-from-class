#include <iostream>
#include <fstream>
#include <string>
using namespace std;

extern "C" void swapColorsSIMD(char* pixelsStart, int numPixels);
extern "C" void bwSIMD(char* pixelsStart, int numPixels);

int main(int argc, char* argv[]) {
  if (argc != 4 || (string(argv[1]) != "swap" && string(argv[1]) != "bw")) {
    cout << "Usage: " << argv[0] << " op input.bmp output.bmp\n";
    cout << "  where op is either \"swap\" or \"bw\"\n";
    return 1;
  }

  // put the input file into an array of bytes
  ifstream inputImage(argv[2], ios_base::binary);
  // get length of file:
  inputImage.seekg (0, inputImage.end);
  int length = inputImage.tellg();
  inputImage.seekg (0, inputImage.beg);
  // allocate memory (with extra length so SIMD doesn't segfault:
  char* bmpImage = new char[length + 15*3];
  // read data into buffer
  inputImage.read (bmpImage,length);
  inputImage.close();
  
  // The image is now stored in bmpImage.
  // Important offsets into the image:
  // - 0x0A (int): offset where the image begins (i.e., the first pixel)
  // - 0x12 (int): width of image in pixels
  // - 0x16 (int): height of image in pixels
   
  int imageStart = *(int *)(bmpImage + 0xA);
  int width = *(int *)(bmpImage + 0x12);
  int height = *(int *)(bmpImage + 0x16);
  
  // Each row of pixels is NOT NECESSARILY width*3 bytes--the next row
  // starts at an offset that is a multiple of 4!
  int rowSize = width*3;
  while ((rowSize & 0b11) != 0) rowSize++;

  // NEON-specific stuff:
  //   We want to use 3 128-bit SIMD registers to hold our R, G, and B
  //   channels, and that means together they will hold 128/8 = 16
  //   pixels. We can process 16 pixels at a time! But if we have a
  //   width that isn't an exact multiple of 16, we have to round up.
  int numberOfPixelsPerRowRoundedDownToTheNearestMultipleOf16 = width & (~0xF);
  int numberOfPixelsPerRowLeftOver = width & (0xF);
  int numberOfPixelsToProcess = numberOfPixelsPerRowRoundedDownToTheNearestMultipleOf16;
  if (numberOfPixelsPerRowLeftOver > 0) numberOfPixelsToProcess += 16;

  // use your filter
  for (int row = 1; row <= height; row++) {
    char* rowStart = bmpImage + imageStart + (row - 1)*rowSize;
    char* rowEnd = rowStart + width*3;
    char* rowEndRoundedUpToTheNearestMultipleOf16Pixels = rowStart + numberOfPixelsToProcess*3;

    char leftOverMemoryToSave[15*3];
    if (numberOfPixelsPerRowLeftOver > 0) {
      // save the memory that shouldn't have been updated
      for (int i = 0; i < 15 * 3; i++) {
        leftOverMemoryToSave[i] = rowEnd[i];
      }
    }

    if (string(argv[1]) == "swap")
      swapColorsSIMD(rowStart, numberOfPixelsToProcess);
    else
      bwSIMD(rowStart, numberOfPixelsToProcess);

    if (numberOfPixelsPerRowLeftOver > 0) {
      // restore the memory that shouldn't have been updated
      for (int i = 0; i < 15 * 3; i++) {
        rowEnd[i] = leftOverMemoryToSave[i];
      }
    }
  }

  // save the updated image in the output ifle
  ofstream outputImage(argv[3], ios_base::binary);
  outputImage.write(bmpImage, length);
  outputImage.close();

  return 0;
}
