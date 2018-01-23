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
input: .string " "
prompt: .string "-> "
unknown: .string "\nYou rested for one turn.\n"
left: .string "l" @6c
right: .string "r" @72
forward: .string "f"
back: .string "b"
quit: .string "q" @71


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

	TST R1, R2
	MOV R0, #1
	MOV PC, LR
	
	TST R1, R3
	MOV R0, #2
    @BX LR
    MOV PC, LR
	
	TST R1, R4
	BEQ _end
    
_unknown:
	MOV R0, #1
	LDR R1, =unknown
	MOV R2, #27
	MOV R7, #4
	SWI 0

    B _prompt
	
