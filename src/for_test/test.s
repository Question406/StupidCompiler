    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    li t0, 1
    mv	a0,zero 
    li a7, 1
    mv	a2,zero 
    j	_forcondBB1
_forcondBB1:
    li a5, 10
    blt	a7,a5,	_forbodyBB1
    j	afterCallBB1
_forbodyBB1:
    add a0,a2,t0
    mv	a2,t0 
    addi a7,a7,    1
    mv	t0,a0 
    j	_forcondBB1
afterCallBB1:
    ret
								 # func end
    .section	.sdata,"aw",@progbits
