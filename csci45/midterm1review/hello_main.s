.global main
.type main, %function
main:
  sub sp, sp, #16
  str lr, [sp]

  // printf(str);
  // the first 8 args go in x0-x7
  ldr x0, =str
  bl printf // clobbers lr

  // clean up stack & restore lr
  ldr lr, [sp]
  add sp, sp, #16

  // return 0
  mov w0, #0
  ret // this jumps to the return address of main

.data
str: .asciz "Hello, world!\n"
