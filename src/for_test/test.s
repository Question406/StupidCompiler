    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -32
    sw ra, 4(sp) 
    sw s11, 0(sp) 
    sw s10, 12(sp) 
    sw s9, 8(sp) 
    mv	s10,s8 
    li a0, 11208
    call malloc
    li a1, 2801
    sw a1,0(a0)
    mv	s9,a0 
    mv	a1,zero 
_forcondBB1:
    li t1, 2800
    sub t1,a1,t1
    bne	t1,zero,	_forbodyBB1
paracopy1:
    li a1, 2800
    mv	a2,zero 
_forbodyBB2:
    slli ra,a1,    1
    beq	ra,zero,	afterCallBB1
_if_end1:
    mv	t5,a1 
    mv	t1,zero 
_forbodyBB3:
    slli t0,t5,    2
    addi t0,t0,    4
    add t0,s9,t0
    lw t2, 0(t0)
    li t0, 10000
    mul t0,t2,t0
    add t1,t1,t0
    addi t0,ra,    -1
    rem t2,t1,t0
    slli ra,t5,    2
    addi ra,ra,    4
    add ra,s9,ra
    sw t2,0(ra)
    addi ra,t0,    -1
    div t1,t1,t0
    mv	s8,t1 
    addi t5,t5,    -1
    beq	t5,zero,	_afterForBB1
_forupdateBB1:
    mul t1,s8,t5
    j	_forbodyBB3
_afterForBB1:
    addi a1,a1,    -14
    mv	s11,a1 
    li a1, 10000
    div a1,s8,a1
    add a0,a2,a1
    call	printInt
    li a1, 10000
    rem a2,s8,a1
    mv	a1,s11 
    j	_forbodyBB2
afterCallBB1:
    la a0,_globalStr0    
    call	print
    mv	s8,s10 
    lw s9, 8(sp) 
    lw s10, 12(sp) 
    lw s11, 0(sp) 
    lw ra, 4(sp) 
    mv	a0,zero 
    addi sp,sp,    32
    ret
_forbodyBB1:
    addi t1,a1,    1
    slli a1,a1,    2
    addi a1,a1,    4
    add a2,s9,a1
    li a1, 2000
    sw a1,0(a2)
    mv	a1,t1 
    j	_forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  "\n"    
