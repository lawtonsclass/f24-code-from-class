#include <iostream>
using namespace std;

// C++, please use the C-style labels
// (just use sumArray as the name of the label for where this func begins)
extern "C" void convert_to_all_caps(char* str);

int main() {
  char str[] = "hello, world!\n";

  convert_to_all_caps(str);

  cout << str;

  return 0;
}
