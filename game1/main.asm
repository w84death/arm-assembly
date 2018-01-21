@ -----------------------------------------------------------
@             Raspberry Pi Assembly GAME#1 by KJ/P1X
@ -----------------------------------------------------------
.arm

.text
.global _start
.global _room2
.global _room3

_start:
	MOV R0, #1		@ monitor
	LDR R1, =intro
	MOV R2, #62		@ lenghth
	MOV R7, #4 		@ output
	SWI 0

	MOV R0, #1		@ monitor
	LDR R1, =welcome
	MOV R2, #124		@ lenghth
	MOV R7, #4 		@ output
	SWI 0

	B _room1

_room2:
	LDR R0, turn            @ next turn
	LDR R1, [R0]
	MOV R2, #1
	ADD R1, R1, R2
	STR R1, [R0]

	MOV R0, #1		@ message
	LDR R1, =room2_msg0
	MOV R2, #144
	MOV R7, #4
	SWI 0

	B _end

_room3:
	LDR R0, turn            @ next turn
	LDR R1, [R0]
	MOV R2, #1
	ADD R1, R1, R2
	STR R1, [R0]

	MOV R0, #1		@ message
	LDR R1, =room3_msg0
	MOV R2, #144
	MOV R7, #4
	SWI 0

	B _end

	MOV R7, #1		@ program exit
	SWI 0			@ push to terminal



@ ====== LABELS ======
turn: .word turn_counter

@ ====== DATA ======
.data
.balign 2
turn_counter: .int 0
intro: .string "\n\n[[  Raspberry Pi Assembly GAME#1 by KJ/P1X ]]\n\n\n\n"
welcome: .string "You are in the cave. You don't have any water or food. You need to get out fast! you have 24 moves to get out of the cave.\n\n"
escape: .string "\n\n\nCongratulation! You escaped the cave!! \n\n\nThank you for playing\n- P1X\n\n"
@ ====== DATA/ROOMS ======
room2_msg0: .string"\nYou enter another cave. This one is smaller. You see spider crawling next to you. Spider jumps on to your head and bite you right in the neck.\n"
room3_msg0: .string "\nThe path was very swallow but you finaly get ther.\nYou enter much bigger cave. There is a (p)it in the center and a clear path on the (r)ight.\n"

