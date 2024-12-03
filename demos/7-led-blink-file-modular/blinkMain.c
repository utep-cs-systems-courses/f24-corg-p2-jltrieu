//Alternate LEDs from Off, Green, and Red
#include <msp430.h>
#include "libTimer.h"
#include "led.h"

int main(void) {
  configureClocks();		/* setup master oscillator, CPU & peripheral clocks */
  //led_init();
  P1DIR |= LEDS;
  P1OUT |= LEDS;
  enableWDTInterrupts();	/* enable periodic interrupt */

  or_sr(0x18);		/* CPU off, GIE on */
}
