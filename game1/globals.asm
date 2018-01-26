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

@ text styles
.equ welcome_style, 32   @ clear screen + green
.equ desc_style, 	16  @ blue
.equ info_style,    8   @ green

@ text colors
.equ ui_cls,     1
.equ ui_cc,      2
.equ ui_red,     4
.equ ui_green,   8
.equ ui_blue,    16
.equ ui_white,   32

@ commands
.equ cmd_quit, 0x0
.equ cmd_west,  0x4
.equ cmd_east,  0x8
.equ cmd_nort,  0xc
.equ cmd_sout,  0x10
.equ cmd_look,  0x14
.equ cmd_rest,  0x18
.equ cmd_help,  0x1c
