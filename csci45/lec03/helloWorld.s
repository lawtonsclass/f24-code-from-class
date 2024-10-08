.global _start  // _start is a global label
_start:
  // let's print "Hello, world!\n" to stdout
  mov x8, #64 // write syscall is #64
  mov w0, #1 // file #1 is stdout
  ldr x1, =hello_string // add of string goes in x1
  mov x2, #14 // # of chars to print from the string at the starting addr given in x1
  svc #0 // run the syscall I just set up

  mov w0, #0  // move the value to return into w0
  mov x8, #93  // move 93 into the register x8
  // 93 is the code for the "exit" system call
  svc #0  // hey Linux kernel, please execute the system call that I just set up!

.data

hello_string: .ascii "Hello, world!\n"
