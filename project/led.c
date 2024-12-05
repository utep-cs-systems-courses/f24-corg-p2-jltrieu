#include <msp430.h>
#include "led.h"
#include "switches.h"

unsigned char red_led_limit = 5;
unsigned char green_led_limit = 5;
unsigned char ledFlags = 0;

void led_init()
{
  P1DIR |= LEDS;
  switch_state_changed = 1;
  led_update();
}

void led_update(){
  if (switch_state_changed){
    ledFlags = 0; // no LEDs on by default
    // if a ledflag is included, it will get brighter with each "cycle"
    // otherwise, it will get dimmer
    // in this case, ledFlags should probably be defined outside led_update..
    // that means led_update will solely be responsible for updating the flags of leds
    // whatever naming scheme but whatever
    ledFlags |= (switch_state_down & SW0) ? 0 : LED_GREEN;
    ledFlags |= (switch_state_down & SW1) ? 0 : LED_RED;
    P1OUT &= (0xff - LEDS);
    P1OUT |= ledFlags;
  }
  switch_state_changed = 0;
}
