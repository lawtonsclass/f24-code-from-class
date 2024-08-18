#include <stdio.h>

struct blah {
  double x;
  int y;
};

int main() {
  struct blah b;

  int distance = (void*)&b.y - (void*)&b;
  printf("%d\n", distance);

  printf("%p %p\n", &b, &b.x);

  return 0;
}
