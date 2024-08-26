.global _start
_start:
  // let's put into w0 the return code that we want to exit with
  // (so we'll sum 1 to 10 into w0)

  mov w0, #0
  mov w1, #1 // for (w1 = 1; w1 <= 10; w1++)
loop:
  cmp w1, #10
  b.gt done // branch based on the comparison--branch if greater than
  // w0 = w0 + w1;
  add w0, w0, w1
  // w1++;
  add w1, w1, #1
  // continue the loop again
  b.al loop

done:
  mov x8, #93
  // the value in w0 will be our exit code
  svc #0
