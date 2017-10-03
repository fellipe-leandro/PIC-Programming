#include "p16f84a.inc"
    ; CONFIG
; __config 0xFFF1
 __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _CP_OFF
 ORG 0x00
    GOTO start
    
start
    banksel TRISB
    movlw 0xFE ;Set RB0 as output
    movwf TRISB
    banksel PORTB
    movlw 0x02
    movwf PORTB ;clear portb
LOOP
    NOP
    btfss PORTB,1
    goto SETLOW
    movlw 0x01
    iorwf PORTB
    goto LOOP
    SETLOW
    movlw 0xFE
    andwf PORTB
    goto LOOP

    
    end
    
    


