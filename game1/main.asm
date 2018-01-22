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
.balign 2
turn_counter: .int 0
intro: .string "\n-- Raspberry Pi Assembly GAME#1 by KJ/P1X --\n\n"
welcome: .string "You are in the cave.\nYou don't have any water or food.\nYou need to get out fast! you have 24 moves to get out of the cave.\n\n"
escape: .string "\n\n\nCongratulation! You escaped the cave!! \n\n\nThank you for playing\n- P1X\n\n"

.text
.global _start
turn: .word turn_counter

_start:
	MOV R0, #1		    @ monitor
	LDR R1, =intro
	MOV R2, #48		    @ lenghth
	MOV R7, #4 		    @ output
	SWI 0

	MOV R0, #1		    @ monitor
	LDR R1, =welcome
	MOV R2, #124	    @ lenghth
	MOV R7, #4 		    @ output
	SWI 0

	B _room1

	MOV R7, #1		    @ program exit
	SWI 0			    @ push to terminal
