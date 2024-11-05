#include <iostream>
#include <vector>
using namespace std;

int main() {
  vector<int> v = {4, 5, 6}; 

  try {
    cout << v.at(3) << endl;
    cout << v.at(2) << endl; // this line will never run
    cout << v.at(4) << endl;
  } catch (out_of_range& e) {
    // C++ jumps here if an out_of_range exception occurs in the try block
    // handle the exception...
    cout << "Uh oh\n";
    cout << e.what() << endl;
  }

  return 0;
}
