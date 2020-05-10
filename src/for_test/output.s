    .text
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -16
    sw ra, 0(sp) 
    li a0, 1
    li t5, 10
    li t1, 2
    j	__whileCondBB1
__whileCondBB1:
    bgt	t5,zero,	__whileBodyBB1
    j	afterCallBB1
__whileBodyBB1:
    andi a1,t5,    1
    li t2, 1
    beq	a1,t2,	__if_thenBB1
    j	paracopy1
paracopy1:
    j	__if_end1
__if_end1:
    mul t1,t1,t1
    li a1, 10000
    rem t1,t1,a1
    li a1, 2
    div t5,t5,a1
    mv	a1,a0 
    mv	a1,t5 
    mv	a1,t1 
    j	__whileCondBB1
__if_thenBB1:
    mul t2,a0,t1
    li a1, 10000
    rem a0,t2,a1
    j	__if_end1
afterCallBB1:
    call	toString
    call	println
    mv	a0,zero 
    lw ra, 0(sp) 
    addi sp,sp,    16
    ret
								 # func end
    .section	.sdata,"aw",@progbits
