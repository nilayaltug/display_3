	LIST P=16F877A
	#INCLUDE <P16F877A.INC>
	__CONFIG H'3F31'
	SAYICI_1 EQU 0X20
	SAYICI_2 EQU 0X21
	ORG 0X00
	GOTO ANA_METOT
	
ANA_METOT
	BANKSEL TRISB
	CLRF TRISB
	CLRF TRISC
	BANKSEL PORTB
	CLRF PORTB
	CLRF PORTC

KONTROL
	BCF PORTC,0
	BSF PORTC,1
	BSF PORTC,2
	BSF PORTC,3
	
	MOVLW B'00000110'
	MOVWF PORTB

	CALL GECIKME

	BSF PORTC,0
	BCF PORTC,1
	BSF PORTC,2
	BSF PORTC,3

	MOVLW B'01101111'
	MOVWF PORTB

	CALL GECIKME

	BSF PORTC,0
	BSF PORTC,1
	BCF PORTC,2
	BSF PORTC,3

	MOVLW B'01101111'
	MOVWF PORTB

	CALL GECIKME

	BSF PORTC,0
	BSF PORTC,1
	BSF PORTC,2
	BCF PORTC,3
	
	MOVLW B'01100110'
	MOVWF PORTB
	
	CALL GECIKME

	GOTO KONTROL

GECIKME
	MOVLW 0XFF
	MOVWF SAYICI_1

TEKRAR_1
	MOVLW 0XFF
	MOVWF SAYICI_2

TEKRAR_2
	DECFSZ SAYICI_2,F
	GOTO TEKRAR_2
	DECFSZ SAYICI_1,F
	GOTO TEKRAR_1
	RETURN

END