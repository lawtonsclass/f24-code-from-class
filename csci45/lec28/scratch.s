.global _start  // _start is a global label
_start:
  add x0, x0, #0 // nop -- no operation -- this instruction does nothing

  /* this is a 
     multi-line comment */
  mov w0, #55  // (move 55 into the register w0) w0 = 55;
  mov x8, #93  // move 93 into the register x8
  // 93 is the code for the "exit" system call
  svc #0  // hey Linux kernel, please execute the system call that I just set up!
