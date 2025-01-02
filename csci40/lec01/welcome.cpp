#include <iostream>
#include <cstdlib>
#include <ctime>
#include <cctype>
#include <string>
#include <thread>
using namespace std;
using namespace std::chrono_literals;

char randomPrintableCharacter() {
  char c = rand() % 128;
  while (!isprint(c)) {
    c = rand() % 128;
  }
  return c;
}

void ungarble(string& garbled, const string& text) {
  for (int i = 0; i < text.size(); i++) {
    // if this index is still wrong, try another random character
    if (garbled.at(i) != text.at(i)) {
      garbled.at(i) = randomPrintableCharacter();
    }
  }
}

int main() {
  srand(time(0));

  string text = "Welcome to CSCI 40!";
  string garbled = string(text.size(), '?');
  cout << garbled << flush;

  while (garbled != text) {
    ungarble(garbled, text);
    cout << '\r' << garbled << flush;
    this_thread::sleep_for(100ms);
  }

  cout << endl;

  return 0;
}
