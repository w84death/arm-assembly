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

.align 16
commands:			@ mem.	mask
    .ascii "quit"   @ #0x0	1
    .ascii "west"   @ #0x4	2
    .ascii "east"   @ #0x8	4
    .ascii "nort"   @ #0xc	8
    .ascii "sout"   @ #0x10	16
    .ascii "look"   @ #0x14	32
    .ascii "help"   @ #0x18	64

.align 16
input: .ascii "1234567812345678"
prompt: .string "-> "
unknown: .string "\nYou rested for one turn.\n"
unavailable: .string "\nYou can not do that.\n"
help: .string "\nYou can use those commands: [quit] [north] [south] [west] [east] [look]\n"

.text
.global _prompt
_prompt:
	PUSH {R1}				@ save the bit mask

_prompt_again:
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
    BEQ _game_over

	CMP R0, #0x18			@ help ->
    BEQ _show_help

	POP {R1}			@ restore bit mask
	AND R2, R4, R1
	CMP R2, R4
	BNE _unavailable		@ command not available

	BX LR

_unknown:
	MOV R0, #1
	LDR R1, =unknown
	MOV R2, #26
	MOV R7, #4
	SWI 0

    B _prompt_again

_unavailable:
	PUSH {R1}			@ save bit mask again

	MOV R0, #1
	LDR R1, =unavailable
	MOV R2, #22
	MOV R7, #4
	SWI 0

    B _prompt_again

_show_help:
	MOV R0, #1
	LDR R1, =help
	MOV R2, #73
	MOV R7, #4
	SWI 0

    B _prompt_again
