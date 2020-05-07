    .text
    .globl	gcd						 # func begin 
    .p2align	2
    .type	gcd,@function
gcd:
%gcd.entryBB1:
    addi sp,sp,    -336
    sw ra, 228(sp) 
    sw s11, 312(sp) 
    sw s10, 316(sp) 
    sw s9, 288(sp) 
    sw s8, 200(sp) 
    sw s6, 236(sp) 
    sw s5, 252(sp) 
    sw s4, 304(sp) 
    sw s3, 232(sp) 
    sw s2, 276(sp) 
    sw s1, 260(sp) 
    sw s0, 212(sp) 
    mv	s2,a7 
    sw a6, 280(sp) 
    sw a5, 248(sp) 
    sw a4, 220(sp) 
    mv	s8,a1 
    lw t6, 428(sp) 
    sw t6, 300(sp) 
    lw s11, 424(sp) 
    lw s6, 420(sp) 
    lw t6, 416(sp) 
    sw t6, 264(sp) 
    lw t6, 412(sp) 
    sw t6, 292(sp) 
    lw s4, 408(sp) 
    lw t6, 404(sp) 
    sw t6, 224(sp) 
    lw t6, 400(sp) 
    sw t6, 216(sp) 
    lw s10, 396(sp) 
    lw t6, 392(sp) 
    sw t6, 196(sp) 
    lw t6, 388(sp) 
    sw t6, 204(sp) 
    lw t6, 384(sp) 
    sw t6, 308(sp) 
    lw t6, 380(sp) 
    sw t6, 272(sp) 
    lw s1, 376(sp) 
    lw t6, 372(sp) 
    sw t6, 268(sp) 
    lw s5, 368(sp) 
    lw t6, 364(sp) 
    sw t6, 192(sp) 
    lw t6, 360(sp) 
    sw t6, 284(sp) 
    lw t6, 356(sp) 
    sw t6, 296(sp) 
    lw s3, 352(sp) 
    lw t6, 348(sp) 
    sw t6, 240(sp) 
    lw s0, 344(sp) 
    lw t6, 340(sp) 
    sw t6, 256(sp) 
    lw t6, 336(sp) 
    sw t6, 244(sp) 
    mv	t6,zero 
    mv	t3,zero 
    sw t3, 208(sp) 
    j	%forcondBB1
%forcondBB1:
    li t3, 10
    ble	t6,t3,	%forbodyBB1
    j	%afterForBB1
%afterForBB1:
    rem a3,a0,s8
    beq	a3,zero,	%if_thenBB1
    j	%if_elseBB1
%if_elseBB1:
    rem s9,a0,s8
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
    lw t6, 244(sp) 
    sw t6, 0(sp) 
    lw t6, 256(sp) 
    sw t6, 4(sp) 
    sw s0, 8(sp) 
    lw t6, 240(sp) 
    sw t6, 12(sp) 
    sw s3, 16(sp) 
    lw t6, 296(sp) 
    sw t6, 20(sp) 
    lw t6, 284(sp) 
    sw t6, 24(sp) 
    lw t6, 192(sp) 
    sw t6, 28(sp) 
    sw s5, 32(sp) 
    lw t6, 268(sp) 
    sw t6, 36(sp) 
    sw s1, 40(sp) 
    lw t6, 272(sp) 
    sw t6, 44(sp) 
    lw t6, 308(sp) 
    sw t6, 48(sp) 
    lw t6, 204(sp) 
    sw t6, 52(sp) 
    lw t6, 196(sp) 
    sw t6, 56(sp) 
    sw s10, 60(sp) 
    lw t6, 216(sp) 
    sw t6, 64(sp) 
    lw t6, 224(sp) 
    sw t6, 68(sp) 
    sw s4, 72(sp) 
    lw t6, 292(sp) 
    sw t6, 76(sp) 
    lw t6, 264(sp) 
    sw t6, 80(sp) 
    sw s6, 84(sp) 
    sw s11, 88(sp) 
    lw t6, 300(sp) 
    sw t6, 92(sp) 
    mv	a0,s8 
    mv	a1,s9 
    lw a2, 208(sp) 
    lw a4, 220(sp) 
    lw a5, 248(sp) 
    lw a6, 280(sp) 
    mv	a7,s2 
    call	gcd1
    j	%gcd.exitBB1
%if_thenBB1:
    mv	a0,s8 
    j	%gcd.exitBB1
%gcd.exitBB1:
    lw s0, 212(sp) 
    lw s1, 260(sp) 
    lw s2, 276(sp) 
    lw s3, 232(sp) 
    lw s4, 304(sp) 
    lw s5, 252(sp) 
    lw s6, 236(sp) 
    lw s8, 200(sp) 
    lw s9, 288(sp) 
    lw s10, 316(sp) 
    lw s11, 312(sp) 
    lw ra, 228(sp) 
    addi sp,sp,    336
    ret
%forbodyBB1:
    add t3,a2,a3
    lw ra, 220(sp) 
    add t3,t3,ra
    lw ra, 248(sp) 
    add t3,t3,ra
    lw ra, 280(sp) 
    add t3,t3,ra
    add ra,t3,s2
    lw t3, 244(sp) 
    add ra,ra,t3
    lw t3, 256(sp) 
    add t3,ra,t3
    add ra,t3,s0
    lw t3, 240(sp) 
    add t3,ra,t3
    add ra,t3,s3
    lw t3, 296(sp) 
    add ra,ra,t3
    lw t3, 284(sp) 
    add ra,ra,t3
    lw t3, 192(sp) 
    add t3,ra,t3
    add t3,t3,s5
    lw ra, 268(sp) 
    add t3,t3,ra
    add t3,t3,s1
    lw ra, 272(sp) 
    add t3,t3,ra
    lw ra, 308(sp) 
    add t3,t3,ra
    lw ra, 204(sp) 
    add t3,t3,ra
    lw ra, 196(sp) 
    add t3,t3,ra
    add ra,t3,s10
    lw t3, 216(sp) 
    add ra,ra,t3
    lw t3, 224(sp) 
    add t3,ra,t3
    add t3,t3,s4
    lw ra, 292(sp) 
    add t3,t3,ra
    lw ra, 264(sp) 
    add t3,t3,ra
    add t3,t3,s6
    add t3,t3,s11
    lw ra, 300(sp) 
    add ra,t3,ra
    li t3, 100
    rem t3,ra,t3
    addi t6,t6,    1
    sw t3, 208(sp) 
    mv	t3,t6 
    lw t3, 208(sp) 
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
    sw ra, 116(sp) 
    sw s11, 140(sp) 
    sw s10, 132(sp) 
    sw s9, 112(sp) 
    sw s7, 136(sp) 
    sw s6, 104(sp) 
    sw s5, 160(sp) 
    sw s4, 148(sp) 
    sw a7, 124(sp) 
    sw a1, 144(sp) 
    lw t6, 268(sp) 
    lw t2, 264(sp) 
    lw s9, 260(sp) 
    lw t3, 256(sp) 
    lw s10, 252(sp) 
    lw ra, 248(sp) 
    sw ra, 108(sp) 
    lw t1, 244(sp) 
    lw t5, 240(sp) 
    lw s5, 236(sp) 
    lw s6, 232(sp) 
    lw t4, 228(sp) 
    lw a1, 224(sp) 
    lw ra, 220(sp) 
    sw ra, 128(sp) 
    lw ra, 216(sp) 
    sw ra, 120(sp) 
    lw ra, 212(sp) 
    lw s4, 208(sp) 
    lw t0, 204(sp) 
    lw a7, 200(sp) 
    lw s11, 196(sp) 
    sw s11, 100(sp) 
    lw s11, 192(sp) 
    sw s11, 152(sp) 
    lw s11, 188(sp) 
    sw s11, 156(sp) 
    lw s11, 184(sp) 
    sw s11, 164(sp) 
    lw s11, 180(sp) 
    sw s11, 96(sp) 
    lw s11, 176(sp) 
    add a2,a2,a3
    add a2,a2,a4
    add a2,a2,a5
    add s7,a2,a6
    lw a2, 124(sp) 
    add a2,s7,a2
    add a2,a2,s11
    lw s7, 96(sp) 
    add s7,a2,s7
    lw a2, 164(sp) 
    add a2,s7,a2
    lw s7, 156(sp) 
    add s7,a2,s7
    lw a2, 152(sp) 
    add s7,s7,a2
    lw a2, 100(sp) 
    add a2,s7,a2
    add a2,a2,a7
    add a2,a2,t0
    add a2,a2,s4
    add s7,a2,ra
    lw a2, 120(sp) 
    add s7,s7,a2
    lw a2, 128(sp) 
    add a2,s7,a2
    add a2,a2,a1
    add a2,a2,t4
    add a2,a2,s6
    add a2,a2,s5
    add a2,a2,t5
    add s7,a2,t1
    lw a2, 108(sp) 
    add a2,s7,a2
    add a2,a2,s10
    add a2,a2,t3
    add a2,a2,s9
    add a2,a2,t2
    add a2,a2,t6
    li s7, 100
    rem a2,a2,s7
    lw s7, 144(sp) 
    rem s7,a0,s7
    beq	s7,zero,	%if_thenBB2
    j	%if_elseBB2
%if_elseBB2:
    lw s7, 144(sp) 
    rem s7,a0,s7
    sw s11, 0(sp) 
    lw a0, 96(sp) 
    sw a0, 4(sp) 
    lw a0, 164(sp) 
    sw a0, 8(sp) 
    lw a0, 156(sp) 
    sw a0, 12(sp) 
    lw a0, 152(sp) 
    sw a0, 16(sp) 
    lw a0, 100(sp) 
    sw a0, 20(sp) 
    sw a7, 24(sp) 
    sw t0, 28(sp) 
    sw s4, 32(sp) 
    sw ra, 36(sp) 
    lw ra, 120(sp) 
    sw ra, 40(sp) 
    lw ra, 128(sp) 
    sw ra, 44(sp) 
    sw a1, 48(sp) 
    sw t4, 52(sp) 
    sw s6, 56(sp) 
    sw s5, 60(sp) 
    sw t5, 64(sp) 
    sw t1, 68(sp) 
    lw ra, 108(sp) 
    sw ra, 72(sp) 
    sw s10, 76(sp) 
    sw t3, 80(sp) 
    sw s9, 84(sp) 
    sw t2, 88(sp) 
    sw t6, 92(sp) 
    lw a0, 144(sp) 
    mv	a1,s7 
    lw a7, 124(sp) 
    call	gcd2
    j	%gcd1.exitBB1
%if_thenBB2:
    lw a0, 144(sp) 
    j	%gcd1.exitBB1
%gcd1.exitBB1:
    lw s4, 148(sp) 
    lw s5, 160(sp) 
    lw s6, 104(sp) 
    lw s7, 136(sp) 
    lw s9, 112(sp) 
    lw s10, 132(sp) 
    lw s11, 140(sp) 
    lw ra, 116(sp) 
    addi sp,sp,    176
    ret
								 # func end
    .globl	gcd2						 # func begin 
    .p2align	2
    .type	gcd2,@function
gcd2:
%gcd2.entryBB1:
    addi sp,sp,    -176
    sw ra, 164(sp) 
    sw s10, 160(sp) 
    sw s8, 112(sp) 
    sw s3, 116(sp) 
    sw s2, 152(sp) 
    sw a3, 128(sp) 
    sw a0, 132(sp) 
    lw a3, 268(sp) 
    sw a3, 124(sp) 
    lw a0, 264(sp) 
    lw s8, 260(sp) 
    lw t6, 256(sp) 
    lw a3, 252(sp) 
    sw a3, 96(sp) 
    lw t5, 248(sp) 
    lw a3, 244(sp) 
    sw a3, 144(sp) 
    lw t2, 240(sp) 
    lw a3, 236(sp) 
    sw a3, 108(sp) 
    lw a3, 232(sp) 
    sw a3, 148(sp) 
    lw a3, 228(sp) 
    sw a3, 136(sp) 
    lw t3, 224(sp) 
    lw a3, 220(sp) 
    sw a3, 100(sp) 
    lw s3, 216(sp) 
    lw t1, 212(sp) 
    lw a3, 208(sp) 
    sw a3, 120(sp) 
    lw t4, 204(sp) 
    lw a3, 200(sp) 
    sw a3, 156(sp) 
    lw s10, 196(sp) 
    lw a3, 192(sp) 
    sw a3, 104(sp) 
    lw a3, 188(sp) 
    sw a3, 140(sp) 
    lw ra, 184(sp) 
    lw t0, 180(sp) 
    lw s2, 176(sp) 
    lw a3, 132(sp) 
    rem a3,a3,a1
    beq	a3,zero,	%if_thenBB3
    j	%if_elseBB3
%if_thenBB3:
    mv	a0,a1 
    j	%gcd2.exitBB1
%if_elseBB3:
    lw a3, 132(sp) 
    rem a3,a3,a1
    sw s2, 0(sp) 
    sw t0, 4(sp) 
    sw ra, 8(sp) 
    lw ra, 140(sp) 
    sw ra, 12(sp) 
    lw ra, 104(sp) 
    sw ra, 16(sp) 
    sw s10, 20(sp) 
    lw ra, 156(sp) 
    sw ra, 24(sp) 
    sw t4, 28(sp) 
    lw ra, 120(sp) 
    sw ra, 32(sp) 
    sw t1, 36(sp) 
    sw s3, 40(sp) 
    lw ra, 100(sp) 
    sw ra, 44(sp) 
    sw t3, 48(sp) 
    lw t3, 136(sp) 
    sw t3, 52(sp) 
    lw t3, 148(sp) 
    sw t3, 56(sp) 
    lw t3, 108(sp) 
    sw t3, 60(sp) 
    sw t2, 64(sp) 
    lw t3, 144(sp) 
    sw t3, 68(sp) 
    sw t5, 72(sp) 
    lw t3, 96(sp) 
    sw t3, 76(sp) 
    sw t6, 80(sp) 
    sw s8, 84(sp) 
    sw a0, 88(sp) 
    lw t6, 124(sp) 
    sw t6, 92(sp) 
    mv	a0,a1 
    mv	a1,a3 
    lw a3, 128(sp) 
    call	gcd
    j	%gcd2.exitBB1
%gcd2.exitBB1:
    lw s2, 152(sp) 
    lw s3, 116(sp) 
    lw s8, 112(sp) 
    lw s10, 160(sp) 
    lw ra, 164(sp) 
    addi sp,sp,    176
    ret
								 # func end
    .section	.sdata,"aw",@progbits
