.global main
.type main, %function
main:
  sub sp, sp, #16
  str lr, [sp]

  // call plus1(42) so we can print that result
  mov w0, #42
  bl plus1
  // w0 now holds the result!
  // let's print the value in w0

  // printf("%d\n", w0)
  // the first 8 args go in x0-x7
  mov w1, w0 // the result
  ldr x0, =str
  bl printf // clobbers lr

  // clean up stack & restore lr
  ldr lr, [sp]
  add sp, sp, #16

  // return 0
  mov w0, #0
  ret // this jumps to the return address of main

// int plus1(int x);
.global plus1
.type plus1, %function
plus1:
  // let's make room on the stack to do our intermediate work
  // sp stores a pointer to the top of the stack, and the stack grows
  // "down"
  // we need to make room for 4 more bytes, but every time you
  // subtract from sp it has to be a multiple of 16
  sub sp, sp, #16
  // so now we have room in [sp], [sp, #4], [sp, #8], [sp, #12]

  // our argument is in w0
  str w0, [sp]

  ldr w1, [sp]
  add w1, w1, #1
  // store the answer back
  str w1, [sp]

  // our return value goes in w0
  ldr w0, [sp]
  // remember to clean up any local vars from the stack!
  add sp, sp, #16

  ret

.data
str: .asciz "%d\n"
