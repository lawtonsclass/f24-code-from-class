#include <iostream>
#include "counter.h"
using namespace std;

int main() {
  init_counter();
  inc();
  inc();
  inc();
  dec();
  cout << get_count() << endl;

  return 0;
}
