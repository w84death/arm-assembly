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
.align
commands:			@ mem.	mask
    .ascii "quit"   @ #0x0	1
    .ascii "west"   @ #0x4	2
    .ascii "east"   @ #0x8	4
    .ascii "nort"   @ #0xc	8
    .ascii "sout"   @ #0x10	16
    .ascii "look"   @ #0x14	32
    .ascii "rest"   @ #0x18	64
    .ascii "help"   @ #0x1c	128
.equ commands_len, 0x1c

.align
input: .ascii "1234567812345678"
.equ input_len, 16
prompt: .string "-> "
.equ prompt_len, 3
unknown: .string "\nThis does nothing.\n"
.equ unknown_len, 20
unavailable: .string "\nYou can not do that.\n"
.equ unavailable_len, 22
rest: .string "\nYou rested for one turn. You feel refreshed.\n"
.equ rest_len, 46
help: .string "\nYou can use those commands: [quit] [north] [south] [west] [east] [look] [rest]\n"
.equ help_len, 80

.text
.global _prompt
_prompt:
	PUSH {R1}

_prompt_again:

	PUSH {LR}
    BL _ui_turn
	POP {LR}

	MOV R0, #1
	LDR R1, =prompt
	MOV R2, #prompt_len
	MOV R7, #4
	SWI 0

	MOV R0, #0
	LDR R1, =input
	MOV R2, #input_len
	MOV R7, #3
	SWI 0

    MOV R0, #0
    LDR R1, =input
	LDR R1, [R1]
	LDR R2, =commands
	MOV R4, #0
	MOV R5, #1
	MOV R6, #2

_loop:
    LDR R3, [R2, R0]
	CMP R1, R3
	BEQ _success
	CMP R0, #commands_len
	BGE _unknown

    ADD R0, #0x4
	MUL R4, R5, R6
	MOV R5, R4

	B _loop


_success:
    CMP R0, #cmd_quit
    BEQ _quit

	CMP R0, #cmd_help
    BEQ _show_help

	CMP R0, #cmd_rest
    BEQ _rest

	POP {R1}
	AND R2, R4, R1
	CMP R2, R4
	PUSHNE {R1}
	BNE _unavailable

	BX 	LR

_unknown:
	PUSH {LR}
	LDR R1, =unknown
    MOV R2, #unknown_len
    MOV R3, #info_style
    BL  _ui_room

	POP {LR}
    B _prompt_again

_unavailable:
	PUSH {LR}
	LDR R1, =unavailable
    MOV R2, #unavailable_len
    MOV R3, #info_style
    BL  _ui_room

	BL	_increment_turn

	POP {LR}
    B _prompt_again

_rest:
	PUSH {LR}
	LDR R1, =rest
    MOV R2, #rest_len
    MOV R3, #desc_style
    BL  _ui_room

	BL	_increment_turn

	POP {LR}
    B _prompt_again

_show_help:
	PUSH {LR}
	LDR R1, =help
    MOV R2, #help_len
    MOV R3, #info_style
    BL  _ui_room
	POP {LR}

    B _prompt_again
