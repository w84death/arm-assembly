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
.equ trigger_turn,  8
welcome:
.string "\nThis particular cave is named - Old Spider - guess why?\n"
description:
.string "\nYou enter another cave. This one is smaller.\nYou see spider crawling next to you..\nThere is a path on [west] site but the spider is looking dangerous.\n"
description2:
.string "\nThe spider has gone. You see path on the [west] site.\n"
spider_attack:
.string "\nSpider jumps on to your head and bite you right in the neck...\n"
.equ welcome_len,   57
.equ desc_len,      152
.equ desc2_len,     55
.equ spider_len,    62

.text
.global _room2

_room2:
    LDR R1, =welcome
    MOV R2, #welcome_len
    MOV R3, #welcome_style
    BL  _ui_render_message

    BL	_increment_turn

_skip_welcome:

    MOV R1, #cmd_mask
    BL  _prompt

    CMP R0, #cmd_west
    BEQ _try_room4

    CMP R0, #cmd_sout
    BEQ _room1

    CMP R0, #cmd_look
    BEQ _look

    B   _skip_welcome

_look:
    BL	_increment_turn

    BL  _get_turn
    CMP R0, #trigger_turn
    BGT _post_trigger

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

_try_room4:
    BL  _get_turn
    CMP R0, #trigger_turn
    BGT _room4

    LDR R1, =spider_attack
    MOV R2, #spider_len
    MOV R3, #desc_style
    BL  _ui_render_message

    B   _game_over
