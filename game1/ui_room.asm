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
    PUSH {R1-R2, LR}

    MOV R1, R3				@ text color
    BL _ui_term

	MOV R0, #1
	POP {R1-R2}
	MOV R7, #4
	SWI 0					@ print text

    MOV R1, #2 				@ clear color
    BL _ui_term

	POP {LR}
	BX LR
