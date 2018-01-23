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
title: .string "--- Empty cave ---\n"
welcome: .string "\nYou are in a relatevely samall cave.\nYou see no exits here.\nYou can back by going (l)eft.\n"

.text
.global _room3

_room3:
	MOV R0, #1
	LDR R1, =title
	MOV R2, #17
	MOV R7, #4
	SWI 0
	
	MOV R0, #1
	LDR R1, =welcome
	MOV R2, #92
	MOV R7, #4
	SWI 0

    BL _prompt
    CMP R0, #1
    BEQ _room1

    B _room3

    BX LR
