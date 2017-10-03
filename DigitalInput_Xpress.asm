#include "p16f15376.inc"

; CONFIG1
; __config 0xFFFA
 __CONFIG _CONFIG1, _FEXTOSC_XT & _RSTOSC_EXT1X & _CLKOUTEN_OFF & _CSWEN_ON & _FCMEN_ON
; CONFIG2
; __config 0xFFFF
 __CONFIG _CONFIG2, _MCLRE_ON & _PWRTE_OFF & _LPBOREN_OFF & _BOREN_ON & _BORV_LO & _ZCD_OFF & _PPS1WAY_ON & _STVREN_ON
; CONFIG3
; __config 0xFFFF
 __CONFIG _CONFIG3, _WDTCPS_WDTCPS_31 & _WDTE_ON & _WDTCWS_WDTCWS_7 & _WDTCCS_SC
; CONFIG4
; __config 0xFFFF
 __CONFIG _CONFIG4, _BBSIZE_BB512 & _BBEN_OFF & _SAFEN_OFF & _WRTAPP_OFF & _WRTB_OFF & _WRTC_OFF & _WRTSAF_OFF & _LVP_ON
; CONFIG5
; __config 0xFFFF
 __CONFIG _CONFIG5, _CP_OFF
 
 
    start
    banksel TRISB   ;automatizes selection memory bank selection process
    movlw 0xFE ;Set RB0 as output
    movwf TRISB
    banksel PORTB
    movlw 0x02
    movwf PORTB ;clear portb
LOOP
    NOP
    btfss PORTB,1   ;test bit 1 level: if 1, then jumps next line; if 0, continue code flow
    goto SETLOW	    ;routine to set LOW level to pin
    movlw 0x01
    iorwf PORTB	    ;0x01 = 0000 0001. OR mantains other bits levels and change bit 0 to 1
    goto LOOP
    SETLOW
    movlw 0xFE
    andwf PORTB	    ;0xFE = 111 1110. AND mantains others bits levels of PORTB and set bit 1 to 0
    goto LOOP

    
    end
    


