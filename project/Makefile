COMMON_OBJECTS  =
CPU             = msp430g2553
CFLAGS          = -mmcu=${CPU} -I./h
LDFLAGS		= -L/opt/ti/msp430_gcc/include

CC              = msp430-elf-gcc
AS              = msp430-elf-as

all: project.elf

project.elf: ${COMMON_OBJECTS} p2_interrupt_handler.o led.o switches.o main.o lib/libTimer.a
	${CC} ${CFLAGS} ${LDFLAGS} -o $@ $^

timer:
	(cd timerLib && make install)

load:	project.elf
	msp430loader.sh project.elf

clean:
	rm -f *.o *.elf
	rm -rf h lib
	(cd timerLib && make clean)
