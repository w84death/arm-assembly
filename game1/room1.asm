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
welcome: .string "You are in a relatevely samall cave.\nYou see two exits.\nYou can go [west] or [east].\n"

.text
.global _room1

_room1:
    LDR R1, =title
    MOV R2, #20
    LDR R3, =welcome
    MOV R4, #86
    BL _ui_room

    MOV R1, #0xc
    BL _prompt
    CMP R0, #0x4
    BEQ _room2
    CMP R0, #0x8
    BEQ _room3

    B _room1
