.global _start
_start:
  // write syscall
  mov x8, #64
  mov w0, #1
  ldr x1, =str
  mov x2, #14
  svc #0 // actually perform the syscall

  // exit with a 0 return code
  mov x8, #93
  mov w0, #0
  svc #0

.data
str: .ascii "Hello, world!\n"
