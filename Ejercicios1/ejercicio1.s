.section .data

data_items:                    
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start

_start:
    movl $0,%edi                    # move 0 into the index register
    movl data_items(,%edi,4),%eax   # load the first byte data
    movl %eax, %ebx                 # since this is the first item, %eax is
                                    # the smallest
start_loop:                         # start loop
    cmpl $0,%eax                    
    je loop_exit
    incl %edi                       # increment index register
    movl data_items(,%edi,4),%eax   # move data to %eax
    cmpl %ebx,%eax                  # compare values
    jle start_loop                  # jump to loop beginning if the new one
                                    # isnt bigger
    movl $3, %ebx                 
    jmp start_loop                  # jump to loop beginning
    
loop_exit:
    movl $1,%eax
    int $0x80
    
