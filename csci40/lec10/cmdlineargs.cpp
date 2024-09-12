#include <iostream>
using namespace std;

// argc: argument count: # of cmd line arguments
// argv: argument vector: contents of cmd line args (as C-strings)
//       (an array of C-strings)
int main(int argc, char* argv[]) {
  cout << argc << endl; 

  // let's iterate through argv
  for (int i = 0; i < argc; i++) {
    cout << "argv[" << i << "]: " << argv[i] << endl;
  }

  return 0;
}
