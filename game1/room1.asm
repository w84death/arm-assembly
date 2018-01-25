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
welcome: .string "\nYou are in the - Main Cave -\n"
description: .string "You are in a relatevely samall cave.\nYou see two exits.\nYou can go [west] or [east].\n"

.text
.global _room1

_room1:

    LDR R1, =welcome
    MOV R2, #30
    MOV R3, #9              @ clear screen + green
    BL  _ui_room

    BL	_increment_turn     @ TURN++

_skip_welcome:
    MOV R1, #38             @ west/east/look
    BL  _prompt

    CMP R0, #0x4
    BEQ _room2              @ room2 ->

    CMP R0, #0x8
    BEQ _room3              @ room3 ->

    CMP R0, #0x14
    BEQ _look               @ look

    B   _skip_welcome

_look:
    LDR R1, =description
    MOV R2, #85
    MOV R3, #16             @ blue
    BL  _ui_room

	BL	_increment_turn     @ TURN++

    B   _skip_welcome
