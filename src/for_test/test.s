    .text
    .globl	gcd						 # func begin 
    .p2align	2
    .type	gcd,@function
gcd:
%gcd.entryBB1:
    addi sp,sp,    -336
    sw ra, 216(sp) 
    sw s2, 280(sp) 
    sw s1, 284(sp) 
    sw s10, 252(sp) 
    sw s9, 240(sp) 
    sw s8, 312(sp) 
    sw s6, 228(sp) 
    sw s5, 264(sp) 
    sw s4, 192(sp) 
    sw s3, 316(sp) 
    mv	s2,a7 
    sw a6, 260(sp) 
    sw a5, 304(sp) 
    sw a4, 308(sp) 
    sw a1, 220(sp) 
    lw t2, 428(sp) 
    sw t2, 212(sp) 
    lw t2, 424(sp) 
    sw t2, 288(sp) 
    lw t2, 420(sp) 
    sw t2, 244(sp) 
    lw t2, 416(sp) 
    sw t2, 292(sp) 
    lw t2, 412(sp) 
    sw t2, 200(sp) 
    lw s9, 408(sp) 
    lw s10, 404(sp) 
    lw t2, 400(sp) 
    sw t2, 196(sp) 
    lw t2, 396(sp) 
    sw t2, 268(sp) 
    lw t2, 392(sp) 
    sw t2, 248(sp) 
    lw t2, 388(sp) 
    sw t2, 256(sp) 
    lw t2, 384(sp) 
    sw t2, 296(sp) 
    lw s1, 380(sp) 
    lw t2, 376(sp) 
    sw t2, 276(sp) 
    lw s6, 372(sp) 
    lw t2, 368(sp) 
    sw t2, 236(sp) 
    lw t2, 364(sp) 
    sw t2, 300(sp) 
    lw t2, 360(sp) 
    sw t2, 272(sp) 
    lw s5, 356(sp) 
    lw t2, 352(sp) 
    sw t2, 208(sp) 
    lw t2, 348(sp) 
    sw t2, 224(sp) 
    lw t2, 344(sp) 
    sw t2, 232(sp) 
    lw s3, 340(sp) 
    lw s4, 336(sp) 
    mv	a6,zero 
    mv	t2,zero 
    sw t2, 204(sp) 
    j	%forcondBB1
%forcondBB1:
    li t2, 10
    ble	a6,t2,	%forbodyBB1
    j	%afterForBB1
%forbodyBB1:
    add t2,a2,a3
    lw ra, 308(sp) 
    add ra,t2,ra
    lw t2, 304(sp) 
    add t2,ra,t2
    lw ra, 260(sp) 
    add t2,t2,ra
    add t2,t2,s2
    add t2,t2,s4
    add t2,t2,s3
    lw ra, 232(sp) 
    add t2,t2,ra
    lw ra, 224(sp) 
    add ra,t2,ra
    lw t2, 208(sp) 
    add t2,ra,t2
    add t2,t2,s5
    lw ra, 272(sp) 
    add t2,t2,ra
    lw ra, 300(sp) 
    add ra,t2,ra
    lw t2, 236(sp) 
    add t2,ra,t2
    add t2,t2,s6
    lw ra, 276(sp) 
    add t2,t2,ra
    add ra,t2,s1
    lw t2, 296(sp) 
    add t2,ra,t2
    lw ra, 256(sp) 
    add t2,t2,ra
    lw ra, 248(sp) 
    add ra,t2,ra
    lw t2, 268(sp) 
    add t2,ra,t2
    lw ra, 196(sp) 
    add t2,t2,ra
    add t2,t2,s10
    add t2,t2,s9
    lw ra, 200(sp) 
    add ra,t2,ra
    lw t2, 292(sp) 
    add t2,ra,t2
    lw ra, 244(sp) 
    add ra,t2,ra
    lw t2, 288(sp) 
    add ra,ra,t2
    lw t2, 212(sp) 
    add ra,ra,t2
    li t2, 100
    rem t2,ra,t2
    addi a6,a6,    1
    sw t2, 204(sp) 
    mv	t2,a6 
    lw t2, 204(sp) 
    j	%forcondBB1
%afterForBB1:
    lw t2, 220(sp) 
    rem t2,a0,t2
    beq	t2,zero,	%if_thenBB1
    j	%if_elseBB1
%if_elseBB1:
    lw t2, 220(sp) 
    rem s8,a0,t2
    li a0, 12
    sw a0, 0(sp) 
    li a0, 14
    sw a0, 4(sp) 
    li a0, 16
    sw a0, 8(sp) 
    li a0, 18
    sw a0, 12(sp) 
    li a0, 20
    sw a0, 16(sp) 
    li a0, 22
    sw a0, 20(sp) 
    li a0, 24
    sw a0, 24(sp) 
    li a0, 26
    sw a0, 28(sp) 
    li a0, 28
    sw a0, 32(sp) 
    li a0, 30
    sw a0, 36(sp) 
    li a0, 32
    sw a0, 40(sp) 
    li a0, 34
    sw a0, 44(sp) 
    li a0, 36
    sw a0, 48(sp) 
    li a0, 38
    sw a0, 52(sp) 
    li a0, 40
    sw a0, 56(sp) 
    li a0, 42
    sw a0, 60(sp) 
    li a0, 44
    sw a0, 64(sp) 
    li a0, 46
    sw a0, 68(sp) 
    li a0, 48
    sw a0, 72(sp) 
    li a0, 50
    sw a0, 76(sp) 
    li a0, 52
    sw a0, 80(sp) 
    li a0, 54
    sw a0, 84(sp) 
    li a0, 56
    sw a0, 88(sp) 
    li a0, 58
    sw a0, 92(sp) 
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
    sw s4, 0(sp) 
    sw s3, 4(sp) 
    lw a0, 232(sp) 
    sw a0, 8(sp) 
    lw a0, 224(sp) 
    sw a0, 12(sp) 
    lw a0, 208(sp) 
    sw a0, 16(sp) 
    sw s5, 20(sp) 
    lw a0, 272(sp) 
    sw a0, 24(sp) 
    lw a0, 300(sp) 
    sw a0, 28(sp) 
    lw a0, 236(sp) 
    sw a0, 32(sp) 
    sw s6, 36(sp) 
    lw a0, 276(sp) 
    sw a0, 40(sp) 
    sw s1, 44(sp) 
    lw a0, 296(sp) 
    sw a0, 48(sp) 
    lw a0, 256(sp) 
    sw a0, 52(sp) 
    lw a0, 248(sp) 
    sw a0, 56(sp) 
    lw a0, 268(sp) 
    sw a0, 60(sp) 
    lw a0, 196(sp) 
    sw a0, 64(sp) 
    sw s10, 68(sp) 
    sw s9, 72(sp) 
    lw a0, 200(sp) 
    sw a0, 76(sp) 
    lw a0, 292(sp) 
    sw a0, 80(sp) 
    lw a0, 244(sp) 
    sw a0, 84(sp) 
    lw a0, 288(sp) 
    sw a0, 88(sp) 
    lw a0, 212(sp) 
    sw a0, 92(sp) 
    lw a0, 220(sp) 
    mv	a1,s8 
    lw a2, 204(sp) 
    lw a4, 308(sp) 
    lw a5, 304(sp) 
    lw a6, 260(sp) 
    mv	a7,s2 
    call	gcd1
    j	%gcd.exitBB1
%if_thenBB1:
    lw a0, 220(sp) 
    j	%gcd.exitBB1
%gcd.exitBB1:
    lw s3, 316(sp) 
    lw s4, 192(sp) 
    lw s5, 264(sp) 
    lw s6, 228(sp) 
    lw s8, 312(sp) 
    lw s9, 240(sp) 
    lw s10, 252(sp) 
    lw s1, 284(sp) 
    lw s2, 280(sp) 
    lw ra, 216(sp) 
    addi sp,sp,    336
    ret
								 # func end
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
    addi sp,sp,    -112
    sw ra, 96(sp) 
    li a0, 12
    sw a0, 0(sp) 
    li a0, 14
    sw a0, 4(sp) 
    li a0, 16
    sw a0, 8(sp) 
    li a0, 18
    sw a0, 12(sp) 
    li a0, 20
    sw a0, 16(sp) 
    li a0, 22
    sw a0, 20(sp) 
    li a0, 24
    sw a0, 24(sp) 
    li a0, 26
    sw a0, 28(sp) 
    li a0, 28
    sw a0, 32(sp) 
    li a0, 30
    sw a0, 36(sp) 
    li a0, 32
    sw a0, 40(sp) 
    li a0, 34
    sw a0, 44(sp) 
    li a0, 36
    sw a0, 48(sp) 
    li a0, 38
    sw a0, 52(sp) 
    li a0, 40
    sw a0, 56(sp) 
    li a0, 42
    sw a0, 60(sp) 
    li a0, 44
    sw a0, 64(sp) 
    li a0, 46
    sw a0, 68(sp) 
    li a0, 48
    sw a0, 72(sp) 
    li a0, 50
    sw a0, 76(sp) 
    li a0, 52
    sw a0, 80(sp) 
    li a0, 54
    sw a0, 84(sp) 
    li a0, 56
    sw a0, 88(sp) 
    li a0, 58
    sw a0, 92(sp) 
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
    addi sp,sp,    -192
    sw ra, 108(sp) 
    sw s1, 148(sp) 
    sw s10, 120(sp) 
    sw s6, 100(sp) 
    sw a5, 144(sp) 
    sw a3, 96(sp) 
    sw a1, 104(sp) 
    lw a3, 284(sp) 
    lw t2, 280(sp) 
    sw t2, 168(sp) 
    lw t2, 276(sp) 
    sw t2, 128(sp) 
    lw t0, 272(sp) 
    lw t2, 268(sp) 
    sw t2, 140(sp) 
    lw ra, 264(sp) 
    lw t2, 260(sp) 
    sw t2, 152(sp) 
    lw t2, 256(sp) 
    sw t2, 112(sp) 
    lw t1, 252(sp) 
    lw t2, 248(sp) 
    sw t2, 116(sp) 
    lw s6, 244(sp) 
    lw t2, 240(sp) 
    lw t6, 236(sp) 
    sw t6, 164(sp) 
    lw t3, 232(sp) 
    lw t5, 228(sp) 
    lw t6, 224(sp) 
    sw t6, 156(sp) 
    lw t6, 220(sp) 
    sw t6, 160(sp) 
    lw a5, 216(sp) 
    lw t6, 212(sp) 
    sw t6, 124(sp) 
    lw t4, 208(sp) 
    lw s1, 204(sp) 
    lw s10, 200(sp) 
    lw t6, 196(sp) 
    lw a1, 192(sp) 
    sw a1, 172(sp) 
    lw a1, 96(sp) 
    add a2,a2,a1
    add a2,a2,a4
    lw a1, 144(sp) 
    add a2,a2,a1
    add a2,a2,a6
    add a2,a2,a7
    lw a1, 172(sp) 
    add a2,a2,a1
    add a2,a2,t6
    add a2,a2,s10
    add a2,a2,s1
    add a2,a2,t4
    lw a1, 124(sp) 
    add a2,a2,a1
    add a2,a2,a5
    lw a1, 160(sp) 
    add a2,a2,a1
    lw a1, 156(sp) 
    add a2,a2,a1
    add a2,a2,t5
    add a2,a2,t3
    lw a1, 164(sp) 
    add a2,a2,a1
    add a2,a2,t2
    add a1,a2,s6
    lw a2, 116(sp) 
    add a2,a1,a2
    add a2,a2,t1
    lw a1, 112(sp) 
    add a1,a2,a1
    lw a2, 152(sp) 
    add a2,a1,a2
    add a1,a2,ra
    lw a2, 140(sp) 
    add a2,a1,a2
    add a1,a2,t0
    lw a2, 128(sp) 
    add a2,a1,a2
    lw a1, 168(sp) 
    add a2,a2,a1
    add a2,a2,a3
    li a1, 100
    sw a1, 132(sp) 
    lw a1, 132(sp) 
    rem a2,a2,a1
    sw a2, 136(sp) 
    lw a2, 104(sp) 
    rem a2,a0,a2
    beq	a2,zero,	%if_thenBB2
    j	%if_elseBB2
%if_thenBB2:
    lw a0, 104(sp) 
    j	%gcd1.exitBB1
%if_elseBB2:
    lw a2, 104(sp) 
    rem a1,a0,a2
    lw a0, 172(sp) 
    sw a0, 0(sp) 
    sw t6, 4(sp) 
    sw s10, 8(sp) 
    sw s1, 12(sp) 
    sw t4, 16(sp) 
    lw a0, 124(sp) 
    sw a0, 20(sp) 
    sw a5, 24(sp) 
    lw a0, 160(sp) 
    sw a0, 28(sp) 
    lw a0, 156(sp) 
    sw a0, 32(sp) 
    sw t5, 36(sp) 
    sw t3, 40(sp) 
    lw a0, 164(sp) 
    sw a0, 44(sp) 
    sw t2, 48(sp) 
    sw s6, 52(sp) 
    lw a0, 116(sp) 
    sw a0, 56(sp) 
    sw t1, 60(sp) 
    lw a0, 112(sp) 
    sw a0, 64(sp) 
    lw a0, 152(sp) 
    sw a0, 68(sp) 
    sw ra, 72(sp) 
    lw a0, 140(sp) 
    sw a0, 76(sp) 
    sw t0, 80(sp) 
    lw a0, 128(sp) 
    sw a0, 84(sp) 
    lw a0, 168(sp) 
    sw a0, 88(sp) 
    sw a3, 92(sp) 
    lw a0, 104(sp) 
    lw a2, 136(sp) 
    lw a3, 96(sp) 
    lw a5, 144(sp) 
    call	gcd2
    j	%gcd1.exitBB1
%gcd1.exitBB1:
    lw s6, 100(sp) 
    lw s10, 120(sp) 
    lw s1, 148(sp) 
    lw ra, 108(sp) 
    addi sp,sp,    192
    ret
								 # func end
    .globl	gcd2						 # func begin 
    .p2align	2
    .type	gcd2,@function
gcd2:
%gcd2.entryBB1:
    addi sp,sp,    -176
    sw ra, 164(sp) 
    sw s1, 124(sp) 
    sw s8, 132(sp) 
    sw s7, 156(sp) 
    sw s4, 108(sp) 
    sw s3, 160(sp) 
    sw a3, 112(sp) 
    sw a2, 120(sp) 
    sw a1, 104(sp) 
    sw a0, 116(sp) 
    lw ra, 268(sp) 
    lw s7, 264(sp) 
    lw t6, 260(sp) 
    lw t3, 256(sp) 
    lw a0, 252(sp) 
    sw a0, 100(sp) 
    lw a0, 248(sp) 
    sw a0, 144(sp) 
    lw a0, 244(sp) 
    sw a0, 148(sp) 
    lw a0, 240(sp) 
    sw a0, 152(sp) 
    lw a0, 236(sp) 
    sw a0, 96(sp) 
    lw t1, 232(sp) 
    lw a0, 228(sp) 
    sw a0, 128(sp) 
    lw s4, 224(sp) 
    lw a0, 220(sp) 
    lw t2, 216(sp) 
    sw t2, 168(sp) 
    lw s1, 212(sp) 
    lw t2, 208(sp) 
    sw t2, 140(sp) 
    lw t2, 204(sp) 
    sw t2, 136(sp) 
    lw t5, 200(sp) 
    lw s8, 196(sp) 
    lw t4, 192(sp) 
    lw t0, 188(sp) 
    lw t2, 184(sp) 
    lw s3, 180(sp) 
    lw a3, 176(sp) 
    lw a1, 104(sp) 
    lw a2, 116(sp) 
    rem a2,a2,a1
    beq	a2,zero,	%if_thenBB3
    j	%if_elseBB3
%if_thenBB3:
    lw a0, 104(sp) 
    j	%gcd2.exitBB1
%if_elseBB3:
    lw a2, 104(sp) 
    lw a1, 116(sp) 
    rem a1,a1,a2
    sw a3, 0(sp) 
    sw s3, 4(sp) 
    sw t2, 8(sp) 
    sw t0, 12(sp) 
    sw t4, 16(sp) 
    sw s8, 20(sp) 
    sw t5, 24(sp) 
    lw t2, 136(sp) 
    sw t2, 28(sp) 
    lw t2, 140(sp) 
    sw t2, 32(sp) 
    sw s1, 36(sp) 
    lw t2, 168(sp) 
    sw t2, 40(sp) 
    sw a0, 44(sp) 
    sw s4, 48(sp) 
    lw a0, 128(sp) 
    sw a0, 52(sp) 
    sw t1, 56(sp) 
    lw a0, 96(sp) 
    sw a0, 60(sp) 
    lw a0, 152(sp) 
    sw a0, 64(sp) 
    lw a0, 148(sp) 
    sw a0, 68(sp) 
    lw a0, 144(sp) 
    sw a0, 72(sp) 
    lw a0, 100(sp) 
    sw a0, 76(sp) 
    sw t3, 80(sp) 
    sw t6, 84(sp) 
    sw s7, 88(sp) 
    sw ra, 92(sp) 
    lw a0, 104(sp) 
    lw a2, 120(sp) 
    lw a3, 112(sp) 
    call	gcd
    j	%gcd2.exitBB1
%gcd2.exitBB1:
    lw s3, 160(sp) 
    lw s4, 108(sp) 
    lw s7, 156(sp) 
    lw s8, 132(sp) 
    lw s1, 124(sp) 
    lw ra, 164(sp) 
    addi sp,sp,    176
    ret
								 # func end
    .section	.sdata,"aw",@progbits
