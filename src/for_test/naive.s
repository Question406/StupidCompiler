    .text
    .globl	gcd				#begin
    .p2align	2
    .type	gcd,@function
gcd:
gcd.entryBB1:
    mv	backup_ra,ra 
    mv	back_s0,s0 
    mv	back_s1,s1 
    mv	back_s2,s2 
    mv	back_s3,s3 
    mv	back_s4,s4 
    mv	back_s5,s5 
    mv	back_s6,s6 
    mv	back_s7,s7 
    mv	back_s8,s8 
    mv	back_s9,s9 
    mv	back_s10,s10 
    mv	back_s11,s11 
    mv	j5.0,a7 
    mv	j4.0,a6 
    mv	j3.0,a5 
    mv	j2.0,a4 
    mv	j1.0,a3 
    mv	j0.0,a2 
    mv	y.0,a1 
    mv	x.0,a0 
    lw j29.0, 300(sp) 
    lw j28.0, 296(sp) 
    lw j27.0, 292(sp) 
    lw j26.0, 288(sp) 
    lw j25.0, 284(sp) 
    lw j24.0, 280(sp) 
    lw j23.0, 276(sp) 
    lw j22.0, 272(sp) 
    lw j21.0, 268(sp) 
    lw j20.0, 264(sp) 
    lw j19.0, 260(sp) 
    lw j18.0, 256(sp) 
    lw j17.0, 252(sp) 
    lw j16.0, 248(sp) 
    lw j15.0, 244(sp) 
    lw j14.0, 240(sp) 
    lw j13.0, 236(sp) 
    lw j12.0, 232(sp) 
    lw j11.0, 228(sp) 
    lw j10.0, 224(sp) 
    lw j9.0, 220(sp) 
    lw j8.0, 216(sp) 
    lw j7.0, 212(sp) 
    lw j6.0, 208(sp) 
    mv	i.2,zero 
    mv	j.1,zero 
    j	forcondBB1
forcondBB1:
    li t, 10
    ble	i.2,t,	forbodyBB1
    j	afterForBB1
forbodyBB1:
    add t.0,j0.0,j1.0
    add t.0,t.0,j2.0
    add t.0,t.0,j3.0
    add t.0,t.0,j4.0
    add t.0,t.0,j5.0
    add t.0,t.0,j6.0
    add t.0,t.0,j7.0
    add t.0,t.0,j8.0
    add t.0,t.0,j9.0
    add t.0,t.0,j10.0
    add t.0,t.0,j11.0
    add t.0,t.0,j12.0
    add t.0,t.0,j13.0
    add t.0,t.0,j14.0
    add t.0,t.0,j15.0
    add t.0,t.0,j16.0
    add t.0,t.0,j17.0
    add t.0,t.0,j18.0
    add t.0,t.0,j19.0
    add t.0,t.0,j20.0
    add t.0,t.0,j21.0
    add t.0,t.0,j22.0
    add t.0,t.0,j23.0
    add t.0,t.0,j24.0
    add t.0,t.0,j25.0
    add t.0,t.0,j26.0
    add t.0,t.0,j27.0
    add t.0,t.0,j28.0
    add t.0,t.0,j29.0
    li t, 100
    rem t.0,t.0,t
    addi i.3,i.2,    1
    mv	i.2,i.3 
    mv	j.1,t.0 
    j	forcondBB1
afterForBB1:
    rem t.0,x.0,y.0
    beq	t.0,zero,	if_thenBB1
    j	if_elseBB1
if_thenBB1:
    mv	mergedretVal.1,y.0 
    j	gcd.exitBB1
gcd.exitBB1:
    mv	s11,back_s11 
    mv	s10,back_s10 
    mv	s9,back_s9 
    mv	s8,back_s8 
    mv	s7,back_s7 
    mv	s6,back_s6 
    mv	s5,back_s5 
    mv	s4,back_s4 
    mv	s3,back_s3 
    mv	s2,back_s2 
    mv	s1,back_s1 
    mv	s0,back_s0 
    mv	ra,backup_ra 
    mv	a0,mergedretVal.1 
    ret
if_elseBB1:
    li para, 12
    sw para, 0(sp) 
    li para, 14
    sw para, 4(sp) 
    li para, 16
    sw para, 8(sp) 
    li para, 18
    sw para, 12(sp) 
    li para, 20
    sw para, 16(sp) 
    li para, 22
    sw para, 20(sp) 
    li para, 24
    sw para, 24(sp) 
    li para, 26
    sw para, 28(sp) 
    li para, 28
    sw para, 32(sp) 
    li para, 30
    sw para, 36(sp) 
    li para, 32
    sw para, 40(sp) 
    li para, 34
    sw para, 44(sp) 
    li para, 36
    sw para, 48(sp) 
    li para, 38
    sw para, 52(sp) 
    li para, 40
    sw para, 56(sp) 
    li para, 42
    sw para, 60(sp) 
    li para, 44
    sw para, 64(sp) 
    li para, 46
    sw para, 68(sp) 
    li para, 48
    sw para, 72(sp) 
    li para, 50
    sw para, 76(sp) 
    li para, 52
    sw para, 80(sp) 
    li para, 54
    sw para, 84(sp) 
    li para, 56
    sw para, 88(sp) 
    li para, 58
    sw para, 92(sp) 
    li para, 10
    mv	a0,para 
    li para, 68
    mv	a1,para 
    mv	a2,zero 
    li para, 2
    mv	a3,para 
    li para, 4
    mv	a4,para 
    li para, 6
    mv	a5,para 
    li para, 8
    mv	a6,para 
    li para, 10
    mv	a7,para 
    call	gcd
    mv	t.0,a0 
    add __t.0,j.1,t.0
    add __t.0,__t.0,j2.0
    add __t.0,__t.0,j3.0
    add __t.0,__t.0,j4.0
    add __t.0,__t.0,j5.0
    add __t.0,__t.0,j6.0
    add __t.0,__t.0,j7.0
    add __t.0,__t.0,j8.0
    add __t.0,__t.0,j9.0
    add __t.0,__t.0,j10.0
    add __t.0,__t.0,j11.0
    add __t.0,__t.0,j12.0
    add __t.0,__t.0,j13.0
    add __t.0,__t.0,j14.0
    add __t.0,__t.0,j15.0
    add __t.0,__t.0,j16.0
    add __t.0,__t.0,j17.0
    add __t.0,__t.0,j18.0
    add __t.0,__t.0,j19.0
    add __t.0,__t.0,j20.0
    add __t.0,__t.0,j21.0
    add __t.0,__t.0,j22.0
    add __t.0,__t.0,j23.0
    add __t.0,__t.0,j24.0
    add __t.0,__t.0,j25.0
    add __t.0,__t.0,j26.0
    add __t.0,__t.0,j27.0
    add __t.0,__t.0,j28.0
    add __t.0,__t.0,j29.0
    li t, 100
    rem __t.0,__t.0,t
    rem __t.0,y.0,t.0
    beq	__t.0,zero,	_if_thenBB1
    j	_if_elseBB1
_if_elseBB1:
    rem __t.0,t.0,__t.0
    beq	__t.0,zero,	_if_thenBB2
    j	_if_elseBB2
_if_elseBB2:
    sw j6.0, 0(sp) 
    sw j7.0, 4(sp) 
    sw j8.0, 8(sp) 
    sw j9.0, 12(sp) 
    sw j10.0, 16(sp) 
    sw j11.0, 20(sp) 
    sw j12.0, 24(sp) 
    sw j13.0, 28(sp) 
    sw j14.0, 32(sp) 
    sw j15.0, 36(sp) 
    sw j16.0, 40(sp) 
    sw j17.0, 44(sp) 
    sw j18.0, 48(sp) 
    sw j19.0, 52(sp) 
    sw j20.0, 56(sp) 
    sw j21.0, 60(sp) 
    sw j22.0, 64(sp) 
    sw j23.0, 68(sp) 
    sw j24.0, 72(sp) 
    sw j25.0, 76(sp) 
    sw j26.0, 80(sp) 
    sw j27.0, 84(sp) 
    sw j28.0, 88(sp) 
    sw j29.0, 92(sp) 
    mv	a0,__t.0 
    mv	a1,__t.0 
    mv	a2,__t.0 
    mv	a3,t.0 
    mv	a4,j2.0 
    mv	a5,j3.0 
    mv	a6,j4.0 
    mv	a7,j5.0 
    call	gcd
    mv	__t.0,a0 
    mv	__mergedretVal.4,__t.0 
    j	afterCallBB1
afterCallBB1:
    mv	__mergedretVal.1,__mergedretVal.4 
    j	afterCallBB2
afterCallBB2:
    mv	mergedretVal.1,__mergedretVal.1 
    j	gcd.exitBB1
_if_thenBB2:
    mv	__mergedretVal.4,__t.0 
    j	afterCallBB1
_if_thenBB1:
    mv	__mergedretVal.1,t.0 
    j	afterCallBB2
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    mv	backup_ra,ra 
    mv	back_s0,s0 
    mv	back_s1,s1 
    mv	back_s2,s2 
    mv	back_s3,s3 
    mv	back_s4,s4 
    mv	back_s5,s5 
    mv	back_s6,s6 
    mv	back_s7,s7 
    mv	back_s8,s8 
    mv	back_s9,s9 
    mv	back_s10,s10 
    mv	back_s11,s11 
    li para, 12
    sw para, 0(sp) 
    li para, 14
    sw para, 4(sp) 
    li para, 16
    sw para, 8(sp) 
    li para, 18
    sw para, 12(sp) 
    li para, 20
    sw para, 16(sp) 
    li para, 22
    sw para, 20(sp) 
    li para, 24
    sw para, 24(sp) 
    li para, 26
    sw para, 28(sp) 
    li para, 28
    sw para, 32(sp) 
    li para, 30
    sw para, 36(sp) 
    li para, 32
    sw para, 40(sp) 
    li para, 34
    sw para, 44(sp) 
    li para, 36
    sw para, 48(sp) 
    li para, 38
    sw para, 52(sp) 
    li para, 40
    sw para, 56(sp) 
    li para, 42
    sw para, 60(sp) 
    li para, 44
    sw para, 64(sp) 
    li para, 46
    sw para, 68(sp) 
    li para, 48
    sw para, 72(sp) 
    li para, 50
    sw para, 76(sp) 
    li para, 52
    sw para, 80(sp) 
    li para, 54
    sw para, 84(sp) 
    li para, 56
    sw para, 88(sp) 
    li para, 58
    sw para, 92(sp) 
    li para, 10
    mv	a0,para 
    li para, 1
    mv	a1,para 
    mv	a2,zero 
    li para, 2
    mv	a3,para 
    li para, 4
    mv	a4,para 
    li para, 6
    mv	a5,para 
    li para, 8
    mv	a6,para 
    li para, 10
    mv	a7,para 
    call	gcd
    mv	_t.0,a0 
    addi _t.0,_t.0,    1024
    mv	a0,_t.0 
    call	printlnInt
    mv	s11,back_s11 
    mv	s10,back_s10 
    mv	s9,back_s9 
    mv	s8,back_s8 
    mv	s7,back_s7 
    mv	s6,back_s6 
    mv	s5,back_s5 
    mv	s4,back_s4 
    mv	s3,back_s3 
    mv	s2,back_s2 
    mv	s1,back_s1 
    mv	s0,back_s0 
    mv	ra,backup_ra 
    mv	a0,zero 
    ret
								 # func end
    .globl	gcd1				#begin
    .p2align	2
    .type	gcd1,@function
gcd1:
gcd1.entryBB1:
    mv	backup_ra,ra 
    mv	back_s0,s0 
    mv	back_s1,s1 
    mv	back_s2,s2 
    mv	back_s3,s3 
    mv	back_s4,s4 
    mv	back_s5,s5 
    mv	back_s6,s6 
    mv	back_s7,s7 
    mv	back_s8,s8 
    mv	back_s9,s9 
    mv	back_s10,s10 
    mv	back_s11,s11 
    mv	j5.0,a7 
    mv	j4.0,a6 
    mv	j3.0,a5 
    mv	j2.0,a4 
    mv	j1.0,a3 
    mv	j0.0,a2 
    mv	y.0,a1 
    mv	x.0,a0 
    lw j29.0, 492(sp) 
    lw j28.0, 488(sp) 
    lw j27.0, 484(sp) 
    lw j26.0, 480(sp) 
    lw j25.0, 476(sp) 
    lw j24.0, 472(sp) 
    lw j23.0, 468(sp) 
    lw j22.0, 464(sp) 
    lw j21.0, 460(sp) 
    lw j20.0, 456(sp) 
    lw j19.0, 452(sp) 
    lw j18.0, 448(sp) 
    lw j17.0, 444(sp) 
    lw j16.0, 440(sp) 
    lw j15.0, 436(sp) 
    lw j14.0, 432(sp) 
    lw j13.0, 428(sp) 
    lw j12.0, 424(sp) 
    lw j11.0, 420(sp) 
    lw j10.0, 416(sp) 
    lw j9.0, 412(sp) 
    lw j8.0, 408(sp) 
    lw j7.0, 404(sp) 
    lw j6.0, 400(sp) 
    add t.0,j0.0,j1.0
    add t.0,t.0,j2.0
    add t.0,t.0,j3.0
    add t.0,t.0,j4.0
    add t.0,t.0,j5.0
    add t.0,t.0,j6.0
    add t.0,t.0,j7.0
    add t.0,t.0,j8.0
    add t.0,t.0,j9.0
    add t.0,t.0,j10.0
    add t.0,t.0,j11.0
    add t.0,t.0,j12.0
    add t.0,t.0,j13.0
    add t.0,t.0,j14.0
    add t.0,t.0,j15.0
    add t.0,t.0,j16.0
    add t.0,t.0,j17.0
    add t.0,t.0,j18.0
    add t.0,t.0,j19.0
    add t.0,t.0,j20.0
    add t.0,t.0,j21.0
    add t.0,t.0,j22.0
    add t.0,t.0,j23.0
    add t.0,t.0,j24.0
    add t.0,t.0,j25.0
    add t.0,t.0,j26.0
    add t.0,t.0,j27.0
    add t.0,t.0,j28.0
    add t.0,t.0,j29.0
    li t, 100
    rem t.0,t.0,t
    rem t.0,x.0,y.0
    beq	t.0,zero,	if_thenBB2
    j	if_elseBB2
if_thenBB2:
    mv	mergedretVal.2,y.0 
    j	gcd1.exitBB1
gcd1.exitBB1:
    mv	s11,back_s11 
    mv	s10,back_s10 
    mv	s9,back_s9 
    mv	s8,back_s8 
    mv	s7,back_s7 
    mv	s6,back_s6 
    mv	s5,back_s5 
    mv	s4,back_s4 
    mv	s3,back_s3 
    mv	s2,back_s2 
    mv	s1,back_s1 
    mv	s0,back_s0 
    mv	ra,backup_ra 
    mv	a0,mergedretVal.2 
    ret
if_elseBB2:
    rem __t.0,y.0,t.0
    beq	__t.0,zero,	_if_thenBB3
    j	_if_elseBB3
_if_thenBB3:
    mv	__mergedretVal.0,t.0 
    j	afterCallBB3
afterCallBB3:
    mv	mergedretVal.2,__mergedretVal.0 
    j	gcd1.exitBB1
_if_elseBB3:
    mv	__i.3,zero 
    mv	__j.2,zero 
    j	_forcondBB1
_forcondBB1:
    li t, 10
    ble	__i.3,t,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    rem __t.0,t.0,__t.0
    beq	__t.0,zero,	_if_thenBB4
    j	_if_elseBB4
_if_thenBB4:
    mv	__mergedretVal.1,__t.0 
    j	afterCallBB4
afterCallBB4:
    mv	__mergedretVal.0,__mergedretVal.1 
    j	afterCallBB3
_if_elseBB4:
    mv	__j.3,zero 
    mv	__i.4,zero 
    j	_forcondBB2
_forcondBB2:
    li t, 10
    ble	__i.4,t,	_forbodyBB2
    j	_if_elseBB5
_forbodyBB2:
    addi __i.5,__i.4,    1
    mv	__i.4,__i.5 
    li __j.3, 70
    j	_forcondBB2
_if_elseBB5:
    mv	__j.4,zero 
    mv	__i.5,zero 
    j	_forcondBB3
_forcondBB3:
    li t, 10
    ble	__i.5,t,	_forbodyBB3
    j	_if_elseBB6
_if_elseBB6:
    li para, 12
    sw para, 0(sp) 
    li para, 14
    sw para, 4(sp) 
    li para, 16
    sw para, 8(sp) 
    li para, 18
    sw para, 12(sp) 
    li para, 20
    sw para, 16(sp) 
    li para, 22
    sw para, 20(sp) 
    li para, 24
    sw para, 24(sp) 
    li para, 26
    sw para, 28(sp) 
    li para, 28
    sw para, 32(sp) 
    li para, 30
    sw para, 36(sp) 
    li para, 32
    sw para, 40(sp) 
    li para, 34
    sw para, 44(sp) 
    li para, 36
    sw para, 48(sp) 
    li para, 38
    sw para, 52(sp) 
    li para, 40
    sw para, 56(sp) 
    li para, 42
    sw para, 60(sp) 
    li para, 44
    sw para, 64(sp) 
    li para, 46
    sw para, 68(sp) 
    li para, 48
    sw para, 72(sp) 
    li para, 50
    sw para, 76(sp) 
    li para, 52
    sw para, 80(sp) 
    li para, 54
    sw para, 84(sp) 
    li para, 56
    sw para, 88(sp) 
    li para, 58
    sw para, 92(sp) 
    li para, 10
    mv	a0,para 
    li para, 68
    mv	a1,para 
    mv	a2,zero 
    li para, 2
    mv	a3,para 
    li para, 4
    mv	a4,para 
    li para, 6
    mv	a5,para 
    li para, 8
    mv	a6,para 
    li para, 10
    mv	a7,para 
    call	gcd
    mv	__t.0,a0 
    li para, 12
    sw para, 0(sp) 
    li para, 14
    sw para, 4(sp) 
    li para, 16
    sw para, 8(sp) 
    li para, 18
    sw para, 12(sp) 
    li para, 20
    sw para, 16(sp) 
    li para, 22
    sw para, 20(sp) 
    li para, 24
    sw para, 24(sp) 
    li para, 26
    sw para, 28(sp) 
    li para, 28
    sw para, 32(sp) 
    li para, 30
    sw para, 36(sp) 
    li para, 32
    sw para, 40(sp) 
    li para, 34
    sw para, 44(sp) 
    li para, 36
    sw para, 48(sp) 
    li para, 38
    sw para, 52(sp) 
    li para, 40
    sw para, 56(sp) 
    li para, 42
    sw para, 60(sp) 
    li para, 44
    sw para, 64(sp) 
    li para, 46
    sw para, 68(sp) 
    li para, 48
    sw para, 72(sp) 
    li para, 50
    sw para, 76(sp) 
    li para, 52
    sw para, 80(sp) 
    li para, 54
    sw para, 84(sp) 
    li para, 56
    sw para, 88(sp) 
    li para, 58
    sw para, 92(sp) 
    li para, 68
    mv	a0,para 
    li para, 10
    mv	a1,para 
    mv	a2,__j.4 
    mv	a3,__t.0 
    li para, 4
    mv	a4,para 
    li para, 6
    mv	a5,para 
    li para, 8
    mv	a6,para 
    li para, 10
    mv	a7,para 
    call	gcd1
    mv	__t.0,a0 
    li para, 12
    sw para, 0(sp) 
    li para, 14
    sw para, 4(sp) 
    li para, 16
    sw para, 8(sp) 
    li para, 18
    sw para, 12(sp) 
    li para, 20
    sw para, 16(sp) 
    li para, 22
    sw para, 20(sp) 
    li para, 24
    sw para, 24(sp) 
    li para, 26
    sw para, 28(sp) 
    li para, 28
    sw para, 32(sp) 
    li para, 30
    sw para, 36(sp) 
    li para, 32
    sw para, 40(sp) 
    li para, 34
    sw para, 44(sp) 
    li para, 36
    sw para, 48(sp) 
    li para, 38
    sw para, 52(sp) 
    li para, 40
    sw para, 56(sp) 
    li para, 42
    sw para, 60(sp) 
    li para, 44
    sw para, 64(sp) 
    li para, 46
    sw para, 68(sp) 
    li para, 48
    sw para, 72(sp) 
    li para, 50
    sw para, 76(sp) 
    li para, 52
    sw para, 80(sp) 
    li para, 54
    sw para, 84(sp) 
    li para, 56
    sw para, 88(sp) 
    li para, 58
    sw para, 92(sp) 
    li para, 68
    mv	a0,para 
    li para, 10
    mv	a1,para 
    mv	a2,__j.3 
    mv	a3,__t.0 
    li para, 4
    mv	a4,para 
    li para, 6
    mv	a5,para 
    li para, 8
    mv	a6,para 
    li para, 10
    mv	a7,para 
    call	gcd1
    mv	__t.0,a0 
    sw j6.0, 0(sp) 
    sw j7.0, 4(sp) 
    sw j8.0, 8(sp) 
    sw j9.0, 12(sp) 
    sw j10.0, 16(sp) 
    sw j11.0, 20(sp) 
    sw j12.0, 24(sp) 
    sw j13.0, 28(sp) 
    sw j14.0, 32(sp) 
    sw j15.0, 36(sp) 
    sw j16.0, 40(sp) 
    sw j17.0, 44(sp) 
    sw j18.0, 48(sp) 
    sw j19.0, 52(sp) 
    sw j20.0, 56(sp) 
    sw j21.0, 60(sp) 
    sw j22.0, 64(sp) 
    sw j23.0, 68(sp) 
    sw j24.0, 72(sp) 
    sw j25.0, 76(sp) 
    sw j26.0, 80(sp) 
    sw j27.0, 84(sp) 
    sw j28.0, 88(sp) 
    sw j29.0, 92(sp) 
    mv	a0,__t.0 
    mv	a1,__t.0 
    mv	a2,__j.2 
    mv	a3,__t.0 
    mv	a4,j2.0 
    mv	a5,j3.0 
    mv	a6,j4.0 
    mv	a7,j5.0 
    call	gcd1
    mv	__t.0,a0 
    mv	__mergedretVal.1,__t.0 
    j	afterCallBB4
_forbodyBB3:
    addi __i.6,__i.5,    1
    mv	__i.5,__i.6 
    li __j.4, 70
    j	_forcondBB3
_forbodyBB1:
    add __t.0,t.0,j1.0
    add __t.0,__t.0,j2.0
    add __t.0,__t.0,j3.0
    add __t.0,__t.0,j4.0
    add __t.0,__t.0,j5.0
    add __t.0,__t.0,j6.0
    add __t.0,__t.0,j7.0
    add __t.0,__t.0,j8.0
    add __t.0,__t.0,j9.0
    add __t.0,__t.0,j10.0
    add __t.0,__t.0,j11.0
    add __t.0,__t.0,j12.0
    add __t.0,__t.0,j13.0
    add __t.0,__t.0,j14.0
    add __t.0,__t.0,j15.0
    add __t.0,__t.0,j16.0
    add __t.0,__t.0,j17.0
    add __t.0,__t.0,j18.0
    add __t.0,__t.0,j19.0
    add __t.0,__t.0,j20.0
    add __t.0,__t.0,j21.0
    add __t.0,__t.0,j22.0
    add __t.0,__t.0,j23.0
    add __t.0,__t.0,j24.0
    add __t.0,__t.0,j25.0
    add __t.0,__t.0,j26.0
    add __t.0,__t.0,j27.0
    add __t.0,__t.0,j28.0
    add __t.0,__t.0,j29.0
    li t, 100
    rem __t.0,__t.0,t
    addi __i.4,__i.3,    1
    mv	__i.3,__i.4 
    mv	__j.2,__t.0 
    j	_forcondBB1
								 # func end
    .globl	gcd2				#begin
    .p2align	2
    .type	gcd2,@function
gcd2:
gcd2.entryBB1:
    mv	backup_ra,ra 
    mv	back_s0,s0 
    mv	back_s1,s1 
    mv	back_s2,s2 
    mv	back_s3,s3 
    mv	back_s4,s4 
    mv	back_s5,s5 
    mv	back_s6,s6 
    mv	back_s7,s7 
    mv	back_s8,s8 
    mv	back_s9,s9 
    mv	back_s10,s10 
    mv	back_s11,s11 
    mv	j5.0,a7 
    mv	j4.0,a6 
    mv	j3.0,a5 
    mv	j2.0,a4 
    mv	j1.0,a3 
    mv	j0.0,a2 
    mv	y.0,a1 
    mv	x.0,a0 
    lw j29.0, 588(sp) 
    lw j28.0, 584(sp) 
    lw j27.0, 580(sp) 
    lw j26.0, 576(sp) 
    lw j25.0, 572(sp) 
    lw j24.0, 568(sp) 
    lw j23.0, 564(sp) 
    lw j22.0, 560(sp) 
    lw j21.0, 556(sp) 
    lw j20.0, 552(sp) 
    lw j19.0, 548(sp) 
    lw j18.0, 544(sp) 
    lw j17.0, 540(sp) 
    lw j16.0, 536(sp) 
    lw j15.0, 532(sp) 
    lw j14.0, 528(sp) 
    lw j13.0, 524(sp) 
    lw j12.0, 520(sp) 
    lw j11.0, 516(sp) 
    lw j10.0, 512(sp) 
    lw j9.0, 508(sp) 
    lw j8.0, 504(sp) 
    lw j7.0, 500(sp) 
    lw j6.0, 496(sp) 
    rem t.0,x.0,y.0
    beq	t.0,zero,	if_thenBB3
    j	if_elseBB3
if_elseBB3:
    mv	__i.3,zero 
    mv	__j.2,zero 
    j	_forcondBB4
_forcondBB4:
    li t, 10
    ble	__i.3,t,	_forbodyBB4
    j	_afterForBB2
_forbodyBB4:
    add __t.0,j0.0,j1.0
    add __t.0,__t.0,j2.0
    add __t.0,__t.0,j3.0
    add __t.0,__t.0,j4.0
    add __t.0,__t.0,j5.0
    add __t.0,__t.0,j6.0
    add __t.0,__t.0,j7.0
    add __t.0,__t.0,j8.0
    add __t.0,__t.0,j9.0
    add __t.0,__t.0,j10.0
    add __t.0,__t.0,j11.0
    add __t.0,__t.0,j12.0
    add __t.0,__t.0,j13.0
    add __t.0,__t.0,j14.0
    add __t.0,__t.0,j15.0
    add __t.0,__t.0,j16.0
    add __t.0,__t.0,j17.0
    add __t.0,__t.0,j18.0
    add __t.0,__t.0,j19.0
    add __t.0,__t.0,j20.0
    add __t.0,__t.0,j21.0
    add __t.0,__t.0,j22.0
    add __t.0,__t.0,j23.0
    add __t.0,__t.0,j24.0
    add __t.0,__t.0,j25.0
    add __t.0,__t.0,j26.0
    add __t.0,__t.0,j27.0
    add __t.0,__t.0,j28.0
    add __t.0,__t.0,j29.0
    li t, 100
    rem __t.0,__t.0,t
    addi __i.4,__i.3,    1
    mv	__i.3,__i.4 
    mv	__j.2,__t.0 
    j	_forcondBB4
_afterForBB2:
    rem __t.0,y.0,t.0
    beq	__t.0,zero,	_if_thenBB5
    j	_if_elseBB7
_if_thenBB5:
    mv	__mergedretVal.3,t.0 
    j	afterCallBB5
afterCallBB5:
    mv	mergedretVal.0,__mergedretVal.3 
    j	gcd2.exitBB1
gcd2.exitBB1:
    mv	s11,back_s11 
    mv	s10,back_s10 
    mv	s9,back_s9 
    mv	s8,back_s8 
    mv	s7,back_s7 
    mv	s6,back_s6 
    mv	s5,back_s5 
    mv	s4,back_s4 
    mv	s3,back_s3 
    mv	s2,back_s2 
    mv	s1,back_s1 
    mv	s0,back_s0 
    mv	ra,backup_ra 
    mv	a0,mergedretVal.0 
    ret
_if_elseBB7:
    mv	__i.3,zero 
    mv	__j.2,zero 
    j	_forcondBB5
_forcondBB5:
    li t, 10
    ble	__i.3,t,	_forbodyBB5
    j	_if_elseBB8
_if_elseBB8:
    mv	__j.2,zero 
    mv	__i.3,zero 
    j	_forcondBB6
_forcondBB6:
    li t, 10
    ble	__i.3,t,	_forbodyBB6
    j	_if_elseBB9
_forbodyBB6:
    addi __i.4,__i.3,    1
    mv	__i.3,__i.4 
    li __j.2, 70
    j	_forcondBB6
_if_elseBB9:
    mv	__j.3,zero 
    mv	__i.4,zero 
    j	_forcondBB7
_forcondBB7:
    li t, 10
    ble	__i.4,t,	_forbodyBB7
    j	_if_elseBB10
_forbodyBB7:
    addi __i.5,__i.4,    1
    mv	__i.4,__i.5 
    li __j.3, 70
    j	_forcondBB7
_if_elseBB10:
    li para, 12
    sw para, 0(sp) 
    li para, 14
    sw para, 4(sp) 
    li para, 16
    sw para, 8(sp) 
    li para, 18
    sw para, 12(sp) 
    li para, 20
    sw para, 16(sp) 
    li para, 22
    sw para, 20(sp) 
    li para, 24
    sw para, 24(sp) 
    li para, 26
    sw para, 28(sp) 
    li para, 28
    sw para, 32(sp) 
    li para, 30
    sw para, 36(sp) 
    li para, 32
    sw para, 40(sp) 
    li para, 34
    sw para, 44(sp) 
    li para, 36
    sw para, 48(sp) 
    li para, 38
    sw para, 52(sp) 
    li para, 40
    sw para, 56(sp) 
    li para, 42
    sw para, 60(sp) 
    li para, 44
    sw para, 64(sp) 
    li para, 46
    sw para, 68(sp) 
    li para, 48
    sw para, 72(sp) 
    li para, 50
    sw para, 76(sp) 
    li para, 52
    sw para, 80(sp) 
    li para, 54
    sw para, 84(sp) 
    li para, 56
    sw para, 88(sp) 
    li para, 58
    sw para, 92(sp) 
    li para, 10
    mv	a0,para 
    li para, 68
    mv	a1,para 
    mv	a2,zero 
    li para, 2
    mv	a3,para 
    li para, 4
    mv	a4,para 
    li para, 6
    mv	a5,para 
    li para, 8
    mv	a6,para 
    li para, 10
    mv	a7,para 
    call	gcd
    mv	__t.0,a0 
    li para, 12
    sw para, 0(sp) 
    li para, 14
    sw para, 4(sp) 
    li para, 16
    sw para, 8(sp) 
    li para, 18
    sw para, 12(sp) 
    li para, 20
    sw para, 16(sp) 
    li para, 22
    sw para, 20(sp) 
    li para, 24
    sw para, 24(sp) 
    li para, 26
    sw para, 28(sp) 
    li para, 28
    sw para, 32(sp) 
    li para, 30
    sw para, 36(sp) 
    li para, 32
    sw para, 40(sp) 
    li para, 34
    sw para, 44(sp) 
    li para, 36
    sw para, 48(sp) 
    li para, 38
    sw para, 52(sp) 
    li para, 40
    sw para, 56(sp) 
    li para, 42
    sw para, 60(sp) 
    li para, 44
    sw para, 64(sp) 
    li para, 46
    sw para, 68(sp) 
    li para, 48
    sw para, 72(sp) 
    li para, 50
    sw para, 76(sp) 
    li para, 52
    sw para, 80(sp) 
    li para, 54
    sw para, 84(sp) 
    li para, 56
    sw para, 88(sp) 
    li para, 58
    sw para, 92(sp) 
    li para, 68
    mv	a0,para 
    li para, 10
    mv	a1,para 
    mv	a2,__j.3 
    mv	a3,__t.0 
    li para, 4
    mv	a4,para 
    li para, 6
    mv	a5,para 
    li para, 8
    mv	a6,para 
    li para, 10
    mv	a7,para 
    call	gcd1
    mv	__t.0,a0 
    add __t.0,__j.2,__t.0
    addi __t.0,__t.0,    4
    addi __t.0,__t.0,    6
    addi __t.0,__t.0,    8
    addi __t.0,__t.0,    10
    addi __t.0,__t.0,    12
    addi __t.0,__t.0,    14
    addi __t.0,__t.0,    16
    addi __t.0,__t.0,    18
    addi __t.0,__t.0,    20
    addi __t.0,__t.0,    22
    addi __t.0,__t.0,    24
    addi __t.0,__t.0,    26
    addi __t.0,__t.0,    28
    addi __t.0,__t.0,    30
    addi __t.0,__t.0,    32
    addi __t.0,__t.0,    34
    addi __t.0,__t.0,    36
    addi __t.0,__t.0,    38
    addi __t.0,__t.0,    40
    addi __t.0,__t.0,    42
    addi __t.0,__t.0,    44
    addi __t.0,__t.0,    46
    addi __t.0,__t.0,    48
    addi __t.0,__t.0,    50
    addi __t.0,__t.0,    52
    addi __t.0,__t.0,    54
    addi __t.0,__t.0,    56
    addi __t.0,__t.0,    58
    li t, 100
    rem __t.0,__t.0,t
    li para, 12
    sw para, 0(sp) 
    li para, 14
    sw para, 4(sp) 
    li para, 16
    sw para, 8(sp) 
    li para, 18
    sw para, 12(sp) 
    li para, 20
    sw para, 16(sp) 
    li para, 22
    sw para, 20(sp) 
    li para, 24
    sw para, 24(sp) 
    li para, 26
    sw para, 28(sp) 
    li para, 28
    sw para, 32(sp) 
    li para, 30
    sw para, 36(sp) 
    li para, 32
    sw para, 40(sp) 
    li para, 34
    sw para, 44(sp) 
    li para, 36
    sw para, 48(sp) 
    li para, 38
    sw para, 52(sp) 
    li para, 40
    sw para, 56(sp) 
    li para, 42
    sw para, 60(sp) 
    li para, 44
    sw para, 64(sp) 
    li para, 46
    sw para, 68(sp) 
    li para, 48
    sw para, 72(sp) 
    li para, 50
    sw para, 76(sp) 
    li para, 52
    sw para, 80(sp) 
    li para, 54
    sw para, 84(sp) 
    li para, 56
    sw para, 88(sp) 
    li para, 58
    sw para, 92(sp) 
    li para, 10
    mv	a0,para 
    li para, 8
    mv	a1,para 
    mv	a2,__t.0 
    mv	a3,__t.0 
    li para, 4
    mv	a4,para 
    li para, 6
    mv	a5,para 
    li para, 8
    mv	a6,para 
    li para, 10
    mv	a7,para 
    call	gcd2
    mv	__t.0,a0 
    add __t.0,__j.2,__t.0
    addi __t.0,__t.0,    4
    addi __t.0,__t.0,    6
    addi __t.0,__t.0,    8
    addi __t.0,__t.0,    10
    addi __t.0,__t.0,    12
    addi __t.0,__t.0,    14
    addi __t.0,__t.0,    16
    addi __t.0,__t.0,    18
    addi __t.0,__t.0,    20
    addi __t.0,__t.0,    22
    addi __t.0,__t.0,    24
    addi __t.0,__t.0,    26
    addi __t.0,__t.0,    28
    addi __t.0,__t.0,    30
    addi __t.0,__t.0,    32
    addi __t.0,__t.0,    34
    addi __t.0,__t.0,    36
    addi __t.0,__t.0,    38
    addi __t.0,__t.0,    40
    addi __t.0,__t.0,    42
    addi __t.0,__t.0,    44
    addi __t.0,__t.0,    46
    addi __t.0,__t.0,    48
    addi __t.0,__t.0,    50
    addi __t.0,__t.0,    52
    addi __t.0,__t.0,    54
    addi __t.0,__t.0,    56
    addi __t.0,__t.0,    58
    li t, 100
    rem __t.0,__t.0,t
    li para, 12
    sw para, 0(sp) 
    li para, 14
    sw para, 4(sp) 
    li para, 16
    sw para, 8(sp) 
    li para, 18
    sw para, 12(sp) 
    li para, 20
    sw para, 16(sp) 
    li para, 22
    sw para, 20(sp) 
    li para, 24
    sw para, 24(sp) 
    li para, 26
    sw para, 28(sp) 
    li para, 28
    sw para, 32(sp) 
    li para, 30
    sw para, 36(sp) 
    li para, 32
    sw para, 40(sp) 
    li para, 34
    sw para, 44(sp) 
    li para, 36
    sw para, 48(sp) 
    li para, 38
    sw para, 52(sp) 
    li para, 40
    sw para, 56(sp) 
    li para, 42
    sw para, 60(sp) 
    li para, 44
    sw para, 64(sp) 
    li para, 46
    sw para, 68(sp) 
    li para, 48
    sw para, 72(sp) 
    li para, 50
    sw para, 76(sp) 
    li para, 52
    sw para, 80(sp) 
    li para, 54
    sw para, 84(sp) 
    li para, 56
    sw para, 88(sp) 
    li para, 58
    sw para, 92(sp) 
    li para, 10
    mv	a0,para 
    li para, 8
    mv	a1,para 
    mv	a2,__t.0 
    mv	a3,__t.0 
    li para, 4
    mv	a4,para 
    li para, 6
    mv	a5,para 
    li para, 8
    mv	a6,para 
    li para, 10
    mv	a7,para 
    call	gcd2
    mv	__t.0,a0 
    add __t.0,__j.2,__t.0
    add __t.0,__t.0,j2.0
    add __t.0,__t.0,j3.0
    add __t.0,__t.0,j4.0
    add __t.0,__t.0,j5.0
    add __t.0,__t.0,j6.0
    add __t.0,__t.0,j7.0
    add __t.0,__t.0,j8.0
    add __t.0,__t.0,j9.0
    add __t.0,__t.0,j10.0
    add __t.0,__t.0,j11.0
    add __t.0,__t.0,j12.0
    add __t.0,__t.0,j13.0
    add __t.0,__t.0,j14.0
    add __t.0,__t.0,j15.0
    add __t.0,__t.0,j16.0
    add __t.0,__t.0,j17.0
    add __t.0,__t.0,j18.0
    add __t.0,__t.0,j19.0
    add __t.0,__t.0,j20.0
    add __t.0,__t.0,j21.0
    add __t.0,__t.0,j22.0
    add __t.0,__t.0,j23.0
    add __t.0,__t.0,j24.0
    add __t.0,__t.0,j25.0
    add __t.0,__t.0,j26.0
    add __t.0,__t.0,j27.0
    add __t.0,__t.0,j28.0
    add __t.0,__t.0,j29.0
    li t, 100
    rem __t.0,__t.0,t
    rem __t.0,t.0,__t.0
    beq	__t.0,zero,	_if_thenBB6
    j	_if_elseBB11
_if_thenBB6:
    mv	__mergedretVal.3,__t.0 
    j	afterCallBB6
afterCallBB6:
    mv	__mergedretVal.3,__mergedretVal.3 
    j	afterCallBB5
_if_elseBB11:
    sw j6.0, 0(sp) 
    sw j7.0, 4(sp) 
    sw j8.0, 8(sp) 
    sw j9.0, 12(sp) 
    sw j10.0, 16(sp) 
    sw j11.0, 20(sp) 
    sw j12.0, 24(sp) 
    sw j13.0, 28(sp) 
    sw j14.0, 32(sp) 
    sw j15.0, 36(sp) 
    sw j16.0, 40(sp) 
    sw j17.0, 44(sp) 
    sw j18.0, 48(sp) 
    sw j19.0, 52(sp) 
    sw j20.0, 56(sp) 
    sw j21.0, 60(sp) 
    sw j22.0, 64(sp) 
    sw j23.0, 68(sp) 
    sw j24.0, 72(sp) 
    sw j25.0, 76(sp) 
    sw j26.0, 80(sp) 
    sw j27.0, 84(sp) 
    sw j28.0, 88(sp) 
    sw j29.0, 92(sp) 
    mv	a0,__t.0 
    mv	a1,__t.0 
    mv	a2,__t.0 
    mv	a3,__t.0 
    mv	a4,j2.0 
    mv	a5,j3.0 
    mv	a6,j4.0 
    mv	a7,j5.0 
    call	gcd2
    mv	__t.0,a0 
    mv	__mergedretVal.3,__t.0 
    j	afterCallBB6
_forbodyBB5:
    addi __i.4,__i.3,    1
    mv	__i.3,__i.4 
    li __j.2, 70
    j	_forcondBB5
if_thenBB3:
    mv	mergedretVal.0,y.0 
    j	gcd2.exitBB1
								 # func end
    .section	.sdata,"aw",@progbits
