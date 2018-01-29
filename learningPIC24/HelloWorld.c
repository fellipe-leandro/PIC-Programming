/*
 * File:   hello.c
 * Author: Fellipe Leandro
 * Hello Embedded World!
 * Created on 25 de Janeiro de 2018, 15:34
 */


#include <xc.h>

void main(void) {
     TRISB=0x00; //All pins as output
     AD1PCFG=0xff; //All portb pins as digital.
     PORTB=0xff;
    
    return;
}
