    .text
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
    la a0,age    
    lw a0, 0(a0)
    la a0,eng    
    lw a0, 0(a0)
    li a0, 4
    call malloc
    li a0, 16
    call malloc
    mv	s8,a0 
    li a0, 3
    sw a0,0(s8)
    li a0, 8
    call malloc
    mv	s4,a0 
    li a0, 1
    sw a0,0(s4)
    addi s1,s4,    4
    addi s7,s4,    4
    j	%_forcondBB1
%_forcondBB1:
    ble	s1,s7,	%_forupdateBB1
    j	%_afterForBB1
%_forupdateBB1:
    li a0, 12
    call malloc
    mv	s0,a0 
    li a0, 2
    sw a0,0(s0)
    addi s5,s0,    4
    addi s9,s0,    8
    j	%_forcondBB2
%_forcondBB2:
    ble	s5,s9,	%_forupdateBB2
    j	%_afterForBB2
%_forupdateBB2:
    li a0, 16
    call malloc
    li a6, 3
    sw a6,0(a0)
    sw a0,0(s5)
    addi s5,s5,    4
    j	%_forcondBB2
%_afterForBB2:
    sw s0,0(s1)
    addi s1,s1,    4
    j	%_forcondBB1
%_afterForBB1:
    li a0, 12
    call malloc
    mv	s1,a0 
    addi a0,s8,    12
    lw a0, 0(a0)
    addi a0,s4,    8
    lw a0, 0(a0)
    addi a0,a0,    12
    lw a0, 0(a0)
    addi a0,a0,    16
    lw a0, 0(a0)
    li a0, 12
    call malloc
    mv	a6,zero 
    j	%__forcondBB1
%__forcondBB1:
    lw a3, 0(    0)
    blt	a6,a3,	%__forbodyBB1
    j	%_afterCallBB1
%__forbodyBB1:
    addi t3,a0,    4
    lw a3, 0(t3)
    addi a3,a3,    1
    sw a3,0(t3)
    addi a6,a6,    1
    j	%__forcondBB1
%_afterCallBB1:
    mv	a6,zero 
    j	%_forcondBB3
%_forcondBB3:
    li a0, 3
    blt	a6,a0,	%_forbodyBB1
    j	%_afterForBB3
%_afterForBB3:
    mv	a6,zero 
    j	%_forcondBB4
%_forcondBB4:
    li a0, 3
    blt	a6,a0,	%_forbodyBB2
    j	%_forbodyBB3
%_forbodyBB2:
    li a0, 4
    mul a0,a6,a0
    addi a0,a0,    4
    add a0,s8,a0
    lw a3, 0(a0)
    mv	a0,zero 
    j	%__forcondBB2
%__forcondBB2:
    add t3,a3,zero
    lw t3, 0(t3)
    blt	a0,t3,	%__forbodyBB2
    j	%_afterCallBB2
%__forbodyBB2:
    addi t6,s1,    4
    lw t3, 0(t6)
    addi t3,t3,    1
    sw t3,0(t6)
    addi a0,a0,    1
    j	%__forcondBB2
%_afterCallBB2:
    addi a6,a6,    1
    j	%_forcondBB4
%_forbodyBB3:
    j	%_forbodyBB3
%_forbodyBB1:
    li a0, 4
    mul a0,a6,a0
    addi a0,a0,    4
    add a0,s8,a0
    lw a3, 0(a0)
    mv	a0,zero 
    j	%__forcondBB3
%__forcondBB3:
    add t3,a3,zero
    lw t3, 0(t3)
    blt	a0,t3,	%__forbodyBB3
    j	%_afterCallBB3
%_afterCallBB3:
    addi a6,a6,    1
    j	%_forcondBB3
%__forbodyBB3:
    addi t6,s1,    4
    lw t3, 0(t6)
    addi t3,t3,    1
    sw t3,0(t6)
    addi a0,a0,    1
    j	%__forcondBB3
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	age					#@age
    .p2align	2
age:
    .word	0
     
    .globl	eng					#@eng
    .p2align	2
eng:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  "Four score and seven years ago"    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  "naive!\n"    
    .globl	_globalStr2					#@_globalStr2
_globalStr2:
    .asciz  "fast!\n"    
    .globl	_globalStr3					#@_globalStr3
_globalStr3:
    .asciz  "too young\\too simple."    
    .globl	_globalStr4					#@_globalStr4
_globalStr4:
    .asciz  "test"    
    .globl	_globalStr5					#@_globalStr5
_globalStr5:
    .asciz  "Four score and seven years ago\n\\\""    
    .globl	_globalStr6					#@_globalStr6
_globalStr6:
    .asciz  "HongKong"    
    .globl	_globalStr7					#@_globalStr7
_globalStr7:
    .asciz  "too young!\\"    
    .globl	_globalStr8					#@_globalStr8
_globalStr8:
    .asciz  "wukefengggao\n"    
