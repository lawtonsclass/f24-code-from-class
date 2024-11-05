#include <iostream>
#include <numeric>
#include <algorithm>
#include <vector>
using namespace std;

int square(int x) {
  return x * x;
}

int main() {
  int n;
  cout << "Enter n: ";
  cin >> n;

  // create a range of numbers from 1 to n
  vector<int> nums(n);
  std::iota(nums.begin(), nums.end(), 1);

  // square each num, creating a new range
  // overwrite nums because breaking the rules gives you the most power
  std::transform(nums.begin(), nums.end(), nums.begin(), square);
  // we just passed a function to a function!!!

  // sum the squared values in nums
  int sum = accumulate(nums.begin(), nums.end(), 0);
  cout << sum << endl;

  //////////////////////////////////
  
  // lambdas: functions without a name
  
  // create a range of numbers from 1 to n
  vector<int> nums2(n);
  std::iota(nums2.begin(), nums2.end(), 1);

  // square each num, creating a new range
  // overwrite nums2 because breaking the rules gives you the most power
  std::transform(nums2.begin(), nums2.end(), nums2.begin(), [](int x){ return x*x; });

  // sum the squared values in nums2
  int sum2 = accumulate(nums2.begin(), nums2.end(), 0);
  cout << sum2 << endl;
  
  return 0;
}
