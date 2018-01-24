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
title: .string "\n--- Empty cave ---\n"
welcome: .string "You are in a relatevely samall cave.\nYou see no exits here.\nYou can back by going [west].\n"

.text
.global _room3

_room3:
    LDR R1, =title
    MOV R2, #21
    LDR R3, =welcome
    MOV R4, #90
    BL _ui_room

    MOV R1, #0x4
    BL _prompt
    CMP R0, #0x4
    BEQ _room1

    B _room3
