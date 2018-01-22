@ ---------------------------------------------------
@
@   Raspberry Pi Assembly GAME#1 by KJ/P1X
@   
@   http://p1x.in | http://krzysztofjankowski.com
@   https://github.com/w84death/arm-assembly        
@
@ ---------------------------------------------------
.arm

.data
input: .ascii " "
prompt: .string "-> "
unknown: .string "\nYou rested for one turn.\n"
left: .word 0x2c6c286c
right: .word 0x2c6c2872
forward: .word 0x2c6c2866
back: .word 0x2c6c2862
quit: .word 0x2c6c2871

.text
.global _prompt

_prompt:
	MOV R0, #1			@ monitor
	LDR R1, =prompt
	MOV R2, #3			@ length
	MOV R7, #4			@ write
	SWI 0

	MOV R0, #0			@ keyboard
	LDR R1, =input
	MOV R2, #1 			@ length
	MOV R7, #3			@ read
	SWI 0

	LDR R1, =input
	LDR R1, [R1]

	LDR R2, =left
	LDR R2, [R2]

	LDR R3, =right
	LDR R3, [R3]

	LDR R4, =quit
	LDR R4, [R4]

	CMP R1, R2
	BEQ _left
	CMP R1, R3
	BEQ _right
	CMP R1, R4
	BEQ _end
	B _unknown

_unknown:
	MOV R0, #1
	LDR R1, =unknown
	MOV R2, #27
	MOV R7, #4
	SWI 0

	B _prompt

_left:
	MOV R0, #1
	BX LR

_right:
	MOV R0, #2
    BX LR
