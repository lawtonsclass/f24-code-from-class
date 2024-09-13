	.arch armv8-a
	.file	"sum-v2.cpp"
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.align	2
	.p2align 4,,11
	.global	_Z9fillArrayPii
	.type	_Z9fillArrayPii, %function
_Z9fillArrayPii:
.LFB2055:
	.cfi_startproc
	cmp	w1, 0
	ble	.L1
	sub	w2, w1, #1
	cmp	w2, 2
	bls	.L6
	adrp	x4, .LC0
	lsr	w3, w1, 2
	movi	v2.4s, 0x4
	mov	x2, x0
	ldr	q0, [x4, #:lo12:.LC0]
	add	x3, x0, w3, uxtw 4
	.p2align 3,,7
.L4:
	mov	v1.16b, v0.16b
	add	v0.4s, v0.4s, v2.4s
	str	q1, [x2], 16
	cmp	x2, x3
	bne	.L4
	and	w2, w1, -4
	cmp	w1, w2
	beq	.L1
.L3:
	add	w3, w2, 1
	str	w2, [x0, w2, sxtw 2]
	sbfiz	x4, x2, 2, 32
	cmp	w1, w3
	ble	.L1
	add	x0, x0, x4
	add	w2, w2, 2
	str	w3, [x0, 4]
	cmp	w1, w2
	ble	.L1
	str	w2, [x0, 8]
.L1:
	ret
.L6:
	mov	w2, 0
	b	.L3
	.cfi_endproc
.LFE2055:
	.size	_Z9fillArrayPii, .-_Z9fillArrayPii
	.align	2
	.p2align 4,,11
	.global	_Z8sumArrayPii
	.type	_Z8sumArrayPii, %function
_Z8sumArrayPii:
.LFB2056:
	.cfi_startproc
	mov	x4, x0
	cmp	w1, 0
	ble	.L15
	sub	w0, w1, #1
	cmp	w0, 2
	bls	.L16
	lsr	w3, w1, 2
	mov	x2, x4
	movi	v0.4s, 0
	add	x3, x4, w3, uxtw 4
	.p2align 3,,7
.L12:
	ldr	q1, [x2], 16
	saddw	v0.2d, v0.2d, v1.2s
	saddw2	v0.2d, v0.2d, v1.4s
	cmp	x2, x3
	bne	.L12
	addp	d0, v0.2d
	and	w2, w1, -4
	fmov	x0, d0
	cmp	w1, w2
	beq	.L9
.L11:
	ldrsw	x5, [x4, w2, sxtw 2]
	add	w3, w2, 1
	sbfiz	x6, x2, 2, 32
	add	x0, x0, x5
	cmp	w1, w3
	ble	.L9
	add	x4, x4, x6
	add	w2, w2, 2
	ldrsw	x3, [x4, 4]
	add	x0, x0, x3
	cmp	w1, w2
	ble	.L9
	ldrsw	x1, [x4, 8]
	add	x0, x0, x1
.L9:
	ret
	.p2align 2,,3
.L15:
	mov	x0, 0
	ret
.L16:
	mov	w2, 0
	mov	x0, 0
	b	.L11
	.cfi_endproc
.LFE2056:
	.size	_Z8sumArrayPii, .-_Z8sumArrayPii
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"sum: "
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB2057:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x0, 33820
	movk	x0, 0x17d7, lsl 16
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	bl	_Znam
	adrp	x1, .LC0
	mov	x3, 33808
	mov	x2, x0
	movi	v2.4s, 0x4
	movk	x3, 0x17d7, lsl 16
	ldr	q0, [x1, #:lo12:.LC0]
	add	x3, x0, x3
	mov	x1, x0
	.p2align 3,,7
.L19:
	mov	v1.16b, v0.16b
	add	v0.4s, v0.4s, v2.4s
	str	q1, [x1], 16
	cmp	x3, x1
	bne	.L19
	movi	v0.4s, 0
	mov	x1, 32768
	movk	x1, 0x17d7, lsl 16
	add	x0, x0, x1
	adrp	x1, .LC2
	ldr	d1, [x1, #:lo12:.LC2]
	mov	w1, 57606
	movk	w1, 0x5f5, lsl 16
	str	w1, [x0, 1048]
	str	d1, [x0, 1040]
	.p2align 3,,7
.L20:
	ldr	q1, [x2], 16
	saddw	v0.2d, v0.2d, v1.2s
	saddw2	v0.2d, v0.2d, v1.4s
	cmp	x2, x3
	bne	.L20
	addp	d0, v0.2d
	mov	x2, 5
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, :got_lo12:_ZSt4cout]
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	fmov	x19, d0
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, :got_lo12:_ZSt4cout]
	mov	x1, 41743
	movk	x1, 0x11e1, lsl 16
	add	x1, x19, x1
	bl	_ZNSo9_M_insertIlEERSoT_
	mov	x19, x0
	ldr	x0, [x0]
	ldr	x0, [x0, -24]
	add	x0, x19, x0
	ldr	x20, [x0, 240]
	cbz	x20, .L27
	ldrb	w0, [x20, 56]
	cbz	w0, .L22
	ldrb	w1, [x20, 67]
.L23:
	mov	x0, x19
	bl	_ZNSo3putEc
	bl	_ZNSo5flushEv
	ldp	x19, x20, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L22:
	.cfi_restore_state
	mov	x0, x20
	bl	_ZNKSt5ctypeIcE13_M_widen_initEv
	ldr	x2, [x20]
	mov	w1, 10
	mov	x0, x20
	ldr	x2, [x2, 48]
	blr	x2
	and	w1, w0, 255
	b	.L23
.L27:
	bl	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE2057:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align	4
.LC0:
	.word	0
	.word	1
	.word	2
	.word	3
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC2:
	.word	100000004
	.word	100000005
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
