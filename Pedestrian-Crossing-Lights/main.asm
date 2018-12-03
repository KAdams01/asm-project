;
; Pedestrian-Crossing-Lights.asm
;
; Created: 18/11/2018 11.42.58
; Author : Kevin, Andrei, Dragos, Liviu
;

.macro delay
	ldi r20, 0xff	; delay_loop_1 = ((1 + 195840 + 1 + 2) * 255) - 1 = 49940219 cycles
delay_loop_1:
	ldi r21, 0xff	; delay_loop_2 = ((1 + 764 + 1 + 2) * 255) - 1 = 195840 cycles
delay_loop_2:
	ldi r22, 0xff	; delay_loop_3 = ((1 + 2) * 255) - 1 = 764 cycles
delay_loop_3:
	dec r22
	brne delay_loop_3
	dec r21
	brne delay_loop_2
	dec r20
	brne delay_loop_1	; total delay in ms = cycles/16000 = 49940219/16000 = 3.121,2636875ms = 3.121s
.endmacro

.macro redLight
    ldi r16, 0b10000000        ;red light on 13 pin (pinb 1000 0000)
    out portb, r16
.endmacro
.macro yellowLight
    ldi r16, 0b01000000        ;yellow light on 12 pin (pinb 0100 0000)
    out portb, r16
.endmacro
.macro greenLight
    ldi r16, 0b00100000        ;green light on 11 pin (pinb 0010 0000)
    out portb, r16
.endmacro
.macro yellowRed
    ldi r16, 0b11000000        ; yellow AND red light on pins 12 and 13 (pinb 1100 0000)
    out portb, r16
.endmacro
.macro pedGreen
    ldi r16, 0b10010000        ;pedestrian green light on pin 10 (pinb 0001 0000)
    out portb, r16            ;also keeps red light on
.endmacro


init:
    ldi r16, 0b11110000        ;set all pins of portb (pinb 1111 0000) to outputs
    out ddrb, r16
    out portb, r16
