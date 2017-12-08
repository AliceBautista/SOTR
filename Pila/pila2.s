#PURPOSE:
#
#

.section .data

.section .text

.globl _start
_start:
pushl $3  #push second argument
pushl $2    #push first argument
call power     #call the function
addl $8, %esp  #move the stack poiter back
pushl %eax  #save the first answer befor calling the next function


pushl $2  #push second argument
pushl $5  #push first argument
call power   #call the function

addl $8, %esp

popl %ebx   #the second answer is already
            #in %eax. We saved the first answer


addl %eax, %ebx   #add them together
                  #the resultis in %ebx


movl $1, %eax  #exit(%ebx is returned)
int $0x80



.type power,@function
power:
pushl %ebp     #seve old base poiter
movl %esp, %ebp #make stack poiter the base pointer
subl $4, %esp   #get room for our local storage

movl 8(%ebp), %ebx  #put first argument in %eax
movl 12(%ebp), %ecx   #put second argument in %ecx

movl %ebx, -4(%ebp)  #store current result(se guarda la base)


power_loop_start:   
cmpl $1, %ecx        #if the power is 1,we are done 
je end_power
movl _4(%ebp), %eax   #move the current result into %eax
imull %ebx, %eax      #multiply the current result bye the base number

movl %eax, -4(%ebp)   #store the current result

decl %ecx             #decrease the power (contiene la potencia que se quiere obtener)
jmp power_loop_start  #run for de next power

end_power:
movl -4(%ebp), %eax  #return value goes in %eax
movl %ebp, %esp      #restore the stack pointer
popl %ebp            #restore the base pointer
ret                  #retorno





