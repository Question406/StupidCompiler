    .text
    .globl	main						 # func begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -16
    sw ra, 0(sp)
    li a0, 1
    li a2, 2
    li ra, 10
    j	__whileCondBB1
__whileCondBB1:
    bgt	ra,zero,	__whileBodyBB1
    j	afterCallBB1
__whileBodyBB1:
    andi a7,ra,    1
    li t5, 1
    beq	a7,t5,	__if_thenBB1
    j	paracopy1
__if_thenBB1:
    mul t5,a0,a2
    li a0, 10000
    rem a0,t5,a0
    j	__if_end1
__if_end1:
    mul a2,a2,a2
    li t5, 10000
    rem a2,a2,t5
    li t5, 2
    div ra,ra,t5
    mv	t5,a0
    mv	t5,a2
    mv	t5,ra
    j	__whileCondBB1
paracopy1:
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
