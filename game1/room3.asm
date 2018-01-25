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
.equ cmd_mask,      34   @ west/look
welcome:
.string "\nYou came to the - Empty Cave -\n"
description:
.string "\nThis cave is an ordynary one. You see a lot of stalagmits ..but no exits here.\nYou can back by going [west].\n"
.equ welcome_len,   32
.equ desc_len,      110

.text
.global _room3

_room3:
    LDR R1, =welcome
    MOV R2, #welcome_len
    MOV R3, #welcome_style
    BL  _ui_render_message

    BL	_increment_turn

_skip_welcome:
    MOV R1, #cmd_mask
    BL  _prompt

    CMP R0, #cmd_west
    BEQ _room1

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
