#include <msp430.h>
#include "libTimer.h"
#include "buzzer.h"

void buzzer_init()
{
  timerAUpmode();
  P2SEL2 &= 
