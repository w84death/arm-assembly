@ -----------------------------------------------------------
@             Raspberry Pi Assembly GAME#1 by KJ/P1X
@ -----------------------------------------------------------

@ ====== CODE ======
.text
.global _start

_start:

	MOV R0, #1
	LDR R1, code
	MOV R2, #2
	MOV R7, #4
	SWI 0

	LDR R0, code            @ next turn
	LDR R1, [R0]
	MOV R2, #1
	ADD R1, R1, R2
	STR R1, [R0]
	
	MOV R2, #255
	CMP R1, R2
	BLT _start
	
_end:
	MOV R7, #1		@ program exit
	SWI 0			@ push to terminal
	

code: .word code_counter

.data
.balign 2
code_counter:
	.word 0
