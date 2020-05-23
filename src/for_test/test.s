    .text
    .globl	gcd				#begin
    .p2align	2
    .type	gcd,@function
gcd:
gcd.entryBB1:
    addi sp,sp,    -336
    sw ra, 288(sp) 
    sw s0, 196(sp) 
    sw s1, 264(sp) 
    sw s2, 220(sp) 
    sw s3, 284(sp) 
    sw s4, 280(sp) 
    sw s5, 296(sp) 
    sw s6, 252(sp) 
    sw s7, 312(sp) 
    sw s8, 232(sp) 
    sw s9, 256(sp) 
    sw s10, 212(sp) 
    sw s11, 228(sp) 
    sw a7, 272(sp) 
    mv	s2,a6 
    sw a5, 192(sp) 
    sw a4, 208(sp) 
    mv	s5,a1 
    lw s7, 428(sp) 
    lw s3, 424(sp) 
    lw t6, 420(sp) 
    sw t6, 268(sp) 
    lw t6, 416(sp) 
    sw t6, 216(sp) 
    lw t6, 412(sp) 
    sw t6, 240(sp) 
    lw t6, 408(sp) 
    sw t6, 200(sp) 
    lw t6, 404(sp) 
    sw t6, 248(sp) 
    lw t6, 400(sp) 
    sw t6, 244(sp) 
    lw t6, 396(sp) 
    sw t6, 292(sp) 
    lw s6, 392(sp) 
    lw t6, 388(sp) 
    sw t6, 308(sp) 
    lw t6, 384(sp) 
    sw t6, 304(sp) 
    lw t6, 380(sp) 
    sw t6, 204(sp) 
    lw t6, 376(sp) 
    sw t6, 316(sp) 
    lw s4, 372(sp) 
    lw s11, 368(sp) 
    lw t6, 364(sp) 
    sw t6, 260(sp) 
    lw s8, 360(sp) 
    lw s10, 356(sp) 
    lw t6, 352(sp) 
    sw t6, 224(sp) 
    lw s9, 348(sp) 
    lw t6, 344(sp) 
    sw t6, 300(sp) 
    lw t6, 340(sp) 
    sw t6, 236(sp) 
    lw s0, 336(sp) 
    mv	t6,zero 
    mv	t0,zero 
    sw t0, 276(sp) 
    j	forcondBB1
forcondBB1:
    li t0, 10
    ble	t6,t0,	forbodyBB1
    j	afterForBB1
forbodyBB1:
    add a5,a2,a3
    lw t0, 208(sp) 
    add t0,a5,t0
    lw a5, 192(sp) 
    add t0,t0,a5
    add t0,t0,s2
    lw a5, 272(sp) 
    add t0,t0,a5
    add a5,t0,s0
    lw t0, 236(sp) 
    add a5,a5,t0
    lw t0, 300(sp) 
    add t0,a5,t0
    add t0,t0,s9
    lw a5, 224(sp) 
    add t0,t0,a5
    add t0,t0,s10
    add a5,t0,s8
    lw t0, 260(sp) 
    add t0,a5,t0
    add t0,t0,s11
    add t0,t0,s4
    lw a5, 316(sp) 
    add a5,t0,a5
    lw t0, 204(sp) 
    add a5,a5,t0
    lw t0, 304(sp) 
    add a5,a5,t0
    lw t0, 308(sp) 
    add t0,a5,t0
    add a5,t0,s6
    lw t0, 292(sp) 
    add t0,a5,t0
    lw a5, 244(sp) 
    add t0,t0,a5
    lw a5, 248(sp) 
    add a5,t0,a5
    lw t0, 200(sp) 
    add t0,a5,t0
    lw a5, 240(sp) 
    add t0,t0,a5
    lw a5, 216(sp) 
    add a5,t0,a5
    lw t0, 268(sp) 
    add t0,a5,t0
    add t0,t0,s3
    add t0,t0,s7
    li a5, 100
    rem t0,t0,a5
    addi t6,t6,    1
    sw t0, 276(sp) 
    j	forcondBB1
afterForBB1:
    rem s1,a0,s5
    beq	s1,zero,	if_thenBB1
    j	if_elseBB1
if_thenBB1:
    mv	a0,s5 
    j	gcd.exitBB1
gcd.exitBB1:
    lw s11, 228(sp) 
    lw s10, 212(sp) 
    lw s9, 256(sp) 
    lw s8, 232(sp) 
    lw s7, 312(sp) 
    lw s6, 252(sp) 
    lw s5, 296(sp) 
    lw s4, 280(sp) 
    lw s3, 284(sp) 
    lw s2, 220(sp) 
    lw s1, 264(sp) 
    lw s0, 196(sp) 
    lw ra, 288(sp) 
    addi sp,sp,    336
    ret
if_elseBB1:
    li t6, 12
    sw t6, 0(sp) 
    li t6, 14
    sw t6, 4(sp) 
    li t6, 16
    sw t6, 8(sp) 
    li t6, 18
    sw t6, 12(sp) 
    li t6, 20
    sw t6, 16(sp) 
    li t6, 22
    sw t6, 20(sp) 
    li t6, 24
    sw t6, 24(sp) 
    li t6, 26
    sw t6, 28(sp) 
    li t6, 28
    sw t6, 32(sp) 
    li t6, 30
    sw t6, 36(sp) 
    li t6, 32
    sw t6, 40(sp) 
    li t6, 34
    sw t6, 44(sp) 
    li t6, 36
    sw t6, 48(sp) 
    li t6, 38
    sw t6, 52(sp) 
    li t6, 40
    sw t6, 56(sp) 
    li t6, 42
    sw t6, 60(sp) 
    li t6, 44
    sw t6, 64(sp) 
    li t6, 46
    sw t6, 68(sp) 
    li t6, 48
    sw t6, 72(sp) 
    li t6, 50
    sw t6, 76(sp) 
    li t6, 52
    sw t6, 80(sp) 
    li t6, 54
    sw t6, 84(sp) 
    li t6, 56
    sw t6, 88(sp) 
    li t6, 58
    sw t6, 92(sp) 
    li a0, 10
    li a1, 68
    mv	a2,zero 
    li a3, 2
    li a4, 4
    li a5, 6
    li a6, 8
    li a7, 10
    call	gcd
    mv	a3,a0 
    lw t6, 276(sp) 
    add t6,t6,a3
    lw t0, 208(sp) 
    add t0,t6,t0
    lw t6, 192(sp) 
    add t6,t0,t6
    add t6,t6,s2
    lw t0, 272(sp) 
    add t6,t6,t0
    add t6,t6,s0
    lw t0, 236(sp) 
    add t6,t6,t0
    lw t0, 300(sp) 
    add t6,t6,t0
    add t0,t6,s9
    lw t6, 224(sp) 
    add t6,t0,t6
    add t6,t6,s10
    add t6,t6,s8
    lw t0, 260(sp) 
    add t6,t6,t0
    add t6,t6,s11
    add t6,t6,s4
    lw t0, 316(sp) 
    add t6,t6,t0
    lw t0, 204(sp) 
    add t6,t6,t0
    lw t0, 304(sp) 
    add t6,t6,t0
    lw t0, 308(sp) 
    add t6,t6,t0
    add t6,t6,s6
    lw t0, 292(sp) 
    add t6,t6,t0
    lw t0, 244(sp) 
    add t0,t6,t0
    lw t6, 248(sp) 
    add t6,t0,t6
    lw t0, 200(sp) 
    add t6,t6,t0
    lw t0, 240(sp) 
    add t0,t6,t0
    lw t6, 216(sp) 
    add t6,t0,t6
    lw t0, 268(sp) 
    add t6,t6,t0
    add t6,t6,s3
    add t0,t6,s7
    li t6, 100
    rem a2,t0,t6
    rem a0,s5,s1
    beq	a0,zero,	_if_thenBB1
    j	_if_elseBB1
_if_elseBB1:
    rem a1,s1,a0
    beq	a1,zero,	_if_thenBB2
    j	_if_elseBB2
_if_elseBB2:
    sw s0, 0(sp) 
    lw t6, 236(sp) 
    sw t6, 4(sp) 
    lw t6, 300(sp) 
    sw t6, 8(sp) 
    sw s9, 12(sp) 
    lw t6, 224(sp) 
    sw t6, 16(sp) 
    sw s10, 20(sp) 
    sw s8, 24(sp) 
    lw t6, 260(sp) 
    sw t6, 28(sp) 
    sw s11, 32(sp) 
    sw s4, 36(sp) 
    lw t6, 316(sp) 
    sw t6, 40(sp) 
    lw t6, 204(sp) 
    sw t6, 44(sp) 
    lw t6, 304(sp) 
    sw t6, 48(sp) 
    lw t6, 308(sp) 
    sw t6, 52(sp) 
    sw s6, 56(sp) 
    lw t6, 292(sp) 
    sw t6, 60(sp) 
    lw t6, 244(sp) 
    sw t6, 64(sp) 
    lw t6, 248(sp) 
    sw t6, 68(sp) 
    lw t6, 200(sp) 
    sw t6, 72(sp) 
    lw t6, 240(sp) 
    sw t6, 76(sp) 
    lw t6, 216(sp) 
    sw t6, 80(sp) 
    lw t6, 268(sp) 
    sw t6, 84(sp) 
    sw s3, 88(sp) 
    sw s7, 92(sp) 
    lw a4, 208(sp) 
    lw a5, 192(sp) 
    mv	a6,s2 
    lw a7, 272(sp) 
    call	gcd
    j	afterCallBB1
afterCallBB1:
    j	afterCallBB2
afterCallBB2:
    j	gcd.exitBB1
_if_thenBB2:
    j	afterCallBB1
_if_thenBB1:
    mv	a0,s1 
    j	afterCallBB2
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -112
    sw ra, 96(sp) 
    li t6, 12
    sw t6, 0(sp) 
    li t6, 14
    sw t6, 4(sp) 
    li t6, 16
    sw t6, 8(sp) 
    li t6, 18
    sw t6, 12(sp) 
    li t6, 20
    sw t6, 16(sp) 
    li t6, 22
    sw t6, 20(sp) 
    li t6, 24
    sw t6, 24(sp) 
    li t6, 26
    sw t6, 28(sp) 
    li t6, 28
    sw t6, 32(sp) 
    li t6, 30
    sw t6, 36(sp) 
    li t6, 32
    sw t6, 40(sp) 
    li t6, 34
    sw t6, 44(sp) 
    li t6, 36
    sw t6, 48(sp) 
    li t6, 38
    sw t6, 52(sp) 
    li t6, 40
    sw t6, 56(sp) 
    li t6, 42
    sw t6, 60(sp) 
    li t6, 44
    sw t6, 64(sp) 
    li t6, 46
    sw t6, 68(sp) 
    li t6, 48
    sw t6, 72(sp) 
    li t6, 50
    sw t6, 76(sp) 
    li t6, 52
    sw t6, 80(sp) 
    li t6, 54
    sw t6, 84(sp) 
    li t6, 56
    sw t6, 88(sp) 
    li t6, 58
    sw t6, 92(sp) 
    li a0, 10
    li a1, 1
    mv	a2,zero 
    li a3, 2
    li a4, 4
    li a5, 6
    li a6, 8
    li a7, 10
    call	gcd
    addi a0,a0,    1024
    call	printlnInt
    lw ra, 96(sp) 
    mv	a0,zero 
    addi sp,sp,    112
    ret
								 # func end
    .globl	gcd1				#begin
    .p2align	2
    .type	gcd1,@function
gcd1:
gcd1.entryBB1:
    addi sp,sp,    -528
    sw ra, 428(sp) 
    sw s0, 504(sp) 
    sw s1, 416(sp) 
    sw s2, 400(sp) 
    sw s3, 488(sp) 
    sw s4, 516(sp) 
    sw s5, 392(sp) 
    sw s6, 512(sp) 
    sw s7, 384(sp) 
    sw s8, 412(sp) 
    sw s9, 424(sp) 
    sw s10, 460(sp) 
    sw s11, 508(sp) 
    sw a7, 496(sp) 
    mv	s10,a6 
    mv	s4,a5 
    mv	s6,a4 
    lw t6, 620(sp) 
    sw t6, 388(sp) 
    lw s0, 616(sp) 
    lw t6, 612(sp) 
    sw t6, 464(sp) 
    lw s2, 608(sp) 
    lw t6, 604(sp) 
    sw t6, 420(sp) 
    lw s8, 600(sp) 
    lw s3, 596(sp) 
    lw t6, 592(sp) 
    sw t6, 432(sp) 
    lw t6, 588(sp) 
    sw t6, 448(sp) 
    lw t6, 584(sp) 
    sw t6, 472(sp) 
    lw t6, 580(sp) 
    sw t6, 396(sp) 
    lw t6, 576(sp) 
    sw t6, 492(sp) 
    lw t6, 572(sp) 
    sw t6, 476(sp) 
    lw t6, 568(sp) 
    sw t6, 468(sp) 
    lw s1, 564(sp) 
    lw t6, 560(sp) 
    sw t6, 408(sp) 
    lw t6, 556(sp) 
    sw t6, 500(sp) 
    lw t6, 552(sp) 
    sw t6, 440(sp) 
    lw t6, 548(sp) 
    sw t6, 444(sp) 
    lw s7, 544(sp) 
    lw s5, 540(sp) 
    lw t6, 536(sp) 
    sw t6, 404(sp) 
    lw t6, 532(sp) 
    sw t6, 456(sp) 
    lw s9, 528(sp) 
    add t6,a2,a3
    add t6,t6,s6
    add t6,t6,s4
    add t0,t6,s10
    lw t6, 496(sp) 
    add t6,t0,t6
    add t6,t6,s9
    lw t0, 456(sp) 
    add t6,t6,t0
    lw t0, 404(sp) 
    add t6,t6,t0
    add t6,t6,s5
    add t0,t6,s7
    lw t6, 444(sp) 
    add t6,t0,t6
    lw t0, 440(sp) 
    add t0,t6,t0
    lw t6, 500(sp) 
    add t6,t0,t6
    lw t0, 408(sp) 
    add t6,t6,t0
    add t0,t6,s1
    lw t6, 468(sp) 
    add t0,t0,t6
    lw t6, 476(sp) 
    add t0,t0,t6
    lw t6, 492(sp) 
    add t0,t0,t6
    lw t6, 396(sp) 
    add t0,t0,t6
    lw t6, 472(sp) 
    add t6,t0,t6
    lw t0, 448(sp) 
    add t0,t6,t0
    lw t6, 432(sp) 
    add t6,t0,t6
    add t6,t6,s3
    add t6,t6,s8
    lw t0, 420(sp) 
    add t6,t6,t0
    add t0,t6,s2
    lw t6, 464(sp) 
    add t6,t0,t6
    add t0,t6,s0
    lw t6, 388(sp) 
    add t0,t0,t6
    li t6, 100
    rem a2,t0,t6
    rem a0,a0,a1
    beq	a0,zero,	if_thenBB2
    j	if_elseBB2
if_thenBB2:
    mv	a0,a1 
    j	gcd1.exitBB1
gcd1.exitBB1:
    lw s11, 508(sp) 
    lw s10, 460(sp) 
    lw s9, 424(sp) 
    lw s8, 412(sp) 
    lw s7, 384(sp) 
    lw s6, 512(sp) 
    lw s5, 392(sp) 
    lw s4, 516(sp) 
    lw s3, 488(sp) 
    lw s2, 400(sp) 
    lw s1, 416(sp) 
    lw s0, 504(sp) 
    lw ra, 428(sp) 
    addi sp,sp,    528
    ret
if_elseBB2:
    rem s11,a1,a0
    beq	s11,zero,	_if_thenBB3
    j	_if_elseBB3
_if_thenBB3:
    j	afterCallBB3
afterCallBB3:
    j	gcd1.exitBB1
_if_elseBB3:
    mv	t0,zero 
    mv	t6,zero 
    sw t6, 484(sp) 
    j	_forcondBB1
_forcondBB1:
    li t6, 10
    ble	t0,t6,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    rem t6,a0,s11
    sw t6, 452(sp) 
    lw t6, 452(sp) 
    beq	t6,zero,	_if_thenBB4
    j	_if_elseBB4
_if_thenBB4:
    mv	a0,s11 
    j	afterCallBB4
afterCallBB4:
    j	afterCallBB3
_if_elseBB4:
    mv	t6,zero 
    sw t6, 436(sp) 
    mv	t0,zero 
    j	_forcondBB2
_forcondBB2:
    li t6, 10
    ble	t0,t6,	_forbodyBB2
    j	_if_elseBB5
_forbodyBB2:
    addi t0,t0,    1
    li t6, 70
    sw t6, 436(sp) 
    j	_forcondBB2
_if_elseBB5:
    mv	t0,zero 
    sw t0, 480(sp) 
    mv	t6,zero 
    j	_forcondBB3
_forcondBB3:
    li t0, 10
    ble	t6,t0,	_forbodyBB3
    j	_if_elseBB6
_if_elseBB6:
    li t6, 12
    sw t6, 0(sp) 
    li t6, 14
    sw t6, 4(sp) 
    li t6, 16
    sw t6, 8(sp) 
    li t6, 18
    sw t6, 12(sp) 
    li t6, 20
    sw t6, 16(sp) 
    li t6, 22
    sw t6, 20(sp) 
    li t6, 24
    sw t6, 24(sp) 
    li t6, 26
    sw t6, 28(sp) 
    li t6, 28
    sw t6, 32(sp) 
    li t6, 30
    sw t6, 36(sp) 
    li t6, 32
    sw t6, 40(sp) 
    li t6, 34
    sw t6, 44(sp) 
    li t6, 36
    sw t6, 48(sp) 
    li t6, 38
    sw t6, 52(sp) 
    li t6, 40
    sw t6, 56(sp) 
    li t6, 42
    sw t6, 60(sp) 
    li t6, 44
    sw t6, 64(sp) 
    li t6, 46
    sw t6, 68(sp) 
    li t6, 48
    sw t6, 72(sp) 
    li t6, 50
    sw t6, 76(sp) 
    li t6, 52
    sw t6, 80(sp) 
    li t6, 54
    sw t6, 84(sp) 
    li t6, 56
    sw t6, 88(sp) 
    li t6, 58
    sw t6, 92(sp) 
    li a0, 10
    li a1, 68
    mv	a2,zero 
    li a3, 2
    li a4, 4
    li a5, 6
    li a6, 8
    li a7, 10
    call	gcd
    mv	a3,a0 
    li t6, 12
    sw t6, 0(sp) 
    li t6, 14
    sw t6, 4(sp) 
    li t6, 16
    sw t6, 8(sp) 
    li t6, 18
    sw t6, 12(sp) 
    li t6, 20
    sw t6, 16(sp) 
    li t6, 22
    sw t6, 20(sp) 
    li t6, 24
    sw t6, 24(sp) 
    li t6, 26
    sw t6, 28(sp) 
    li t6, 28
    sw t6, 32(sp) 
    li t6, 30
    sw t6, 36(sp) 
    li t6, 32
    sw t6, 40(sp) 
    li t6, 34
    sw t6, 44(sp) 
    li t6, 36
    sw t6, 48(sp) 
    li t6, 38
    sw t6, 52(sp) 
    li t6, 40
    sw t6, 56(sp) 
    li t6, 42
    sw t6, 60(sp) 
    li t6, 44
    sw t6, 64(sp) 
    li t6, 46
    sw t6, 68(sp) 
    li t6, 48
    sw t6, 72(sp) 
    li t6, 50
    sw t6, 76(sp) 
    li t6, 52
    sw t6, 80(sp) 
    li t6, 54
    sw t6, 84(sp) 
    li t6, 56
    sw t6, 88(sp) 
    li t6, 58
    sw t6, 92(sp) 
    li a0, 68
    li a1, 10
    lw a2, 480(sp) 
    li a4, 4
    li a5, 6
    li a6, 8
    li a7, 10
    call	gcd1
    mv	a3,a0 
    li t6, 12
    sw t6, 0(sp) 
    li t6, 14
    sw t6, 4(sp) 
    li t6, 16
    sw t6, 8(sp) 
    li t6, 18
    sw t6, 12(sp) 
    li t6, 20
    sw t6, 16(sp) 
    li t6, 22
    sw t6, 20(sp) 
    li t6, 24
    sw t6, 24(sp) 
    li t6, 26
    sw t6, 28(sp) 
    li t6, 28
    sw t6, 32(sp) 
    li t6, 30
    sw t6, 36(sp) 
    li t6, 32
    sw t6, 40(sp) 
    li t6, 34
    sw t6, 44(sp) 
    li t6, 36
    sw t6, 48(sp) 
    li t6, 38
    sw t6, 52(sp) 
    li t6, 40
    sw t6, 56(sp) 
    li t6, 42
    sw t6, 60(sp) 
    li t6, 44
    sw t6, 64(sp) 
    li t6, 46
    sw t6, 68(sp) 
    li t6, 48
    sw t6, 72(sp) 
    li t6, 50
    sw t6, 76(sp) 
    li t6, 52
    sw t6, 80(sp) 
    li t6, 54
    sw t6, 84(sp) 
    li t6, 56
    sw t6, 88(sp) 
    li t6, 58
    sw t6, 92(sp) 
    li a0, 68
    li a1, 10
    lw a2, 436(sp) 
    li a4, 4
    li a5, 6
    li a6, 8
    li a7, 10
    call	gcd1
    mv	a3,a0 
    sw s9, 0(sp) 
    lw t6, 456(sp) 
    sw t6, 4(sp) 
    lw t6, 404(sp) 
    sw t6, 8(sp) 
    sw s5, 12(sp) 
    sw s7, 16(sp) 
    lw t6, 444(sp) 
    sw t6, 20(sp) 
    lw t6, 440(sp) 
    sw t6, 24(sp) 
    lw t6, 500(sp) 
    sw t6, 28(sp) 
    lw t6, 408(sp) 
    sw t6, 32(sp) 
    sw s1, 36(sp) 
    lw t6, 468(sp) 
    sw t6, 40(sp) 
    lw t6, 476(sp) 
    sw t6, 44(sp) 
    lw t6, 492(sp) 
    sw t6, 48(sp) 
    lw t6, 396(sp) 
    sw t6, 52(sp) 
    lw t6, 472(sp) 
    sw t6, 56(sp) 
    lw t6, 448(sp) 
    sw t6, 60(sp) 
    lw t6, 432(sp) 
    sw t6, 64(sp) 
    sw s3, 68(sp) 
    sw s8, 72(sp) 
    lw t6, 420(sp) 
    sw t6, 76(sp) 
    sw s2, 80(sp) 
    lw t6, 464(sp) 
    sw t6, 84(sp) 
    sw s0, 88(sp) 
    lw t6, 388(sp) 
    sw t6, 92(sp) 
    mv	a0,s11 
    lw a1, 452(sp) 
    lw a2, 484(sp) 
    mv	a4,s6 
    mv	a5,s4 
    mv	a6,s10 
    lw a7, 496(sp) 
    call	gcd1
    j	afterCallBB4
_forbodyBB3:
    addi t6,t6,    1
    li t0, 70
    sw t0, 480(sp) 
    j	_forcondBB3
_forbodyBB1:
    add t6,a2,a3
    add t6,t6,s6
    add t6,t6,s4
    add a5,t6,s10
    lw t6, 496(sp) 
    add t6,a5,t6
    add a5,t6,s9
    lw t6, 456(sp) 
    add t6,a5,t6
    lw a5, 404(sp) 
    add t6,t6,a5
    add t6,t6,s5
    add t6,t6,s7
    lw a5, 444(sp) 
    add a5,t6,a5
    lw t6, 440(sp) 
    add a5,a5,t6
    lw t6, 500(sp) 
    add t6,a5,t6
    lw a5, 408(sp) 
    add t6,t6,a5
    add a5,t6,s1
    lw t6, 468(sp) 
    add a5,a5,t6
    lw t6, 476(sp) 
    add a5,a5,t6
    lw t6, 492(sp) 
    add a5,a5,t6
    lw t6, 396(sp) 
    add t6,a5,t6
    lw a5, 472(sp) 
    add t6,t6,a5
    lw a5, 448(sp) 
    add t6,t6,a5
    lw a5, 432(sp) 
    add t6,t6,a5
    add t6,t6,s3
    add a5,t6,s8
    lw t6, 420(sp) 
    add t6,a5,t6
    add a5,t6,s2
    lw t6, 464(sp) 
    add t6,a5,t6
    add a5,t6,s0
    lw t6, 388(sp) 
    add t6,a5,t6
    li a5, 100
    rem t6,t6,a5
    addi t0,t0,    1
    sw t6, 484(sp) 
    j	_forcondBB1
								 # func end
    .globl	gcd2				#begin
    .p2align	2
    .type	gcd2,@function
gcd2:
gcd2.entryBB1:
    addi sp,sp,    -624
    sw ra, 484(sp) 
    sw s0, 616(sp) 
    sw s1, 524(sp) 
    sw s2, 556(sp) 
    sw s3, 564(sp) 
    sw s4, 488(sp) 
    sw s5, 504(sp) 
    sw s6, 496(sp) 
    sw s7, 500(sp) 
    sw s8, 520(sp) 
    sw s9, 480(sp) 
    sw s10, 508(sp) 
    sw s11, 492(sp) 
    sw a7, 560(sp) 
    sw a6, 576(sp) 
    mv	s11,a5 
    sw a4, 536(sp) 
    lw t6, 716(sp) 
    sw t6, 516(sp) 
    lw s9, 712(sp) 
    lw s8, 708(sp) 
    lw s4, 704(sp) 
    lw t6, 700(sp) 
    sw t6, 512(sp) 
    lw t6, 696(sp) 
    sw t6, 552(sp) 
    lw s10, 692(sp) 
    lw t6, 688(sp) 
    sw t6, 540(sp) 
    lw t6, 684(sp) 
    sw t6, 568(sp) 
    lw t6, 680(sp) 
    sw t6, 544(sp) 
    lw t6, 676(sp) 
    sw t6, 596(sp) 
    lw s6, 672(sp) 
    lw t6, 668(sp) 
    sw t6, 592(sp) 
    lw s1, 664(sp) 
    lw t6, 660(sp) 
    sw t6, 612(sp) 
    lw t6, 656(sp) 
    sw t6, 572(sp) 
    lw t6, 652(sp) 
    sw t6, 608(sp) 
    lw t6, 648(sp) 
    sw t6, 600(sp) 
    lw t6, 644(sp) 
    sw t6, 532(sp) 
    lw s7, 640(sp) 
    lw t6, 636(sp) 
    sw t6, 588(sp) 
    lw s3, 632(sp) 
    lw s5, 628(sp) 
    lw t6, 624(sp) 
    sw t6, 584(sp) 
    rem s0,a0,a1
    beq	s0,zero,	if_thenBB3
    j	if_elseBB3
if_elseBB3:
    mv	t6,zero 
    mv	t0,zero 
    sw t0, 604(sp) 
    j	_forcondBB4
_forcondBB4:
    li t0, 10
    ble	t6,t0,	_forbodyBB4
    j	_afterForBB2
_forbodyBB4:
    add a0,a2,a3
    lw t0, 536(sp) 
    add t0,a0,t0
    add t0,t0,s11
    lw a0, 576(sp) 
    add t0,t0,a0
    lw a0, 560(sp) 
    add a0,t0,a0
    lw t0, 584(sp) 
    add t0,a0,t0
    add t0,t0,s5
    add a0,t0,s3
    lw t0, 588(sp) 
    add t0,a0,t0
    add t0,t0,s7
    lw a0, 532(sp) 
    add a0,t0,a0
    lw t0, 600(sp) 
    add t0,a0,t0
    lw a0, 608(sp) 
    add t0,t0,a0
    lw a0, 572(sp) 
    add t0,t0,a0
    lw a0, 612(sp) 
    add t0,t0,a0
    add a0,t0,s1
    lw t0, 592(sp) 
    add t0,a0,t0
    add t0,t0,s6
    lw a0, 596(sp) 
    add t0,t0,a0
    lw a0, 544(sp) 
    add t0,t0,a0
    lw a0, 568(sp) 
    add t0,t0,a0
    lw a0, 540(sp) 
    add t0,t0,a0
    add a0,t0,s10
    lw t0, 552(sp) 
    add t0,a0,t0
    lw a0, 512(sp) 
    add t0,t0,a0
    add t0,t0,s4
    add t0,t0,s8
    add a0,t0,s9
    lw t0, 516(sp) 
    add a0,a0,t0
    li t0, 100
    rem t0,a0,t0
    addi t6,t6,    1
    sw t0, 604(sp) 
    j	_forcondBB4
_afterForBB2:
    rem s2,a1,s0
    beq	s2,zero,	_if_thenBB5
    j	_if_elseBB7
_if_thenBB5:
    mv	a0,s0 
    j	afterCallBB5
afterCallBB5:
    j	gcd2.exitBB1
gcd2.exitBB1:
    lw s11, 492(sp) 
    lw s10, 508(sp) 
    lw s9, 480(sp) 
    lw s8, 520(sp) 
    lw s7, 500(sp) 
    lw s6, 496(sp) 
    lw s5, 504(sp) 
    lw s4, 488(sp) 
    lw s3, 564(sp) 
    lw s2, 556(sp) 
    lw s1, 524(sp) 
    lw s0, 616(sp) 
    lw ra, 484(sp) 
    addi sp,sp,    624
    ret
_if_elseBB7:
    mv	t6,zero 
    mv	t0,zero 
    sw t0, 548(sp) 
    j	_forcondBB5
_forcondBB5:
    li t0, 10
    ble	t6,t0,	_forbodyBB5
    j	_if_elseBB8
_if_elseBB8:
    mv	t0,zero 
    sw t0, 580(sp) 
    mv	t6,zero 
    j	_forcondBB6
_forcondBB6:
    li t0, 10
    ble	t6,t0,	_forbodyBB6
    j	_if_elseBB9
_forbodyBB6:
    addi t6,t6,    1
    li t0, 70
    sw t0, 580(sp) 
    j	_forcondBB6
_if_elseBB9:
    mv	t0,zero 
    sw t0, 528(sp) 
    mv	t6,zero 
    j	_forcondBB7
_forcondBB7:
    li t0, 10
    ble	t6,t0,	_forbodyBB7
    j	_if_elseBB10
_forbodyBB7:
    addi t6,t6,    1
    li t0, 70
    sw t0, 528(sp) 
    j	_forcondBB7
_if_elseBB10:
    li t6, 12
    sw t6, 0(sp) 
    li t6, 14
    sw t6, 4(sp) 
    li t6, 16
    sw t6, 8(sp) 
    li t6, 18
    sw t6, 12(sp) 
    li t6, 20
    sw t6, 16(sp) 
    li t6, 22
    sw t6, 20(sp) 
    li t6, 24
    sw t6, 24(sp) 
    li t6, 26
    sw t6, 28(sp) 
    li t6, 28
    sw t6, 32(sp) 
    li t6, 30
    sw t6, 36(sp) 
    li t6, 32
    sw t6, 40(sp) 
    li t6, 34
    sw t6, 44(sp) 
    li t6, 36
    sw t6, 48(sp) 
    li t6, 38
    sw t6, 52(sp) 
    li t6, 40
    sw t6, 56(sp) 
    li t6, 42
    sw t6, 60(sp) 
    li t6, 44
    sw t6, 64(sp) 
    li t6, 46
    sw t6, 68(sp) 
    li t6, 48
    sw t6, 72(sp) 
    li t6, 50
    sw t6, 76(sp) 
    li t6, 52
    sw t6, 80(sp) 
    li t6, 54
    sw t6, 84(sp) 
    li t6, 56
    sw t6, 88(sp) 
    li t6, 58
    sw t6, 92(sp) 
    li a0, 10
    li a1, 68
    mv	a2,zero 
    li a3, 2
    li a4, 4
    li a5, 6
    li a6, 8
    li a7, 10
    call	gcd
    mv	a3,a0 
    li t6, 12
    sw t6, 0(sp) 
    li t6, 14
    sw t6, 4(sp) 
    li t6, 16
    sw t6, 8(sp) 
    li t6, 18
    sw t6, 12(sp) 
    li t6, 20
    sw t6, 16(sp) 
    li t6, 22
    sw t6, 20(sp) 
    li t6, 24
    sw t6, 24(sp) 
    li t6, 26
    sw t6, 28(sp) 
    li t6, 28
    sw t6, 32(sp) 
    li t6, 30
    sw t6, 36(sp) 
    li t6, 32
    sw t6, 40(sp) 
    li t6, 34
    sw t6, 44(sp) 
    li t6, 36
    sw t6, 48(sp) 
    li t6, 38
    sw t6, 52(sp) 
    li t6, 40
    sw t6, 56(sp) 
    li t6, 42
    sw t6, 60(sp) 
    li t6, 44
    sw t6, 64(sp) 
    li t6, 46
    sw t6, 68(sp) 
    li t6, 48
    sw t6, 72(sp) 
    li t6, 50
    sw t6, 76(sp) 
    li t6, 52
    sw t6, 80(sp) 
    li t6, 54
    sw t6, 84(sp) 
    li t6, 56
    sw t6, 88(sp) 
    li t6, 58
    sw t6, 92(sp) 
    li a0, 68
    li a1, 10
    lw a2, 528(sp) 
    li a4, 4
    li a5, 6
    li a6, 8
    li a7, 10
    call	gcd1
    mv	a3,a0 
    lw t6, 580(sp) 
    add t6,t6,a3
    addi t6,t6,    4
    addi t6,t6,    6
    addi t6,t6,    8
    addi t6,t6,    10
    addi t6,t6,    12
    addi t6,t6,    14
    addi t6,t6,    16
    addi t6,t6,    18
    addi t6,t6,    20
    addi t6,t6,    22
    addi t6,t6,    24
    addi t6,t6,    26
    addi t6,t6,    28
    addi t6,t6,    30
    addi t6,t6,    32
    addi t6,t6,    34
    addi t6,t6,    36
    addi t6,t6,    38
    addi t6,t6,    40
    addi t6,t6,    42
    addi t6,t6,    44
    addi t6,t6,    46
    addi t6,t6,    48
    addi t6,t6,    50
    addi t6,t6,    52
    addi t6,t6,    54
    addi t6,t6,    56
    addi t6,t6,    58
    li t0, 100
    rem a2,t6,t0
    li t6, 12
    sw t6, 0(sp) 
    li t6, 14
    sw t6, 4(sp) 
    li t6, 16
    sw t6, 8(sp) 
    li t6, 18
    sw t6, 12(sp) 
    li t6, 20
    sw t6, 16(sp) 
    li t6, 22
    sw t6, 20(sp) 
    li t6, 24
    sw t6, 24(sp) 
    li t6, 26
    sw t6, 28(sp) 
    li t6, 28
    sw t6, 32(sp) 
    li t6, 30
    sw t6, 36(sp) 
    li t6, 32
    sw t6, 40(sp) 
    li t6, 34
    sw t6, 44(sp) 
    li t6, 36
    sw t6, 48(sp) 
    li t6, 38
    sw t6, 52(sp) 
    li t6, 40
    sw t6, 56(sp) 
    li t6, 42
    sw t6, 60(sp) 
    li t6, 44
    sw t6, 64(sp) 
    li t6, 46
    sw t6, 68(sp) 
    li t6, 48
    sw t6, 72(sp) 
    li t6, 50
    sw t6, 76(sp) 
    li t6, 52
    sw t6, 80(sp) 
    li t6, 54
    sw t6, 84(sp) 
    li t6, 56
    sw t6, 88(sp) 
    li t6, 58
    sw t6, 92(sp) 
    li a0, 10
    li a1, 8
    li a4, 4
    li a5, 6
    li a6, 8
    li a7, 10
    call	gcd2
    mv	a3,a0 
    lw t6, 548(sp) 
    add t6,t6,a3
    addi t6,t6,    4
    addi t6,t6,    6
    addi t6,t6,    8
    addi t6,t6,    10
    addi t6,t6,    12
    addi t6,t6,    14
    addi t6,t6,    16
    addi t6,t6,    18
    addi t6,t6,    20
    addi t6,t6,    22
    addi t6,t6,    24
    addi t6,t6,    26
    addi t6,t6,    28
    addi t6,t6,    30
    addi t6,t6,    32
    addi t6,t6,    34
    addi t6,t6,    36
    addi t6,t6,    38
    addi t6,t6,    40
    addi t6,t6,    42
    addi t6,t6,    44
    addi t6,t6,    46
    addi t6,t6,    48
    addi t6,t6,    50
    addi t6,t6,    52
    addi t6,t6,    54
    addi t6,t6,    56
    addi t0,t6,    58
    li t6, 100
    rem a2,t0,t6
    li t6, 12
    sw t6, 0(sp) 
    li t6, 14
    sw t6, 4(sp) 
    li t6, 16
    sw t6, 8(sp) 
    li t6, 18
    sw t6, 12(sp) 
    li t6, 20
    sw t6, 16(sp) 
    li t6, 22
    sw t6, 20(sp) 
    li t6, 24
    sw t6, 24(sp) 
    li t6, 26
    sw t6, 28(sp) 
    li t6, 28
    sw t6, 32(sp) 
    li t6, 30
    sw t6, 36(sp) 
    li t6, 32
    sw t6, 40(sp) 
    li t6, 34
    sw t6, 44(sp) 
    li t6, 36
    sw t6, 48(sp) 
    li t6, 38
    sw t6, 52(sp) 
    li t6, 40
    sw t6, 56(sp) 
    li t6, 42
    sw t6, 60(sp) 
    li t6, 44
    sw t6, 64(sp) 
    li t6, 46
    sw t6, 68(sp) 
    li t6, 48
    sw t6, 72(sp) 
    li t6, 50
    sw t6, 76(sp) 
    li t6, 52
    sw t6, 80(sp) 
    li t6, 54
    sw t6, 84(sp) 
    li t6, 56
    sw t6, 88(sp) 
    li t6, 58
    sw t6, 92(sp) 
    li a0, 10
    li a1, 8
    li a4, 4
    li a5, 6
    li a6, 8
    li a7, 10
    call	gcd2
    mv	a3,a0 
    lw t6, 604(sp) 
    add t6,t6,a3
    lw t0, 536(sp) 
    add t6,t6,t0
    add t6,t6,s11
    lw t0, 576(sp) 
    add t0,t6,t0
    lw t6, 560(sp) 
    add t0,t0,t6
    lw t6, 584(sp) 
    add t6,t0,t6
    add t6,t6,s5
    add t0,t6,s3
    lw t6, 588(sp) 
    add t6,t0,t6
    add t0,t6,s7
    lw t6, 532(sp) 
    add t6,t0,t6
    lw t0, 600(sp) 
    add t0,t6,t0
    lw t6, 608(sp) 
    add t0,t0,t6
    lw t6, 572(sp) 
    add t6,t0,t6
    lw t0, 612(sp) 
    add t6,t6,t0
    add t6,t6,s1
    lw t0, 592(sp) 
    add t6,t6,t0
    add t0,t6,s6
    lw t6, 596(sp) 
    add t6,t0,t6
    lw t0, 544(sp) 
    add t0,t6,t0
    lw t6, 568(sp) 
    add t6,t0,t6
    lw t0, 540(sp) 
    add t6,t6,t0
    add t0,t6,s10
    lw t6, 552(sp) 
    add t6,t0,t6
    lw t0, 512(sp) 
    add t6,t6,t0
    add t6,t6,s4
    add t6,t6,s8
    add t6,t6,s9
    lw t0, 516(sp) 
    add t6,t6,t0
    li t0, 100
    rem a2,t6,t0
    rem a1,s0,s2
    beq	a1,zero,	_if_thenBB6
    j	_if_elseBB11
_if_thenBB6:
    mv	a0,s2 
    j	afterCallBB6
afterCallBB6:
    j	afterCallBB5
_if_elseBB11:
    lw t6, 584(sp) 
    sw t6, 0(sp) 
    sw s5, 4(sp) 
    sw s3, 8(sp) 
    lw t6, 588(sp) 
    sw t6, 12(sp) 
    sw s7, 16(sp) 
    lw t6, 532(sp) 
    sw t6, 20(sp) 
    lw t6, 600(sp) 
    sw t6, 24(sp) 
    lw t6, 608(sp) 
    sw t6, 28(sp) 
    lw t6, 572(sp) 
    sw t6, 32(sp) 
    lw t6, 612(sp) 
    sw t6, 36(sp) 
    sw s1, 40(sp) 
    lw t6, 592(sp) 
    sw t6, 44(sp) 
    sw s6, 48(sp) 
    lw t6, 596(sp) 
    sw t6, 52(sp) 
    lw t6, 544(sp) 
    sw t6, 56(sp) 
    lw t6, 568(sp) 
    sw t6, 60(sp) 
    lw t6, 540(sp) 
    sw t6, 64(sp) 
    sw s10, 68(sp) 
    lw t6, 552(sp) 
    sw t6, 72(sp) 
    lw t6, 512(sp) 
    sw t6, 76(sp) 
    sw s4, 80(sp) 
    sw s8, 84(sp) 
    sw s9, 88(sp) 
    lw t6, 516(sp) 
    sw t6, 92(sp) 
    mv	a0,s2 
    lw a4, 536(sp) 
    mv	a5,s11 
    lw a6, 576(sp) 
    lw a7, 560(sp) 
    call	gcd2
    j	afterCallBB6
_forbodyBB5:
    addi t6,t6,    1
    li t0, 70
    sw t0, 548(sp) 
    j	_forcondBB5
if_thenBB3:
    mv	a0,a1 
    j	gcd2.exitBB1
								 # func end
    .section	.sdata,"aw",@progbits
