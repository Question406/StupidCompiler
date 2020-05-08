    .text
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -16
    sw ra, 0(sp) 
    li a0, 20
    call malloc
    li a3, 4
    sw a3,0(a0)
    addi a3,a0,    4
    li a4, 10
    sw a4,0(a3)
    addi a4,a0,    4
    lw a0, 0(a4)
    addi a3,a0,    1
    sw a3,0(a4)
    lw ra, 0(sp) 
    addi sp,sp,    16
    ret
								 # func end
    .section	.sdata,"aw",@progbits
