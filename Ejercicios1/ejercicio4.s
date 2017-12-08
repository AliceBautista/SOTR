.section .data

data_items:                 
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start

_start:
    movl $0,%edi                    # move 0 into the index register
    movl data_items(,%edi,4),%eax   # load the first byte data
    movl %eax, %ebx                 # since this is the first item, %eax is
                                    # the biggest
start_loop:                         # start loop
    movl %ebx,%esi                  #
    cmpl $data_items_end, %ecx
    
loop_exit:
    movl $1,%eax
    int $0x80
    
