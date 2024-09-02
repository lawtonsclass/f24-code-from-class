.global bwSIMD
.type bwSIMD, %function
bwSIMD:
  sub sp, sp, #16
  str lr, [sp]
  
  // FIXME: implement the void bwSIMD(char* pixelsStart, int numPixels)
  // function to darken numPixels pixels starting at pixelsStart. Do
  // this by halving the value in each color channel. numPixels is
  // guaranteed to be a multiple of 16 so that you can use 128-bit registers.

  ldr lr, [sp]
  add sp, sp, #16
  ret
