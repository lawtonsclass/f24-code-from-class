.global main
.type main, %function
main:
  sub sp, sp, #16 
  str lr, [sp]
  // we're going to use a saved register (x19)
  // we have to save it so we can restore before we return
  str x19, [sp, #8]

  // srand(time(0))
  mov x0, #0
  bl time
  bl srand

  // print 50 random #s
  mov x19, #0
  // our counter variable needs to go in a saved register because the
  // functions that we call can clobber x0-x18. We have to save and
  // restore the original x19!!!

loop:
  cmp x19, #50
  b.ge done

  // call rand() and print the #
  bl rand
  // rand returns an int (so w0)
  
  // printf("%d\n", rand_result)
  mov w1, w0
  ldr x0, =fmt
  bl printf // allowed to clobber all scratch registers!

  add x19, x19, #1
  b.al loop

done:
  mov w0, #0
  ldr lr, [sp]
  add sp, sp, #16 
  ret

.data
fmt: .asciz "%d\n"
