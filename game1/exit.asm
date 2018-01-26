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
welcome:
.string "Light! Bright flash!\n"
description:
.string "\nCongratulation! You escape form the cave!\nYour signifficant other is waiting for you..\n"
.equ welcome_len,    21
.equ desc_len,       89

.text
.global _exit

_exit:
    LDR R1, =welcome
    MOV R2, #welcome_len
    BL  _ui_render_welcome

    LDR R1, =description
    MOV R2, #desc_len
    MOV R3, #ui_blue
    BL  _ui_render_message

    B _quit
