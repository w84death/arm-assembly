.arm

.data
input: 
    .ascii "12345678123456781234567812345678"
commands:
    .ascii "quit"
    .ascii "left"
    .ascii "right"

welcome: 
    .string "Welcome,\nyou can use <left>, <right> or <quit> to terminate the program. Have fun.\n"
success: 
    .string "Success!\n"
fail: 
    .string "Fail...\n"
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
	MOV R2, #32	        @ length
	MOV R7, #3			@ read
	SWI 0
	

    
_testing:
    LDR R0, =input
	LDR R0, [R0]
	
	LDR R1, =commands   
	 
	LDR R2, [R1]
	CMP R0, R2
	BEQ _end
	
	LDR R2, [R1, #4]
	CMP R0, R2
	BEQ _success

    LDR R2, [R1, #8]
	CMP R0, R2
	BEQ _success
	
	B _fail
	
_success:
	MOV R0, #1			@ keyboard
	LDR R1, =success
	MOV R2, #10 			@ length
	MOV R7, #4			@ write
	SWI 0
	
	B _input
	
_fail:
	MOV R0, #1			@ keyboard
	LDR R1, =fail
	MOV R2, #9 			@ length
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
	
	

	
