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
.align 4
turn: .word 0
input: .string "1234567812345678"
intro: .string "\n-- Raspberry Pi Assembly GAME#1 by KJ/P1X --\n\n"
welcome: .string "You are in the cave.\nYou only have one torch that is slowly dimming.\nYou need to get out fast! you have 12 moves to get out of the cave.\n\n--------------------\nPRESS ENTER TO START \n--------------------\n"
.text
.global _start
.global _increment_turn
.global _get_turn

_start:
    LDR R1, =intro
    MOV R2, #48
    MOV R3, #9              @ clear screen + green
    BL  _ui_room

	LDR R1, =welcome
	MOV R2, #202
    MOV R3, #16             @ blue
    BL  _ui_room

	MOV R0, #0
	LDR R1, =input
	MOV R2, #128       		@ we dont want any garbage in the input
	MOV R7, #3
	SWI 0

	B _room1				@ room1 ->

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
