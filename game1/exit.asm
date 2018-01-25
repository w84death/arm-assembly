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
welcome: .string "\nLight! Bright flash!\n"
description: .string "\nCongratulation! You escape form the cave!\nYour signifficant other is waiting for you..\n"

.text
.global _exit

_exit:
    LDR R1, =welcome
    MOV R2, #32
    MOV R3, #9              @ clear screen + green
    BL  _ui_render_message

    LDR R1, =description
    MOV R2, #86
    MOV R3, #9              @ clear screen + green
    BL  _ui_render_message

    B _quit
