
.global main			     // no more _start
.type main, %function	 // main is a function
main:				           // main starts here
  // lr (x30) holds the addr for main to return to; we need to save it
  // if we want to call other function
  sub sp, sp, #16 // make room on the stack for 16 bytes (always must be a multiple of 16!!!)
  // now there's room at [sp] and [sp, #8]--we can store lr at either spot
  str lr, [sp]

  mov x8, #179 // sysinfo
  ldr x0, =sysinfostruct
  svc #0

  // extract uptime, totalram, and freeram into x1, x2, and x3
  ldr x0, =sysinfostruct
  ldr x1, [x0] // uptime
  ldr x2, [x0, #32] // totalram
  ldr x3, [x0, #40] // freeram

  // printf("%lu %lu %lu\n", x1, x2, x3)
  ldr x0, =printint
  bl printf

  // return 0 (ints are 32 bits, so we use w0)
  mov w0, #0

  // return from main
  ldr lr, [sp] // restore the old lr
  add sp, sp, #16 // reset the stack
  ret // jump to the addr stored in lr

.data
printint: .asciz "%lu %lu %lu\n" // makes a C-string for us!
sysinfostruct: .quad 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
