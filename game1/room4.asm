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
.equ cmd_mask,          58  @ west/north/south/look
.equ room_mask,         0x8

welcome:
.string "The - Intersection Cave -\n"
description:
.string "\nYou see rumors all over the place.\nYou still can go to [north]/[west] and [south].\n"
description2:
.string "\nRight after you came to this cave you hear a big bum!\nThe path has demolished. You can't go back\n"
.equ welcome_len,   26
.equ desc_len,      84
.equ desc2_len,    98

.text
.global _room4

_room4:
    LDR R1, =welcome
    MOV R2, #welcome_len
    BL  _ui_render_welcome

    BL	_increment_turn

_skip_welcome:

    MOV R1, #cmd_mask
    BL  _prompt

    CMP R0, #cmd_west
    BEQ _room5

    CMP R0, #cmd_nort
    BEQ _room6

    CMP R0, #cmd_sout
    BEQ _room7

    CMP R0, #cmd_look
    BEQ _look

    B   _skip_welcome

_look:
    BL	_increment_turn

    MOV R0, #room_mask
    BL  _get_room_state
    CMP R0, #0
    BEQ _post_trigger

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

    MOV R0, #room_mask
    BL _set_room_state

    B   _skip_welcome
