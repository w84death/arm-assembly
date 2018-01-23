game: main.o
	ld -o game main.o prompt.o game_over.o ui_room.o room1.o room2.o room3.o
main.o: main.asm
	as -g -o main.o main.asm
	as -g -o prompt.o prompt.asm
	as -g -o game_over.o game_over.asm
	as -g -o ui_room.o ui_room.asm
	as -g -o room1.o room1.asm
	as -g -o room2.o room2.asm
	as -g -o room3.o room3.asm
clean:
	rm *.o
