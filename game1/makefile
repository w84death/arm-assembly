game: main.o
	ld -o game main.o globals.o prompt.o game_over.o ui_term.o ui_room.o room1.o room2.o room3.o room4.o exit.o
main.o: main.asm
	as -o main.o main.asm
	as -o globals.o globals.asm
	as -o prompt.o prompt.asm
	as -o game_over.o game_over.asm
	as -o ui_term.o ui_term.asm
	as -o ui_room.o ui_room.asm
	as -o room1.o room1.asm
	as -o room2.o room2.asm
	as -o room3.o room3.asm
	as -o room4.o room4.asm
	as -o exit.o exit.asm
debug:
	as -g -o main.o main.asm
	as -g -o globals.o globals.asm
	as -g -o prompt.o prompt.asm
	as -g -o game_over.o game_over.asm
	as -g -o ui_term.o ui_term.asm
	as -g -o ui_room.o ui_room.asm
	as -g -o room1.o room1.asm
	as -g -o room2.o room2.asm
	as -g -o room3.o room3.asm
	as -g -o room4.o room4.asm
	as -g -o exit.o exit.asm
clean:
	rm *.o
