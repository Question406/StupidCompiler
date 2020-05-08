    .text
    .globl	A.A						 # func begin 
    .p2align	2
    .type	A.A,@function
A.A:
%A.A.entryBB1:
    addi sp,sp,    -64
    sw ra, 24(sp) 
    sw s4, 40(sp) 
    sw s5, 52(sp) 
    sw s6, 20(sp) 
    sw s8, 12(sp) 
    sw a0, 44(sp) 
    la t6,countA    
    lw t0, 0(t6)
    la t6,countB    
    lw s4, 0(t6)
    lw t6, 44(sp) 
    addi t6,t6,    12
    addi s6,t0,    1
    sw s6,0(t6)
    lw t6, 44(sp) 
    addi t6,t6,    12
    lw t0, 0(t6)
    li t6, 2
    rem t6,t0,t6
    beq	t6,zero,	%if_thenBB1
    j	%if_elseBB1
%if_thenBB1:
    lw t6, 44(sp) 
    add s8,t6,zero
    li a0, 16
    call malloc
    mv	s5,a0 
    lui t6,%hi(countA)
    sw s6, %lo(countA)(t6)
    lui t6,%hi(countB)
    sw s4, %lo(countB)(t6)
    mv	a0,s5 
    call	A.A
    la t6,countB    
    lw s6, 0(t6)
    la t6,countA    
    lw s4, 0(t6)
    sw s5,0(s8)
    li t6, 2
    rem t6,s6,t6
    beq	t6,zero,	%if_thenBB2
    j	%if_elseBB2
%if_elseBB2:
    lw t6, 44(sp) 
    addi t0,t6,    4
    li t6, 0
    sw t6,0(t0)
    mv	t6,s4 
    sw t6, 8(sp) 
    mv	t0,s6 
    sw t0, 28(sp) 
    lw t6, 8(sp) 
    lw t6, 8(sp) 
    sw t6, 8(sp) 
    lw t6, 28(sp) 
    j	%if_end1
%if_thenBB2:
    lw t6, 44(sp) 
    addi s5,t6,    4
    li a0, 8
    call malloc
    mv	s8,a0 
    lui t6,%hi(countB)
    sw s6, %lo(countB)(t6)
    mv	a0,s8 
    call	B.B
    la t6,countB    
    lw t0, 0(t6)
    sw s8,0(s5)
    mv	t6,s4 
    sw t6, 8(sp) 
    sw t0, 28(sp) 
    lw t6, 8(sp) 
    lw t6, 8(sp) 
    sw t6, 8(sp) 
    lw t6, 28(sp) 
    j	%if_end1
%if_elseBB1:
    lw t6, 44(sp) 
    add t0,t6,zero
    li t6, 0
    sw t6,0(t0)
    mv	t6,s6 
    sw t6, 8(sp) 
    mv	t0,s4 
    sw t0, 28(sp) 
    lw t6, 8(sp) 
    lw t6, 8(sp) 
    sw t6, 8(sp) 
    lw t6, 28(sp) 
    j	%if_end1
%if_end1:
    lw t6, 44(sp) 
    addi s4,t6,    8
    li a0, 12
    call malloc
    li t6, 2
    sw t6,0(a0)
    sw a0,0(s4)
    lw t6, 44(sp) 
    addi t6,t6,    8
    lw t6, 0(t6)
    addi t6,t6,    4
    sw t6, 0(sp) 
    li a0, 28
    call malloc
    sw a0, 36(sp) 
    li t6, 6
    lw t0, 36(sp) 
    sw t6,0(t0)
    lw t6, 36(sp) 
    addi s4,t6,    4
    lw t6, 36(sp) 
    addi s6,t6,    24
    j	%forcondBB1
%forcondBB1:
    ble	s4,s6,	%forupdateBB1
    j	%afterForBB1
%afterForBB1:
    lw t6, 36(sp) 
    addi t6,t6,    12
    lw t6, 0(t6)
    addi t6,t6,    16
    lw t6, 0(t6)
    addi t6,t6,    16
    lw t6, 0(t6)
    lw t0, 0(sp) 
    sw t6,0(t0)
    lw t6, 44(sp) 
    addi t6,t6,    8
    lw t6, 0(t6)
    addi t0,t6,    8
    li t6, 0
    sw t6,0(t0)
    lw t6, 44(sp) 
    addi t6,t6,    8
    lw a0, 0(t6)
    call	_arraySize
    li t6, 2
    bne	a0,t6,	%if_thenBB3
    j	%if_end2
%if_thenBB3:
    la a0,_globalStr2    
    call	println
    j	%if_end2
%if_end2:
    lui t0,%hi(countA)
    lw t6, 8(sp) 
    sw t6, %lo(countA)(t0)
    lui t6,%hi(countB)
    lw t0, 28(sp) 
    sw t0, %lo(countB)(t6)
    lw s8, 12(sp) 
    lw s6, 20(sp) 
    lw s5, 52(sp) 
    lw s4, 40(sp) 
    lw ra, 24(sp) 
    addi sp,sp,    64
    ret
%forupdateBB1:
    li a0, 28
    call malloc
    mv	s8,a0 
    li t6, 6
    sw t6,0(s8)
    addi s5,s8,    4
    addi t6,s8,    24
    sw t6, 32(sp) 
    j	%forcondBB2
%forcondBB2:
    lw t6, 32(sp) 
    ble	s5,t6,	%forupdateBB2
    j	%afterForBB2
%forupdateBB2:
    li a0, 28
    call malloc
    sw a0, 48(sp) 
    li t6, 6
    lw t0, 48(sp) 
    sw t6,0(t0)
    lw t6, 48(sp) 
    addi t6,t6,    4
    lw t0, 48(sp) 
    addi t0,t0,    24
    sw t0, 16(sp) 
    sw t6, 4(sp) 
    lw t6, 4(sp) 
    j	%forcondBB3
%forcondBB3:
    lw t6, 4(sp) 
    lw t0, 16(sp) 
    ble	t6,t0,	%forupdateBB3
    j	%afterForBB3
%forupdateBB3:
    li a0, 52
    call malloc
    li t6, 6
    sw t6,0(a0)
    lw t6, 4(sp) 
    sw a0,0(t6)
    lw t6, 4(sp) 
    addi t6,t6,    4
    sw t6, 4(sp) 
    lw t6, 4(sp) 
    j	%forcondBB3
%afterForBB3:
    lw t6, 48(sp) 
    sw t6,0(s5)
    addi s5,s5,    4
    j	%forcondBB2
%afterForBB2:
    sw s8,0(s4)
    addi s4,s4,    4
    j	%forcondBB1
								 # func end
    .globl	B.B						 # func begin 
    .p2align	2
    .type	B.B,@function
B.B:
%B.B.entryBB1:
    addi sp,sp,    -32
    sw ra, 12(sp) 
    sw s1, 8(sp) 
    sw s3, 4(sp) 
    la t6,countB    
    lw t0, 0(t6)
    add t6,a0,zero
    addi s3,t0,    1
    sw s3,0(t6)
    addi s1,a0,    4
    li a0, 16
    call malloc
    sw a0, 0(sp) 
    lui t6,%hi(countB)
    sw s3, %lo(countB)(t6)
    lw a0, 0(sp) 
    call	A.A
    la t6,countB    
    lw t0, 0(t6)
    lw t6, 0(sp) 
    addi t6,t6,    8
    lw t6, 0(t6)
    addi t6,t6,    4
    lw t6, 0(t6)
    addi t6,t6,    4
    lw t6, 0(t6)
    sw t6,0(s1)
    lui t6,%hi(countB)
    sw t0, %lo(countB)(t6)
    lw s3, 4(sp) 
    lw s1, 8(sp) 
    lw ra, 12(sp) 
    addi sp,sp,    32
    ret
								 # func end
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
    la t6,countA    
    lw t6, 0(t6)
    la t6,countB    
    lw t6, 0(t6)
    la t6,something    
    lw s1, 0(t6)
    la t6,countC    
    lw t6, 0(t6)
    mv	s11,zero 
    j	%_forbodyBB1
%_forbodyBB1:
    xori t6,s11,    627
    xori t0,t6,    666
    li t6, 1
    beq	t0,t6,	%_if_thenBB1
    j	%_forupdateBB1
%_if_thenBB1:
    mv	a0,s11 
    call	toString
    call	println
    mv	a0,zero 
    call	toString
    call	println
    li a0, 1
    call	toString
    call	println
    mv	s7,zero 
    mv	s3,zero 
    mv	s0,zero 
    li a0, 8
    call malloc
    lui t6,%hi(countB)
    sw s3, %lo(countB)(t6)
    call	B.B
    la t6,countB    
    lw s3, 0(t6)
    mv	a0,s7 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    mv	s7,a0 
    mv	a0,s3 
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    la a1,_globalStr1    
    call	_stringAdd
    mv	s7,a0 
    mv	a0,s0 
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    call	println
    li s4, 1
    li s7, 1
    li s3, 1
    li a0, 8
    call malloc
    lui t6,%hi(countB)
    sw s7, %lo(countB)(t6)
    call	B.B
    la t6,countB    
    lw s0, 0(t6)
    li t6, 1
    sub a0,s4,t6
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    mv	s7,a0 
    li t6, 1
    sub a0,s0,t6
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    la a1,_globalStr1    
    call	_stringAdd
    mv	s7,a0 
    li t6, 1
    sub a0,s3,t6
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    call	print
    la a0,_globalStr5    
    call	print
    mv	t6,s1 
    addi t6,t6,    4
    lw s7, 0(t6)
    addi t6,s1,    4
    lw a0, 0(t6)
    call	stringLength
    li t6, 1
    sub a2,a0,t6
    mv	a0,s7 
    li a1, 1
    call	_stringSubstring
    call	_stringParseInt
    call	toString
    call	println
    addi t6,s1,    4
    lw a0, 0(t6)
    li t6, 42
    andi a1,t6,    21
    call	_stringOrd
    call	toString
    mv	s7,a0 
    addi t6,s1,    4
    lw a1, 0(t6)
    mv	a0,s7 
    call	_stringLess
    bne	a0, zero %__if_thenBB1
    j	%__if_elseBB1
%__if_thenBB1:
    addi t6,s1,    4
    lw a0, 0(t6)
    la a1,_globalStr3    
    call	_stringAdd
    mv	a1,s7 
    call	_stringAdd
    call	println
    j	%_whileBodyBB1
%__if_elseBB1:
    addi t6,s1,    4
    lw a0, 0(t6)
    la a1,_globalStr6    
    call	_stringAdd
    mv	a1,s7 
    call	_stringAdd
    call	println
    j	%_whileBodyBB1
%_whileBodyBB1:
    li t6, 2
    rem t6,s11,t6
    beq	t6,zero,	%_whileBodyBB1
    j	%_if_end1
%_if_end1:
    mv	a0,s11 
    call	toString
    la a1,_globalStr4    
    call	_stringAdd
    call	print
    j	%_whileBodyBB1
%_forupdateBB1:
    addi s11,s11,    1
    j	%_forbodyBB1
								 # func end
    .globl	C.Me						 # func begin 
    .p2align	2
    .type	C.Me,@function
C.Me:
%C.Me.entryBB1:
    ret
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	countA					#@countA
    .p2align	2
countA:
    .word	0
     
    .globl	countB					#@countB
    .p2align	2
countB:
    .word	0
     
    .globl	countC					#@countC
    .p2align	2
countC:
    .word	0
     
    .globl	something					#@something
    .p2align	2
something:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  ""    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  " "    
    .globl	_globalStr2					#@_globalStr2
_globalStr2:
    .asciz  "Oops!"    
    .globl	_globalStr3					#@_globalStr3
_globalStr3:
    .asciz  ">"    
    .globl	_globalStr4					#@_globalStr4
_globalStr4:
    .asciz  ","    
    .globl	_globalStr5					#@_globalStr5
_globalStr5:
    .asciz  "\n"    
    .globl	_globalStr6					#@_globalStr6
_globalStr6:
    .asciz  "<="    
