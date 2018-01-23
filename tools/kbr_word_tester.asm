.arm
.data
.align 16
input:      
    .ascii "1234567812345678"
.align 4
commands:
    .ascii "quit"
    .ascii "left"
    .ascii "righ"
    .ascii "back"
    .ascii "forw"
welcome: 
    .string "Welcome,\nyou can use <left>, <right> or <quit> to terminate the program. Have fun.\n"
success: 
    .string "Success!\n"
fail: 
    .string "...\n"
quit: 
    .string "Bye!\n"

.text
.global _start

_start:
	MOV R0, #1			@ monitor
	LDR R1, =welcome
	MOV R2, #84			@ length
	MOV R7, #4			@ write
	SWI 0

_input:	
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
    CMP R0, #24
    BGE _fail
    LDR R3, [R2, R0]
	CMP R1, R3
	BEQ _success
	ADDNE R0, #4
	BNE _loop
	
_success:
    CMP R0, #0
    BEQ _end

	MOV R0, #1			@ keyboard
	LDR R1, =success
	MOV R2, #10 		@ length
	MOV R7, #4			@ write
	SWI 0
	
	B _input
	
_fail:
	MOV R0, #1			@ keyboard
	LDR R1, =fail
	MOV R2, #4 			@ length
	MOV R7, #4			@ write
	SWI 0
	
    b _input
    
_end:
	MOV R0, #1			@ monitor
	LDR R1, =quit
	MOV R2, #5			@ length
	MOV R7, #4			@ write
	SWI 0
	
	MOV R7, #1
	SWI 0
	
	

	
