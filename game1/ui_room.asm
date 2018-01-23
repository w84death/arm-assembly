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

.text
.global _ui_room

_ui_room:
    PUSH {R1-R4, LR}    
    
    MOV R1, #5 @0101
    BL _ui_term
	
	POP {R1-R2}
	
	MOV R0, #1
	MOV R7, #4
	SWI 0
	
	POP {R1-R2}
	
	MOV R0, #1
	MOV R7, #4
	SWI 0
	
    MOV R1, #2 @0010
    BL _ui_term
	
	POP {LR}
	BX LR
