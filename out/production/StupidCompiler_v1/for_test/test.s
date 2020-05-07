    .text
    .globl	gcd						 # func begin 
    .p2align	2
    .type	gcd,@function
gcd:
%gcd.entryBB1:
    addi sp,sp,    -336
    sw ra, 312(sp) 
    sw s0, 316(sp) 
    sw s1, 284(sp) 
    sw s2, 200(sp) 
    sw s4, 228(sp) 
    sw s5, 244(sp) 
    sw s6, 304(sp) 
    sw s7, 224(sp) 
    sw s8, 268(sp) 
    sw s9, 252(sp) 
    sw s10, 208(sp) 
    sw a7, 236(sp) 
    mv	s9,a6 
    sw a5, 272(sp) 
    sw a4, 240(sp) 
    sw a1, 220(sp) 
    lw t2, 428(sp) 
    sw t2, 276(sp) 
    lw t2, 424(sp) 
    sw t2, 300(sp) 
    lw s0, 420(sp) 
    lw s5, 416(sp) 
    lw t2, 412(sp) 
    sw t2, 256(sp) 
    lw t2, 408(sp) 
    sw t2, 292(sp) 
    lw s8, 404(sp) 
    lw t2, 400(sp) 
    sw t2, 216(sp) 
    lw t2, 396(sp) 
    sw t2, 212(sp) 
    lw s2, 392(sp) 
    lw t2, 388(sp) 
    sw t2, 196(sp) 
    lw t2, 384(sp) 
    sw t2, 204(sp) 
    lw t2, 380(sp) 
    sw t2, 308(sp) 
    lw t2, 376(sp) 
    sw t2, 264(sp) 
    lw s10, 372(sp) 
    lw t2, 368(sp) 
    sw t2, 260(sp) 
    lw s1, 364(sp) 
    lw t2, 360(sp) 
    sw t2, 192(sp) 
    lw t2, 356(sp) 
    sw t2, 280(sp) 
    lw t2, 352(sp) 
    sw t2, 296(sp) 
    lw s4, 348(sp) 
    lw t2, 344(sp) 
    sw t2, 232(sp) 
    lw s6, 340(sp) 
    lw t2, 336(sp) 
    sw t2, 248(sp) 
    mv	t2,zero 
    mv	t3,zero 
    sw t3, 288(sp) 
    j	%forcondBB1
%forcondBB1:
    li t3, 10
    ble	t2,t3,	%forbodyBB1
    j	%afterForBB1
%afterForBB1:
    lw a3, 220(sp) 
    rem a3,a0,a3
    beq	a3,zero,	%if_thenBB1
    j	%if_elseBB1
%if_elseBB1:
    lw a3, 220(sp) 
    rem s7,a0,a3
    li a3, 12
    sw a3, 0(sp) 
    li a3, 14
    sw a3, 4(sp) 
    li a3, 16
    sw a3, 8(sp) 
    li a3, 18
    sw a3, 12(sp) 
    li a3, 20
    sw a3, 16(sp) 
    li a3, 22
    sw a3, 20(sp) 
    li a3, 24
    sw a3, 24(sp) 
    li a3, 26
    sw a3, 28(sp) 
    li a3, 28
    sw a3, 32(sp) 
    li a3, 30
    sw a3, 36(sp) 
    li a3, 32
    sw a3, 40(sp) 
    li a3, 34
    sw a3, 44(sp) 
    li a3, 36
    sw a3, 48(sp) 
    li a3, 38
    sw a3, 52(sp) 
    li a3, 40
    sw a3, 56(sp) 
    li a3, 42
    sw a3, 60(sp) 
    li a3, 44
    sw a3, 64(sp) 
    li a3, 46
    sw a3, 68(sp) 
    li a3, 48
    sw a3, 72(sp) 
    li a3, 50
    sw a3, 76(sp) 
    li a3, 52
    sw a3, 80(sp) 
    li a3, 54
    sw a3, 84(sp) 
    li a3, 56
    sw a3, 88(sp) 
    li a3, 58
    sw a3, 92(sp) 
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
    lw a2, 248(sp) 
    sw a2, 0(sp) 
    sw s6, 4(sp) 
    lw a2, 232(sp) 
    sw a2, 8(sp) 
    sw s4, 12(sp) 
    lw a2, 296(sp) 
    sw a2, 16(sp) 
    lw a2, 280(sp) 
    sw a2, 20(sp) 
    lw a2, 192(sp) 
    sw a2, 24(sp) 
    sw s1, 28(sp) 
    lw a2, 260(sp) 
    sw a2, 32(sp) 
    sw s10, 36(sp) 
    lw a2, 264(sp) 
    sw a2, 40(sp) 
    lw a2, 308(sp) 
    sw a2, 44(sp) 
    lw a2, 204(sp) 
    sw a2, 48(sp) 
    lw a2, 196(sp) 
    sw a2, 52(sp) 
    sw s2, 56(sp) 
    lw a2, 212(sp) 
    sw a2, 60(sp) 
    lw a2, 216(sp) 
    sw a2, 64(sp) 
    sw s8, 68(sp) 
    lw a2, 292(sp) 
    sw a2, 72(sp) 
    lw a2, 256(sp) 
    sw a2, 76(sp) 
    sw s5, 80(sp) 
    sw s0, 84(sp) 
    lw a2, 300(sp) 
    sw a2, 88(sp) 
    lw a2, 276(sp) 
    sw a2, 92(sp) 
    lw a0, 220(sp) 
    mv	a1,s7 
    lw a2, 288(sp) 
    lw a4, 240(sp) 
    lw a5, 272(sp) 
    mv	a6,s9 
    lw a7, 236(sp) 
    call	gcd1
    j	%gcd.exitBB1
%if_thenBB1:
    lw a0, 220(sp) 
    j	%gcd.exitBB1
%gcd.exitBB1:
    lw s10, 208(sp) 
    lw s9, 252(sp) 
    lw s8, 268(sp) 
    lw s7, 224(sp) 
    lw s6, 304(sp) 
    lw s5, 244(sp) 
    lw s4, 228(sp) 
    lw s2, 200(sp) 
    lw s1, 284(sp) 
    lw s0, 316(sp) 
    lw ra, 312(sp) 
    addi sp,sp,    336
    ret
%forbodyBB1:
    add t3,a2,a3
    lw t5, 240(sp) 
    add t5,t3,t5
    lw t3, 272(sp) 
    add t3,t5,t3
    add t3,t3,s9
    lw t5, 236(sp) 
    add t5,t3,t5
    lw t3, 248(sp) 
    add t3,t5,t3
    add t3,t3,s6
    lw t5, 232(sp) 
    add t3,t3,t5
    add t5,t3,s4
    lw t3, 296(sp) 
    add t5,t5,t3
    lw t3, 280(sp) 
    add t3,t5,t3
    lw t5, 192(sp) 
    add t3,t3,t5
    add t3,t3,s1
    lw t5, 260(sp) 
    add t3,t3,t5
    add t5,t3,s10
    lw t3, 264(sp) 
    add t3,t5,t3
    lw t5, 308(sp) 
    add t3,t3,t5
    lw t5, 204(sp) 
    add t3,t3,t5
    lw t5, 196(sp) 
    add t3,t3,t5
    add t5,t3,s2
    lw t3, 212(sp) 
    add t3,t5,t3
    lw t5, 216(sp) 
    add t3,t3,t5
    add t3,t3,s8
    lw t5, 292(sp) 
    add t5,t3,t5
    lw t3, 256(sp) 
    add t3,t5,t3
    add t3,t3,s5
    add t5,t3,s0
    lw t3, 300(sp) 
    add t5,t5,t3
    lw t3, 276(sp) 
    add t3,t5,t3
    li t5, 100
    rem t3,t3,t5
    addi t2,t2,    1
    sw t3, 288(sp) 
    mv	t3,t2 
    lw t3, 288(sp) 
    j	%forcondBB1
								 # func end
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
    addi sp,sp,    -112
    sw ra, 96(sp) 
    li a3, 12
    sw a3, 0(sp) 
    li a3, 14
    sw a3, 4(sp) 
    li a3, 16
    sw a3, 8(sp) 
    li a3, 18
    sw a3, 12(sp) 
    li a3, 20
    sw a3, 16(sp) 
    li a3, 22
    sw a3, 20(sp) 
    li a3, 24
    sw a3, 24(sp) 
    li a3, 26
    sw a3, 28(sp) 
    li a3, 28
    sw a3, 32(sp) 
    li a3, 30
    sw a3, 36(sp) 
    li a3, 32
    sw a3, 40(sp) 
    li a3, 34
    sw a3, 44(sp) 
    li a3, 36
    sw a3, 48(sp) 
    li a3, 38
    sw a3, 52(sp) 
    li a3, 40
    sw a3, 56(sp) 
    li a3, 42
    sw a3, 60(sp) 
    li a3, 44
    sw a3, 64(sp) 
    li a3, 46
    sw a3, 68(sp) 
    li a3, 48
    sw a3, 72(sp) 
    li a3, 50
    sw a3, 76(sp) 
    li a3, 52
    sw a3, 80(sp) 
    li a3, 54
    sw a3, 84(sp) 
    li a3, 56
    sw a3, 88(sp) 
    li a3, 58
    sw a3, 92(sp) 
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
    call	toString
    call	println
    lw ra, 96(sp) 
    mv	a0,zero 
    addi sp,sp,    112
    ret
								 # func end
    .globl	gcd1						 # func begin 
    .p2align	2
    .type	gcd1,@function
gcd1:
%gcd1.entryBB1:
    addi sp,sp,    -176
    sw ra, 136(sp) 
    sw s0, 112(sp) 
    sw s3, 104(sp) 
    sw s4, 160(sp) 
    sw s5, 144(sp) 
    sw s10, 156(sp) 
    sw s11, 132(sp) 
    sw a6, 124(sp) 
    sw a1, 140(sp) 
    mv	a1,a0 
    lw t2, 268(sp) 
    sw t2, 120(sp) 
    lw t2, 264(sp) 
    lw t6, 260(sp) 
    lw s3, 256(sp) 
    lw t3, 252(sp) 
    lw s0, 248(sp) 
    lw a0, 244(sp) 
    sw a0, 108(sp) 
    lw t4, 240(sp) 
    lw t0, 236(sp) 
    lw s5, 232(sp) 
    lw s10, 228(sp) 
    lw t5, 224(sp) 
    lw t1, 220(sp) 
    lw a0, 216(sp) 
    sw a0, 128(sp) 
    lw a0, 212(sp) 
    sw a0, 116(sp) 
    lw a0, 208(sp) 
    lw s4, 204(sp) 
    lw ra, 200(sp) 
    lw a6, 196(sp) 
    lw s11, 192(sp) 
    sw s11, 100(sp) 
    lw s11, 188(sp) 
    sw s11, 148(sp) 
    lw s11, 184(sp) 
    sw s11, 152(sp) 
    lw s11, 180(sp) 
    sw s11, 164(sp) 
    lw s11, 176(sp) 
    sw s11, 96(sp) 
    add a2,a2,a3
    add a2,a2,a4
    add s11,a2,a5
    lw a2, 124(sp) 
    add a2,s11,a2
    add a2,a2,a7
    lw s11, 96(sp) 
    add s11,a2,s11
    lw a2, 164(sp) 
    add a2,s11,a2
    lw s11, 152(sp) 
    add a2,a2,s11
    lw s11, 148(sp) 
    add a2,a2,s11
    lw s11, 100(sp) 
    add a2,a2,s11
    add a2,a2,a6
    add a2,a2,ra
    add a2,a2,s4
    add s11,a2,a0
    lw a2, 116(sp) 
    add s11,s11,a2
    lw a2, 128(sp) 
    add a2,s11,a2
    add a2,a2,t1
    add a2,a2,t5
    add a2,a2,s10
    add a2,a2,s5
    add a2,a2,t0
    add s11,a2,t4
    lw a2, 108(sp) 
    add a2,s11,a2
    add a2,a2,s0
    add a2,a2,t3
    add a2,a2,s3
    add a2,a2,t6
    add s11,a2,t2
    lw a2, 120(sp) 
    add s11,s11,a2
    li a2, 100
    rem a2,s11,a2
    lw s11, 140(sp) 
    rem s11,a1,s11
    beq	s11,zero,	%if_thenBB2
    j	%if_elseBB2
%if_elseBB2:
    lw s11, 140(sp) 
    rem a1,a1,s11
    lw s11, 96(sp) 
    sw s11, 0(sp) 
    lw s11, 164(sp) 
    sw s11, 4(sp) 
    lw s11, 152(sp) 
    sw s11, 8(sp) 
    lw s11, 148(sp) 
    sw s11, 12(sp) 
    lw s11, 100(sp) 
    sw s11, 16(sp) 
    sw a6, 20(sp) 
    sw ra, 24(sp) 
    sw s4, 28(sp) 
    sw a0, 32(sp) 
    lw a0, 116(sp) 
    sw a0, 36(sp) 
    lw a0, 128(sp) 
    sw a0, 40(sp) 
    sw t1, 44(sp) 
    sw t5, 48(sp) 
    sw s10, 52(sp) 
    sw s5, 56(sp) 
    sw t0, 60(sp) 
    sw t4, 64(sp) 
    lw a0, 108(sp) 
    sw a0, 68(sp) 
    sw s0, 72(sp) 
    sw t3, 76(sp) 
    sw s3, 80(sp) 
    sw t6, 84(sp) 
    sw t2, 88(sp) 
    lw t2, 120(sp) 
    sw t2, 92(sp) 
    lw a0, 140(sp) 
    lw a6, 124(sp) 
    call	gcd2
    j	%gcd1.exitBB1
%if_thenBB2:
    lw a0, 140(sp) 
    j	%gcd1.exitBB1
%gcd1.exitBB1:
    lw s11, 132(sp) 
    lw s10, 156(sp) 
    lw s5, 144(sp) 
    lw s4, 160(sp) 
    lw s3, 104(sp) 
    lw s0, 112(sp) 
    lw ra, 136(sp) 
    addi sp,sp,    176
    ret
								 # func end
    .globl	gcd2						 # func begin 
    .p2align	2
    .type	gcd2,@function
gcd2:
%gcd2.entryBB1:
    addi sp,sp,    -176
    sw ra, 136(sp) 
    sw s0, 116(sp) 
    sw s6, 152(sp) 
    sw s9, 112(sp) 
    sw s10, 156(sp) 
    sw s11, 148(sp) 
    sw a2, 128(sp) 
    mv	a2,a1 
    lw t2, 268(sp) 
    sw t2, 164(sp) 
    lw t2, 264(sp) 
    sw t2, 124(sp) 
    lw t4, 260(sp) 
    lw t6, 256(sp) 
    lw t2, 252(sp) 
    lw t3, 248(sp) 
    sw t3, 96(sp) 
    lw t0, 244(sp) 
    lw t3, 240(sp) 
    sw t3, 140(sp) 
    lw ra, 236(sp) 
    lw t3, 232(sp) 
    sw t3, 108(sp) 
    lw t3, 228(sp) 
    sw t3, 144(sp) 
    lw t3, 224(sp) 
    sw t3, 132(sp) 
    lw t3, 220(sp) 
    lw t5, 216(sp) 
    sw t5, 100(sp) 
    lw s10, 212(sp) 
    lw s6, 208(sp) 
    lw t5, 204(sp) 
    sw t5, 120(sp) 
    lw t1, 200(sp) 
    lw t5, 196(sp) 
    sw t5, 160(sp) 
    lw s9, 192(sp) 
    lw t5, 188(sp) 
    sw t5, 104(sp) 
    lw s11, 184(sp) 
    lw t5, 180(sp) 
    lw s0, 176(sp) 
    rem a1,a0,a2
    beq	a1,zero,	%if_thenBB3
    j	%if_elseBB3
%if_thenBB3:
    mv	a0,a2 
    j	%gcd2.exitBB1
%if_elseBB3:
    rem a1,a0,a2
    sw s0, 0(sp) 
    sw t5, 4(sp) 
    sw s11, 8(sp) 
    lw a0, 104(sp) 
    sw a0, 12(sp) 
    sw s9, 16(sp) 
    lw a0, 160(sp) 
    sw a0, 20(sp) 
    sw t1, 24(sp) 
    lw a0, 120(sp) 
    sw a0, 28(sp) 
    sw s6, 32(sp) 
    sw s10, 36(sp) 
    lw a0, 100(sp) 
    sw a0, 40(sp) 
    sw t3, 44(sp) 
    lw t3, 132(sp) 
    sw t3, 48(sp) 
    lw t3, 144(sp) 
    sw t3, 52(sp) 
    lw t3, 108(sp) 
    sw t3, 56(sp) 
    sw ra, 60(sp) 
    lw t3, 140(sp) 
    sw t3, 64(sp) 
    sw t0, 68(sp) 
    lw t3, 96(sp) 
    sw t3, 72(sp) 
    sw t2, 76(sp) 
    sw t6, 80(sp) 
    sw t4, 84(sp) 
    lw t2, 124(sp) 
    sw t2, 88(sp) 
    lw t2, 164(sp) 
    sw t2, 92(sp) 
    mv	a0,a2 
    lw a2, 128(sp) 
    call	gcd
    j	%gcd2.exitBB1
%gcd2.exitBB1:
    lw s11, 148(sp) 
    lw s10, 156(sp) 
    lw s9, 112(sp) 
    lw s6, 152(sp) 
    lw s0, 116(sp) 
    lw ra, 136(sp) 
    addi sp,sp,    176
    ret
								 # func end
    .section	.sdata,"aw",@progbits
