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
welcome: .string "\nYou are in a relatevely samall room. You see no exits here. You can choose back to room1 going (l)eft.\n"

.text
.global _room3

_room3:
	MOV R0, #1
	LDR R1, =welcome
	MOV R2, #105
	MOV R7, #4
	SWI 0

    BL _prompt
    CMP R0, #1
    BEQ _room1

    B _room3

    BX LR
