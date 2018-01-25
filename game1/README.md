```
@ ---------------------------------------------------
@
@   Raspberry Pi Assembly GAME#1 by KJ/P1X
@
@   http://p1x.in | http://krzysztofjankowski.com
@   https://github.com/w84death/arm-assembly
@
@ ---------------------------------------------------
```
# About
This game was made mainly for me to learn assemlby language. It is completely written in ARM Assembly. To make it easy I created a simple text based adventure game concept.

You can only use few commands. Move thru rooms (caves in this case) and trigger diffrent scenarios. And die a lot.

Episode one is placed in the cave. Player needs to escape before torch burns out. On the way player must go to each room in ideal conbination to solve the whole puzzle. Sometimes waiting in one room for few turns is advised.

![intro screen](https://i.imgur.com/x4Y01Ec.png)


![gameplay](https://i.imgur.com/ZMcM9Qn.png)

# Download Pulic Alpha:
- [ARM Alpha1](https://github.com/w84death/arm-assembly/raw/master/game1/game_arm_alpha1)
# How to compile
Use real ARM hardware like any of the Raspberry Pi. Or setup a QEMU device (this is not easy).
```
$ make
```

# Run
```
$ chmod +x game
$ ./game
```

# ToDo (prioritized):
- printing numbers subrutine
- enter triggers / room states
- more rooms with triggers
- torch system (light/dark)
- better visuals (128 ascii art)

# Change Log:
- refactor rooms code
- global variables for all subrutines
- first room with turn trigger (spider)
- ability to win! (there is an exit now)
- turn triggers
- turn system (counting, partial printing)
- [look] command

# Implemented so far:

- start/quit
- rooms
- text commands
- "graphics" sub-rutines
-- displaying room title/descriptions
-- colors/cls sub-rutines
- help
- ability to game over

# Ideas:

- after X-turn one room gets fire, fire "spread" to nearby rooms (diffrent timing for trigger)
- you torch can be blown out, then you can't use [look] and go just blindly eas/west/north/south till the end
- trigger in some caves to run on X turn; if user goes there right away he will die, if user will wait 1 turn before he will see diffrent description (after the event)
- levels? some cave can have a hole and you go to completly new labirynth just too realize that it's all dead-end
