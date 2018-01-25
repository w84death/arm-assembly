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
welcome: .string "\nRoom4\n"
description: .string "\nLorem Ipsum.\n"
description2: .string "\nDolor sid amet.\n"
.text
.global _room4

_room4:
    LDR R1, =welcome
    MOV R2, #5
    MOV R3, #9              @ clear screen + green
    BL  _ui_room

    BL	_increment_turn     @ TURN++

_skip_welcome:

    MOV R1, #63             @ west/east/north/south/look
    BL  _prompt

    @ CMP R0, #0x4
    @ BEQ _room5             @ room5 (danger) ->

    CMP R0, #0x8
    BEQ _room2              @ room2 (spider) ->

    @ CMP R0, #0x10
    @ BEQ _room7             @ _room7 (water) ->

    @ CMP R0, #0xc
    @ BEQ _room6             @ _room6 (plank) ->

    CMP R0, #0x14
    BEQ _look               @ look

    B   _room2

_look:
    BL	_increment_turn     @ TURN++

    @ BL  _get_room_triggers
    @ AND R0, R1
    @ CMP R0, #8
    @ BGT _post_trigger

    LDR R1, =description
    MOV R2, #12
    MOV R3, #16             @ blue
    BL  _ui_room

    B   _skip_welcome

_post_trigger:
    LDR R1, =description2
    MOV R2, #15
    MOV R3, #16             @ blue
    BL  _ui_room

    B   _skip_welcome
