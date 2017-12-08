#include <stdio.h>
//#define SEPT_6

typedef
struct myfloat{      //estructura que tiene campos de bits
    unsigned mantisa  :23; //bits menos significativos
    unsigned power    :8;
    unsigned sing     :1; //bit mas significativo
}MyFloat; //alias8

struct four_chars{ //estructura de 4 caratcteres
    unsigned char   abcd0;
    unsigned char   abcd1;
    unsigned char   abcd2;
    unsigned char   abcd3;
};

union UFloat{
    MyFloat MyF;
    struct four_chars FourChars;
};
typedef 
struct Int{
    unsigned byte0   :8;
    unsigned byte1   :8;
    unsigned byte2   :8;
    unsigned byte3   :8; 
}Int;

union paraInt{
    Int IntV;
    struct four_chars FC;
};

void show_bits(int);

long main(){
    int intA=2012026905;
    show_bits(intA);
    printf("\n");
    Int IntVar=*((Int*)(&intA));
    printf("IntVar=%d\n",*(int*)(&IntVar));
    printf("byte0=%x\tbyte1=%x\tbyte2=%x\tbyte3=%x\n",
           IntVar.byte0,IntVar.byte1,IntVar.byte2,IntVar.byte3);
    
    union paraInt union_para_Int;
    union_para_Int.IntV=IntVar;
    printf("byte0=%x\tbyte1=%x\tbyte2=%x\tbyte3=%x\n",
           &(union_para_Int.abcd0),&(union_para_Int.abcd1)
           ,&(union_para_Int.abcd2),&(union_para_Int.abcd3));
    
    #ifdef SEPT_6
    float floatA=7.5;
    intA=*((int*)(&floatA));
    show_bits(intA);
    printf("/n");
    MyFloat MyF;
    printf("sizeof(MyF)=%d\n",(int)sizeof(MyF));
    printf("sizeof(unsigned char)=%d\n",(int)sizeof(unsigned char));
    printf("sizeof(struct four_chars)=%d\n",(int)sizeof(four_chars));
    MyF=*((MyFloat*)(&floatA));
    union UFloat union_Ufloat;
    union_UFloat.MyF=MyF;
    printf("%x\t",union_UFloat.FourChars.abcd0);
    printf("%x\t",union_UFloat.FourChars.abcd1);
    printf("%x\t",union_UFloat.FourChars.abcd2);
    printf("%x\t",union_UFloat.FourChars.abcd3);
    printf("power=%x\n",union_UFloat.MyF.power);
    printf("mantisa=%x\n",union_UFloat.MyF.mantisa);
#endif /*SEPT_6*/
    return 0;
}//end main

void show_bits(int intTmp){
    int i;
    for(i=8*sizeof(int)-1;i>=0;i--){
        printf("%d",((intTmp)>>i)&0x00000001);
    }
    
}