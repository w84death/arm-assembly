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
clear_screen:
    .ascii "\033c"
color_red:
    .ascii "\033[31m"
color_clear:
    .ascii "\033[0m\000"
.text
.global _ui_room

_ui_room:
    PUSH {r1-r4}    
    
    MOV R0, #1
	LDR R1, =clear_screen
	MOV R2, #2
	MOV R7, #4
	SWI 0
	
	MOV R0, #1
	LDR R1, =color_red
	MOV R2, #5
	MOV R7, #4
	SWI 0
	
	POP {r1-r2}
	
	MOV R0, #1
	MOV R7, #4
	SWI 0
	
	POP {r1-r2}
	
	MOV R0, #1
	MOV R7, #4
	SWI 0
	
	MOV R0, #1
	LDR R1, =color_clear
	MOV R2, #5
	MOV R7, #4
	SWI 0
	
	BX LR
