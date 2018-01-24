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
commands:
    .ascii "quit"   @ #0x0
    .ascii "west"   @ #0x4
    .ascii "east"   @ #0x8
    .ascii "nort"   @ #0xc
    .ascii "sout"   @ #0x14
    .ascii "look"   @ #0x18
    .ascii "help"   @ #0x1c

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

_loop:
    LDR R3, [R2, R0]
	CMP R1, R3
	BEQ _success
	CMP R0, #28				@ cmd_length
    ADDNE R0, #0x4
	BNE _loop
	BGE _unknown

_success:
    CMP R0, #0x0
    BEQ _game_over
    CMP R0, #24
    BEQ _show_help

	POP {R1}				@ restore bit mask
	AND R2, R0, R1
	CMP R2, R0
	BNE _unavailable		@ command not available

	BX LR

_unknown:
	MOV R0, #1
	LDR R1, =unknown
	MOV R2, #27
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
