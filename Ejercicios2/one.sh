#documento.sh corre todas las intrucciones que hay en la computadora
#!/bin/sh
as --32 $1.s -o $1.o
ld -melf_i386 $1.o -o $1
./$1
echo $? 
