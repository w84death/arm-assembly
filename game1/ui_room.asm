@ ---------------------------------------------------
@
@   Raspberry Pi Assembly GAME#1 by KJ/P1X
@
@   http://p1x.in | http://krzysztofjankowski.com
@   https://github.com/w84death/arm-assembly
@
@ ---------------------------------------------------
.arm
.include "globals.asm"

.data
.align 4
num: .string " "
.align 4
divider: .string "="
.align 4
new_line: .string "\n"

.text
.global _ui_render_message
.global _ui_render_turn
.global _ui_render_divider
.global _ui_render_welcome

_ui_render_message:
    PUSH {R1-R2, LR}

    MOV R1, R3				@ text color
    BL _ui_term

	MOV R0, #1
	POP {R1-R2}
	MOV R7, #4
	SWI 0					@ print text

    MOV R1, #ui_cc
    BL _ui_term

	POP {LR}
	BX LR

_ui_render_turn:
	PUSH {LR}

	BL 	_get_turn
	ADD R0, #48
	LDR R1, =num
	STR R0, [R1]

    MOV R2, #1
    MOV R3, #ui_white
    BL  _ui_render_message

	POP {LR}
	BX LR

_ui_render_divider:
	PUSH {LR}

	BL 	_get_width
	MOV R1, #0
	PUSH {R0, R1}

	_divider_loop:

	LDR R1, =divider
	MOV R2, #1
    MOV R3, #ui_blue
    BL  _ui_render_message

	POP {R0, R1}
	ADD R1, #1
	CMP R1, R0
	PUSHLT {R0, R1}
	BLT _divider_loop

	LDR R1, =new_line
	MOV R2, #1
    MOV R3, #ui_cc
    BL  _ui_render_message

	POP {LR}
	BX LR

_ui_render_welcome:
	PUSH {R1-R2, LR}

    BL _clear_screen
    BL _ui_render_divider

	POP {R1-R2}
    MOV R3, #welcome_style
    BL  _ui_render_message

	BL _ui_render_divider

	POP {LR}
	BX LR
