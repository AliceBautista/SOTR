#PURPOSE:
#
#

.section .data

.section .text

.globl _start
_start:
pushl $3       #push second argument
pushl $2       #push first argument
call power     #call the function
addl $8, %esp  #move the stack poiter back
pushl %eax     #save the first answer befor calling the next function


pushl $2       #push second argument
pushl $5       #push first argument
call power     #call the function
addl $8, %esp
popl %ebx      #the second answer is already in %eax. We saved the first answer

addl %eax, %ebx   #add them together the resultis in %ebx

movl $1, %eax     #exit(%ebx is returned)
int $0x80
