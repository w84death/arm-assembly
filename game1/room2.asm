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
welcome: .string "\nThis particular cave is named - Old Spider - guess why?\n"
description: .string "\nYou enter another cave. This one is smaller.\nYou see spider crawling next to you..\nThere is a path but the spider is looking dangerous.\n"
description2: .string "\nThe spider has gone. You see path on the [west] site.\n"
spider_attack: .string "\nSpider jumps on to your head and bite you right in the neck...\n"
.text
.global _room2

_room2:
    LDR R1, =welcome
    MOV R2, #57
    MOV R3, #9              @ clear screen + green
    BL  _ui_room

    BL	_increment_turn     @ TURN++

_skip_welcome:

    MOV R1, #38             @ west/east/look
    BL  _prompt

    CMP R0, #0x4
    BEQ _try_room4          @ room4 ->

    CMP R0, #0x8
    BEQ _room1              @ room1 ->

    CMP R0, #0x14
    BEQ _look               @ look

    B   _room2

_look:
    BL	_increment_turn     @ TURN++

    BL  _get_turn
    CMP R0, #8
    BGT _post_trigger

    LDR R1, =description
    MOV R2, #137
    MOV R3, #16             @ blue
    BL  _ui_room

    B   _skip_welcome

_post_trigger:
    LDR R1, =description2
    MOV R2, #55
    MOV R3, #16             @ blue
    BL  _ui_room

    B   _skip_welcome

_try_room4:
    BL  _get_turn
    CMP R0, #8
    @BGT _room4              @ spider is gone, room4 ->
    BGT _exit                @ BETA VERSION: cave exit ->

    LDR R1, =spider_attack
    MOV R2, #62
    MOV R3, #16             @ blue
    BL  _ui_room

    B   _game_over
