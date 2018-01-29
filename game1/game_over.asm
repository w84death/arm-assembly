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
game_over:
    .string "\nYou did not escape. You are dead... GAME OVER\n"
    .equ over_len, .-game_over
quit:
    .string "\nThank you for playing,\nP1X\n\n"
    .equ quit_len, .-quit

.text
.global _game_over
.global _quit

_game_over:
    LDR R1, =game_over
    MOV R2, #over_len
    MOV R3, #ui_red
    BL  _ui_render_message

_quit:
    BL  _ui_render_divider

    LDR R1, =quit
    MOV R2, #quit_len
    MOV R3, #ui_white
    BL  _ui_render_message

    MOV R7, #1
    SWI 0
