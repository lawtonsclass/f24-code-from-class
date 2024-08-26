.global _start
_start:
  // get 3 chars from the user with the read syscall
  // (really 4 chars total because we have to eat up the \n char)
  // read syscall
  mov x8, #63
  mov w0, #0
  ldr x1, =str
  mov x2, #4
  svc #0

  // write what we just read
  mov x8, #64
  mov w0, #1
  ldr x1, =str
  mov x2, #4
  svc #0 // actually perform the syscall

  mov x8, #93
  mov w0, #0
  svc #0

.data
str: .ascii "XXXX"
