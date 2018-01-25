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
welcome: .string "\nYou came to the - Empty Cave -\n"
description: .string "This cave is an ordynary one. You see a lot of stalagmits ..but no exits here.\nYou can back by going [west].\n"

.text
.global _room3

_room3:
    LDR R1, =welcome
    MOV R2, #32
    MOV R3, #9              @ clear screen + green
    BL  _ui_room

    BL	_increment_turn     @ TURN++

_skip_welcome:
    MOV R1, #34             @ west/look
    BL  _prompt

    CMP R0, #0x4
    BEQ _room1              @ room1 ->

    CMP R0, #0x14
    BEQ _look               @ look

    B   _skip_welcome

_look:
    LDR R1, =description
    MOV R2, #109
    MOV R3, #16             @ blue
    BL  _ui_room
    BL	_increment_turn     @ TURN++

    B   _skip_welcome
