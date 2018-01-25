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
num: .ascii " "

.text
.global _ui_room
.global _ui_turn

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

_ui_turn:
	PUSH {LR}

	BL 	_get_turn			@ R0 turn number
	ADD R0, #48				@ R0 ascii code
	LDR R1, =num
	STR R0, [R1]

    MOV R2, #1
    MOV R3, #32             @ white
    BL  _ui_room

	POP {LR}
	BX LR
