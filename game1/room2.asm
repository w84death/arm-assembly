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
title: .string "--- Spider cave ---\n"
welcome: .string "\nYou enter another cave. This one is smaller.\nYou see spider crawling next to you.\nSpider jumps on to your head and bite you right in the neck...\n"

.text
.global _room2

_room2:

	MOV R0, #1
	LDR R1, =title
	MOV R2, #19
	MOV R7, #4
	SWI 0
	
	MOV R0, #1
	LDR R1, =welcome
	MOV R2, #147
	MOV R7, #4
	SWI 0

    B _end
