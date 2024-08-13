#include <iostream>
#include <vector>
using namespace std;

class Statistician {
  public:
    // operations
    void init();
    void addNumber(int n);
    int getMax();
    double average();

    // data
    int count;
    int currentMax;
    vector<int> nums;
};

void Statistician::init() {
  nums = {42};
  count = 1;
  currentMax = 42;
}

void Statistician::addNumber(int n) {
  nums.push_back(n);
  count++;
  if (count == 1) {
    currentMax = n; // the first number
  } else if (n > currentMax) {
    currentMax = n; // we just saw a bigger number
  }
}

int Statistician::getMax() {
  return currentMax;
}

double Statistician::average() {
  double avg = 0.0;

  for (int n : nums) avg += n;

  avg = avg / count;

  return avg;
}

int main() {
  Statistician s;
  s.init();

  while (true) {
    cout << "Enter the next number (-1 to quit): ";
    int n;
    cin >> n;

    if (n == -1) {
      break;
    } else {
      s.addNumber(n);
    }
  }

  cout << s.count << endl;
  cout << s.getMax() << endl;
  for (int num : s.nums) {
    cout << num << " ";
  }
  cout << endl;
  cout << s.average() << endl;

  return 0;
}
