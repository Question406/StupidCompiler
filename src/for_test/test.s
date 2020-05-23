    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -32
    sw ra, 24(sp) 
    sw s11, 20(sp) 
    sw s10, 16(sp) 
    sw s9, 4(sp) 
    sw s8, 12(sp) 
    sw s7, 0(sp) 
    sw s6, 8(sp) 
    call	getInt
    mv	s7,a0 
    call	getInt
    mv	s6,a0 
    li a0, 40024
    call malloc
    li t4, 10005
    sw t4,0(a0)
    mv	s8,a0 
    li a0, 40024
    call malloc
    li t4, 10005
    sw t4,0(a0)
    mv	s9,a0 
    li a0, 40024
    call malloc
    li t4, 10005
    sw t4,0(a0)
    mv	s10,a0 
    mv	s11,zero 
    j	_forcondBB1
_forcondBB1:
    blt	s11,s6,	_forbodyBB1
    j	_afterForBB1
_forbodyBB1:
    call	getInt
    slli t4,s11,    2
    addi t4,t4,    4
    add t4,s8,t4
    sw a0,0(t4)
    call	getInt
    slli t4,s11,    2
    addi t4,t4,    4
    add t4,s9,t4
    sw a0,0(t4)
    addi t4,s11,    1
    mv	s11,t4 
    j	_forcondBB1
_afterForBB1:
    mv	t4,zero 
    j	_forcondBB2
_forcondBB2:
    blt	t4,s6,	_forbodyBB2
    j	afterCallBB1
_forbodyBB2:
    slli a7,t4,    2
    addi a7,a7,    4
    add a7,s9,a7
    lw a7, 0(a7)
    j	_forcondBB3
_forcondBB3:
    ble	a7,s7,	_forbodyBB3
    j	_forupdateBB1
_forupdateBB1:
    addi t4,t4,    1
    j	_forcondBB2
_forbodyBB3:
    slli a6,t4,    2
    addi a6,a6,    4
    add a3,s8,a6
    slli a6,t4,    2
    addi a6,a6,    4
    add a6,s9,a6
    lw a6, 0(a6)
    sub a6,a7,a6
    slli a6,a6,    2
    addi a6,a6,    4
    add a6,s10,a6
    lw a6, 0(a6)
    lw a3, 0(a3)
    add a3,a6,a3
    slli a6,a7,    2
    addi a6,a6,    4
    add a6,s10,a6
    lw a6, 0(a6)
    ble	a6,a3,	_if_thenBB1
    j	_forupdateBB2
_forupdateBB2:
    addi a7,a7,    1
    j	_forcondBB3
_if_thenBB1:
    slli a6,t4,    2
    addi a6,a6,    4
    add a6,s8,a6
    slli a3,t4,    2
    addi a3,a3,    4
    add a3,s9,a3
    lw a3, 0(a3)
    sub a3,a7,a3
    slli a3,a3,    2
    addi a3,a3,    4
    add a3,s10,a3
    lw a3, 0(a3)
    lw a6, 0(a6)
    add a3,a3,a6
    slli a6,a7,    2
    addi a6,a6,    4
    add a6,s10,a6
    sw a3,0(a6)
    j	_forupdateBB2
afterCallBB1:
    slli t4,s7,    2
    addi t4,t4,    4
    add t4,s10,t4
    lw a0, 0(t4)
    call	printInt
    lw s6, 8(sp) 
    lw s7, 0(sp) 
    lw s8, 12(sp) 
    lw s9, 4(sp) 
    lw s10, 16(sp) 
    lw s11, 20(sp) 
    lw ra, 24(sp) 
    mv	a0,zero 
    addi sp,sp,    32
    ret
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	MAXN					#@MAXN
    .p2align	2
MAXN:
    .word	0
     
    .globl	MAXM					#@MAXM
    .p2align	2
MAXM:
    .word	0
     
