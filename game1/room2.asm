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
title: .string "\n--- Spider cave ---\n"
welcome: .string "You enter another cave. This one is smaller.\nYou see spider crawling next to you.\nSpider jumps on to your head and bite you right in the neck...\n"

.text
.global _room2

_room2:
    LDR R1, =title
    MOV R2, #22
    LDR R3, =welcome
    MOV R4, #146
    BL _ui_room

    B _game_over
