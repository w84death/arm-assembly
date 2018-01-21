.arm
.data
input: .ascii " "
prompt: .string "(l,r,f,b,q)-> "
wrong: .string "(Unknown command)"
left: .word 0xa0a0a6c
right: .word 0xa0a0a72
forward: .word 0xa0a0a66
back: .word 0xa0a0a62
quit: .word 0xa0a0a71

.text
.global _prompt

_prompt:
	MOV R0, #1			@ monitor
	LDR R1, =prompt
	MOV R2, #14			@ length
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

	CMP R1, R2
	BEQ _left
	CMP R1, R3
	BEQ _right

	B _wrong

_wrong:
	MOV R0, #1
	LDR R1, =prompt
	MOV R2, #17
	MOV R7, #4
	SWI 0

	B _prompt

_left:
	MOV R0, #1
	BX LR

_right:
	MOV R0, #2
    BX LR
