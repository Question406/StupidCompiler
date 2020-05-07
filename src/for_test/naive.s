    .text
    .globl	gcd						 # func begin 
    .p2align	2
    .type	gcd,@function
gcd:
%gcd.entryBB1:
    mv	backup_ra,ra 
    mv	back_s2,s2 
    mv	back_s1,s1 
    mv	back_s0,s0 
    mv	back_s11,s11 
    mv	back_s10,s10 
    mv	back_s9,s9 
    mv	back_s8,s8 
    mv	back_s7,s7 
    mv	back_s6,s6 
    mv	back_s5,s5 
    mv	back_s4,s4 
    mv	back_s3,s3 
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
    mv	i.1,zero 
    mv	j.0,zero 
    j	%forcondBB1
%forcondBB1:
    li t, 10
    ble	i.1,t,	%forbodyBB1
    j	%afterForBB1
%forbodyBB1:
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
    mv	j.1,t.0 
    addi i.2,i.1,    1
    mv	i.1,i.2 
    mv	j.0,j.1 
    mv	breaker,i.1 
    mv	i.1,i.1 
    mv	breaker,j.0 
    j	%forcondBB1
%afterForBB1:
    rem t.0,x.0,y.0
    beq	t.0,zero,	%if_thenBB1
    j	%if_elseBB1
%if_elseBB1:
    rem t.0,x.0,y.0
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
    mv	a0,y.0 
    mv	a1,t.0 
    mv	a2,j.0 
    mv	a3,t.0 
    mv	a4,j2.0 
    mv	a5,j3.0 
    mv	a6,j4.0 
    mv	a7,j5.0 
    call	gcd1
    mv	t.0,a0 
    mv	mergedretVal.0,t.0 
    mv	mergedretVal.2,mergedretVal.0 
    mv	breaker,mergedretVal.2 
    j	%gcd.exitBB1
%if_thenBB1:
    mv	mergedretVal.1,y.0 
    mv	mergedretVal.2,mergedretVal.1 
    mv	breaker,mergedretVal.2 
    j	%gcd.exitBB1
%gcd.exitBB1:
    mv	s3,back_s3 
    mv	s4,back_s4 
    mv	s5,back_s5 
    mv	s6,back_s6 
    mv	s7,back_s7 
    mv	s8,back_s8 
    mv	s9,back_s9 
    mv	s10,back_s10 
    mv	s11,back_s11 
    mv	s0,back_s0 
    mv	s1,back_s1 
    mv	s2,back_s2 
    mv	ra,backup_ra 
    mv	a0,mergedretVal.2 
    ret
								 # func end
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
    mv	backup_ra,ra 
    mv	back_s2,s2 
    mv	back_s1,s1 
    mv	back_s0,s0 
    mv	back_s11,s11 
    mv	back_s10,s10 
    mv	back_s9,s9 
    mv	back_s8,s8 
    mv	back_s7,s7 
    mv	back_s6,s6 
    mv	back_s5,s5 
    mv	back_s4,s4 
    mv	back_s3,s3 
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
    call	toString
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    mv	s3,back_s3 
    mv	s4,back_s4 
    mv	s5,back_s5 
    mv	s6,back_s6 
    mv	s7,back_s7 
    mv	s8,back_s8 
    mv	s9,back_s9 
    mv	s10,back_s10 
    mv	s11,back_s11 
    mv	s0,back_s0 
    mv	s1,back_s1 
    mv	s2,back_s2 
    mv	ra,backup_ra 
    mv	a0,zero 
    ret
								 # func end
    .globl	gcd1						 # func begin 
    .p2align	2
    .type	gcd1,@function
gcd1:
%gcd1.entryBB1:
    mv	backup_ra,ra 
    mv	back_s2,s2 
    mv	back_s1,s1 
    mv	back_s0,s0 
    mv	back_s11,s11 
    mv	back_s10,s10 
    mv	back_s9,s9 
    mv	back_s8,s8 
    mv	back_s7,s7 
    mv	back_s6,s6 
    mv	back_s5,s5 
    mv	back_s4,s4 
    mv	back_s3,s3 
    mv	j5.0,a7 
    mv	j4.0,a6 
    mv	j3.0,a5 
    mv	j2.0,a4 
    mv	j1.0,a3 
    mv	j0.0,a2 
    mv	y.0,a1 
    mv	x.0,a0 
    lw j29.0, 204(sp) 
    lw j28.0, 200(sp) 
    lw j27.0, 196(sp) 
    lw j26.0, 192(sp) 
    lw j25.0, 188(sp) 
    lw j24.0, 184(sp) 
    lw j23.0, 180(sp) 
    lw j22.0, 176(sp) 
    lw j21.0, 172(sp) 
    lw j20.0, 168(sp) 
    lw j19.0, 164(sp) 
    lw j18.0, 160(sp) 
    lw j17.0, 156(sp) 
    lw j16.0, 152(sp) 
    lw j15.0, 148(sp) 
    lw j14.0, 144(sp) 
    lw j13.0, 140(sp) 
    lw j12.0, 136(sp) 
    lw j11.0, 132(sp) 
    lw j10.0, 128(sp) 
    lw j9.0, 124(sp) 
    lw j8.0, 120(sp) 
    lw j7.0, 116(sp) 
    lw j6.0, 112(sp) 
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
    mv	j.0,t.0 
    rem t.0,x.0,y.0
    beq	t.0,zero,	%if_thenBB2
    j	%if_elseBB2
%if_thenBB2:
    mv	mergedretVal.1,y.0 
    mv	mergedretVal.2,mergedretVal.1 
    mv	breaker,mergedretVal.2 
    j	%gcd1.exitBB1
%if_elseBB2:
    rem t.0,x.0,y.0
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
    mv	a0,y.0 
    mv	a1,t.0 
    mv	a2,j.0 
    mv	a3,j1.0 
    mv	a4,j2.0 
    mv	a5,j3.0 
    mv	a6,j4.0 
    mv	a7,j5.0 
    call	gcd2
    mv	t.0,a0 
    mv	mergedretVal.0,t.0 
    mv	mergedretVal.2,mergedretVal.0 
    mv	breaker,mergedretVal.2 
    j	%gcd1.exitBB1
%gcd1.exitBB1:
    mv	s3,back_s3 
    mv	s4,back_s4 
    mv	s5,back_s5 
    mv	s6,back_s6 
    mv	s7,back_s7 
    mv	s8,back_s8 
    mv	s9,back_s9 
    mv	s10,back_s10 
    mv	s11,back_s11 
    mv	s0,back_s0 
    mv	s1,back_s1 
    mv	s2,back_s2 
    mv	ra,backup_ra 
    mv	a0,mergedretVal.2 
    ret
								 # func end
    .globl	gcd2						 # func begin 
    .p2align	2
    .type	gcd2,@function
gcd2:
%gcd2.entryBB1:
    mv	backup_ra,ra 
    mv	back_s2,s2 
    mv	back_s1,s1 
    mv	back_s0,s0 
    mv	back_s11,s11 
    mv	back_s10,s10 
    mv	back_s9,s9 
    mv	back_s8,s8 
    mv	back_s7,s7 
    mv	back_s6,s6 
    mv	back_s5,s5 
    mv	back_s4,s4 
    mv	back_s3,s3 
    mv	j5.0,a7 
    mv	j4.0,a6 
    mv	j3.0,a5 
    mv	j2.0,a4 
    mv	j1.0,a3 
    mv	j0.0,a2 
    mv	y.0,a1 
    mv	x.0,a0 
    lw j29.0, 204(sp) 
    lw j28.0, 200(sp) 
    lw j27.0, 196(sp) 
    lw j26.0, 192(sp) 
    lw j25.0, 188(sp) 
    lw j24.0, 184(sp) 
    lw j23.0, 180(sp) 
    lw j22.0, 176(sp) 
    lw j21.0, 172(sp) 
    lw j20.0, 168(sp) 
    lw j19.0, 164(sp) 
    lw j18.0, 160(sp) 
    lw j17.0, 156(sp) 
    lw j16.0, 152(sp) 
    lw j15.0, 148(sp) 
    lw j14.0, 144(sp) 
    lw j13.0, 140(sp) 
    lw j12.0, 136(sp) 
    lw j11.0, 132(sp) 
    lw j10.0, 128(sp) 
    lw j9.0, 124(sp) 
    lw j8.0, 120(sp) 
    lw j7.0, 116(sp) 
    lw j6.0, 112(sp) 
    rem t.0,x.0,y.0
    beq	t.0,zero,	%if_thenBB3
    j	%if_elseBB3
%if_thenBB3:
    mv	mergedretVal.1,y.0 
    mv	mergedretVal.2,mergedretVal.1 
    mv	breaker,mergedretVal.2 
    j	%gcd2.exitBB1
%if_elseBB3:
    rem t.0,x.0,y.0
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
    mv	a0,y.0 
    mv	a1,t.0 
    mv	a2,j0.0 
    mv	a3,j1.0 
    mv	a4,j2.0 
    mv	a5,j3.0 
    mv	a6,j4.0 
    mv	a7,j5.0 
    call	gcd
    mv	t.0,a0 
    mv	mergedretVal.0,t.0 
    mv	mergedretVal.2,mergedretVal.0 
    mv	breaker,mergedretVal.2 
    j	%gcd2.exitBB1
%gcd2.exitBB1:
    mv	s3,back_s3 
    mv	s4,back_s4 
    mv	s5,back_s5 
    mv	s6,back_s6 
    mv	s7,back_s7 
    mv	s8,back_s8 
    mv	s9,back_s9 
    mv	s10,back_s10 
    mv	s11,back_s11 
    mv	s0,back_s0 
    mv	s1,back_s1 
    mv	s2,back_s2 
    mv	ra,backup_ra 
    mv	a0,mergedretVal.2 
    ret
								 # func end
    .section	.sdata,"aw",@progbits
