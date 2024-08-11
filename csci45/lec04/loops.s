.global _start  // _start is a global label
_start:
  mov x0, #10

loopstart:
  cmp x0, #1
  b.lt done // this is the opposite of the loop condition--exit when this is true
  // loop body
  sub x0, x0, #1
  b.al loopstart
done:

  ///////////////////////////////////// 4x4 box of stars

  /*
    int i = 1;
    while (i <= 4) {
      int j = 1;
      while (j <= 4) {
        cout << '*';
        j++;
      }
      cout << '\n';
      i++;
    }
  */

  // let's put i in x19 and j in x20 (those are guaranteed to not be messed with by any syscall)
  mov x19, #1
outerloop:
  cmp x19, #4
  b.gt outerloopdone

  // body of outer loop
  mov x20, #1
innerloop:
  cmp x20, #4
  b.gt innerloopdone

  // body of the inner loop
    // print a single star
      mov x8, #64 // write syscall is #64
      mov w0, #1 // file #1 is stdout
      ldr x1, =star // addr of string goes in x1
      mov x2, #1 // # of chars to print from the string at the starting addr given in x1
      svc #0 // run the syscall I just set up
    // increment j
      add x20, x20, #1
    // jump back to the start of the inner loop
      b.al innerloop
innerloopdone:

  // inner loop has finished
  // print newline
    mov x8, #64 // write syscall is #64
    mov w0, #1 // file #1 is stdout
    ldr x1, =newline // addr of string goes in x1
    mov x2, #1 // # of chars to print from the string at the starting addr given in x1
    svc #0 // run the syscall I just set up
  // increment i
    add x19, x19, #1
  // jump back to the start of the outer loop
    b.al outerloop
outerloopdone:

  // exit (0)
  mov w0, #0  // move the value to return into w0
  mov x8, #93  // move 93 into the register x8
  // 93 is the code for the "exit" system call
  svc #0  // hey Linux kernel, please execute the system call that I just set up!

.data
star: .ascii "*"
newline: .ascii "\n"
