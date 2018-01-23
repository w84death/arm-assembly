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
title: .string "\n--- Main cave ---\n"
welcome: .string "You are in a relatevely samall cave.\nYou see two exits.\nYou can choose (l)eft or (r)ight.\n"

.text
.global _room1

_room1:
    LDR R1, =title
    MOV R2, #20
    LDR R3, =welcome
    MOV R4, #91
    BL _ui_room

    BL _prompt
    CMP R0, #4
    BEQ _room2
    CMP R0, #8
    BEQ _room3

    B _room1
