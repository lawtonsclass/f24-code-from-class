#include <iostream>
#include <vector>
using namespace std;

int sum_vector(const vector<int>& v) {
  // v.at(0) = 42; // we'd like this to be impossible

  int sum = 0;

  for (int elem : v) {
    sum += elem;
  }

  return sum;
}

int main() {
  int x = 42;
  const int y = x;
  x++;
  // y++;

  vector<int> v = {1, 2, 3, 4, 5};
  cout << sum_vector(v) << endl;

  return 0;
}
