#include <stdio.h>

typedef
struct myfloat{
    unsigned sing     :1;
    unsigned power    :8;
    unsigned mantisa  :23;
}Myfload;

struct four_chars{
    unsigned char   abcd0;
    unsigned char   abcd1;
    unsigned char   abcd2;
    unsigned char   abcd3
}

union UFloat{
    MyFloat MyF;
    struct four_chars FourChars;
}

void show_bits(int):

long main(){
    int intA=10;
    show bits(intA);
    printf("\n");
    float floatA=7.5;
    intA=*((int*)(&floatA)):
    show bits(intA);
    printf("/n");
    Myfload MyF;
    printf("sizeof(MyF)=%d\n",sizeof(MyF));
    return 0;
    }//end main()