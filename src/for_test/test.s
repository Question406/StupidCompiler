    .text
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -48
    sw ra, 36(sp) 
    sw s9, 32(sp) 
    sw s8, 4(sp) 
    sw s7, 40(sp) 
    sw s6, 20(sp) 
    sw s5, 12(sp) 
    sw s4, 28(sp) 
    sw s3, 8(sp) 
    sw s2, 0(sp) 
    sw s1, 16(sp) 
    sw s0, 24(sp) 
    mv	s6,s11 
    li a0, 404
    call malloc
    mv	s8,a0 
    li a7, 100
    sw a7,0(s8)
    addi s2,s8,    4
    addi s3,s8,    400
    j	forcondBB1
forcondBB1:
    ble	s2,s3,	forupdateBB1
    j	afterForBB1
forupdateBB1:
    li a0, 324
    call malloc
    li a7, 80
    sw a7,0(a0)
    sw a0,0(s2)
    addi s2,s2,    4
    j	forcondBB1
afterForBB1:
    li a0, 25284
    call malloc
    li a7, 6320
    sw a7,0(a0)
    mv	s3,a0 
    li a0, 24
    call malloc
    li a7, 5
    sw a7,0(a0)
    mv	s1,a0 
    j	_whileBodyBB1
_whileBodyBB1:
    call	getInt
    beq	a0,zero,	afterCallBB1
    j	_if_end1
_if_end1:
    li a7, 1
    beq	a0,a7,	_if_thenBB1
    j	_if_elseBB1
_if_elseBB1:
    li a7, 2
    beq	a0,a7,	_if_thenBB2
    j	_whileBodyBB1
_if_thenBB2:
    call	getString
    mv	s0,a0 
    li a0, 24
    call malloc
    li a7, 5
    sw a7,0(a0)
    mv	s2,a0 
    mv	a0,s0 
    call	stringLength
    li a7, 40
    bne	a0,a7,	__if_thenBB1
    j	__if_end1
__if_thenBB1:
    la a0,_globalStr1    
    call	println
    j	_whileBodyBB1
__if_end1:
    mv	a7,zero 
    j	__forcondBB1
__forcondBB1:
    li a3, 5
    blt	a7,a3,	__forbodyBB1
    j	__afterForBB1
__afterForBB1:
    mv	s4,zero 
    j	__forcondBB2
__forcondBB2:
    li a7, 40
    blt	s4,a7,	__forbodyBB2
    j	__afterForBB2
__afterForBB2:
    li s11, 1
    j	__forcondBB3
__forcondBB3:
    li a7, 4
    ble	s11,a7,	__forbodyBB3
    j	__afterForBB3
__afterForBB3:
    la a0,_globalStr3    
    call	println
    j	_whileBodyBB1
__forbodyBB3:
    mv	a7,zero 
    j	__forcondBB4
__forcondBB4:
    blt	a7,s11,	__forbodyBB4
    j	__whileBodyBB1
__forbodyBB4:
    li a3, 4
    mul a3,a7,a3
    addi a3,a3,    4
    add a3,s3,a3
    li a4, 48
    sw a4,0(a3)
    addi a7,a7,    1
    j	__forcondBB4
__whileBodyBB1:
    mv	a7,s3 
    addi a3,s11,    64
    li a4, 56
    sub a4,a3,a4
    li a3, 64
    div a3,a4,a3
    addi ra,a3,    1
    li a3, 100
    bgt	ra,a3,	_if_thenBB3
    j	_if_end2
_if_thenBB3:
    la a0,_globalStr4    
    call	println
    mv	s7,zero 
    j	afterCallBB2
afterCallBB2:
    mv	a0,s7 
    call	_arraySize
    mv	s9,a0 
    mv	a0,s2 
    call	_arraySize
    bne	s9,a0,	_if_thenBB4
    j	_if_end3
_if_thenBB4:
    mv	a7,zero 
    j	afterCallBB3
afterCallBB3:
    bne	a7, zero, __if_thenBB2
    j	__if_end2
__if_thenBB2:
    mv	s2,zero 
    j	__forcondBB5
__forcondBB5:
    blt	s2,s11,	__forbodyBB5
    j	__afterForBB4
__forbodyBB5:
    li a7, 4
    mul a7,s2,a7
    addi a7,a7,    4
    add a7,s3,a7
    lw a7, 0(a7)
    li a3, 32
    bge	a7,a3,	_ifTrue1
    j	_if_end4
_if_end4:
    la a0,_globalStr0    
    j	afterCallBB4
afterCallBB4:
    call	print
    addi s2,s2,    1
    j	__forcondBB5
_ifTrue1:
    li a3, 126
    ble	a7,a3,	_if_thenBB5
    j	_if_end4
_if_thenBB5:
    li a3, 32
    sub a1,a7,a3
    li a3, 31
    sub a2,a7,a3
    la a0,_globalStr2    
    call	_stringSubstring
    j	afterCallBB4
__afterForBB4:
    la a0,_globalStr0    
    call	println
    j	_whileBodyBB1
__if_end2:
    mv	a7,s3 
    li a3, 1
    sub a3,s11,a3
    j	_forcondBB1
_forcondBB1:
    bge	a3,zero,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	a7,zero 
    j	afterCallBB5
afterCallBB5:
    bne	a7, zero, __whileBodyBB1
    j	__forupdateBB1
__forupdateBB1:
    addi s11,s11,    1
    j	__forcondBB3
_forbodyBB1:
    li a4, 4
    mul a4,a3,a4
    addi a4,a4,    4
    add a4,a7,a4
    lw a4, 0(a4)
    li a0, 122
    beq	a4,a0,	__if_thenBB3
    j	__if_end3
__if_end3:
    li a0, 90
    beq	a4,a0,	__if_thenBB4
    j	__if_end4
__if_end4:
    li a0, 57
    beq	a4,a0,	__if_thenBB5
    j	__if_end5
__if_end5:
    addi a4,a4,    1
    j	_afterCallBB1
_afterCallBB1:
    li a0, 4
    mul a0,a3,a0
    addi a0,a0,    4
    add a0,a7,a0
    sw a4,0(a0)
    li a4, 4
    mul a4,a3,a4
    addi a4,a4,    4
    add a4,a7,a4
    lw a0, 0(a4)
    li a4, -1
    beq	a0,a4,	_if_thenBB6
    j	_if_elseBB2
_if_thenBB6:
    li a4, 4
    mul a4,a3,a4
    addi a4,a4,    4
    add a4,a7,a4
    li a0, 48
    sw a0,0(a4)
    li a4, 1
    sub a3,a3,a4
    j	_forcondBB1
_if_elseBB2:
    li a7, 1
    j	afterCallBB5
__if_thenBB5:
    li a4, 65
    j	_afterCallBB1
__if_thenBB4:
    li a4, 97
    j	_afterCallBB1
__if_thenBB3:
    li a4, -1
    j	_afterCallBB1
_if_end3:
    mv	s9,zero 
    j	_forcondBB2
_forcondBB2:
    mv	a0,s7 
    call	_arraySize
    blt	s9,a0,	_forbodyBB2
    j	_afterForBB2
_afterForBB2:
    li a7, 1
    j	afterCallBB3
_forbodyBB2:
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a3,s7,a7
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,s2,a7
    lw a3, 0(a3)
    lw a7, 0(a7)
    bne	a3,a7,	_if_thenBB7
    j	_forupdateBB1
_forupdateBB1:
    addi s9,s9,    1
    j	_forcondBB2
_if_thenBB7:
    mv	a7,zero 
    j	afterCallBB3
_if_end2:
    mv	a3,zero 
    j	_forcondBB3
_forcondBB3:
    blt	a3,ra,	_forbodyBB3
    j	_afterForBB3
_afterForBB3:
    mv	a3,zero 
    j	_forcondBB4
_forcondBB4:
    blt	a3,s11,	_forbodyBB4
    j	_afterForBB4
_forbodyBB4:
    li a4, 64
    div a0,a3,a4
    li a4, 4
    mul a4,a0,a4
    addi a4,a4,    4
    add t5,s8,a4
    li a4, 64
    rem a4,a3,a4
    li a0, 4
    div a5,a4,a0
    lw a0, 0(t5)
    li a4, 4
    mul a4,a5,a4
    addi a4,a4,    4
    add a5,a0,a4
    li a4, 4
    mul a4,a3,a4
    addi a4,a4,    4
    add t5,a7,a4
    li a4, 4
    rem a0,a3,a4
    li a4, 3
    sub a4,a4,a0
    li a0, 8
    mul a4,a4,a0
    lw a0, 0(t5)
    sll a0,a0,a4
    lw a4, 0(a5)
    or a0,a4,a0
    li a4, 64
    div a4,a3,a4
    li t5, 4
    mul a4,a4,t5
    addi a4,a4,    4
    add a4,s8,a4
    li t5, 64
    rem a5,a3,t5
    li t5, 4
    div a5,a5,t5
    lw t5, 0(a4)
    li a4, 4
    mul a4,a5,a4
    addi a4,a4,    4
    add a4,t5,a4
    sw a0,0(a4)
    addi a3,a3,    1
    j	_forcondBB4
_afterForBB4:
    li a7, 64
    div a4,a3,a7
    li a7, 4
    mul a7,a4,a7
    addi a7,a7,    4
    add a0,s8,a7
    li a7, 64
    rem a4,a3,a7
    li a7, 4
    div a4,a4,a7
    lw a0, 0(a0)
    li a7, 4
    mul a7,a4,a7
    addi a7,a7,    4
    add a4,a0,a7
    li a7, 4
    rem a7,a3,a7
    li a0, 3
    sub a7,a0,a7
    li a0, 8
    mul a0,a7,a0
    li a7, 128
    sll a0,a7,a0
    lw a7, 0(a4)
    or a7,a7,a0
    li a4, 64
    div a4,a3,a4
    li a0, 4
    mul a4,a4,a0
    addi a4,a4,    4
    add a4,s8,a4
    li a0, 64
    rem a0,a3,a0
    li a3, 4
    div a0,a0,a3
    lw a4, 0(a4)
    li a3, 4
    mul a3,a0,a3
    addi a3,a3,    4
    add a3,a4,a3
    sw a7,0(a3)
    slli a3,s11,    3
    li a7, 1
    sub a4,ra,a7
    li a7, 4
    mul a7,a4,a7
    addi a7,a7,    4
    add a7,s8,a7
    lw a7, 0(a7)
    addi a7,a7,    64
    sw a3,0(a7)
    srai a7,s11,    29
    andi a3,a7,    7
    li a7, 1
    sub a4,ra,a7
    li a7, 4
    mul a7,a4,a7
    addi a7,a7,    4
    add a7,s8,a7
    lw a7, 0(a7)
    addi a7,a7,    60
    sw a3,0(a7)
    li a2, -271733879
    li t5, -1732584194
    mv	t3,zero 
    li t2, -1009589776
    li a0, 1732584193
    li t0, 271733878
    j	_forcondBB5
_forcondBB5:
    blt	t3,ra,	_forbodyBB5
    j	_afterForBB5
_forbodyBB5:
    li a7, 16
    j	_forcondBB6
_forcondBB6:
    li a3, 80
    blt	a7,a3,	_forbodyBB6
    j	_afterForBB6
_forbodyBB6:
    li a3, 4
    mul a3,t3,a3
    addi a3,a3,    4
    add a3,s8,a3
    li a4, 3
    sub a5,a7,a4
    lw a4, 0(a3)
    li a3, 4
    mul a3,a5,a3
    addi a3,a3,    4
    add a5,a4,a3
    li a3, 4
    mul a3,t3,a3
    addi a3,a3,    4
    add a3,s8,a3
    li a4, 8
    sub t6,a7,a4
    lw a4, 0(a3)
    li a3, 4
    mul a3,t6,a3
    addi a3,a3,    4
    add a3,a4,a3
    lw a4, 0(a5)
    lw a3, 0(a3)
    xor t6,a4,a3
    li a3, 4
    mul a3,t3,a3
    addi a3,a3,    4
    add a4,s8,a3
    li a3, 14
    sub a5,a7,a3
    lw a4, 0(a4)
    li a3, 4
    mul a3,a5,a3
    addi a3,a3,    4
    add a3,a4,a3
    lw a3, 0(a3)
    xor t6,t6,a3
    li a3, 4
    mul a3,t3,a3
    addi a3,a3,    4
    add a4,s8,a3
    li a3, 16
    sub a5,a7,a3
    lw a3, 0(a4)
    li a4, 4
    mul a4,a5,a4
    addi a4,a4,    4
    add a3,a3,a4
    lw a3, 0(a3)
    xor a3,t6,a3
    li a4, 2147483647
    and a4,a3,a4
    slli a4,a4,    1
    srai a3,a3,    31
    andi a3,a3,    1
    or a3,a4,a3
    li a4, 4
    mul a4,t3,a4
    addi a4,a4,    4
    add a4,s8,a4
    lw a5, 0(a4)
    li a4, 4
    mul a4,a7,a4
    addi a4,a4,    4
    add a4,a5,a4
    sw a3,0(a4)
    addi a7,a7,    1
    j	_forcondBB6
_afterForBB6:
    mv	a3,t5 
    mv	t6,t0 
    mv	a1,t2 
    mv	a4,a0 
    mv	a5,a2 
    mv	a7,a4 
    mv	a7,a1 
    mv	a7,a5 
    mv	a7,t6 
    mv	a7,a3 
    mv	t4,zero 
    j	_forcondBB7
_forcondBB7:
    li a7, 80
    blt	t4,a7,	_forbodyBB7
    j	_afterForBB7
_forbodyBB7:
    li a7, 20
    blt	t4,a7,	_if_thenBB8
    j	_if_elseBB3
_if_elseBB3:
    li a7, 40
    blt	t4,a7,	_if_thenBB9
    j	_if_elseBB4
_if_elseBB4:
    li a7, 60
    blt	t4,a7,	_if_thenBB10
    j	_if_elseBB5
_if_thenBB10:
    and a7,a5,a3
    and a6,a5,t6
    or a7,a7,a6
    and a6,a3,t6
    or t1,a7,a6
    li a7, 48348
    li a6, 36635
    slli a6,a6,    16
    or a6,a7,a6
    mv	a7,a6 
    mv	a7,t1 
    j	_if_end5
_if_end5:
    li s7, 5
    li a7, 1
    beq	s7,a7,	__if_thenBB6
    j	__if_end6
__if_end6:
    li a7, 31
    beq	s7,a7,	__if_thenBB7
    j	__if_end7
__if_thenBB7:
    andi a7,a4,    1
    slli s7,a7,    31
    srai s9,a4,    1
    li a7, 2147483647
    and a7,s9,a7
    or a7,s7,a7
    j	_afterCallBB2
_afterCallBB2:
    li s7, 65535
    and s9,a7,s7
    li s7, 65535
    and s7,a1,s7
    add s7,s9,s7
    srai s9,a7,    16
    li a7, 65535
    and s9,s9,a7
    srai a7,a1,    16
    li a1, 65535
    and a7,a7,a1
    add a1,s9,a7
    srai a7,s7,    16
    add a7,a1,a7
    li a1, 65535
    and a7,a7,a1
    slli a1,a7,    16
    li a7, 65535
    and a7,s7,a7
    or a1,a1,a7
    li a7, 65535
    and s7,t1,a7
    li a7, 65535
    and a7,a6,a7
    add a7,s7,a7
    srai t1,t1,    16
    li s7, 65535
    and t1,t1,s7
    srai s7,a6,    16
    li a6, 65535
    and a6,s7,a6
    add t1,t1,a6
    srai a6,a7,    16
    add a6,t1,a6
    li t1, 65535
    and a6,a6,t1
    slli t1,a6,    16
    li a6, 65535
    and a7,a7,a6
    or a7,t1,a7
    li a6, 65535
    and a6,a1,a6
    li t1, 65535
    and t1,a7,t1
    add a6,a6,t1
    srai a1,a1,    16
    li t1, 65535
    and t1,a1,t1
    srai a1,a7,    16
    li a7, 65535
    and a7,a1,a7
    add a7,t1,a7
    srai a1,a6,    16
    add a7,a7,a1
    li a1, 65535
    and a7,a7,a1
    slli a1,a7,    16
    li a7, 65535
    and a7,a6,a7
    or a1,a1,a7
    li a7, 4
    mul a7,t3,a7
    addi a7,a7,    4
    add a7,s8,a7
    lw a6, 0(a7)
    li a7, 4
    mul a7,t4,a7
    addi a7,a7,    4
    add a7,a6,a7
    lw a7, 0(a7)
    li a6, 65535
    and t1,a1,a6
    li a6, 65535
    and a6,a7,a6
    add a6,t1,a6
    srai t1,a1,    16
    li a1, 65535
    and a1,t1,a1
    srai a7,a7,    16
    li t1, 65535
    and a7,a7,t1
    add a1,a1,a7
    srai a7,a6,    16
    add a1,a1,a7
    li a7, 65535
    and a7,a1,a7
    slli a1,a7,    16
    li a7, 65535
    and a7,a6,a7
    or a6,a1,a7
    li a1, 30
    li a7, 1
    beq	a1,a7,	__if_thenBB8
    j	__if_end8
__if_end8:
    li a7, 31
    beq	a1,a7,	__if_thenBB9
    j	__if_end9
__if_thenBB9:
    andi a7,a5,    1
    slli a7,a7,    31
    srai a5,a5,    1
    li a1, 2147483647
    and a5,a5,a1
    or a7,a7,a5
    j	_afterCallBB3
_afterCallBB3:
    mv	a5,a4 
    addi t4,t4,    1
    mv	a4,a6 
    mv	a1,t6 
    mv	t6,a3 
    mv	a3,a7 
    mv	a7,a4 
    mv	a7,a1 
    mv	a7,a5 
    mv	a7,t6 
    mv	a7,a3 
    mv	a7,t4 
    j	_forcondBB7
__if_end9:
    li a7, 32
    sub t1,a7,a1
    li a7, 1
    sll a7,a7,t1
    li t1, 1
    sub a7,a7,t1
    and a7,a5,a7
    sll t1,a7,a1
    li a7, 32
    sub a7,a7,a1
    sra a5,a5,a7
    li a7, 1
    sll a7,a7,a1
    li a1, 1
    sub a7,a7,a1
    and a7,a5,a7
    or a7,t1,a7
    j	_afterCallBB3
__if_thenBB8:
    li a7, 2147483647
    and a7,a5,a7
    slli a1,a7,    1
    srai a7,a5,    31
    andi a7,a7,    1
    or a7,a1,a7
    j	_afterCallBB3
__if_end7:
    li a7, 32
    sub a7,a7,s7
    li s9, 1
    sll a7,s9,a7
    li s9, 1
    sub a7,a7,s9
    and a7,a4,a7
    sll s9,a7,s7
    li a7, 32
    sub a7,a7,s7
    sra s4,a4,a7
    li a7, 1
    sll s7,a7,s7
    li a7, 1
    sub a7,s7,a7
    and a7,s4,a7
    or a7,s9,a7
    j	_afterCallBB2
__if_thenBB6:
    li a7, 2147483647
    and a7,a4,a7
    slli a7,a7,    1
    srai s7,a4,    31
    andi s7,s7,    1
    or a7,a7,s7
    j	_afterCallBB2
_if_elseBB5:
    xor a7,a5,a3
    xor t1,a7,t6
    li a7, 49622
    li a6, 51810
    slli a6,a6,    16
    or a6,a7,a6
    mv	a7,a6 
    mv	a7,t1 
    j	_if_end5
_if_thenBB9:
    xor a7,a5,a3
    xor t1,a7,t6
    li a6, 1859775393
    mv	a7,a6 
    mv	a7,t1 
    j	_if_end5
_if_thenBB8:
    and a6,a5,a3
    xori a7,a5,    -1
    and a7,a7,t6
    or t1,a6,a7
    li a6, 1518500249
    mv	a7,a6 
    mv	a7,t1 
    j	_if_end5
_afterForBB7:
    li a7, 65535
    and a7,a0,a7
    li a6, 65535
    and a6,a4,a6
    add a7,a7,a6
    srai a6,a0,    16
    li a0, 65535
    and a0,a6,a0
    srai a6,a4,    16
    li a4, 65535
    and a4,a6,a4
    add a4,a0,a4
    srai a0,a7,    16
    add a4,a4,a0
    li a0, 65535
    and a4,a4,a0
    slli a4,a4,    16
    li a0, 65535
    and a7,a7,a0
    or a0,a4,a7
    li a7, 65535
    and a4,a2,a7
    li a7, 65535
    and a7,a5,a7
    add a4,a4,a7
    srai a2,a2,    16
    li a7, 65535
    and a2,a2,a7
    srai a7,a5,    16
    li a5, 65535
    and a7,a7,a5
    add a7,a2,a7
    srai a5,a4,    16
    add a7,a7,a5
    li a5, 65535
    and a7,a7,a5
    slli a5,a7,    16
    li a7, 65535
    and a7,a4,a7
    or a2,a5,a7
    li a7, 65535
    and a4,t5,a7
    li a7, 65535
    and a7,a3,a7
    add a4,a4,a7
    srai a7,t5,    16
    li t5, 65535
    and t5,a7,t5
    srai a3,a3,    16
    li a7, 65535
    and a7,a3,a7
    add a3,t5,a7
    srai a7,a4,    16
    add a3,a3,a7
    li a7, 65535
    and a7,a3,a7
    slli a7,a7,    16
    li a3, 65535
    and a3,a4,a3
    or t5,a7,a3
    li a7, 65535
    and a3,t0,a7
    li a7, 65535
    and a7,t6,a7
    add a3,a3,a7
    srai a4,t0,    16
    li a7, 65535
    and a4,a4,a7
    srai a5,t6,    16
    li a7, 65535
    and a7,a5,a7
    add a4,a4,a7
    srai a7,a3,    16
    add a4,a4,a7
    li a7, 65535
    and a7,a4,a7
    slli a4,a7,    16
    li a7, 65535
    and a7,a3,a7
    or t0,a4,a7
    li a7, 65535
    and a7,t2,a7
    li a3, 65535
    and a3,a1,a3
    add a3,a7,a3
    srai a7,t2,    16
    li a4, 65535
    and a7,a7,a4
    srai a5,a1,    16
    li a4, 65535
    and a4,a5,a4
    add a4,a7,a4
    srai a7,a3,    16
    add a7,a4,a7
    li a4, 65535
    and a7,a7,a4
    slli a7,a7,    16
    li a4, 65535
    and a3,a3,a4
    or t2,a7,a3
    addi t3,t3,    1
    mv	a7,a2 
    mv	a7,t5 
    mv	a7,t3 
    mv	a7,t2 
    mv	a7,a0 
    mv	a7,t0 
    j	_forcondBB5
_afterForBB5:
    addi a7,s1,    4
    sw a0,0(a7)
    addi a7,s1,    8
    sw a2,0(a7)
    addi a7,s1,    12
    sw t5,0(a7)
    addi a7,s1,    16
    sw t0,0(a7)
    addi a7,s1,    20
    sw t2,0(a7)
    mv	s7,s1 
    j	afterCallBB2
_forbodyBB3:
    mv	a4,zero 
    j	_forcondBB8
_forcondBB8:
    li a0, 80
    blt	a4,a0,	_forbodyBB8
    j	_forupdateBB2
_forupdateBB2:
    addi a3,a3,    1
    j	_forcondBB3
_forbodyBB8:
    li a0, 4
    mul a0,a3,a0
    addi a0,a0,    4
    add a0,s8,a0
    lw t5, 0(a0)
    li a0, 4
    mul a0,a4,a0
    addi a0,a0,    4
    add t5,t5,a0
    li a0, 0
    sw a0,0(t5)
    addi a4,a4,    1
    j	_forcondBB8
__forbodyBB2:
    li a7, 8
    div a7,s4,a7
    li a3, 4
    mul a7,a7,a3
    addi a7,a7,    4
    add s7,s2,a7
    addi a2,s4,    4
    mv	a0,s0 
    mv	a1,s4 
    call	_stringSubstring
    mv	s11,a0 
    mv	s5,zero 
    mv	s9,zero 
    j	_forcondBB9
_forcondBB9:
    mv	a0,s11 
    call	stringLength
    blt	s9,a0,	_forbodyBB9
    j	_afterForBB8
_forbodyBB9:
    mv	a0,s11 
    mv	a1,s9 
    call	_stringOrd
    li a7, 48
    bge	a0,a7,	_ifTrue2
    j	_if_elseBB6
_if_elseBB6:
    li a7, 65
    bge	a0,a7,	_ifTrue3
    j	_if_elseBB7
_ifTrue3:
    li a7, 70
    ble	a0,a7,	_if_thenBB11
    j	_if_elseBB7
_if_thenBB11:
    li a7, 16
    mul a7,s5,a7
    add a7,a7,a0
    li a3, 65
    sub a7,a7,a3
    addi a3,a7,    10
    j	_forupdateBB3
_forupdateBB3:
    addi a7,s9,    1
    mv	s5,a3 
    mv	s9,a7 
    mv	a7,s5 
    mv	a7,s9 
    j	_forcondBB9
_if_elseBB7:
    li a7, 97
    bge	a0,a7,	_ifTrue4
    j	_if_elseBB8
_ifTrue4:
    li a7, 102
    ble	a0,a7,	_if_thenBB12
    j	_if_elseBB8
_if_thenBB12:
    li a7, 16
    mul a7,s5,a7
    add a3,a7,a0
    li a7, 97
    sub a7,a3,a7
    addi a3,a7,    10
    j	_forupdateBB3
_if_elseBB8:
    mv	a7,zero 
    j	afterCallBB6
afterCallBB6:
    li a3, 4
    div a4,s4,a3
    li a3, 2
    rem a3,a4,a3
    li a4, 1
    sub a3,a4,a3
    li a4, 16
    mul a3,a3,a4
    sll a7,a7,a3
    lw a3, 0(s7)
    or a3,a3,a7
    li a7, 8
    div a4,s4,a7
    li a7, 4
    mul a7,a4,a7
    addi a7,a7,    4
    add a7,s2,a7
    sw a3,0(a7)
    addi a7,s4,    4
    mv	s4,a7 
    mv	a7,s4 
    j	__forcondBB2
_ifTrue2:
    li a7, 57
    ble	a0,a7,	_if_thenBB13
    j	_if_elseBB6
_if_thenBB13:
    li a7, 16
    mul a7,s5,a7
    add a3,a7,a0
    li a7, 48
    sub a3,a3,a7
    j	_forupdateBB3
_afterForBB8:
    mv	a7,s5 
    j	afterCallBB6
__forbodyBB1:
    li a3, 4
    mul a3,a7,a3
    addi a3,a3,    4
    add a3,s2,a3
    li a4, 0
    sw a4,0(a3)
    addi a7,a7,    1
    j	__forcondBB1
_if_thenBB1:
    call	getString
    mv	s11,a0 
    mv	s2,zero 
    j	__forcondBB6
__forcondBB6:
    mv	a0,s11 
    call	stringLength
    blt	s2,a0,	__forbodyBB6
    j	__afterForBB5
__forbodyBB6:
    mv	a0,s11 
    mv	a1,s2 
    call	_stringOrd
    li a7, 4
    mul a7,s2,a7
    addi a7,a7,    4
    add a7,s3,a7
    sw a0,0(a7)
    addi s2,s2,    1
    j	__forcondBB6
__afterForBB5:
    mv	a0,s11 
    call	stringLength
    mv	a7,s3 
    addi a3,a0,    64
    li a4, 56
    sub a4,a3,a4
    li a3, 64
    div a3,a4,a3
    addi a5,a3,    1
    li a3, 100
    bgt	a5,a3,	_if_thenBB14
    j	_if_end6
_if_end6:
    mv	a4,zero 
    j	_forcondBB10
_forcondBB10:
    blt	a4,a5,	_forbodyBB10
    j	_afterForBB9
_afterForBB9:
    mv	a3,zero 
    j	_forcondBB11
_forcondBB11:
    blt	a3,a0,	_forbodyBB11
    j	_afterForBB10
_afterForBB10:
    li a7, 64
    div a4,a3,a7
    li a7, 4
    mul a7,a4,a7
    addi a7,a7,    4
    add t5,s8,a7
    li a7, 64
    rem a7,a3,a7
    li a4, 4
    div a7,a7,a4
    lw t5, 0(t5)
    li a4, 4
    mul a7,a7,a4
    addi a7,a7,    4
    add t5,t5,a7
    li a7, 4
    rem a4,a3,a7
    li a7, 3
    sub a7,a7,a4
    li a4, 8
    mul a4,a7,a4
    li a7, 128
    sll a7,a7,a4
    lw a4, 0(t5)
    or t6,a4,a7
    li a7, 64
    div a7,a3,a7
    li a4, 4
    mul a7,a7,a4
    addi a7,a7,    4
    add a4,s8,a7
    li a7, 64
    rem a7,a3,a7
    li a3, 4
    div t5,a7,a3
    lw a7, 0(a4)
    li a3, 4
    mul a3,t5,a3
    addi a3,a3,    4
    add a7,a7,a3
    sw t6,0(a7)
    slli a3,a0,    3
    li a7, 1
    sub a7,a5,a7
    li a4, 4
    mul a7,a7,a4
    addi a7,a7,    4
    add a7,s8,a7
    lw a7, 0(a7)
    addi a7,a7,    64
    sw a3,0(a7)
    srai a7,a0,    29
    andi a3,a7,    7
    li a7, 1
    sub a4,a5,a7
    li a7, 4
    mul a7,a4,a7
    addi a7,a7,    4
    add a7,s8,a7
    lw a7, 0(a7)
    addi a7,a7,    60
    sw a3,0(a7)
    li a0, -1732584194
    li a3, -271733879
    mv	t5,zero 
    li t0, 271733878
    li t6, -1009589776
    li ra, 1732584193
    j	_forcondBB12
_forcondBB12:
    blt	t5,a5,	_forbodyBB12
    j	_afterForBB11
_forbodyBB12:
    li a4, 16
    j	_forcondBB13
_forcondBB13:
    li a7, 80
    blt	a4,a7,	_forbodyBB13
    j	_afterForBB12
_forbodyBB13:
    li a7, 4
    mul a7,t5,a7
    addi a7,a7,    4
    add t3,s8,a7
    li a7, 3
    sub a2,a4,a7
    lw t3, 0(t3)
    li a7, 4
    mul a7,a2,a7
    addi a7,a7,    4
    add t3,t3,a7
    li a7, 4
    mul a7,t5,a7
    addi a7,a7,    4
    add a7,s8,a7
    li a2, 8
    sub a2,a4,a2
    lw a7, 0(a7)
    li t2, 4
    mul a2,a2,t2
    addi a2,a2,    4
    add a7,a7,a2
    lw t3, 0(t3)
    lw a7, 0(a7)
    xor a2,t3,a7
    li a7, 4
    mul a7,t5,a7
    addi a7,a7,    4
    add t3,s8,a7
    li a7, 14
    sub t2,a4,a7
    lw t3, 0(t3)
    li a7, 4
    mul a7,t2,a7
    addi a7,a7,    4
    add a7,t3,a7
    lw a7, 0(a7)
    xor t2,a2,a7
    li a7, 4
    mul a7,t5,a7
    addi a7,a7,    4
    add t3,s8,a7
    li a7, 16
    sub a2,a4,a7
    lw a7, 0(t3)
    li t3, 4
    mul t3,a2,t3
    addi t3,t3,    4
    add a7,a7,t3
    lw a7, 0(a7)
    xor a7,t2,a7
    li a2, 1
    li t3, 1
    beq	a2,t3,	__if_thenBB10
    j	__if_end10
__if_thenBB10:
    li t3, 2147483647
    and t3,a7,t3
    slli t3,t3,    1
    srai a7,a7,    31
    andi a7,a7,    1
    or a7,t3,a7
    j	_afterCallBB4
_afterCallBB4:
    li t3, 4
    mul t3,t5,t3
    addi t3,t3,    4
    add t3,s8,t3
    lw a2, 0(t3)
    li t3, 4
    mul t3,a4,t3
    addi t3,t3,    4
    add t3,a2,t3
    sw a7,0(t3)
    addi a4,a4,    1
    j	_forcondBB13
__if_end10:
    li t3, 31
    beq	a2,t3,	__if_thenBB11
    j	__if_end11
__if_thenBB11:
    andi t3,a7,    1
    slli t3,t3,    31
    srai a7,a7,    1
    li a2, 2147483647
    and a7,a7,a2
    or a7,t3,a7
    j	_afterCallBB4
__if_end11:
    li t3, 32
    sub t2,t3,a2
    li t3, 1
    sll t3,t3,t2
    li t2, 1
    sub t3,t3,t2
    and t3,a7,t3
    sll t2,t3,a2
    li t3, 32
    sub t3,t3,a2
    sra t3,a7,t3
    li a7, 1
    sll a2,a7,a2
    li a7, 1
    sub a7,a2,a7
    and a7,t3,a7
    or a7,t2,a7
    j	_afterCallBB4
_afterForBB12:
    mv	t2,a3 
    mv	a2,a0 
    mv	t4,zero 
    mv	t3,t0 
    mv	a6,t6 
    mv	a1,ra 
    mv	a7,t2 
    mv	a7,t4 
    mv	a7,t3 
    mv	a7,a2 
    mv	a7,a6 
    mv	a7,a1 
    j	_forcondBB14
_forcondBB14:
    li a7, 80
    blt	t4,a7,	_forbodyBB14
    j	_afterForBB13
_forbodyBB14:
    li a7, 20
    blt	t4,a7,	_if_thenBB15
    j	_if_elseBB9
_if_elseBB9:
    li a7, 40
    blt	t4,a7,	_if_thenBB16
    j	_if_elseBB10
_if_thenBB16:
    xor a7,t2,a2
    xor t1,a7,t3
    li a7, 1859775393
    mv	a4,t1 
    mv	a4,a7 
    j	_if_end7
_if_end7:
    li s11, 5
    li a4, 1
    beq	s11,a4,	__if_thenBB12
    j	__if_end12
__if_end12:
    li a4, 31
    beq	s11,a4,	__if_thenBB13
    j	__if_end13
__if_thenBB13:
    andi a4,a1,    1
    slli s2,a4,    31
    srai a4,a1,    1
    li s11, 2147483647
    and a4,a4,s11
    or a4,s2,a4
    j	_afterCallBB5
_afterCallBB5:
    li s2, 65535
    and s2,a4,s2
    li s11, 65535
    and s11,a6,s11
    add s2,s2,s11
    srai a4,a4,    16
    li s11, 65535
    and a4,a4,s11
    srai a6,a6,    16
    li s11, 65535
    and a6,a6,s11
    add a4,a4,a6
    srai a6,s2,    16
    add a6,a4,a6
    li a4, 65535
    and a4,a6,a4
    slli a4,a4,    16
    li a6, 65535
    and a6,s2,a6
    or a4,a4,a6
    li a6, 65535
    and a6,t1,a6
    li s2, 65535
    and s2,a7,s2
    add a6,a6,s2
    srai t1,t1,    16
    li s2, 65535
    and t1,t1,s2
    srai s2,a7,    16
    li a7, 65535
    and a7,s2,a7
    add t1,t1,a7
    srai a7,a6,    16
    add a7,t1,a7
    li t1, 65535
    and a7,a7,t1
    slli t1,a7,    16
    li a7, 65535
    and a7,a6,a7
    or a7,t1,a7
    li a6, 65535
    and t1,a4,a6
    li a6, 65535
    and a6,a7,a6
    add a6,t1,a6
    srai t1,a4,    16
    li a4, 65535
    and a4,t1,a4
    srai t1,a7,    16
    li a7, 65535
    and a7,t1,a7
    add a4,a4,a7
    srai a7,a6,    16
    add a4,a4,a7
    li a7, 65535
    and a7,a4,a7
    slli a4,a7,    16
    li a7, 65535
    and a7,a6,a7
    or a7,a4,a7
    li a4, 4
    mul a4,t5,a4
    addi a4,a4,    4
    add a4,s8,a4
    lw a6, 0(a4)
    li a4, 4
    mul a4,t4,a4
    addi a4,a4,    4
    add a4,a6,a4
    lw a4, 0(a4)
    li a6, 65535
    and t1,a7,a6
    li a6, 65535
    and a6,a4,a6
    add a6,t1,a6
    srai t1,a7,    16
    li a7, 65535
    and t1,t1,a7
    srai a4,a4,    16
    li a7, 65535
    and a7,a4,a7
    add a7,t1,a7
    srai a4,a6,    16
    add a4,a7,a4
    li a7, 65535
    and a7,a4,a7
    slli a4,a7,    16
    li a7, 65535
    and a7,a6,a7
    or a7,a4,a7
    mv	a6,t3 
    li s2, 30
    li a4, 1
    beq	s2,a4,	__if_thenBB14
    j	__if_end14
__if_thenBB14:
    li a4, 2147483647
    and a4,t2,a4
    slli a4,a4,    1
    srai t3,t2,    31
    andi t3,t3,    1
    or a4,a4,t3
    j	_afterCallBB6
_afterCallBB6:
    mv	t2,a1 
    mv	a1,a7 
    addi t4,t4,    1
    mv	t3,a2 
    mv	a2,a4 
    mv	a7,t2 
    mv	a7,t4 
    mv	a7,t3 
    mv	a7,a2 
    mv	a7,a6 
    mv	a7,a1 
    j	_forcondBB14
__if_end14:
    li a4, 31
    beq	s2,a4,	__if_thenBB15
    j	__if_end15
__if_end15:
    li a4, 32
    sub t3,a4,s2
    li a4, 1
    sll t3,a4,t3
    li a4, 1
    sub a4,t3,a4
    and a4,t2,a4
    sll t1,a4,s2
    li a4, 32
    sub a4,a4,s2
    sra a4,t2,a4
    li t3, 1
    sll t2,t3,s2
    li t3, 1
    sub t3,t2,t3
    and a4,a4,t3
    or a4,t1,a4
    j	_afterCallBB6
__if_thenBB15:
    andi a4,t2,    1
    slli t3,a4,    31
    srai a4,t2,    1
    li t2, 2147483647
    and a4,a4,t2
    or a4,t3,a4
    j	_afterCallBB6
__if_end13:
    li a4, 32
    sub s2,a4,s11
    li a4, 1
    sll s2,a4,s2
    li a4, 1
    sub a4,s2,a4
    and a4,a1,a4
    sll s7,a4,s11
    li a4, 32
    sub a4,a4,s11
    sra a4,a1,a4
    li s2, 1
    sll s11,s2,s11
    li s2, 1
    sub s2,s11,s2
    and a4,a4,s2
    or a4,s7,a4
    j	_afterCallBB5
__if_thenBB12:
    li a4, 2147483647
    and a4,a1,a4
    slli s2,a4,    1
    srai a4,a1,    31
    andi a4,a4,    1
    or a4,s2,a4
    j	_afterCallBB5
_if_elseBB10:
    li a7, 60
    blt	t4,a7,	_if_thenBB17
    j	_if_elseBB11
_if_thenBB17:
    and a7,t2,a2
    and a4,t2,t3
    or a4,a7,a4
    and a7,a2,t3
    or t1,a4,a7
    li a4, 48348
    li a7, 36635
    slli a7,a7,    16
    or a7,a4,a7
    mv	a4,t1 
    mv	a4,a7 
    j	_if_end7
_if_elseBB11:
    xor a7,t2,a2
    xor t1,a7,t3
    li a4, 49622
    li a7, 51810
    slli a7,a7,    16
    or a7,a4,a7
    mv	a4,t1 
    mv	a4,a7 
    j	_if_end7
_if_thenBB15:
    and a4,t2,a2
    xori a7,t2,    -1
    and a7,a7,t3
    or t1,a4,a7
    li a7, 1518500249
    mv	a4,t1 
    mv	a4,a7 
    j	_if_end7
_afterForBB13:
    li a7, 65535
    and a4,ra,a7
    li a7, 65535
    and a7,a1,a7
    add a4,a4,a7
    srai ra,ra,    16
    li a7, 65535
    and t4,ra,a7
    srai a7,a1,    16
    li ra, 65535
    and a7,a7,ra
    add a7,t4,a7
    srai ra,a4,    16
    add ra,a7,ra
    li a7, 65535
    and a7,ra,a7
    slli ra,a7,    16
    li a7, 65535
    and a7,a4,a7
    or ra,ra,a7
    li a7, 65535
    and a7,a3,a7
    li a4, 65535
    and a4,t2,a4
    add a7,a7,a4
    srai a3,a3,    16
    li a4, 65535
    and t4,a3,a4
    srai a4,t2,    16
    li a3, 65535
    and a3,a4,a3
    add a3,t4,a3
    srai a4,a7,    16
    add a3,a3,a4
    li a4, 65535
    and a3,a3,a4
    slli a3,a3,    16
    li a4, 65535
    and a7,a7,a4
    or a3,a3,a7
    li a7, 65535
    and a4,a0,a7
    li a7, 65535
    and a7,a2,a7
    add a4,a4,a7
    srai a7,a0,    16
    li a0, 65535
    and a0,a7,a0
    srai a7,a2,    16
    li a2, 65535
    and a7,a7,a2
    add a0,a0,a7
    srai a7,a4,    16
    add a0,a0,a7
    li a7, 65535
    and a7,a0,a7
    slli a0,a7,    16
    li a7, 65535
    and a7,a4,a7
    or a0,a0,a7
    li a7, 65535
    and a7,t0,a7
    li a4, 65535
    and a4,t3,a4
    add a4,a7,a4
    srai a7,t0,    16
    li t0, 65535
    and a7,a7,t0
    srai t3,t3,    16
    li t0, 65535
    and t3,t3,t0
    add t3,a7,t3
    srai a7,a4,    16
    add a7,t3,a7
    li t3, 65535
    and a7,a7,t3
    slli a7,a7,    16
    li t3, 65535
    and a4,a4,t3
    or t0,a7,a4
    li a7, 65535
    and a4,t6,a7
    li a7, 65535
    and a7,a6,a7
    add a4,a4,a7
    srai a7,t6,    16
    li t6, 65535
    and t3,a7,t6
    srai a7,a6,    16
    li t6, 65535
    and a7,a7,t6
    add t6,t3,a7
    srai a7,a4,    16
    add t6,t6,a7
    li a7, 65535
    and a7,t6,a7
    slli a7,a7,    16
    li t6, 65535
    and a4,a4,t6
    or t6,a7,a4
    addi t5,t5,    1
    mv	a7,a0 
    mv	a7,a3 
    mv	a7,t5 
    mv	a7,t0 
    mv	a7,t6 
    mv	a7,ra 
    j	_forcondBB12
_afterForBB11:
    addi a7,s1,    4
    sw ra,0(a7)
    addi a7,s1,    8
    sw a3,0(a7)
    addi a7,s1,    12
    sw a0,0(a7)
    addi a7,s1,    16
    sw t0,0(a7)
    addi a7,s1,    20
    sw t6,0(a7)
    mv	s4,s1 
    j	afterCallBB7
afterCallBB7:
    mv	s9,zero 
    j	__forcondBB7
__forcondBB7:
    mv	a0,s4 
    call	_arraySize
    blt	s9,a0,	__forbodyBB7
    j	_afterCallBB7
_afterCallBB7:
    la a0,_globalStr0    
    call	println
    j	_whileBodyBB1
__forbodyBB7:
    li a7, 4
    mul a7,s9,a7
    addi a7,a7,    4
    add a7,s4,a7
    lw s11, 0(a7)
    la s2,_globalStr0    
    li s7, 28
    j	_forcondBB15
_forcondBB15:
    bge	s7,zero,	_forbodyBB15
    j	afterCallBB8
afterCallBB8:
    mv	a0,s2 
    call	print
    addi s9,s9,    1
    j	__forcondBB7
_forbodyBB15:
    sra a7,s11,s7
    andi a7,a7,    15
    li a3, 10
    blt	a7,a3,	_if_thenBB18
    j	_if_elseBB12
_if_elseBB12:
    addi a7,a7,    65
    li a3, 10
    sub a7,a7,a3
    li a3, 32
    bge	a7,a3,	__ifTrue1
    j	__if_end16
__if_end16:
    la a0,_globalStr0    
    j	_afterCallBB8
_afterCallBB8:
    mv	a1,a0 
    mv	a0,s2 
    call	_stringAdd
    j	_forupdateBB4
_forupdateBB4:
    li a7, 4
    sub s7,s7,a7
    mv	s2,a0 
    mv	a7,s2 
    mv	a7,s7 
    j	_forcondBB15
__ifTrue1:
    li a3, 126
    ble	a7,a3,	__if_thenBB16
    j	__if_end16
__if_thenBB16:
    li a3, 32
    sub a1,a7,a3
    li a3, 31
    sub a2,a7,a3
    la a0,_globalStr2    
    call	_stringSubstring
    j	_afterCallBB8
_if_thenBB18:
    addi a7,a7,    48
    li a3, 32
    bge	a7,a3,	__ifTrue2
    j	__if_end17
__if_end17:
    la a1,_globalStr0    
    j	_afterCallBB9
_afterCallBB9:
    mv	a0,s2 
    call	_stringAdd
    j	_forupdateBB4
__ifTrue2:
    li a3, 126
    ble	a7,a3,	__if_thenBB17
    j	__if_end17
__if_thenBB17:
    li a3, 32
    sub a1,a7,a3
    li a3, 31
    sub a2,a7,a3
    la a0,_globalStr2    
    call	_stringSubstring
    mv	a1,a0 
    j	_afterCallBB9
_forbodyBB11:
    li a4, 64
    div t5,a3,a4
    li a4, 4
    mul a4,t5,a4
    addi a4,a4,    4
    add a4,s8,a4
    li t5, 64
    rem t5,a3,t5
    li t6, 4
    div t5,t5,t6
    lw t6, 0(a4)
    li a4, 4
    mul a4,t5,a4
    addi a4,a4,    4
    add t6,t6,a4
    li a4, 4
    mul a4,a3,a4
    addi a4,a4,    4
    add ra,a7,a4
    li a4, 4
    rem a4,a3,a4
    li t5, 3
    sub a4,t5,a4
    li t5, 8
    mul a4,a4,t5
    lw t5, 0(ra)
    sll t5,t5,a4
    lw a4, 0(t6)
    or t5,a4,t5
    li a4, 64
    div t6,a3,a4
    li a4, 4
    mul a4,t6,a4
    addi a4,a4,    4
    add ra,s8,a4
    li a4, 64
    rem a4,a3,a4
    li t6, 4
    div a4,a4,t6
    lw ra, 0(ra)
    li t6, 4
    mul a4,a4,t6
    addi a4,a4,    4
    add a4,ra,a4
    sw t5,0(a4)
    addi a3,a3,    1
    j	_forcondBB11
_forbodyBB10:
    mv	a3,zero 
    j	_forcondBB16
_forcondBB16:
    li t5, 80
    blt	a3,t5,	_forbodyBB16
    j	_forupdateBB5
_forbodyBB16:
    li t5, 4
    mul t5,a4,t5
    addi t5,t5,    4
    add t5,s8,t5
    lw t5, 0(t5)
    li t6, 4
    mul t6,a3,t6
    addi t6,t6,    4
    add t6,t5,t6
    li t5, 0
    sw t5,0(t6)
    addi a3,a3,    1
    j	_forcondBB16
_forupdateBB5:
    addi a4,a4,    1
    j	_forcondBB10
_if_thenBB14:
    la a0,_globalStr4    
    call	println
    mv	s4,zero 
    j	afterCallBB7
afterCallBB1:
    mv	s11,s6 
    lw s0, 24(sp) 
    lw s1, 16(sp) 
    lw s2, 0(sp) 
    lw s3, 8(sp) 
    lw s4, 28(sp) 
    lw s5, 12(sp) 
    lw s6, 20(sp) 
    lw s7, 40(sp) 
    lw s8, 4(sp) 
    lw s9, 32(sp) 
    lw ra, 36(sp) 
    mv	a0,zero 
    addi sp,sp,    48
    ret
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	outputBuffer					#@outputBuffer
    .p2align	2
outputBuffer:
    .word	0
     
    .globl	asciiTable					#@asciiTable
    .p2align	2
asciiTable:
    .word	0
     
    .globl	inputBuffer					#@inputBuffer
    .p2align	2
inputBuffer:
    .word	0
     
    .globl	MAXCHUNK					#@MAXCHUNK
    .p2align	2
MAXCHUNK:
    .word	0
     
    .globl	chunks					#@chunks
    .p2align	2
chunks:
    .word	0
     
    .globl	MAXLENGTH					#@MAXLENGTH
    .p2align	2
MAXLENGTH:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  ""    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  "Invalid input"    
    .globl	_globalStr2					#@_globalStr2
_globalStr2:
    .asciz  " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"    
    .globl	_globalStr3					#@_globalStr3
_globalStr3:
    .asciz  "Not Found!"    
    .globl	_globalStr4					#@_globalStr4
_globalStr4:
    .asciz  "nChunk > MAXCHUNK!"    
