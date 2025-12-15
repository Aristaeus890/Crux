ORIGIN = "init.asm"
OUTPUT = "crux.ssd"
BOOTNAME = "game"

all:
	clear
	wine beebasm -i $(ORIGIN) -do $(OUTPUT) -boot $(BOOTNAME)
clean:

run:

