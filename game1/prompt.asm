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
.align 16
input:      
    .ascii "1234567812345678"
.align 4
commands:
    .ascii "quit"   @ 0
    .ascii "left"   @ 4
    .ascii "righ"   @ 8
    .ascii "back"   @ 12
    .ascii "forw"   @ 16
    .ascii "info"   @ 20
prompt: 
    .string "-> "
unknown: 
    .string "\nYou rested for one turn.\n"


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
	MOV R2, #16         @ length
	MOV R7, #3			@ read
	SWI 0

_testing:
    
    MOV R0, #0
    LDR R1, =input
	LDR R1, [R1]
	LDR R2, =commands
	
_loop:	
    LDR R3, [R2, R0]
	CMP R1, R3
	BEQ _success
	CMP R0, #24    
    ADDNE R0, #4
	BNE _loop
	BGE _unknown
	
_success:
    CMP R0, #0
    BEQ _game_over
	BX LR
    
_unknown:
	MOV R0, #1
	LDR R1, =unknown
	MOV R2, #27
	MOV R7, #4
	SWI 0

    B _prompt
