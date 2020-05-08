    .text
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
    addi sp,sp,    -32
    sw ra, 0(sp) 
    sw s6, 16(sp) 
    sw s8, 20(sp) 
    sw s9, 12(sp) 
    sw s11, 4(sp) 
    la t3,t    
    lw t3, 0(t3)
    la t3,i    
    lw t3, 0(t3)
    la t3,s    
    lw t3, 0(t3)
    la t3,l    
    lw t3, 0(t3)
    call	getInt
    mv	s6,a0 
    mv	s8,zero 
    j	%_forcondBB1
%_forcondBB1:
    blt	s8,s6,	%_forbodyBB1
    j	%afterCallBB1
%_forbodyBB1:
    call	getString
    sw a0, 8(sp) 
    lw a0, 8(sp) 
    call	stringLength
    mv	s11,a0 
    li t3, 10
    bgt	s11,t3,	%_if_thenBB1
    j	%_if_elseBB1
%_if_elseBB1:
    lw a0, 8(sp) 
    call	println
    j	%_forupdateBB1
%_if_thenBB1:
    lw a0, 8(sp) 
    mv	a1,zero 
    li a2, 1
    call	_stringSubstring
    mv	s9,a0 
    li t3, 2
    sub a0,s11,t3
    call	toString
    mv	a1,a0 
    mv	a0,s9 
    call	_stringAdd
    mv	s9,a0 
    li t3, 1
    sub a1,s11,t3
    lw a0, 8(sp) 
    mv	a2,s11 
    call	_stringSubstring
    mv	a1,a0 
    mv	a0,s9 
    call	_stringAdd
    call	println
    j	%_forupdateBB1
%_forupdateBB1:
    addi s8,s8,    1
    j	%_forcondBB1
%afterCallBB1:
    lw s11, 4(sp) 
    lw s9, 12(sp) 
    lw s8, 20(sp) 
    lw s6, 16(sp) 
    lw ra, 0(sp) 
    mv	a0,zero 
    addi sp,sp,    32
    ret
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	s					#@s
    .p2align	2
s:
    .word	0
     
    .globl	t					#@t
    .p2align	2
t:
    .word	0
     
    .globl	i					#@i
    .p2align	2
i:
    .word	0
     
    .globl	l					#@l
    .p2align	2
l:
    .word	0
     
