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
game_over:
    .string "\n\n\nYou did not escape. You are dead... GAME OVER. \n\n\nThank you for playing\n- P1X\n\n"

.text
.global _game_over

_game_over:
    LDR R1, =game_over
    MOV R2, #83
    MOV R3, #4             @ red
    BL  _ui_room

    MOV R7, #1
    SWI 0
