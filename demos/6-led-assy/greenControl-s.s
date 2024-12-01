	.arch msp430g2553
	.p2align 1,0
	.text


	.global greenControl
	.global oncePerSecond
	.extern P1OUT

greenControl:
	cmp #0, r12
	jz off
	bis #64, &P1OUT		;or
	pop r0
off:	and #~64, &P1OUT
	pop r0

	.extern blinkLimit
oncePerSecond:
	add #1, &blinkLimit
	cmp #8, &blinkLimit
	jnc end
	mov #0, &blinkLimit
end:	pop r0
