.section .data

data_items:                   
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,255

.section .text

.globl _start

_start:
    movl $0,%edi                    # move 0 into the index register
    movl data_items(,%edi,4),%eax   # load the first byte data
    movl %eax, %ebx                 # since this is the first item, %eax is
                                    # the biggest
start_loop:                         # start loop
    incl %edi                       # increment index register
    movl data_items(,%edi,4),%eax   # move data to %eax
    cmpl $255,%eax                  
    je loop_exit
    cmpl %ebx,%eax                  # compare values
    jle start_loop                  # jump to loop beginning if the new one
                                    # isnt smaller
    movl %eax, %ebx                 # move the value as the largest
    jmp start_loop                  
    
loop_exit:
    movl $1,%eax
    int $0x80
    
