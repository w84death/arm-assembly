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
input: .ascii "1234567812345678"
prompt: .string "-> "
unknown: .string "\nYou rested for one turn.\n"
help: .string "\nYou can use those commands: [quit] [north] [south] [west] [east] [look]\n"
.align 4
commands:
    .ascii "quit"   @ 0
    .ascii "west"   @ 4
    .ascii "east"   @ 8
    .ascii "nort"   @ 12
    .ascii "sout"   @ 16
    .ascii "look"   @ 20
    .ascii "help"   @ 24

.text
.global _prompt

_prompt:
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
	CMP R0, #28
    ADDNE R0, #4
	BNE _loop
	BGE _unknown

_success:
    CMP R0, #0
    BEQ _game_over
    CMP R0, #24
    BEQ _show_help

	BX LR

_unknown:
	MOV R0, #1
	LDR R1, =unknown
	MOV R2, #27
	MOV R7, #4
	SWI 0

    B _prompt

_show_help:
	MOV R0, #1
	LDR R1, =help
	MOV R2, #73
	MOV R7, #4
	SWI 0

    B _prompt
