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

.align 4
commands:			@ mem.	mask
    .ascii "quit"   @ #0x0	1
    .ascii "west"   @ #0x4	2
    .ascii "east"   @ #0x8	4
    .ascii "nort"   @ #0xc	8
    .ascii "sout"   @ #0x10	16
    .ascii "look"   @ #0x14	32
    .ascii "rest"   @ #0x18	64
    .ascii "help"   @ #0x1c	128

.align 4
input: .ascii "1234567812345678"
prompt: .string "-> "
unknown: .string "\nThis does nothing.\n"
unavailable: .string "\nYou can not do that.\n"
rest: .string "\nYou rested for one turn. You feel refreshed.\n"
help: .string "\nYou can use those commands: [quit] [north] [south] [west] [east] [look] [rest]\n"

.text
.global _prompt
_prompt:
	PUSH {R1}				@ save the bit mask

_prompt_again:

	PUSH {LR}
    BL _ui_turn
	POP {LR}

	MOV R0, #1
	LDR R1, =prompt
	MOV R2, #3
	MOV R7, #4
	SWI 0

	MOV R0, #0
	LDR R1, =input
	MOV R2, #16
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
	CMP R0, #0x1c				@ max commands
	BGE _unknown

    ADD R0, #0x4
	MUL R4, R5, R6
	MOV R5, R4

	B _loop


_success:
    CMP R0, #0x0			@ game over ->
    BEQ _quit

	CMP R0, #0x1c			@ help ->
    BEQ _show_help

	CMP R0, #0x18			@ rest ->
    BEQ _rest

	POP {R1}			@ restore bit mask
	AND R2, R4, R1
	CMP R2, R4
	PUSHNE {R1}
	BNE _unavailable		@ command not available

	BX 	LR

_unknown:
	PUSH {LR}
	LDR R1, =unknown
    MOV R2, #20
    MOV R3, #8              @ green
    BL  _ui_room

	POP {LR}
    B _prompt_again

_unavailable:
	PUSH {LR}
	LDR R1, =unavailable
    MOV R2, #22
    MOV R3, #8              @ green
    BL  _ui_room

	BL	_increment_turn		@ TURN++

	POP {LR}
    B _prompt_again

_rest:
	PUSH {LR}
	LDR R1, =rest
    MOV R2, #46
    MOV R3, #16              @ blue
    BL  _ui_room

	BL	_increment_turn		@ TURN++

	POP {LR}
    B _prompt_again

_show_help:
	PUSH {LR}
	LDR R1, =help
    MOV R2, #80
    MOV R3, #8              @ green
    BL  _ui_room
	POP {LR}

    B _prompt_again
