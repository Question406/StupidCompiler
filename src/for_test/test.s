    .text
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
    addi sp,sp,    -32
    sw ra, 12(sp) 
    sw s0, 4(sp) 
    sw s3, 0(sp) 
    la t6,map    
    lw t6, 0(t6)
    la t6,str    
    lw t6, 0(t6)
    la t6,a    
    lw t6, 0(t6)
    la t6,b    
    lw t6, 0(t6)
    li a0, 2896
    call malloc
    li t6, 723
    sw t6,0(a0)
    mv	s3,a0 
    li a0, 616
    call malloc
    li t6, 153
    sw t6,0(a0)
    addi s0,a0,    4
    addi t6,a0,    612
    sw t6, 8(sp) 
    j	%forcondBB1
%forcondBB1:
    lw t6, 8(sp) 
    ble	s0,t6,	%forupdateBB1
    j	%afterForBB1
%forupdateBB1:
    li a0, 580
    call malloc
    li t6, 144
    sw t6,0(a0)
    sw a0,0(s0)
    addi s0,s0,    4
    j	%forcondBB1
%afterForBB1:
    mv	a2,zero 
    j	%_forcondBB1
%_forcondBB1:
    li t6, 10213
    blt	a2,t6,	%_forbodyBB1
    j	%afterCallBB1
%afterCallBB1:
    lw s3, 0(sp) 
    lw s0, 4(sp) 
    lw ra, 12(sp) 
    mv	a0,zero 
    addi sp,sp,    32
    ret
%_forbodyBB1:
    li t6, 10213
    mul a1,a2,t6
    li t6, 13
    sub t6,a1,t6
    li a1, 4
    mul a1,a2,a1
    addi a1,a1,    4
    add a1,s3,a1
    lw a1, 0(a1)
    add a1,a1,zero
    lw a1, 0(a1)
    blt	t6,a1,	%_forupdateBB1
    j	%_if_thenBB1
%_if_thenBB1:
    li t6, 4
    mul t6,a2,t6
    addi t6,t6,    4
    add a1,s3,t6
    addi t6,a2,    1
    li t3, 4
    mul t6,t6,t3
    addi t6,t6,    4
    add t6,s3,t6
    lw t6, 0(t6)
    add t3,t6,zero
    lw t3, 0(t3)
    li t2, 10
    ble	t2,t3,	%__forbodyBB1
    j	%__afterForBB1
%__forbodyBB1:
    j	%_afterCallBB1
%__afterForBB1:
    j	%_afterCallBB1
%_afterCallBB1:
    sw t6,0(a1)
    addi t6,s3,    48
    lw t6, 0(t6)
    add t6,t6,zero
    lw t6, 0(t6)
    j	%_forupdateBB1
%_forupdateBB1:
    addi a2,a2,    1
    j	%_forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	str					#@str
    .p2align	2
str:
    .word	0
     
    .globl	a					#@a
    .p2align	2
a:
    .word	0
     
    .globl	b					#@b
    .p2align	2
b:
    .word	0
     
    .globl	map					#@map
    .p2align	2
map:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  "19asdojkhkj1"    
