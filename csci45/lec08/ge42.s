.global main
.type main, %function
main:
  sub sp, sp, #16 
  str lr, [sp]

  // let's get a # from the user and store it on the stack!
  // we already have room on the stack for 1 new int--we could use sp+8
  // for fun, we'll allocate extra stack memory
  // we only need 4 bytes for an int
  // scanf("%d", &i);
  sub sp, sp, #16 
  ldr x0, =fmt
  mov x1, sp
  bl scanf

  // the top of the stack has been set to whatever the user
  // typed--let's put it in w0 (b/c it's an int) and clean up our stack
  ldr w0, [sp]
  add sp, sp, #16 
  cmp w0, #42
  b.ge ge42
lt42:
  ldr x0, =string2  
  bl printf
  b.al done
ge42:
  ldr x0, =string1  
  bl printf
done:

  mov w0, #0
  ldr lr, [sp]
  add sp, sp, #16 
  ret

.data
fmt: .asciz "%d"
string1: .asciz ">= 42!\n"
string2: .asciz "< 42!\n"
