#include <iostream>
#include "add1.h" // now I can use the add1 func
using namespace std;

int main() {
  cout << "Enter a number: ";
  int n;
  cin >> n;
  
  cout << add1(n) << endl;

  return 0;
}
