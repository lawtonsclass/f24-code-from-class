#include <iostream>
#include <string>
#include <cctype> // toupper, isdigit
using namespace std;

int main() {
  cout << "Enter a word: ";
  string s;
  cin >> s;

  // capitalize the first char of s
  s.at(0) = toupper(s.at(0));
  cout << s << endl;

  // check if last char was a digit
  if (isdigit(s.at(s.size() - 1))) {
    cout << "s ends with a number!\n";
  } else {
    cout << "s doesn't end with a number!\n";
  }

  return 0;
}
