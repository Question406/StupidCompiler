    .text
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -48
    sw ra, 4(sp) 
    sw s0, 20(sp) 
    sw s1, 40(sp) 
    sw s2, 16(sp) 
    sw s3, 36(sp) 
    sw s4, 32(sp) 
    sw s5, 12(sp) 
    sw s6, 24(sp) 
    sw s7, 8(sp) 
    sw s8, 0(sp) 
    sw s9, 28(sp) 
    mv	s2,s10 
    li a0, 404
    call malloc
    mv	s3,a0 
    li t3, 100
    sw t3,0(s3)
    addi s5,s3,    4
    addi s8,s3,    400
    j	forcondBB1
forcondBB1:
    ble	s5,s8,	forupdateBB1
    j	afterForBB1
forupdateBB1:
    li a0, 324
    call malloc
    li t3, 80
    sw t3,0(a0)
    sw a0,0(s5)
    addi s5,s5,    4
    j	forcondBB1
afterForBB1:
    mv	s8,s3 
    li a0, 25284
    call malloc
    li t3, 6320
    sw t3,0(a0)
    mv	s0,a0 
    li a0, 24
    call malloc
    li t3, 5
    sw t3,0(a0)
    mv	s9,a0 
    j	_whileBodyBB1
_whileBodyBB1:
    call	getInt
    beq	a0,zero,	afterCallBB1
    j	_if_end1
afterCallBB1:
    mv	s10,s2 
    lw s9, 28(sp) 
    lw s8, 0(sp) 
    lw s7, 8(sp) 
    lw s6, 24(sp) 
    lw s5, 12(sp) 
    lw s4, 32(sp) 
    lw s3, 36(sp) 
    lw s2, 16(sp) 
    lw s1, 40(sp) 
    lw s0, 20(sp) 
    lw ra, 4(sp) 
    mv	a0,zero 
    addi sp,sp,    48
    ret
_if_end1:
    li t3, 1
    beq	a0,t3,	_if_thenBB1
    j	_if_elseBB1
_if_elseBB1:
    li t3, 2
    beq	a0,t3,	_if_thenBB2
    j	_whileBodyBB1
_if_thenBB2:
    call	getString
    mv	s4,a0 
    li a0, 24
    call malloc
    li t3, 5
    sw t3,0(a0)
    mv	s10,a0 
    mv	a0,s4 
    call	stringLength
    li t3, 40
    bne	a0,t3,	__if_thenBB1
    j	__if_end1
__if_end1:
    mv	t3,zero 
    j	__forcondBB1
__forcondBB1:
    li t5, 5
    blt	t3,t5,	__forbodyBB1
    j	__afterForBB1
__forbodyBB1:
    li t5, 4
    mul t5,t3,t5
    addi t5,t5,    4
    add t5,s10,t5
    li a2, 0
    sw a2,0(t5)
    addi t3,t3,    1
    j	__forcondBB1
__afterForBB1:
    mv	s5,zero 
    j	__forcondBB2
__forcondBB2:
    li t3, 40
    blt	s5,t3,	__forbodyBB2
    j	__afterForBB2
__forbodyBB2:
    li t3, 8
    div t3,s5,t3
    li t5, 4
    mul t3,t3,t5
    addi t3,t3,    4
    add s6,s10,t3
    addi a2,s5,    4
    mv	a0,s4 
    mv	a1,s5 
    call	_stringSubstring
    mv	s3,a0 
    mv	s7,zero 
    mv	s1,zero 
    j	_forcondBB1
_forcondBB1:
    mv	a0,s3 
    call	stringLength
    blt	s7,a0,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	t3,s1 
    j	afterCallBB2
afterCallBB2:
    li t5, 4
    div t5,s5,t5
    li a2, 2
    rem t5,t5,a2
    li a2, 1
    sub a2,a2,t5
    li t5, 16
    mul t5,a2,t5
    sll t3,t3,t5
    lw t5, 0(s6)
    or t5,t5,t3
    li t3, 8
    div t3,s5,t3
    li a2, 4
    mul t3,t3,a2
    addi t3,t3,    4
    add t3,s10,t3
    sw t5,0(t3)
    addi t3,s5,    4
    mv	s5,t3 
    mv	t3,s5 
    j	__forcondBB2
_forbodyBB1:
    mv	a0,s3 
    mv	a1,s7 
    call	_stringOrd
    li t3, 48
    bge	a0,t3,	_ifTrue1
    j	_if_elseBB2
_if_elseBB2:
    li t3, 65
    bge	a0,t3,	_ifTrue2
    j	_if_elseBB3
_ifTrue2:
    li t3, 70
    ble	a0,t3,	_if_thenBB3
    j	_if_elseBB3
_if_elseBB3:
    li t3, 97
    bge	a0,t3,	_ifTrue3
    j	_if_elseBB4
_if_elseBB4:
    mv	t3,zero 
    j	afterCallBB2
_ifTrue3:
    li t3, 102
    ble	a0,t3,	_if_thenBB4
    j	_if_elseBB4
_if_thenBB4:
    li t3, 16
    mul t3,s1,t3
    add t5,t3,a0
    li t3, 97
    sub t3,t5,t3
    addi t5,t3,    10
    j	_forupdateBB1
_forupdateBB1:
    addi t3,s7,    1
    mv	s7,t3 
    mv	s1,t5 
    mv	t3,s7 
    mv	t3,s1 
    j	_forcondBB1
_if_thenBB3:
    li t3, 16
    mul t3,s1,t3
    add t3,t3,a0
    li t5, 65
    sub t3,t3,t5
    addi t5,t3,    10
    j	_forupdateBB1
_ifTrue1:
    li t3, 57
    ble	a0,t3,	_if_thenBB5
    j	_if_elseBB2
_if_thenBB5:
    li t3, 16
    mul t3,s1,t3
    add t3,t3,a0
    li t5, 48
    sub t5,t3,t5
    j	_forupdateBB1
__afterForBB2:
    li s5, 1
    j	__forcondBB3
__forcondBB3:
    li t3, 4
    ble	s5,t3,	__forbodyBB3
    j	__afterForBB3
__forbodyBB3:
    mv	t3,zero 
    j	__forcondBB4
__forcondBB4:
    blt	t3,s5,	__forbodyBB4
    j	__whileBodyBB1
__forbodyBB4:
    li t5, 4
    mul t5,t3,t5
    addi t5,t5,    4
    add a2,s0,t5
    li t5, 48
    sw t5,0(a2)
    addi t3,t3,    1
    j	__forcondBB4
__whileBodyBB1:
    mv	t3,s0 
    addi t5,s5,    64
    li a2, 56
    sub a2,t5,a2
    li t5, 64
    div t5,a2,t5
    addi t0,t5,    1
    li t5, 100
    bgt	t0,t5,	_if_thenBB6
    j	_if_end2
_if_thenBB6:
    la a0,_globalStr4    
    call	println
    mv	s7,zero 
    j	afterCallBB3
afterCallBB3:
    mv	s3,s10 
    mv	a0,s7 
    call	_arraySize
    mv	s4,a0 
    mv	a0,s3 
    call	_arraySize
    bne	s4,a0,	_if_thenBB7
    j	_if_end3
_if_thenBB7:
    mv	t3,zero 
    j	afterCallBB4
afterCallBB4:
    bne	t3, zero, __if_thenBB2
    j	__if_end2
__if_thenBB2:
    mv	s3,zero 
    j	__forcondBB5
__forcondBB5:
    blt	s3,s5,	__forbodyBB5
    j	__afterForBB4
__forbodyBB5:
    li t3, 4
    mul t3,s3,t3
    addi t3,t3,    4
    add t3,s0,t3
    lw t3, 0(t3)
    li t5, 32
    bge	t3,t5,	_ifTrue4
    j	_if_end4
_ifTrue4:
    li t5, 126
    ble	t3,t5,	_if_thenBB8
    j	_if_end4
_if_thenBB8:
    li t5, 32
    sub a1,t3,t5
    li t5, 31
    sub a2,t3,t5
    la a0,_globalStr2    
    call	_stringSubstring
    j	afterCallBB5
afterCallBB5:
    call	print
    addi s3,s3,    1
    j	__forcondBB5
_if_end4:
    la a0,_globalStr0    
    j	afterCallBB5
__afterForBB4:
    la a0,_globalStr0    
    call	println
    j	_whileBodyBB1
__if_end2:
    mv	t3,s0 
    li t5, 1
    sub t5,s5,t5
    j	_forcondBB2
_forcondBB2:
    bge	t5,zero,	_forbodyBB2
    j	_afterForBB2
_afterForBB2:
    mv	t3,zero 
    j	afterCallBB6
afterCallBB6:
    bne	t3, zero, __whileBodyBB1
    j	__forupdateBB1
__forupdateBB1:
    addi s5,s5,    1
    j	__forcondBB3
_forbodyBB2:
    li a2, 4
    mul a2,t5,a2
    addi a2,a2,    4
    add a2,t3,a2
    lw a2, 0(a2)
    li a7, 122
    beq	a2,a7,	__if_thenBB3
    j	__if_end3
__if_thenBB3:
    li a2, -1
    j	_afterCallBB1
_afterCallBB1:
    li a7, 4
    mul a7,t5,a7
    addi a7,a7,    4
    add a7,t3,a7
    sw a2,0(a7)
    li a2, 4
    mul a2,t5,a2
    addi a2,a2,    4
    add a2,t3,a2
    lw a7, 0(a2)
    li a2, -1
    beq	a7,a2,	_if_thenBB9
    j	_if_elseBB5
_if_elseBB5:
    li t3, 1
    j	afterCallBB6
_if_thenBB9:
    li a2, 4
    mul a2,t5,a2
    addi a2,a2,    4
    add a7,t3,a2
    li a2, 48
    sw a2,0(a7)
    li a2, 1
    sub t5,t5,a2
    j	_forcondBB2
__if_end3:
    li a7, 90
    beq	a2,a7,	__if_thenBB4
    j	__if_end4
__if_thenBB4:
    li a2, 97
    j	_afterCallBB1
__if_end4:
    li a7, 57
    beq	a2,a7,	__if_thenBB5
    j	__if_end5
__if_end5:
    addi a2,a2,    1
    j	_afterCallBB1
__if_thenBB5:
    li a2, 65
    j	_afterCallBB1
_if_end3:
    mv	s4,zero 
    j	_forcondBB3
_forcondBB3:
    mv	a0,s7 
    call	_arraySize
    blt	s4,a0,	_forbodyBB3
    j	_afterForBB3
_afterForBB3:
    li t3, 1
    j	afterCallBB4
_forbodyBB3:
    li t3, 4
    mul t3,s4,t3
    addi t3,t3,    4
    add t5,s7,t3
    li t3, 4
    mul t3,s4,t3
    addi t3,t3,    4
    add t3,s3,t3
    lw t5, 0(t5)
    lw t3, 0(t3)
    bne	t5,t3,	_if_thenBB10
    j	_forupdateBB2
_forupdateBB2:
    addi s4,s4,    1
    j	_forcondBB3
_if_thenBB10:
    mv	t3,zero 
    j	afterCallBB4
_if_end2:
    mv	a2,zero 
    j	_forcondBB4
_forcondBB4:
    blt	a2,t0,	_forbodyBB4
    j	_afterForBB4
_afterForBB4:
    mv	t5,zero 
    j	_forcondBB5
_forcondBB5:
    blt	t5,s5,	_forbodyBB5
    j	_afterForBB5
_forbodyBB5:
    li a2, 64
    div a2,t5,a2
    li a7, 4
    mul a2,a2,a7
    addi a2,a2,    4
    add a2,s8,a2
    li a7, 64
    rem a7,t5,a7
    li t2, 4
    div a7,a7,t2
    lw t2, 0(a2)
    li a2, 4
    mul a2,a7,a2
    addi a2,a2,    4
    add t2,t2,a2
    li a2, 4
    mul a2,t5,a2
    addi a2,a2,    4
    add a5,t3,a2
    li a2, 4
    rem a7,t5,a2
    li a2, 3
    sub a7,a2,a7
    li a2, 8
    mul a7,a7,a2
    lw a2, 0(a5)
    sll a2,a2,a7
    lw a7, 0(t2)
    or a2,a7,a2
    li a7, 64
    div t2,t5,a7
    li a7, 4
    mul a7,t2,a7
    addi a7,a7,    4
    add t2,s8,a7
    li a7, 64
    rem a7,t5,a7
    li a5, 4
    div a5,a7,a5
    lw t2, 0(t2)
    li a7, 4
    mul a7,a5,a7
    addi a7,a7,    4
    add a7,t2,a7
    sw a2,0(a7)
    addi t5,t5,    1
    j	_forcondBB5
_afterForBB5:
    li t3, 64
    div a2,t5,t3
    li t3, 4
    mul t3,a2,t3
    addi t3,t3,    4
    add a2,s8,t3
    li t3, 64
    rem t3,t5,t3
    li a7, 4
    div t3,t3,a7
    lw a2, 0(a2)
    li a7, 4
    mul t3,t3,a7
    addi t3,t3,    4
    add a7,a2,t3
    li t3, 4
    rem a2,t5,t3
    li t3, 3
    sub a2,t3,a2
    li t3, 8
    mul t3,a2,t3
    li a2, 128
    sll a2,a2,t3
    lw t3, 0(a7)
    or a7,t3,a2
    li t3, 64
    div t3,t5,t3
    li a2, 4
    mul t3,t3,a2
    addi t3,t3,    4
    add t3,s8,t3
    li a2, 64
    rem a2,t5,a2
    li t5, 4
    div a2,a2,t5
    lw t3, 0(t3)
    li t5, 4
    mul t5,a2,t5
    addi t5,t5,    4
    add t3,t3,t5
    sw a7,0(t3)
    slli t5,s5,    3
    li t3, 1
    sub a2,t0,t3
    li t3, 4
    mul t3,a2,t3
    addi t3,t3,    4
    add t3,s8,t3
    lw t3, 0(t3)
    addi t3,t3,    64
    sw t5,0(t3)
    srai t3,s5,    29
    andi a2,t3,    7
    li t3, 1
    sub t3,t0,t3
    li t5, 4
    mul t3,t3,t5
    addi t3,t3,    4
    add t3,s8,t3
    lw t3, 0(t3)
    addi t3,t3,    60
    sw a2,0(t3)
    li t4, -271733879
    li t1, 1732584193
    mv	ra,zero 
    li a0, -1009589776
    li t3, -1732584194
    li a4, 271733878
    j	_forcondBB6
_forcondBB6:
    blt	ra,t0,	_forbodyBB6
    j	_afterForBB6
_afterForBB6:
    addi t5,s9,    4
    sw t1,0(t5)
    addi t5,s9,    8
    sw t4,0(t5)
    addi t5,s9,    12
    sw t3,0(t5)
    addi t3,s9,    16
    sw a4,0(t3)
    addi t3,s9,    20
    sw a0,0(t3)
    mv	s7,s9 
    j	afterCallBB3
_forbodyBB6:
    li a2, 16
    j	_forcondBB7
_forcondBB7:
    li t5, 80
    blt	a2,t5,	_forbodyBB7
    j	_afterForBB7
_afterForBB7:
    mv	a3,t4 
    mv	a1,t3 
    mv	t2,a0 
    mv	a5,zero 
    mv	a2,t1 
    mv	a7,a4 
    mv	t5,t2 
    mv	t5,a2 
    mv	t5,a1 
    mv	t5,a5 
    mv	t5,a3 
    mv	t5,a7 
    j	_forcondBB8
_forcondBB8:
    li t5, 80
    blt	a5,t5,	_forbodyBB8
    j	_afterForBB8
_forbodyBB8:
    li t5, 20
    blt	a5,t5,	_if_thenBB11
    j	_if_elseBB6
_if_elseBB6:
    li t5, 40
    blt	a5,t5,	_if_thenBB12
    j	_if_elseBB7
_if_thenBB12:
    xor t5,a3,a1
    xor t6,t5,a7
    li a6, 1859775393
    mv	t5,t6 
    mv	t5,a6 
    j	_if_end5
_if_end5:
    li s3, 5
    li t5, 1
    beq	s3,t5,	__if_thenBB6
    j	__if_end6
__if_thenBB6:
    li t5, 2147483647
    and t5,a2,t5
    slli s3,t5,    1
    srai t5,a2,    31
    andi t5,t5,    1
    or t5,s3,t5
    j	_afterCallBB2
_afterCallBB2:
    li s3, 65535
    and s7,t5,s3
    li s3, 65535
    and s3,t2,s3
    add s3,s7,s3
    srai t5,t5,    16
    li s7, 65535
    and s7,t5,s7
    srai t5,t2,    16
    li t2, 65535
    and t5,t5,t2
    add t2,s7,t5
    srai t5,s3,    16
    add t5,t2,t5
    li t2, 65535
    and t5,t5,t2
    slli t2,t5,    16
    li t5, 65535
    and t5,s3,t5
    or t2,t2,t5
    li t5, 65535
    and t5,t6,t5
    li s3, 65535
    and s3,a6,s3
    add s3,t5,s3
    srai t5,t6,    16
    li t6, 65535
    and s7,t5,t6
    srai t6,a6,    16
    li t5, 65535
    and t5,t6,t5
    add t5,s7,t5
    srai t6,s3,    16
    add t6,t5,t6
    li t5, 65535
    and t5,t6,t5
    slli t5,t5,    16
    li t6, 65535
    and t6,s3,t6
    or t5,t5,t6
    li t6, 65535
    and a6,t2,t6
    li t6, 65535
    and t6,t5,t6
    add t6,a6,t6
    srai a6,t2,    16
    li t2, 65535
    and a6,a6,t2
    srai t2,t5,    16
    li t5, 65535
    and t5,t2,t5
    add t5,a6,t5
    srai t2,t6,    16
    add t2,t5,t2
    li t5, 65535
    and t5,t2,t5
    slli t2,t5,    16
    li t5, 65535
    and t5,t6,t5
    or t2,t2,t5
    li t5, 4
    mul t5,ra,t5
    addi t5,t5,    4
    add t5,s8,t5
    lw t5, 0(t5)
    li t6, 4
    mul t6,a5,t6
    addi t6,t6,    4
    add t5,t5,t6
    lw t5, 0(t5)
    li t6, 65535
    and t6,t2,t6
    li a6, 65535
    and a6,t5,a6
    add t6,t6,a6
    srai t2,t2,    16
    li a6, 65535
    and a6,t2,a6
    srai t2,t5,    16
    li t5, 65535
    and t5,t2,t5
    add t2,a6,t5
    srai t5,t6,    16
    add t2,t2,t5
    li t5, 65535
    and t5,t2,t5
    slli t2,t5,    16
    li t5, 65535
    and t5,t6,t5
    or t5,t2,t5
    mv	t2,a7 
    mv	a7,a1 
    li a6, 30
    li a1, 1
    beq	a6,a1,	__if_thenBB7
    j	__if_end7
__if_thenBB7:
    li a1, 2147483647
    and a1,a3,a1
    slli t6,a1,    1
    srai a1,a3,    31
    andi a1,a1,    1
    or a1,t6,a1
    j	_afterCallBB3
_afterCallBB3:
    mv	a3,a2 
    addi a5,a5,    1
    mv	a2,t5 
    mv	t5,t2 
    mv	t5,a2 
    mv	t5,a1 
    mv	t5,a5 
    mv	t5,a3 
    mv	t5,a7 
    j	_forcondBB8
__if_end7:
    li a1, 31
    beq	a6,a1,	__if_thenBB8
    j	__if_end8
__if_thenBB8:
    andi a1,a3,    1
    slli a1,a1,    31
    srai t6,a3,    1
    li a3, 2147483647
    and a3,t6,a3
    or a1,a1,a3
    j	_afterCallBB3
__if_end8:
    li a1, 32
    sub a1,a1,a6
    li t6, 1
    sll a1,t6,a1
    li t6, 1
    sub a1,a1,t6
    and a1,a3,a1
    sll t6,a1,a6
    li a1, 32
    sub a1,a1,a6
    sra a3,a3,a1
    li a1, 1
    sll a6,a1,a6
    li a1, 1
    sub a1,a6,a1
    and a1,a3,a1
    or a1,t6,a1
    j	_afterCallBB3
__if_end6:
    li t5, 31
    beq	s3,t5,	__if_thenBB9
    j	__if_end9
__if_thenBB9:
    andi t5,a2,    1
    slli t5,t5,    31
    srai s7,a2,    1
    li s3, 2147483647
    and s3,s7,s3
    or t5,t5,s3
    j	_afterCallBB2
__if_end9:
    li t5, 32
    sub s7,t5,s3
    li t5, 1
    sll s7,t5,s7
    li t5, 1
    sub t5,s7,t5
    and t5,a2,t5
    sll s4,t5,s3
    li t5, 32
    sub t5,t5,s3
    sra s7,a2,t5
    li t5, 1
    sll t5,t5,s3
    li s3, 1
    sub t5,t5,s3
    and t5,s7,t5
    or t5,s4,t5
    j	_afterCallBB2
_if_elseBB7:
    li t5, 60
    blt	a5,t5,	_if_thenBB13
    j	_if_elseBB8
_if_elseBB8:
    xor t5,a3,a1
    xor t6,t5,a7
    li a6, 49622
    li t5, 51810
    slli t5,t5,    16
    or a6,a6,t5
    mv	t5,t6 
    mv	t5,a6 
    j	_if_end5
_if_thenBB13:
    and t6,a3,a1
    and t5,a3,a7
    or t6,t6,t5
    and t5,a1,a7
    or t6,t6,t5
    li a6, 48348
    li t5, 36635
    slli t5,t5,    16
    or a6,a6,t5
    mv	t5,t6 
    mv	t5,a6 
    j	_if_end5
_if_thenBB11:
    and t6,a3,a1
    xori t5,a3,    -1
    and t5,t5,a7
    or t6,t6,t5
    li a6, 1518500249
    mv	t5,t6 
    mv	t5,a6 
    j	_if_end5
_afterForBB8:
    li t5, 65535
    and a5,t1,t5
    li t5, 65535
    and t5,a2,t5
    add a5,a5,t5
    srai t1,t1,    16
    li t5, 65535
    and t1,t1,t5
    srai t5,a2,    16
    li a2, 65535
    and t5,t5,a2
    add t5,t1,t5
    srai a2,a5,    16
    add a2,t5,a2
    li t5, 65535
    and t5,a2,t5
    slli a2,t5,    16
    li t5, 65535
    and t5,a5,t5
    or t1,a2,t5
    li t5, 65535
    and a2,t4,t5
    li t5, 65535
    and t5,a3,t5
    add a2,a2,t5
    srai t5,t4,    16
    li a5, 65535
    and t4,t5,a5
    srai t5,a3,    16
    li a5, 65535
    and t5,t5,a5
    add a5,t4,t5
    srai t5,a2,    16
    add a5,a5,t5
    li t5, 65535
    and t5,a5,t5
    slli a5,t5,    16
    li t5, 65535
    and t5,a2,t5
    or t4,a5,t5
    li t5, 65535
    and a2,t3,t5
    li t5, 65535
    and t5,a1,t5
    add t5,a2,t5
    srai t3,t3,    16
    li a2, 65535
    and a2,t3,a2
    srai t3,a1,    16
    li a5, 65535
    and t3,t3,a5
    add a2,a2,t3
    srai t3,t5,    16
    add a2,a2,t3
    li t3, 65535
    and t3,a2,t3
    slli a2,t3,    16
    li t3, 65535
    and t3,t5,t3
    or t3,a2,t3
    li t5, 65535
    and a2,a4,t5
    li t5, 65535
    and t5,a7,t5
    add a2,a2,t5
    srai t5,a4,    16
    li a5, 65535
    and a5,t5,a5
    srai t5,a7,    16
    li a7, 65535
    and t5,t5,a7
    add a7,a5,t5
    srai t5,a2,    16
    add a7,a7,t5
    li t5, 65535
    and t5,a7,t5
    slli a7,t5,    16
    li t5, 65535
    and t5,a2,t5
    or a4,a7,t5
    li t5, 65535
    and t5,a0,t5
    li a2, 65535
    and a2,t2,a2
    add t5,t5,a2
    srai a2,a0,    16
    li a7, 65535
    and a7,a2,a7
    srai t2,t2,    16
    li a2, 65535
    and a2,t2,a2
    add a2,a7,a2
    srai a7,t5,    16
    add a2,a2,a7
    li a7, 65535
    and a2,a2,a7
    slli a2,a2,    16
    li a7, 65535
    and t5,t5,a7
    or a0,a2,t5
    addi ra,ra,    1
    mv	t5,t4 
    mv	t5,t1 
    mv	t5,ra 
    mv	t5,a0 
    mv	t5,t3 
    mv	t5,a4 
    j	_forcondBB6
_forbodyBB7:
    li t5, 4
    mul t5,ra,t5
    addi t5,t5,    4
    add a7,s8,t5
    li t5, 3
    sub t5,a2,t5
    lw t2, 0(a7)
    li a7, 4
    mul t5,t5,a7
    addi t5,t5,    4
    add a7,t2,t5
    li t5, 4
    mul t5,ra,t5
    addi t5,t5,    4
    add t5,s8,t5
    li t2, 8
    sub t2,a2,t2
    lw a5, 0(t5)
    li t5, 4
    mul t5,t2,t5
    addi t5,t5,    4
    add t2,a5,t5
    lw t5, 0(a7)
    lw a7, 0(t2)
    xor a7,t5,a7
    li t5, 4
    mul t5,ra,t5
    addi t5,t5,    4
    add t2,s8,t5
    li t5, 14
    sub a5,a2,t5
    lw t2, 0(t2)
    li t5, 4
    mul t5,a5,t5
    addi t5,t5,    4
    add t5,t2,t5
    lw t5, 0(t5)
    xor a7,a7,t5
    li t5, 4
    mul t5,ra,t5
    addi t5,t5,    4
    add t2,s8,t5
    li t5, 16
    sub a5,a2,t5
    lw t2, 0(t2)
    li t5, 4
    mul t5,a5,t5
    addi t5,t5,    4
    add t5,t2,t5
    lw t5, 0(t5)
    xor t5,a7,t5
    li a5, 1
    li a7, 1
    beq	a5,a7,	__if_thenBB10
    j	__if_end10
__if_thenBB10:
    li a7, 2147483647
    and a7,t5,a7
    slli a7,a7,    1
    srai t5,t5,    31
    andi t5,t5,    1
    or t5,a7,t5
    j	_afterCallBB4
_afterCallBB4:
    li a7, 4
    mul a7,ra,a7
    addi a7,a7,    4
    add a7,s8,a7
    lw t2, 0(a7)
    li a7, 4
    mul a7,a2,a7
    addi a7,a7,    4
    add a7,t2,a7
    sw t5,0(a7)
    addi a2,a2,    1
    j	_forcondBB7
__if_end10:
    li a7, 31
    beq	a5,a7,	__if_thenBB11
    j	__if_end11
__if_end11:
    li a7, 32
    sub a7,a7,a5
    li t2, 1
    sll t2,t2,a7
    li a7, 1
    sub a7,t2,a7
    and a7,t5,a7
    sll t2,a7,a5
    li a7, 32
    sub a7,a7,a5
    sra t5,t5,a7
    li a7, 1
    sll a5,a7,a5
    li a7, 1
    sub a7,a5,a7
    and t5,t5,a7
    or t5,t2,t5
    j	_afterCallBB4
__if_thenBB11:
    andi a7,t5,    1
    slli a7,a7,    31
    srai t5,t5,    1
    li t2, 2147483647
    and t5,t5,t2
    or t5,a7,t5
    j	_afterCallBB4
_forbodyBB4:
    mv	t5,zero 
    j	_forcondBB9
_forcondBB9:
    li a7, 80
    blt	t5,a7,	_forbodyBB9
    j	_forupdateBB3
_forbodyBB9:
    li a7, 4
    mul a7,a2,a7
    addi a7,a7,    4
    add a7,s8,a7
    lw t2, 0(a7)
    li a7, 4
    mul a7,t5,a7
    addi a7,a7,    4
    add t2,t2,a7
    li a7, 0
    sw a7,0(t2)
    addi t5,t5,    1
    j	_forcondBB9
_forupdateBB3:
    addi a2,a2,    1
    j	_forcondBB4
__afterForBB3:
    la a0,_globalStr3    
    call	println
    j	_whileBodyBB1
__if_thenBB1:
    la a0,_globalStr1    
    call	println
    j	_whileBodyBB1
_if_thenBB1:
    call	getString
    mv	s3,a0 
    mv	s5,zero 
    j	__forcondBB6
__forcondBB6:
    mv	a0,s3 
    call	stringLength
    blt	s5,a0,	__forbodyBB6
    j	__afterForBB5
__afterForBB5:
    mv	a0,s3 
    call	stringLength
    mv	t3,s0 
    addi a2,a0,    64
    li t5, 56
    sub t5,a2,t5
    li a2, 64
    div t5,t5,a2
    addi t4,t5,    1
    li t5, 100
    bgt	t4,t5,	_if_thenBB14
    j	_if_end6
_if_thenBB14:
    la a0,_globalStr4    
    call	println
    mv	s3,zero 
    j	afterCallBB7
afterCallBB7:
    mv	s4,zero 
    j	__forcondBB7
__forcondBB7:
    mv	a0,s3 
    call	_arraySize
    blt	s4,a0,	__forbodyBB7
    j	_afterCallBB5
_afterCallBB5:
    la a0,_globalStr0    
    call	println
    j	_whileBodyBB1
__forbodyBB7:
    li t3, 4
    mul t3,s4,t3
    addi t3,t3,    4
    add t3,s3,t3
    lw s7, 0(t3)
    la s5,_globalStr0    
    li s10, 28
    j	_forcondBB10
_forcondBB10:
    bge	s10,zero,	_forbodyBB10
    j	afterCallBB8
_forbodyBB10:
    sra t3,s7,s10
    andi t3,t3,    15
    li t5, 10
    blt	t3,t5,	_if_thenBB15
    j	_if_elseBB9
_if_elseBB9:
    addi t5,t3,    65
    li t3, 10
    sub t3,t5,t3
    li t5, 32
    bge	t3,t5,	__ifTrue1
    j	__if_end12
__if_end12:
    la a1,_globalStr0    
    j	_afterCallBB6
_afterCallBB6:
    mv	a0,s5 
    call	_stringAdd
    j	_forupdateBB4
_forupdateBB4:
    li t3, 4
    sub s10,s10,t3
    mv	s5,a0 
    mv	t3,s5 
    mv	t3,s10 
    j	_forcondBB10
__ifTrue1:
    li t5, 126
    ble	t3,t5,	__if_thenBB12
    j	__if_end12
__if_thenBB12:
    li t5, 32
    sub a1,t3,t5
    li t5, 31
    sub a2,t3,t5
    la a0,_globalStr2    
    call	_stringSubstring
    mv	a1,a0 
    j	_afterCallBB6
_if_thenBB15:
    addi t3,t3,    48
    li t5, 32
    bge	t3,t5,	__ifTrue2
    j	__if_end13
__ifTrue2:
    li t5, 126
    ble	t3,t5,	__if_thenBB13
    j	__if_end13
__if_end13:
    la a1,_globalStr0    
    j	_afterCallBB7
_afterCallBB7:
    mv	a0,s5 
    call	_stringAdd
    j	_forupdateBB4
__if_thenBB13:
    li t5, 32
    sub a1,t3,t5
    li t5, 31
    sub a2,t3,t5
    la a0,_globalStr2    
    call	_stringSubstring
    mv	a1,a0 
    j	_afterCallBB7
afterCallBB8:
    mv	a0,s5 
    call	print
    addi s4,s4,    1
    j	__forcondBB7
_if_end6:
    mv	t5,zero 
    j	_forcondBB11
_forcondBB11:
    blt	t5,t4,	_forbodyBB11
    j	_afterForBB9
_afterForBB9:
    mv	t5,zero 
    j	_forcondBB12
_forcondBB12:
    blt	t5,a0,	_forbodyBB12
    j	_afterForBB10
_forbodyBB12:
    li a2, 64
    div a7,t5,a2
    li a2, 4
    mul a2,a7,a2
    addi a2,a2,    4
    add a5,s8,a2
    li a2, 64
    rem a2,t5,a2
    li a7, 4
    div t2,a2,a7
    lw a2, 0(a5)
    li a7, 4
    mul a7,t2,a7
    addi a7,a7,    4
    add t2,a2,a7
    li a2, 4
    mul a2,t5,a2
    addi a2,a2,    4
    add a5,t3,a2
    li a2, 4
    rem a2,t5,a2
    li a7, 3
    sub a7,a7,a2
    li a2, 8
    mul a7,a7,a2
    lw a2, 0(a5)
    sll a2,a2,a7
    lw a7, 0(t2)
    or a7,a7,a2
    li a2, 64
    div t2,t5,a2
    li a2, 4
    mul a2,t2,a2
    addi a2,a2,    4
    add a5,s8,a2
    li a2, 64
    rem t2,t5,a2
    li a2, 4
    div a2,t2,a2
    lw t2, 0(a5)
    li a5, 4
    mul a2,a2,a5
    addi a2,a2,    4
    add a2,t2,a2
    sw a7,0(a2)
    addi t5,t5,    1
    j	_forcondBB12
_afterForBB10:
    li t3, 64
    div a2,t5,t3
    li t3, 4
    mul t3,a2,t3
    addi t3,t3,    4
    add t2,s8,t3
    li t3, 64
    rem a2,t5,t3
    li t3, 4
    div a7,a2,t3
    lw t3, 0(t2)
    li a2, 4
    mul a2,a7,a2
    addi a2,a2,    4
    add a7,t3,a2
    li t3, 4
    rem t3,t5,t3
    li a2, 3
    sub t3,a2,t3
    li a2, 8
    mul t3,t3,a2
    li a2, 128
    sll a2,a2,t3
    lw t3, 0(a7)
    or a7,t3,a2
    li t3, 64
    div t3,t5,t3
    li a2, 4
    mul t3,t3,a2
    addi t3,t3,    4
    add a2,s8,t3
    li t3, 64
    rem t3,t5,t3
    li t5, 4
    div t5,t3,t5
    lw a2, 0(a2)
    li t3, 4
    mul t3,t5,t3
    addi t3,t3,    4
    add t3,a2,t3
    sw a7,0(t3)
    slli t5,a0,    3
    li t3, 1
    sub t3,t4,t3
    li a2, 4
    mul t3,t3,a2
    addi t3,t3,    4
    add t3,s8,t3
    lw t3, 0(t3)
    addi t3,t3,    64
    sw t5,0(t3)
    srai t3,a0,    29
    andi t5,t3,    7
    li t3, 1
    sub a2,t4,t3
    li t3, 4
    mul t3,a2,t3
    addi t3,t3,    4
    add t3,s8,t3
    lw t3, 0(t3)
    addi t3,t3,    60
    sw t5,0(t3)
    li a3, -271733879
    li a7, 271733878
    li a0, -1732584194
    li ra, -1009589776
    li t1, 1732584193
    mv	a1,zero 
    j	_forcondBB13
_forcondBB13:
    blt	a1,t4,	_forbodyBB13
    j	_afterForBB11
_forbodyBB13:
    li t5, 16
    j	_forcondBB14
_forcondBB14:
    li t3, 80
    blt	t5,t3,	_forbodyBB14
    j	_afterForBB12
_afterForBB12:
    mv	t0,t1 
    mv	a5,ra 
    mv	t5,a0 
    mv	a2,a7 
    mv	a4,a3 
    mv	t3,t0 
    mv	t3,a5 
    mv	t3,t5 
    mv	t3,a2 
    mv	t3,a4 
    mv	t6,zero 
    j	_forcondBB15
_forcondBB15:
    li t3, 80
    blt	t6,t3,	_forbodyBB15
    j	_afterForBB13
_forbodyBB15:
    li t3, 20
    blt	t6,t3,	_if_thenBB16
    j	_if_elseBB10
_if_thenBB16:
    and t3,a4,t5
    xori t2,a4,    -1
    and t2,t2,a2
    or a6,t3,t2
    li t2, 1518500249
    j	_if_end7
_if_end7:
    li t3, 134217727
    and t3,t0,t3
    slli s3,t3,    5
    srai t3,t0,    27
    andi t3,t3,    31
    or t3,s3,t3
    li s3, 65535
    and s3,t3,s3
    li s5, 65535
    and s5,a5,s5
    add s3,s3,s5
    srai t3,t3,    16
    li s5, 65535
    and s5,t3,s5
    srai t3,a5,    16
    li a5, 65535
    and t3,t3,a5
    add a5,s5,t3
    srai t3,s3,    16
    add t3,a5,t3
    li a5, 65535
    and t3,t3,a5
    slli a5,t3,    16
    li t3, 65535
    and t3,s3,t3
    or t3,a5,t3
    li a5, 65535
    and s3,a6,a5
    li a5, 65535
    and a5,t2,a5
    add a5,s3,a5
    srai s3,a6,    16
    li a6, 65535
    and s3,s3,a6
    srai t2,t2,    16
    li a6, 65535
    and t2,t2,a6
    add t2,s3,t2
    srai a6,a5,    16
    add t2,t2,a6
    li a6, 65535
    and t2,t2,a6
    slli t2,t2,    16
    li a6, 65535
    and a5,a5,a6
    or t2,t2,a5
    li a5, 65535
    and a5,t3,a5
    li a6, 65535
    and a6,t2,a6
    add a5,a5,a6
    srai t3,t3,    16
    li a6, 65535
    and a6,t3,a6
    srai t3,t2,    16
    li t2, 65535
    and t3,t3,t2
    add t2,a6,t3
    srai t3,a5,    16
    add t3,t2,t3
    li t2, 65535
    and t3,t3,t2
    slli t3,t3,    16
    li t2, 65535
    and t2,a5,t2
    or t3,t3,t2
    li t2, 4
    mul t2,a1,t2
    addi t2,t2,    4
    add t2,s8,t2
    lw a5, 0(t2)
    li t2, 4
    mul t2,t6,t2
    addi t2,t2,    4
    add t2,a5,t2
    lw t2, 0(t2)
    li a5, 65535
    and a5,t3,a5
    li a6, 65535
    and a6,t2,a6
    add a5,a5,a6
    srai t3,t3,    16
    li a6, 65535
    and t3,t3,a6
    srai a6,t2,    16
    li t2, 65535
    and t2,a6,t2
    add t2,t3,t2
    srai t3,a5,    16
    add t2,t2,t3
    li t3, 65535
    and t3,t2,t3
    slli t2,t3,    16
    li t3, 65535
    and t3,a5,t3
    or t3,t2,t3
    mv	a5,a2 
    mv	a2,t5 
    andi t5,a4,    3
    slli t2,t5,    30
    srai a4,a4,    2
    li t5, 1073741823
    and t5,a4,t5
    or t5,t2,t5
    mv	a4,t0 
    mv	t0,t3 
    addi t6,t6,    1
    mv	t3,t0 
    mv	t3,a5 
    mv	t3,t5 
    mv	t3,a2 
    mv	t3,t6 
    mv	t3,a4 
    j	_forcondBB15
_if_elseBB10:
    li t3, 40
    blt	t6,t3,	_if_thenBB17
    j	_if_elseBB11
_if_thenBB17:
    xor t3,a4,t5
    xor a6,t3,a2
    li t2, 1859775393
    j	_if_end7
_if_elseBB11:
    li t3, 60
    blt	t6,t3,	_if_thenBB18
    j	_if_elseBB12
_if_elseBB12:
    xor t3,a4,t5
    xor a6,t3,a2
    li t2, -899497514
    j	_if_end7
_if_thenBB18:
    and t3,a4,t5
    and t2,a4,a2
    or t2,t3,t2
    and t3,t5,a2
    or a6,t2,t3
    li t2, -1894007588
    j	_if_end7
_afterForBB13:
    li t3, 65535
    and t3,t1,t3
    li t2, 65535
    and t2,t0,t2
    add t3,t3,t2
    srai t2,t1,    16
    li t1, 65535
    and t2,t2,t1
    srai t1,t0,    16
    li t0, 65535
    and t0,t1,t0
    add t0,t2,t0
    srai t2,t3,    16
    add t2,t0,t2
    li t0, 65535
    and t2,t2,t0
    slli t0,t2,    16
    li t2, 65535
    and t3,t3,t2
    or t1,t0,t3
    li t3, 65535
    and t2,a3,t3
    li t3, 65535
    and t3,a4,t3
    add t2,t2,t3
    srai t3,a3,    16
    li t0, 65535
    and t3,t3,t0
    srai a4,a4,    16
    li t0, 65535
    and t0,a4,t0
    add t3,t3,t0
    srai t0,t2,    16
    add t3,t3,t0
    li t0, 65535
    and t3,t3,t0
    slli t0,t3,    16
    li t3, 65535
    and t3,t2,t3
    or a3,t0,t3
    li t3, 65535
    and t3,a0,t3
    li t2, 65535
    and t2,t5,t2
    add t2,t3,t2
    srai t3,a0,    16
    li a0, 65535
    and a0,t3,a0
    srai t5,t5,    16
    li t3, 65535
    and t3,t5,t3
    add t5,a0,t3
    srai t3,t2,    16
    add t3,t5,t3
    li t5, 65535
    and t3,t3,t5
    slli t3,t3,    16
    li t5, 65535
    and t5,t2,t5
    or a0,t3,t5
    li t3, 65535
    and t3,a7,t3
    li t5, 65535
    and t5,a2,t5
    add t3,t3,t5
    srai a7,a7,    16
    li t5, 65535
    and a7,a7,t5
    srai a2,a2,    16
    li t5, 65535
    and t5,a2,t5
    add t5,a7,t5
    srai a2,t3,    16
    add a2,t5,a2
    li t5, 65535
    and t5,a2,t5
    slli t5,t5,    16
    li a2, 65535
    and t3,t3,a2
    or a7,t5,t3
    li t3, 65535
    and t5,ra,t3
    li t3, 65535
    and t3,a5,t3
    add t3,t5,t3
    srai a2,ra,    16
    li t5, 65535
    and a2,a2,t5
    srai t5,a5,    16
    li t2, 65535
    and t5,t5,t2
    add t5,a2,t5
    srai a2,t3,    16
    add a2,t5,a2
    li t5, 65535
    and t5,a2,t5
    slli a2,t5,    16
    li t5, 65535
    and t3,t3,t5
    or ra,a2,t3
    addi a1,a1,    1
    mv	t3,a3 
    mv	t3,a7 
    mv	t3,a0 
    mv	t3,ra 
    mv	t3,t1 
    mv	t3,a1 
    j	_forcondBB13
_forbodyBB14:
    li t3, 4
    mul t3,a1,t3
    addi t3,t3,    4
    add a2,s8,t3
    li t3, 3
    sub t3,t5,t3
    lw t2, 0(a2)
    li a2, 4
    mul t3,t3,a2
    addi t3,t3,    4
    add a2,t2,t3
    li t3, 4
    mul t3,a1,t3
    addi t3,t3,    4
    add t2,s8,t3
    li t3, 8
    sub a5,t5,t3
    lw t2, 0(t2)
    li t3, 4
    mul t3,a5,t3
    addi t3,t3,    4
    add t3,t2,t3
    lw a2, 0(a2)
    lw t3, 0(t3)
    xor a2,a2,t3
    li t3, 4
    mul t3,a1,t3
    addi t3,t3,    4
    add t3,s8,t3
    li t2, 14
    sub a5,t5,t2
    lw t2, 0(t3)
    li t3, 4
    mul t3,a5,t3
    addi t3,t3,    4
    add t3,t2,t3
    lw t3, 0(t3)
    xor a2,a2,t3
    li t3, 4
    mul t3,a1,t3
    addi t3,t3,    4
    add t3,s8,t3
    li t2, 16
    sub t2,t5,t2
    lw a5, 0(t3)
    li t3, 4
    mul t3,t2,t3
    addi t3,t3,    4
    add t3,a5,t3
    lw t3, 0(t3)
    xor t3,a2,t3
    li a2, 2147483647
    and a2,t3,a2
    slli a2,a2,    1
    srai t3,t3,    31
    andi t3,t3,    1
    or t3,a2,t3
    li a2, 4
    mul a2,a1,a2
    addi a2,a2,    4
    add a2,s8,a2
    lw t2, 0(a2)
    li a2, 4
    mul a2,t5,a2
    addi a2,a2,    4
    add a2,t2,a2
    sw t3,0(a2)
    addi t5,t5,    1
    j	_forcondBB14
_afterForBB11:
    addi t3,s9,    4
    sw t1,0(t3)
    addi t3,s9,    8
    sw a3,0(t3)
    addi t3,s9,    12
    sw a0,0(t3)
    addi t3,s9,    16
    sw a7,0(t3)
    addi t3,s9,    20
    sw ra,0(t3)
    mv	s3,s9 
    j	afterCallBB7
_forbodyBB11:
    mv	a2,zero 
    j	_forcondBB16
_forcondBB16:
    li a7, 80
    blt	a2,a7,	_forbodyBB16
    j	_forupdateBB5
_forbodyBB16:
    li a7, 4
    mul a7,t5,a7
    addi a7,a7,    4
    add a7,s8,a7
    lw t2, 0(a7)
    li a7, 4
    mul a7,a2,a7
    addi a7,a7,    4
    add a7,t2,a7
    li t2, 0
    sw t2,0(a7)
    addi a2,a2,    1
    j	_forcondBB16
_forupdateBB5:
    addi t5,t5,    1
    j	_forcondBB11
__forbodyBB6:
    mv	a0,s3 
    mv	a1,s5 
    call	_stringOrd
    li t3, 4
    mul t3,s5,t3
    addi t3,t3,    4
    add t3,s0,t3
    sw a0,0(t3)
    addi s5,s5,    1
    j	__forcondBB6
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
