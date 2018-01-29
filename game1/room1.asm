@ ---------------------------------------------------
@
@   Raspberry Pi Assembly GAME#1 by KJ/P1X
@
@   http://p1x.in | http://krzysztofjankowski.com
@   https://github.com/w84death/arm-assembly
@
@ ---------------------------------------------------
.arm
.include "globals.asm"

.data
.equ cmd_mask,      38  @ west/east/look
welcome:
    .string "You are in the - Main Cave -\n"
    .equ welcome_len, .-welcome
description:
    .string "\nYou are in a relatevely samall cave.\nYou see two exits.\nYou can go [west] or [east].\n"
    .equ desc_len, .-description

.text
.global _room1

_room1:
    LDR R1, =welcome
    MOV R2, #welcome_len
    BL _ui_render_welcome

    BL	_increment_turn

_skip_welcome:
    MOV R1, #cmd_mask
    BL  _prompt

    CMP R0, #cmd_west
    BEQ _room2

    CMP R0, #cmd_east
    BEQ _room3

    CMP R0, #cmd_look
    BEQ _look

    B   _skip_welcome

_look:
    LDR R1, =description
    MOV R2, #desc_len
    MOV R3, #desc_style
    BL  _ui_render_message

	BL	_increment_turn

    B   _skip_welcome
