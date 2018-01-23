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
title: .string "--- Main cave ---\n"
welcome: .string "\nYou are in a relatevely samall cave.\nYou see two exits.\nYou can choose (l)eft or (r)ight.\n"

.text
.global _room1

_room1:
	MOV R0, #1
	LDR R1, =title
	MOV R2, #19
	MOV R7, #4
	SWI 0
	
	MOV R0, #1
	LDR R1, =welcome
	MOV R2, #92
	MOV R7, #4
	SWI 0

    BL _prompt
    TST R0, #1
    BEQ _room2
    TST R0, #2
    BEQ _room3

    B _room1

    BX LR
