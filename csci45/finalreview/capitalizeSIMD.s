.global main
.type main, %function
main:
  sub sp, sp, #16
  str lr, [sp]

  ldr x0, =str
  // load 8-bit data in order into v0 (v0 can fit 16 8-bit things)
  ld1 {v0.16B}, [x0]

  ldr x1, =offsets
  ld1 {v1.16B}, [x1]

  sub v0.16B, v0.16B, v1.16B

  // store back the updated string
  st1 {v0.16B}, [x0]

  // x0 already has the starting addr of the string
  bl printf

  mov w0, #0
  ldr lr, [sp]
  add sp, sp, #16
  ret

.data
str: .asciz "abcdefghijklmnop\n"
offsets: .byte 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
