#ifndef switches_included
#define switches_included

// this is basically just switches.h from demo 10

#define SW0 BIT0 // P2.0
#define SW1 BIT1 // P2.1
#define SW2 BIT2 // P2.2
#define SW3 BIT3 // P2.3

#define SWITCHES 15 // 1111 in bin = 15 in dec

void switch_init();
void switch_interrupt_handler();

extern char switch_state_down, switch_state_changed;

#endif
