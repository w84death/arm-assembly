.arm

.data
input: .string " "
test_a: .word 0x61
test_q: .word 0x71
success: .string "Success!\n"
fail: .string "Fail...\n"
.text
.global _start

_start:
	MOV R0, #0			@ keyboard
	LDR R1, =input
	MOV R2, #1 			@ length
	MOV R7, #3			@ read
	SWI 0
	
	
	LDR R1, =input
	LDR R1, [R1]
	AND R1, R1, #0xf7         @ ADD keep selecetd bits
	                          @ BIC removes selected bits
	
	@ 00000000000000001100001 a
	@ 10000010000000001100001 a from input
    @ 00000000000000001111111 AND clear mask
    @ 00000000000000001100001 result
    
    MOV R2, #0x2        @ enter
    CMP R1, R2
    BEQ _start

    
_testing:   
	LDR R2, =test_a
	LDR R2, [R2]
	
	LDR R3, =test_q
	LDR R3, [R3]
	
	CMP R1, R3
	BEQ _end
	
	CMP R1, R2
	BEQ _success
	BNE _fail
	

    
_success:
	MOV R0, #0			@ keyboard
	LDR R1, =success
	MOV R2, #10 			@ length
	MOV R7, #4			@ write
	SWI 0
	
	B _start
	
_fail:
	MOV R0, #0			@ keyboard
	LDR R1, =fail
	MOV R2, #9 			@ length
	MOV R7, #4			@ write
	SWI 0

    b _start
    
_end:
	MOV R7, #1
	SWI 0
	
	

	
