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
.equ cmd_mask,          48  @ south/look

welcome:
.string "\nRoom #6\n"
description:
.string "\nLorem Ipsum.\n"
description2:
.string "\nDolor sid amet.\n"
.equ welcome_len,    9
.equ desc_len,       14
.equ desc2_len,      17

.text
.global _room6

_room6:
    LDR R1, =welcome
    MOV R2, #welcome_len
    MOV R3, #welcome_style
    BL  _ui_render_message

    BL	_increment_turn

_skip_welcome:

    MOV R1, #cmd_mask
    BL  _prompt

    CMP R0, #cmd_sout
    BEQ _room4

    CMP R0, #cmd_look
    BEQ _look

    B   _skip_welcome

_look:
    BL	_increment_turn

    @ BL  _get_room_triggers
    @ AND R0, R1
    @ CMP R0, #8
    @ BGT _post_trigger

    LDR R1, =description
    MOV R2, #desc_len
    MOV R3, #desc_style
    BL  _ui_render_message

    B   _skip_welcome

_post_trigger:
    LDR R1, =description2
    MOV R2, #desc2_len
    MOV R3, #desc_style
    BL  _ui_render_message

    B   _skip_welcome
