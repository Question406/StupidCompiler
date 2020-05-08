    .text
    .globl	A.A						 # func begin 
    .p2align	2
    .type	A.A,@function
A.A:
%A.A.entryBB1:
    addi sp,sp,    -64
    sw ra, 0(sp) 
    sw s7, 44(sp) 
    sw s8, 52(sp) 
    sw s9, 16(sp) 
    sw s11, 12(sp) 
    sw a0, 36(sp) 
    la a5,countB    
    lw s8, 0(a5)
    la a5,countA    
    lw t1, 0(a5)
    lw a5, 36(sp) 
    addi a5,a5,    12
    addi s9,t1,    1
    sw s9,0(a5)
    lw a5, 36(sp) 
    addi a5,a5,    12
    lw t1, 0(a5)
    li a5, 2
    rem a5,t1,a5
    beq	a5,zero,	%if_thenBB1
    j	%if_elseBB1
%if_thenBB1:
    lw a5, 36(sp) 
    add a5,a5,zero
    sw a5, 24(sp) 
    li a0, 16
    call malloc
    mv	s11,a0 
    lui a5,%hi(countB)
    sw s8, %lo(countB)(a5)
    lui a5,%hi(countA)
    sw s9, %lo(countA)(a5)
    mv	a0,s11 
    call	A.A
    la a5,countA    
    lw s9, 0(a5)
    la a5,countB    
    lw s8, 0(a5)
    lw a5, 24(sp) 
    sw s11,0(a5)
    li a5, 2
    rem a5,s8,a5
    beq	a5,zero,	%if_thenBB2
    j	%if_elseBB2
%if_elseBB2:
    lw a5, 36(sp) 
    addi t1,a5,    4
    li a5, 0
    sw a5,0(t1)
    sw s9, 56(sp) 
    mv	a5,s8 
    sw a5, 4(sp) 
    lw a5, 56(sp) 
    lw s9, 56(sp) 
    sw s9, 56(sp) 
    lw a5, 4(sp) 
    j	%if_end1
%if_thenBB2:
    lw a5, 36(sp) 
    addi s7,a5,    4
    li a0, 8
    call malloc
    mv	s11,a0 
    lui a5,%hi(countB)
    sw s8, %lo(countB)(a5)
    mv	a0,s11 
    call	B.B
    la a5,countB    
    lw a5, 0(a5)
    sw s11,0(s7)
    sw s9, 56(sp) 
    sw a5, 4(sp) 
    lw a5, 56(sp) 
    lw s9, 56(sp) 
    sw s9, 56(sp) 
    lw a5, 4(sp) 
    j	%if_end1
%if_elseBB1:
    lw a5, 36(sp) 
    add t1,a5,zero
    li a5, 0
    sw a5,0(t1)
    sw s9, 56(sp) 
    mv	a5,s8 
    sw a5, 4(sp) 
    lw a5, 56(sp) 
    lw s9, 56(sp) 
    sw s9, 56(sp) 
    lw a5, 4(sp) 
    j	%if_end1
%if_end1:
    lw a5, 36(sp) 
    addi s9,a5,    8
    li a0, 12
    call malloc
    li a5, 2
    sw a5,0(a0)
    sw a0,0(s9)
    lw a5, 36(sp) 
    addi a5,a5,    8
    lw a5, 0(a5)
    addi a5,a5,    4
    sw a5, 28(sp) 
    li a0, 28
    call malloc
    sw a0, 20(sp) 
    li t1, 6
    lw a5, 20(sp) 
    sw t1,0(a5)
    lw a5, 20(sp) 
    addi t1,a5,    4
    lw a5, 20(sp) 
    addi a5,a5,    24
    sw a5, 40(sp) 
    sw t1, 48(sp) 
    lw a5, 48(sp) 
    j	%forcondBB1
%forcondBB1:
    lw a5, 40(sp) 
    lw t1, 48(sp) 
    ble	t1,a5,	%forupdateBB1
    j	%afterForBB1
%forupdateBB1:
    li a0, 28
    call malloc
    mv	s7,a0 
    li a5, 6
    sw a5,0(s7)
    addi a5,s7,    4
    addi s11,s7,    24
    sw a5, 8(sp) 
    lw a5, 8(sp) 
    j	%forcondBB2
%forcondBB2:
    lw a5, 8(sp) 
    ble	a5,s11,	%forupdateBB2
    j	%afterForBB2
%forupdateBB2:
    li a0, 28
    call malloc
    mv	s9,a0 
    li a5, 6
    sw a5,0(s9)
    addi a5,s9,    4
    addi s8,s9,    24
    sw a5, 32(sp) 
    lw a5, 32(sp) 
    j	%forcondBB3
%forcondBB3:
    lw a5, 32(sp) 
    ble	a5,s8,	%forupdateBB3
    j	%afterForBB3
%afterForBB3:
    lw a5, 8(sp) 
    sw s9,0(a5)
    lw a5, 8(sp) 
    addi a5,a5,    4
    sw a5, 8(sp) 
    lw a5, 8(sp) 
    j	%forcondBB2
%forupdateBB3:
    li a0, 52
    call malloc
    li a5, 6
    sw a5,0(a0)
    lw a5, 32(sp) 
    sw a0,0(a5)
    lw a5, 32(sp) 
    addi a5,a5,    4
    sw a5, 32(sp) 
    lw a5, 32(sp) 
    j	%forcondBB3
%afterForBB2:
    lw a5, 48(sp) 
    sw s7,0(a5)
    lw a5, 48(sp) 
    addi t1,a5,    4
    sw t1, 48(sp) 
    lw a5, 48(sp) 
    j	%forcondBB1
%afterForBB1:
    lw a5, 20(sp) 
    addi a5,a5,    12
    lw a5, 0(a5)
    addi a5,a5,    16
    lw a5, 0(a5)
    addi a5,a5,    16
    lw t1, 0(a5)
    lw a5, 28(sp) 
    sw t1,0(a5)
    lw a5, 36(sp) 
    addi a5,a5,    8
    lw a5, 0(a5)
    addi t1,a5,    8
    li a5, 0
    sw a5,0(t1)
    lw a5, 36(sp) 
    addi a5,a5,    8
    lw a0, 0(a5)
    call	_arraySize
    li a5, 2
    bne	a0,a5,	%if_thenBB3
    j	%if_end2
%if_thenBB3:
    la a0,_globalStr2    
    call	println
    j	%if_end2
%if_end2:
    lui t1,%hi(countB)
    lw a5, 4(sp) 
    sw a5, %lo(countB)(t1)
    lui t1,%hi(countA)
    lw a5, 56(sp) 
    sw a5, %lo(countA)(t1)
    lw s11, 12(sp) 
    lw s9, 16(sp) 
    lw s8, 52(sp) 
    lw s7, 44(sp) 
    lw ra, 0(sp) 
    addi sp,sp,    64
    ret
								 # func end
    .globl	B.B						 # func begin 
    .p2align	2
    .type	B.B,@function
B.B:
%B.B.entryBB1:
    addi sp,sp,    -32
    sw ra, 12(sp) 
    sw s4, 0(sp) 
    sw s8, 4(sp) 
    sw s9, 8(sp) 
    la a5,countB    
    lw a5, 0(a5)
    add t1,a0,zero
    addi s8,a5,    1
    sw s8,0(t1)
    addi s9,a0,    4
    li a0, 16
    call malloc
    mv	s4,a0 
    lui a5,%hi(countB)
    sw s8, %lo(countB)(a5)
    mv	a0,s4 
    call	A.A
    la a5,countB    
    lw t1, 0(a5)
    addi a5,s4,    8
    lw a5, 0(a5)
    addi a5,a5,    4
    lw a5, 0(a5)
    addi a5,a5,    4
    lw a5, 0(a5)
    sw a5,0(s9)
    lui a5,%hi(countB)
    sw t1, %lo(countB)(a5)
    lw s9, 8(sp) 
    lw s8, 4(sp) 
    lw s4, 0(sp) 
    lw ra, 12(sp) 
    addi sp,sp,    32
    ret
								 # func end
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
    la a5,countB    
    lw a5, 0(a5)
    la a5,countA    
    lw a5, 0(a5)
    la a5,countC    
    lw a5, 0(a5)
    la a5,something    
    lw s3, 0(a5)
    mv	s9,zero 
    j	%_forbodyBB1
%_forbodyBB1:
    xori a5,s9,    627
    xori a5,a5,    666
    li t1, 1
    beq	a5,t1,	%_if_thenBB1
    j	%_forupdateBB1
%_forupdateBB1:
    addi s9,s9,    1
    j	%_forbodyBB1
%_if_thenBB1:
    mv	a0,s9 
    call	toString
    call	println
    mv	a0,zero 
    call	toString
    call	println
    li a0, 1
    call	toString
    call	println
    mv	s5,zero 
    mv	s6,zero 
    mv	s8,zero 
    li a0, 8
    call malloc
    lui a5,%hi(countB)
    sw s6, %lo(countB)(a5)
    call	B.B
    la a5,countB    
    lw s6, 0(a5)
    mv	a0,s5 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    mv	s5,a0 
    mv	a0,s6 
    call	toString
    mv	a1,a0 
    mv	a0,s5 
    call	_stringAdd
    la a1,_globalStr1    
    call	_stringAdd
    mv	s6,a0 
    mv	a0,s8 
    call	toString
    mv	a1,a0 
    mv	a0,s6 
    call	_stringAdd
    call	println
    li s6, 1
    li s5, 1
    li s8, 1
    li a0, 8
    call malloc
    lui a5,%hi(countB)
    sw s5, %lo(countB)(a5)
    call	B.B
    la a5,countB    
    lw s5, 0(a5)
    li a5, 1
    sub a0,s6,a5
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    mv	s6,a0 
    li a5, 1
    sub a0,s5,a5
    call	toString
    mv	a1,a0 
    mv	a0,s6 
    call	_stringAdd
    la a1,_globalStr1    
    call	_stringAdd
    mv	s6,a0 
    li a5, 1
    sub a0,s8,a5
    call	toString
    mv	a1,a0 
    mv	a0,s6 
    call	_stringAdd
    call	print
    la a0,_globalStr5    
    call	print
    mv	a5,s3 
    addi a5,a5,    4
    lw s6, 0(a5)
    addi a5,s3,    4
    lw a0, 0(a5)
    call	stringLength
    li a5, 1
    sub a2,a0,a5
    mv	a0,s6 
    li a1, 1
    call	_stringSubstring
    call	_stringParseInt
    call	toString
    call	println
    addi a5,s3,    4
    lw a0, 0(a5)
    li a5, 42
    andi a1,a5,    21
    call	_stringOrd
    call	toString
    mv	s6,a0 
    addi a5,s3,    4
    lw a1, 0(a5)
    mv	a0,s6 
    call	_stringLess
    bne	a0, zero %__if_thenBB1
    j	%__if_elseBB1
%__if_thenBB1:
    addi a5,s3,    4
    lw a0, 0(a5)
    la a1,_globalStr3    
    call	_stringAdd
    mv	a1,s6 
    call	_stringAdd
    call	println
    j	%_whileBodyBB1
%__if_elseBB1:
    addi a5,s3,    4
    lw a0, 0(a5)
    la a1,_globalStr6    
    call	_stringAdd
    mv	a1,s6 
    call	_stringAdd
    call	println
    j	%_whileBodyBB1
%_whileBodyBB1:
    li a5, 2
    rem a5,s9,a5
    beq	a5,zero,	%_whileBodyBB1
    j	%_if_end1
%_if_end1:
    mv	a0,s9 
    call	toString
    la a1,_globalStr4    
    call	_stringAdd
    call	print
    j	%_whileBodyBB1
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
