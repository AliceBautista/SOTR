#include <stdio.h>
#include <stdlib.h>
union {
  float f;
  int i;
}mistery;

long main(int argc,char *argv[]){
    float floatA=atof(argv[1]);
    int i; 
    mistery.f=floatA;
    //printf("sizeof(float)=%d\n",sizeof(float)); //muestra el tamaño del float
    //for(i=8*sizeof(float)-1;i>=0;i--)
    for(i=31;i>=0;i--){
    printf("%d",(mistery.i>>i)&0x00000001);
    }
    printf("\n");
    return floatA; 
}
