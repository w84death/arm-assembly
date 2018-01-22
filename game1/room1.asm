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
welcome: .string "\nYou are in a relatevely samall room. You see two exits. You can choose (l)eft or (r)ight. \n"

.text
.global _room1

_room1:
	MOV R0, #1
	LDR R1, =welcome
	MOV R2, #82
	MOV R7, #4
	SWI 0

    BL _prompt
    CMP R0, #1
    BEQ _room2
    CMP R0, #2
    BEQ _room3

    B _room1

    BX LR