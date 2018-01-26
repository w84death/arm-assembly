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
.balign 4
turn: .word 0
.balign 4
width: .word 80
input: .string "1234567812345678"
intro:
.string "Raspberry Pi / ARM Assembly GAME#1 by KJ/P1X\nVER: beta1\n"
welcome:
.string "You are in the cave.\nYou only have one torch that is slowly dimming.\nYou need to get out fast! you have 12 moves to get out of the cave.\n"
press_enter:
.string "PRESS ENTER TO START GAME "
.equ intro_len, 	56
.equ welcome_len, 	137
.equ press_len, 	26

.text
.global _start
.global _increment_turn
.global _get_turn
.global _get_width

_start:
	@ LDR R1, [SP, #8]
	@ LDR R2, =width
	@ STR R1, [R2]

	BL _clear_screen

	BL _ui_render_divider

    LDR R1, =intro
    MOV R2, #intro_len
    MOV R3, #ui_white
    BL  _ui_render_message

	BL _ui_render_divider

	LDR R1, =welcome
	MOV R2, #welcome_len
    MOV R3, #ui_white
    BL  _ui_render_message

	BL _ui_render_divider

	LDR R1, =press_enter
	MOV R2, #press_len
    MOV R3, #ui_red
    BL  _ui_render_message

	MOV R0, #0
	LDR R1, =input
	MOV R2, #128       		@ we dont want any garbage in the input
	MOV R7, #3
	SWI 0

	B _room1

_increment_turn:
	LDR R1, =turn
	LDR R2, [R1]
	MOV R3, #1
	ADD R2, R3
	STR R2, [R1]

	BX 	LR

_get_turn:
	LDR R0, =turn
	LDR R0, [R0]

	BX 	LR

_get_width:
	LDR R0, =width
	LDR R0, [R0]

	BX 	LR
