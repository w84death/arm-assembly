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
clear_screen:
    .ascii "\033c"          @ 1 - clear screen
clear_color:
    .ascii "\033[0m\000"    @ 2 - clear color
color_red: 
    .ascii "\033[31m"       @ 4 - red
color_green:
    .ascii "\033[31m"       @ 8 - green
color_blue:
    .ascii "\033[31m"       @ 16 - blue
color_white:
    .ascii "\033[31m"       @ 32 - white
    
    
.text
.global _ui_term

_ui_term:
    PUSH {LR}
    AND R2, R1, #1
    CMP R2, #1
    BLEQ _clear_screen
    
    AND R2, R1, #2
    CMP R2, #2
    BLEQ _clear_color
    
    AND R2, R1, #4
    CMP R2, #4
    BLEQ _color_red

    POP {LR}
	BX LR
    
_clear_screen:
    MOV R0, #1    
    LDR R1, =clear_screen
    MOV R2, #2
    MOV R7, #4
    SWI 0
    BX LR
    
_clear_color:    
    MOV R0, #1    
    LDR R1, =clear_color
    MOV R2, #5
    MOV R7, #4
    SWI 0
    BX LR
    
_color_red:    
    MOV R0, #1    
    LDR R1, =color_red
    MOV R2, #5
    MOV R7, #4
    SWI 0
    BX LR
	
	
