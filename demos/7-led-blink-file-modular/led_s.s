	.arch msp430g2553
	.p2align 1,0
	.data

red_on:		.byte 1
green_on:	.byte 1
led_changed:	.byte 0
redVal:		.byte 0
		.byte 1
greenVal:	.byte 0
		.byte 64

	.text

	.global red_on
	.global green_on
	.global led_changed
	.global led_init
	.global led_update

	.extern P1DIR
	.extern P1OUT

led_init:
	bis #65, &P1DIR
	mov.b #1, &led_changed
	call led_update
	pop r0

led_update:
	cmp #0, &led_changed
	jnz cont		; if led_changed == 0, pop r0
	pop r0
cont:	
	mov.b &red_on, r13	; r13 as index
	mov.b redVal(r13), r12	; r12 as ledFlags
	mov.b &green_on, r13
	bis.b greenVal(r13), r12; redVal(red_on) | greenVal(green_on)
	mov.b #255, r13		; r13 temp, temp = 0xff
	xor.b #65, r13		; temp ^= LEDS
	bis.b r12, r13		; temp |= ledFlags
	and r13, &P1OUT		; P1OUT &= temp
	bis r12, &P1OUT	 	; P1OUT |= ledFlags
	mov.b #0, &led_changed
	pop r0
	
