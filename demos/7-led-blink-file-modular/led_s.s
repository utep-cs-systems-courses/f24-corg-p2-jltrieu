	.arch msp430g2553
	.p2align 1,0
	.text

	.global red_on
	.global green_on
	.global led_changed
	.global led_init
	.global led_update

red_on:	.byte 0
green_on:	.byte 0
led_changed:	.byte 0
redVal:	.byte 0
	.byte 1
greenVal:	.byte 0
	.byte 64

	.extern P1DIR
	.extern P1OUT

led_init:
	bis #65, &P1DIR		; P1DIR |= BIT6 | BIT0
	mov.b #1, &led_changed	;i think actually i should be using registers but um
	call led_update
	pop r0

led_update:
	cmp #0, &led_changed
	jz end			;if led_changed == 0
	mov.b redVal, r13 	;r13 temp :)
	add.b &red_on, r13	; temp += red_on
	mov.b #1, r12		;r12 is ledFlags ;for now, replacing 0(r13) with 1 to debug
	mov.b greenVal, r13
	add.b &green_on, r13
	bis.b #64, r12		;here we go again ;for now, debugging with temp constants
	mov.b #255, r13		;r13 temp
	xor.b #65, r13		; temp ^= LEDS
	bis.b r12, r13		; temp =| r12
	and.b r13, &P1OUT		; suffer, as I have
	bis r12, &P1OUT
	mov.b #0, &led_changed
end:	pop r0
	
	
