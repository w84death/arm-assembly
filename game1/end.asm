.arm
.data
game_over: .string "\n\n\nYou did not escape. You are dead... GAME OVER. \n\n\nThank you for playing\n- P1X\n\n"

.text
.global _end

_end:
	MOV R0, #1
	LDR R1, =game_over
	MOV R2, #82
	MOV R7, #4
	SWI 0

	MOV R7, #1
	SWI 0
