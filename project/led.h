#ifndef led_included
#define led_included

#include <msp430.h>

#define LED_RED BIT0
#define LED_GREEN BIT6
#define LEDS (BIT0 | BIT6)

void led_init();
void led_update();

// boolean
extern unsigned char leds_changed;
// determines dimness/brightness of green/red leds
// if 0, turn off that respective LED
// otherwise, flicker it every x milliseconds (higher number = brighter light)
extern unsigned char ledFlags;
extern unsigned char green_led_state, red_led_state;
extern unsigned char green_led_limit, red_led_limit;

#endif
