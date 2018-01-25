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

# ToDo (prioritized):
- turn system!
- ability to win!
- refactor ui_term (code duplication)
- turn system!
- torch system (light/dark)
- better visuals (128 ascii art)
- triggers (on X turn)
- ansii art support?

# Change Log:

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
