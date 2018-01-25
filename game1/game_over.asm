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
game_over: .string "\nYou did not escape. You are dead... GAME OVER\n"
quit: .string "\nThank you for playing,\nP1X\n\n"

.text
.global _game_over
.global _quit

_game_over:
    LDR R1, =game_over
    MOV R2, #45
    MOV R3, #4             @ red
    BL  _ui_render_message

_quit:
    LDR R1, =quit
    MOV R2, #29
    MOV R3, #32             @ white
    BL  _ui_render_message

    MOV R7, #1
    SWI 0
