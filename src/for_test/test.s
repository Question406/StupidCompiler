    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init__init.entryBB1:
    addi sp,sp,    -32
    sw ra, 16(sp) 
    sw s0, 12(sp) 
    sw s1, 8(sp) 
    sw s2, 4(sp) 
    sw s3, 0(sp) 
    mv	s1,s4 
    li a0, 60008
    call malloc
    li t6, 15001
    sw t6,0(a0)
    mv	s2,a0 
    li t6, 1
__init_forcondBB1:
    li a4, 15000
    ble	t6,a4,	__init_forbodyBB1
__init_afterForBB1:
    mv	a0,zero 
    li s3, 2
__init_forcondBB2:
    li t6, 15000
    ble	s3,t6,	__init_forbodyBB2
__initafterCallBB1:
    call	toString
    mv	a1,a0 
    la a0,_globalStr0    
    call	_stringAdd
    call	println
    mv	s4,s1 
    lw s3, 0(sp) 
    lw s2, 4(sp) 
    lw s1, 8(sp) 
    lw s0, 12(sp) 
    lw ra, 16(sp) 
    mv	a0,zero 
    addi sp,sp,    32
    ret
__init_forbodyBB2:
    slli t6,s3,    2
    addi t6,t6,    4
    add t6,s2,t6
    lw t6, 0(t6)
    bne	t6, zero, __init_if_thenBB1
__initparacopy1:
__init_forupdateBB1:
    addi t6,s3,    1
    mv	s3,t6 
    j	__init_forcondBB2
__init_if_thenBB1:
    li t6, 3
    bgt	s3,t6,	__init_ifTrue1
__initparacopy2:
    li t6, 2
__init_whileCondBB1:
    mul a3,s3,t6
    li a4, 15000
    ble	a3,a4,	__init_whileBodyBB1
__initparacopy3:
    j	__init_forupdateBB1
__init_whileBodyBB1:
    slli a4,a3,    2
    addi a4,a4,    4
    add a4,s2,a4
    sw zero,0(a4)
    addi t6,t6,    1
    j	__init_whileCondBB1
__init_ifTrue1:
    addi t6,s3,    -2
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,s2,t6
    lw t6, 0(t6)
    bne	t6, zero, __init_if_thenBB2
__initparacopy4:
    li t6, 2
    j	__init_whileCondBB1
__init_if_thenBB2:
    addi s0,a0,    1
    mv	a0,s3 
    call	toString
    mv	s4,a0 
    addi a0,s3,    -2
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    mv	a1,s4 
    call	_stringAdd
    call	println
    mv	a0,s0 
    li t6, 2
    j	__init_whileCondBB1
__init_forbodyBB1:
    slli a4,t6,    2
    addi a4,a4,    4
    add a3,s2,a4
    li a4, 1
    sw a4,0(a3)
    addi t6,t6,    1
    j	__init_forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	b					#@b
    .p2align	2
b:
    .word	0
     
    .globl	resultCount					#@resultCount
    .p2align	2
resultCount:
    .word	0
     
    .globl	N					#@N
    .p2align	2
N:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  "Total: "    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  " "    
