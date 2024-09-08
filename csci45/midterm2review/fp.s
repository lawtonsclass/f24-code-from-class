.global main
.type main, %function
main:
  sub sp, sp, #16
  str lr, [sp]

  // scanf("%lf", &num_from_user);
  ldr x0, =scanf_fmt
  ldr x1, =num_from_user
  bl scanf

  ldr x1, =num_from_user
  ldr d0, [x1]
  fmov d1, #2.0
  ldr x1, =pi
  ldr d2, [x1]
  fmul d0, d0, d1 // d0 = 2 * r
  fmul d0, d0, d2 // d0 = 2 * pi * r

  // printf("%f\n", *num_from_user);
  // the format string goes in x0 as usual
  // printf expects the double arg in d0, and it's already there
  ldr x0, =fmt
  bl printf

  mov w0, #0
  ldr lr, [sp]
  add sp, sp, #16
  ret

.data
scanf_fmt: .asciz "%lf"
num_from_user: .double 0.0
pi: .double 3.1416 
fmt: .asciz "%f\n"
