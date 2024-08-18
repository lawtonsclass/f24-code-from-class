#include <stdio.h>
#include <sys/sysinfo.h>

int main(int argc, char* argv[]) {
  struct sysinfo test;
  printf("%ld\n", sizeof(test));
  printf("%ld\n", sizeof(test.uptime));

  unsigned long totalram_addr = (unsigned long)&test.totalram;
  unsigned long starting_addr = (unsigned long)&test;
  printf("%ld\n", totalram_addr - starting_addr);

  return 0;
}
