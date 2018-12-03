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


