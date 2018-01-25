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
description: .string "You enter another cave. This one is smaller.\nYou see spider crawling next to you.\nSpider jumps on to your head and bite you right in the neck...\n"

.text
.global _room2

_room2:
    LDR R1, =welcome
    MOV R2, #57
    MOV R3, #9              @ clear screen + green
    BL  _ui_room

    BL	_increment_turn     @ TURN++

    MOV R1, #36             @ east/look
    BL  _prompt

    CMP R0, #0x8
    BEQ _room1              @ room1 ->

    CMP R0, #0x14
    BEQ _look               @ look

    B   _room2

_look:
    LDR R1, =description
    MOV R2, #145
    MOV R3, #16             @ blue
    BL  _ui_room
    BL	_increment_turn     @ TURN++

    B   _game_over
