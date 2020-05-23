    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -48
    sw ra, 24(sp) 
    sw s7, 16(sp) 
    sw s8, 8(sp) 
    sw s9, 20(sp) 
    sw s10, 32(sp) 
    sw s11, 28(sp) 
    sw s0, 4(sp) 
    sw s1, 12(sp) 
    sw s2, 40(sp) 
    sw s3, 0(sp) 
    sw s4, 36(sp) 
    mv	s3,s5 
    li a0, 404
    call malloc
    mv	s8,a0 
    li t0, 100
    sw t0,0(s8)
    addi s9,s8,    4
    addi s0,s8,    400
    j	forcondBB1
forcondBB1:
    ble	s9,s0,	forupdateBB1
    j	afterForBB1
afterForBB1:
    mv	s0,s8 
    li a0, 25284
    call malloc
    li t0, 6320
    sw t0,0(a0)
    mv	s4,a0 
    li a0, 24
    call malloc
    li t0, 5
    sw t0,0(a0)
    mv	s7,a0 
    j	_whileBodyBB1
_whileBodyBB1:
    call	getInt
    beq	a0,zero,	afterCallBB1
    j	_if_end1
_if_end1:
    li t0, 1
    beq	a0,t0,	_if_thenBB1
    j	_if_elseBB1
_if_elseBB1:
    li t0, 2
    beq	a0,t0,	_if_thenBB2
    j	_whileBodyBB1
_if_thenBB2:
    call	getString
    mv	s11,a0 
    li a0, 24
    call malloc
    li t0, 5
    sw t0,0(a0)
    mv	s5,a0 
    mv	a0,s11 
    call	stringLength
    li t0, 40
    bne	a0,t0,	__if_thenBB1
    j	__if_end1
__if_thenBB1:
    la a0,_globalStr1    
    call	println
    j	_whileBodyBB1
__if_end1:
    mv	t0,zero 
    j	__forcondBB1
__forcondBB1:
    li t1, 5
    blt	t0,t1,	__forbodyBB1
    j	__afterForBB1
__afterForBB1:
    mv	s2,zero 
    j	__forcondBB2
__forcondBB2:
    li t0, 40
    blt	s2,t0,	__forbodyBB2
    j	__afterForBB2
__afterForBB2:
    li s8, 1
    j	__forcondBB3
__forcondBB3:
    li t0, 4
    ble	s8,t0,	__forbodyBB3
    j	__afterForBB3
__afterForBB3:
    la a0,_globalStr3    
    call	println
    j	_whileBodyBB1
__forbodyBB3:
    mv	t0,zero 
    j	__forcondBB4
__forcondBB4:
    blt	t0,s8,	__forbodyBB4
    j	__whileBodyBB1
__whileBodyBB1:
    mv	t0,s4 
    addi t1,s8,    64
    li a5, 56
    sub t1,t1,a5
    srai t1,t1,    6
    addi t6,t1,    1
    li t1, 100
    bgt	t6,t1,	_if_thenBB3
    j	_if_end2
_if_end2:
    mv	a5,zero 
    j	_forcondBB1
_forcondBB1:
    blt	a5,t6,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	t1,zero 
    j	_forcondBB2
_forcondBB2:
    blt	t1,s8,	_forbodyBB2
    j	_afterForBB2
_forbodyBB2:
    li a5, 4
    rem a5,t1,a5
    li t4, 3
    sub a5,t4,a5
    slli t4,a5,    3
    slli a5,t1,    2
    addi a5,a5,    4
    add a5,t0,a5
    lw a5, 0(a5)
    sll t4,a5,t4
    srai a5,t1,    6
    slli a5,a5,    2
    addi a5,a5,    4
    add a2,s0,a5
    li a5, 64
    rem a5,t1,a5
    srai t5,a5,    2
    lw a5, 0(a2)
    slli t5,t5,    2
    addi t5,t5,    4
    add a5,a5,t5
    lw a5, 0(a5)
    or t5,a5,t4
    srai a5,t1,    6
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,s0,a5
    li t4, 64
    rem t4,t1,t4
    srai t4,t4,    2
    lw a5, 0(a5)
    slli t4,t4,    2
    addi t4,t4,    4
    add a5,a5,t4
    sw t5,0(a5)
    addi t1,t1,    1
    j	_forcondBB2
_afterForBB2:
    li t0, 4
    rem a5,t1,t0
    li t0, 3
    sub t0,t0,a5
    slli a5,t0,    3
    li t0, 128
    sll a5,t0,a5
    srai t0,t1,    6
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,s0,t0
    li t4, 64
    rem t4,t1,t4
    srai t4,t4,    2
    lw t5, 0(t0)
    slli t0,t4,    2
    addi t0,t0,    4
    add t0,t5,t0
    lw t0, 0(t0)
    or a5,t0,a5
    srai t0,t1,    6
    slli t0,t0,    2
    addi t0,t0,    4
    add t4,s0,t0
    li t0, 64
    rem t0,t1,t0
    srai t0,t0,    2
    lw t1, 0(t4)
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,t1,t0
    sw a5,0(t0)
    slli t1,s8,    3
    li t0, 1
    sub t0,t6,t0
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,s0,t0
    lw t0, 0(t0)
    sw t1,64(t0)
    srai t0,s8,    29
    andi t1,t0,    7
    li t0, 1
    sub t0,t6,t0
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,s0,t0
    lw t0, 0(t0)
    sw t1,60(t0)
    mv	t5,zero 
    li a7, -1009589776
    li a2, -1732584194
    li t2, -271733879
    li t1, 1732584193
    li a6, 271733878
    j	_forcondBB3
_forcondBB3:
    blt	t5,t6,	_forbodyBB3
    j	_afterForBB3
_afterForBB3:
    sw t1,4(s7)
    sw t2,8(s7)
    sw a2,12(s7)
    sw a6,16(s7)
    sw a7,20(s7)
    mv	t1,s7 
    j	afterCallBB2
afterCallBB2:
    mv	t0,s5 
    lw t4, 0(t0)
    lw a5, 0(t1)
    bne	a5,t4,	_if_thenBB4
    j	_if_end3
_if_thenBB4:
    mv	t0,zero 
    j	afterCallBB3
afterCallBB3:
    bne	t0, zero, __if_thenBB2
    j	__if_end2
__if_thenBB2:
    mv	s9,zero 
    j	__forcondBB5
__forcondBB5:
    blt	s9,s8,	__forbodyBB5
    j	__afterForBB4
__forbodyBB5:
    slli t0,s9,    2
    addi t0,t0,    4
    add t0,s4,t0
    lw t0, 0(t0)
    li t1, 32
    bge	t0,t1,	_ifTrue1
    j	_if_end4
_ifTrue1:
    li t1, 126
    ble	t0,t1,	_if_thenBB5
    j	_if_end4
_if_end4:
    la a0,_globalStr0    
    j	afterCallBB4
afterCallBB4:
    call	print
    addi s9,s9,    1
    j	__forcondBB5
_if_thenBB5:
    li t1, 32
    sub a1,t0,t1
    li t1, 31
    sub a2,t0,t1
    la a0,_globalStr2    
    call	_stringSubstring
    j	afterCallBB4
__afterForBB4:
    la a0,_globalStr0    
    call	println
    j	_whileBodyBB1
__if_end2:
    mv	t0,s4 
    li t1, 1
    sub a5,s8,t1
    j	_forcondBB4
_forcondBB4:
    bge	a5,zero,	_forbodyBB4
    j	_afterForBB4
_forbodyBB4:
    slli t1,a5,    2
    addi t1,t1,    4
    add t1,t0,t1
    lw t1, 0(t1)
    li t4, 122
    beq	t1,t4,	__if_thenBB3
    j	__if_end3
__if_end3:
    li t4, 90
    beq	t1,t4,	__if_thenBB4
    j	__if_end4
__if_thenBB4:
    li t1, 97
    j	_afterCallBB1
_afterCallBB1:
    slli t4,a5,    2
    addi t4,t4,    4
    add t4,t0,t4
    sw t1,0(t4)
    slli t1,a5,    2
    addi t1,t1,    4
    add t1,t0,t1
    lw t1, 0(t1)
    li t4, -1
    beq	t1,t4,	_if_thenBB6
    j	_if_elseBB2
_if_thenBB6:
    slli t1,a5,    2
    addi t1,t1,    4
    add t4,t0,t1
    li t1, 48
    sw t1,0(t4)
    li t1, 1
    sub a5,a5,t1
    j	_forcondBB4
_if_elseBB2:
    li t0, 1
    j	afterCallBB5
afterCallBB5:
    bne	t0, zero, __whileBodyBB1
    j	__forupdateBB1
__forupdateBB1:
    addi s8,s8,    1
    j	__forcondBB3
__if_end4:
    li t4, 57
    beq	t1,t4,	__if_thenBB5
    j	__if_end5
__if_thenBB5:
    li t1, 65
    j	_afterCallBB1
__if_end5:
    addi t1,t1,    1
    j	_afterCallBB1
__if_thenBB3:
    li t1, -1
    j	_afterCallBB1
_afterForBB4:
    mv	t0,zero 
    j	afterCallBB5
_if_end3:
    mv	a5,zero 
    j	_forcondBB5
_forcondBB5:
    lw t4, 0(t1)
    blt	a5,t4,	_forbodyBB5
    j	_afterForBB5
_afterForBB5:
    li t0, 1
    j	afterCallBB3
_forbodyBB5:
    slli t4,a5,    2
    addi t4,t4,    4
    add t6,t0,t4
    slli t4,a5,    2
    addi t4,t4,    4
    add t4,t1,t4
    lw t4, 0(t4)
    lw t6, 0(t6)
    bne	t4,t6,	_if_thenBB7
    j	_forupdateBB1
_if_thenBB7:
    mv	t0,zero 
    j	afterCallBB3
_forupdateBB1:
    addi a5,a5,    1
    j	_forcondBB5
_forbodyBB3:
    li a5, 16
    j	_forcondBB6
_forcondBB6:
    li t0, 80
    blt	a5,t0,	_forbodyBB6
    j	_afterForBB6
_afterForBB6:
    mv	t3,t1 
    mv	a0,t2 
    mv	t0,a6 
    mv	t4,a7 
    mv	a4,a2 
    mv	a3,zero 
    j	_forcondBB7
_forcondBB7:
    li a5, 80
    blt	a3,a5,	_forbodyBB7
    j	_afterForBB7
_afterForBB7:
    li a5, 65535
    and a3,t3,a5
    li a5, 65535
    and a5,t1,a5
    add a5,a5,a3
    srai a3,a5,    16
    srai t3,t3,    16
    li a1, 65535
    and t3,t3,a1
    srai t1,t1,    16
    li a1, 65535
    and t1,t1,a1
    add t1,t1,t3
    add t1,t1,a3
    li t3, 65535
    and t1,t1,t3
    li t3, 65535
    and a5,a5,t3
    slli t1,t1,    16
    or t1,t1,a5
    li a5, 65535
    and a5,a0,a5
    li t3, 65535
    and t3,t2,t3
    add t3,t3,a5
    srai a3,t3,    16
    srai a0,a0,    16
    li a5, 65535
    and a5,a0,a5
    srai a0,t2,    16
    li t2, 65535
    and t2,a0,t2
    add a5,t2,a5
    add t2,a5,a3
    li a5, 65535
    and a5,t2,a5
    li t2, 65535
    and t2,t3,t2
    slli a5,a5,    16
    or t2,a5,t2
    li a5, 65535
    and t3,a4,a5
    li a5, 65535
    and a5,a2,a5
    add a5,a5,t3
    srai t3,a5,    16
    srai a0,a4,    16
    li a4, 65535
    and a4,a0,a4
    srai a0,a2,    16
    li a2, 65535
    and a2,a0,a2
    add a2,a2,a4
    add a4,a2,t3
    li a2, 65535
    and a2,a4,a2
    li a4, 65535
    and a5,a5,a4
    slli a2,a2,    16
    or a2,a2,a5
    li a5, 65535
    and a4,t0,a5
    li a5, 65535
    and a5,a6,a5
    add a5,a5,a4
    srai a4,a5,    16
    srai t3,t0,    16
    li t0, 65535
    and t0,t3,t0
    srai a6,a6,    16
    li t3, 65535
    and a6,a6,t3
    add t0,a6,t0
    add t0,t0,a4
    li a6, 65535
    and t0,t0,a6
    li a6, 65535
    and a5,a5,a6
    slli t0,t0,    16
    or a6,t0,a5
    li t0, 65535
    and t0,t4,t0
    li a5, 65535
    and a5,a7,a5
    add t0,a5,t0
    srai t3,t0,    16
    srai t4,t4,    16
    li a5, 65535
    and a4,t4,a5
    srai a5,a7,    16
    li t4, 65535
    and a5,a5,t4
    add a5,a5,a4
    add a5,a5,t3
    li t4, 65535
    and a5,a5,t4
    li t4, 65535
    and t4,t0,t4
    slli t0,a5,    16
    or a7,t0,t4
    addi t5,t5,    1
    j	_forcondBB3
_forbodyBB7:
    li a5, 20
    blt	a3,a5,	_if_thenBB8
    j	_if_elseBB3
_if_elseBB3:
    li a5, 40
    blt	a3,a5,	_if_thenBB9
    j	_if_elseBB4
_if_elseBB4:
    li a5, 60
    blt	a3,a5,	_if_thenBB10
    j	_if_elseBB5
_if_thenBB10:
    and ra,a4,t0
    and a5,a0,t0
    and a1,a0,a4
    or a5,a1,a5
    or a1,a5,ra
    li a5, -1894007588
    j	_if_end5
_if_end5:
    srai ra,t3,    27
    andi s9,ra,    31
    li ra, 134217727
    and ra,t3,ra
    slli ra,ra,    5
    or ra,ra,s9
    li s9, 65535
    and s2,t4,s9
    li s9, 65535
    and s9,ra,s9
    add s9,s9,s2
    srai s2,s9,    16
    srai t4,t4,    16
    li s11, 65535
    and t4,t4,s11
    srai ra,ra,    16
    li s11, 65535
    and ra,ra,s11
    add t4,ra,t4
    add ra,t4,s2
    li t4, 65535
    and t4,ra,t4
    li ra, 65535
    and ra,s9,ra
    slli t4,t4,    16
    or t4,t4,ra
    li ra, 65535
    and ra,a5,ra
    li s9, 65535
    and s9,a1,s9
    add ra,s9,ra
    srai s9,ra,    16
    srai s2,a5,    16
    li a5, 65535
    and s2,s2,a5
    srai a5,a1,    16
    li a1, 65535
    and a5,a5,a1
    add a5,a5,s2
    add a5,a5,s9
    li a1, 65535
    and a5,a5,a1
    li a1, 65535
    and a1,ra,a1
    slli a5,a5,    16
    or a1,a5,a1
    li a5, 65535
    and ra,a1,a5
    li a5, 65535
    and a5,t4,a5
    add a5,a5,ra
    srai ra,a5,    16
    srai a1,a1,    16
    li s9, 65535
    and a1,a1,s9
    srai s9,t4,    16
    li t4, 65535
    and t4,s9,t4
    add t4,t4,a1
    add a1,t4,ra
    li t4, 65535
    and t4,a1,t4
    li a1, 65535
    and a1,a5,a1
    slli a5,t4,    16
    or a1,a5,a1
    slli a5,t5,    2
    addi a5,a5,    4
    add a5,s0,a5
    lw t4, 0(a5)
    slli a5,a3,    2
    addi a5,a5,    4
    add a5,t4,a5
    lw a5, 0(a5)
    li t4, 65535
    and ra,a5,t4
    li t4, 65535
    and t4,a1,t4
    add t4,t4,ra
    srai s9,t4,    16
    srai a5,a5,    16
    li ra, 65535
    and ra,a5,ra
    srai a5,a1,    16
    li a1, 65535
    and a5,a5,a1
    add a5,a5,ra
    add a1,a5,s9
    li a5, 65535
    and a5,a1,a5
    li a1, 65535
    and t4,t4,a1
    slli a5,a5,    16
    or a5,a5,t4
    mv	t4,t0 
    mv	t0,a4 
    srai a4,a0,    2
    li a1, 1073741823
    and a1,a4,a1
    andi a4,a0,    3
    slli a4,a4,    30
    or a4,a4,a1
    mv	a0,t3 
    addi a3,a3,    1
    mv	t3,a5 
    j	_forcondBB7
_if_elseBB5:
    xor a5,a0,a4
    xor a1,a5,t0
    li a5, -899497514
    j	_if_end5
_if_thenBB9:
    xor a5,a0,a4
    xor a1,a5,t0
    li a5, 1859775393
    j	_if_end5
_if_thenBB8:
    xori a5,a0,    -1
    and a5,a5,t0
    and a1,a0,a4
    or a1,a1,a5
    li a5, 1518500249
    j	_if_end5
_forbodyBB6:
    slli t0,t5,    2
    addi t0,t0,    4
    add t4,s0,t0
    li t0, 16
    sub t0,a5,t0
    lw t4, 0(t4)
    slli t0,t0,    2
    addi t0,t0,    4
    add t4,t4,t0
    slli t0,t5,    2
    addi t0,t0,    4
    add a4,s0,t0
    li t0, 14
    sub t0,a5,t0
    lw a4, 0(a4)
    slli t0,t0,    2
    addi t0,t0,    4
    add t3,a4,t0
    slli t0,t5,    2
    addi t0,t0,    4
    add t0,s0,t0
    li a4, 8
    sub a0,a5,a4
    lw a4, 0(t0)
    slli t0,a0,    2
    addi t0,t0,    4
    add a4,a4,t0
    slli t0,t5,    2
    addi t0,t0,    4
    add a0,s0,t0
    li t0, 3
    sub t0,a5,t0
    lw a0, 0(a0)
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,a0,t0
    lw t0, 0(t0)
    lw a4, 0(a4)
    xor t0,t0,a4
    lw a4, 0(t3)
    xor t0,t0,a4
    lw t4, 0(t4)
    xor t0,t0,t4
    srai t4,t0,    31
    andi t4,t4,    1
    li a4, 2147483647
    and t0,t0,a4
    slli t0,t0,    1
    or t0,t0,t4
    slli t4,t5,    2
    addi t4,t4,    4
    add t4,s0,t4
    lw t4, 0(t4)
    slli a4,a5,    2
    addi a4,a4,    4
    add t4,t4,a4
    sw t0,0(t4)
    addi a5,a5,    1
    j	_forcondBB6
_forbodyBB1:
    mv	t1,zero 
    j	_forcondBB8
_forcondBB8:
    li t4, 80
    blt	t1,t4,	_forbodyBB8
    j	_forupdateBB2
_forbodyBB8:
    slli t4,a5,    2
    addi t4,t4,    4
    add t4,s0,t4
    lw t4, 0(t4)
    slli t5,t1,    2
    addi t5,t5,    4
    add t4,t4,t5
    li t5, 0
    sw t5,0(t4)
    addi t1,t1,    1
    j	_forcondBB8
_forupdateBB2:
    addi a5,a5,    1
    j	_forcondBB1
_if_thenBB3:
    la a0,_globalStr4    
    call	println
    mv	t1,zero 
    j	afterCallBB2
__forbodyBB4:
    slli t1,t0,    2
    addi t1,t1,    4
    add a5,s4,t1
    li t1, 48
    sw t1,0(a5)
    addi t0,t0,    1
    j	__forcondBB4
__forbodyBB2:
    srai t0,s2,    2
    li t1, 2
    rem t1,t0,t1
    li t0, 1
    sub t0,t0,t1
    slli s1,t0,    4
    addi a2,s2,    4
    mv	a0,s11 
    mv	a1,s2 
    call	_stringSubstring
    mv	s8,a0 
    mv	s10,zero 
    mv	s9,zero 
    j	_forcondBB9
_forcondBB9:
    mv	a0,s8 
    call	stringLength
    blt	s9,a0,	_forbodyBB9
    j	_afterForBB8
_afterForBB8:
    mv	t0,s10 
    j	afterCallBB6
afterCallBB6:
    sll t1,t0,s1
    srai t0,s2,    3
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,s5,t0
    lw t0, 0(t0)
    or t1,t0,t1
    srai t0,s2,    3
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,s5,t0
    sw t1,0(t0)
    addi t0,s2,    4
    mv	s2,t0 
    j	__forcondBB2
_forbodyBB9:
    mv	a0,s8 
    mv	a1,s9 
    call	_stringOrd
    li t0, 48
    bge	a0,t0,	_ifTrue2
    j	_if_elseBB6
_if_elseBB6:
    li t0, 65
    bge	a0,t0,	_ifTrue3
    j	_if_elseBB7
_ifTrue3:
    li t0, 70
    ble	a0,t0,	_if_thenBB11
    j	_if_elseBB7
_if_thenBB11:
    slli t0,s10,    4
    add t1,t0,a0
    li t0, 65
    sub t0,t1,t0
    addi t1,t0,    10
    j	_forupdateBB3
_forupdateBB3:
    addi t0,s9,    1
    mv	s10,t1 
    mv	s9,t0 
    j	_forcondBB9
_if_elseBB7:
    li t0, 97
    bge	a0,t0,	_ifTrue4
    j	_if_elseBB8
_ifTrue4:
    li t0, 102
    ble	a0,t0,	_if_thenBB12
    j	_if_elseBB8
_if_thenBB12:
    slli t0,s10,    4
    add t1,t0,a0
    li t0, 97
    sub t0,t1,t0
    addi t1,t0,    10
    j	_forupdateBB3
_if_elseBB8:
    mv	t0,zero 
    j	afterCallBB6
_ifTrue2:
    li t0, 57
    ble	a0,t0,	_if_thenBB13
    j	_if_elseBB6
_if_thenBB13:
    slli t0,s10,    4
    add t1,t0,a0
    li t0, 48
    sub t1,t1,t0
    j	_forupdateBB3
__forbodyBB1:
    slli t1,t0,    2
    addi t1,t1,    4
    add t1,s5,t1
    li a5, 0
    sw a5,0(t1)
    addi t0,t0,    1
    j	__forcondBB1
_if_thenBB1:
    call	getString
    mv	s8,a0 
    mv	s9,zero 
    j	__forcondBB6
__forcondBB6:
    mv	a0,s8 
    call	stringLength
    blt	s9,a0,	__forbodyBB6
    j	__afterForBB5
__afterForBB5:
    mv	a0,s8 
    call	stringLength
    mv	t0,s4 
    addi t1,a0,    64
    li a5, 56
    sub t1,t1,a5
    srai t1,t1,    6
    addi a2,t1,    1
    li t1, 100
    bgt	a2,t1,	_if_thenBB14
    j	_if_end6
_if_thenBB14:
    la a0,_globalStr4    
    call	println
    mv	s8,zero 
    j	afterCallBB7
afterCallBB7:
    mv	s11,zero 
    j	__forcondBB7
__forcondBB7:
    lw t0, 0(s8)
    blt	s11,t0,	__forbodyBB7
    j	_afterCallBB2
__forbodyBB7:
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,s8,t0
    lw s2, 0(t0)
    la s9,_globalStr0    
    li s10, 28
    j	_forcondBB10
_forcondBB10:
    bge	s10,zero,	_forbodyBB10
    j	afterCallBB8
afterCallBB8:
    mv	a0,s9 
    call	print
    addi s11,s11,    1
    j	__forcondBB7
_forbodyBB10:
    sra t0,s2,s10
    andi t0,t0,    15
    li t1, 10
    blt	t0,t1,	_if_thenBB15
    j	_if_elseBB9
_if_elseBB9:
    addi t1,t0,    65
    li t0, 10
    sub t0,t1,t0
    li t1, 32
    bge	t0,t1,	__ifTrue1
    j	__if_end6
__ifTrue1:
    li t1, 126
    ble	t0,t1,	__if_thenBB6
    j	__if_end6
__if_end6:
    la a1,_globalStr0    
    j	_afterCallBB3
_afterCallBB3:
    mv	a0,s9 
    call	_stringAdd
    j	_forupdateBB4
_forupdateBB4:
    li t0, 4
    sub s10,s10,t0
    mv	s9,a0 
    j	_forcondBB10
__if_thenBB6:
    li t1, 32
    sub a1,t0,t1
    li t1, 31
    sub a2,t0,t1
    la a0,_globalStr2    
    call	_stringSubstring
    mv	a1,a0 
    j	_afterCallBB3
_if_thenBB15:
    addi t0,t0,    48
    li t1, 32
    bge	t0,t1,	__ifTrue2
    j	__if_end7
__ifTrue2:
    li t1, 126
    ble	t0,t1,	__if_thenBB7
    j	__if_end7
__if_thenBB7:
    li t1, 32
    sub a1,t0,t1
    li t1, 31
    sub a2,t0,t1
    la a0,_globalStr2    
    call	_stringSubstring
    j	_afterCallBB4
_afterCallBB4:
    mv	a1,a0 
    mv	a0,s9 
    call	_stringAdd
    j	_forupdateBB4
__if_end7:
    la a0,_globalStr0    
    j	_afterCallBB4
_afterCallBB2:
    la a0,_globalStr0    
    call	println
    j	_whileBodyBB1
_if_end6:
    mv	t1,zero 
    j	_forcondBB11
_forcondBB11:
    blt	t1,a2,	_forbodyBB11
    j	_afterForBB9
_afterForBB9:
    mv	t1,zero 
    j	_forcondBB12
_forcondBB12:
    blt	t1,a0,	_forbodyBB12
    j	_afterForBB10
_forbodyBB12:
    li a5, 4
    rem t4,t1,a5
    li a5, 3
    sub a5,a5,t4
    slli t4,a5,    3
    slli a5,t1,    2
    addi a5,a5,    4
    add a5,t0,a5
    lw a5, 0(a5)
    sll t5,a5,t4
    srai a5,t1,    6
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,s0,a5
    li t4, 64
    rem t4,t1,t4
    srai t6,t4,    2
    lw t4, 0(a5)
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,t4,a5
    lw a5, 0(a5)
    or t4,a5,t5
    srai a5,t1,    6
    slli a5,a5,    2
    addi a5,a5,    4
    add t6,s0,a5
    li a5, 64
    rem a5,t1,a5
    srai a5,a5,    2
    lw t6, 0(t6)
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,t6,a5
    sw t4,0(a5)
    addi t1,t1,    1
    j	_forcondBB12
_afterForBB10:
    li t0, 4
    rem a5,t1,t0
    li t0, 3
    sub t0,t0,a5
    slli t0,t0,    3
    li a5, 128
    sll t4,a5,t0
    srai t0,t1,    6
    slli t0,t0,    2
    addi t0,t0,    4
    add a5,s0,t0
    li t0, 64
    rem t0,t1,t0
    srai t0,t0,    2
    lw a5, 0(a5)
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,a5,t0
    lw t0, 0(t0)
    or a5,t0,t4
    srai t0,t1,    6
    slli t0,t0,    2
    addi t0,t0,    4
    add t4,s0,t0
    li t0, 64
    rem t0,t1,t0
    srai t0,t0,    2
    lw t1, 0(t4)
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,t1,t0
    sw a5,0(t0)
    slli t1,a0,    3
    li t0, 1
    sub t0,a2,t0
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,s0,t0
    lw t0, 0(t0)
    sw t1,64(t0)
    srai t0,a0,    29
    andi t1,t0,    7
    li t0, 1
    sub t0,a2,t0
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,s0,t0
    lw t0, 0(t0)
    sw t1,60(t0)
    mv	t4,zero 
    li a7, -271733879
    li a6, 271733878
    li t2, -1009589776
    li a5, 1732584193
    li t6, -1732584194
    j	_forcondBB13
_forcondBB13:
    blt	t4,a2,	_forbodyBB13
    j	_afterForBB11
_forbodyBB13:
    li t1, 16
    j	_forcondBB14
_forcondBB14:
    li t0, 80
    blt	t1,t0,	_forbodyBB14
    j	_afterForBB12
_forbodyBB14:
    slli t0,t4,    2
    addi t0,t0,    4
    add t5,s0,t0
    li t0, 16
    sub t0,t1,t0
    lw t5, 0(t5)
    slli t0,t0,    2
    addi t0,t0,    4
    add a4,t5,t0
    slli t0,t4,    2
    addi t0,t0,    4
    add t5,s0,t0
    li t0, 14
    sub t0,t1,t0
    lw t5, 0(t5)
    slli t0,t0,    2
    addi t0,t0,    4
    add t3,t5,t0
    slli t0,t4,    2
    addi t0,t0,    4
    add a0,s0,t0
    li t0, 8
    sub t5,t1,t0
    lw t0, 0(a0)
    slli t5,t5,    2
    addi t5,t5,    4
    add t0,t0,t5
    slli t5,t4,    2
    addi t5,t5,    4
    add a0,s0,t5
    li t5, 3
    sub t5,t1,t5
    lw a0, 0(a0)
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,a0,t5
    lw t5, 0(t5)
    lw t0, 0(t0)
    xor t5,t5,t0
    lw t0, 0(t3)
    xor t0,t5,t0
    lw t5, 0(a4)
    xor t0,t0,t5
    srai t5,t0,    31
    andi t5,t5,    1
    li a4, 2147483647
    and t0,t0,a4
    slli t0,t0,    1
    or t0,t0,t5
    slli t5,t4,    2
    addi t5,t5,    4
    add t5,s0,t5
    lw a4, 0(t5)
    slli t5,t1,    2
    addi t5,t5,    4
    add t5,a4,t5
    sw t0,0(t5)
    addi t1,t1,    1
    j	_forcondBB14
_afterForBB12:
    mv	a0,a6 
    mv	a3,t2 
    mv	a1,t6 
    mv	t1,a5 
    mv	t3,a7 
    mv	a4,zero 
    j	_forcondBB15
_forcondBB15:
    li t0, 80
    blt	a4,t0,	_forbodyBB15
    j	_afterForBB13
_forbodyBB15:
    li t0, 20
    blt	a4,t0,	_if_thenBB16
    j	_if_elseBB10
_if_elseBB10:
    li t0, 40
    blt	a4,t0,	_if_thenBB17
    j	_if_elseBB11
_if_elseBB11:
    li t0, 60
    blt	a4,t0,	_if_thenBB18
    j	_if_elseBB12
_if_thenBB18:
    and ra,a1,a0
    and t5,t3,a0
    and t0,t3,a1
    or t0,t0,t5
    or t5,t0,ra
    li s8, -1894007588
    j	_if_end7
_if_end7:
    srai t0,t1,    27
    andi ra,t0,    31
    li t0, 134217727
    and t0,t1,t0
    slli t0,t0,    5
    or t0,t0,ra
    li ra, 65535
    and s9,a3,ra
    li ra, 65535
    and ra,t0,ra
    add ra,ra,s9
    srai s2,ra,    16
    srai a3,a3,    16
    li s9, 65535
    and s9,a3,s9
    srai a3,t0,    16
    li t0, 65535
    and t0,a3,t0
    add t0,t0,s9
    add t0,t0,s2
    li a3, 65535
    and t0,t0,a3
    li a3, 65535
    and a3,ra,a3
    slli t0,t0,    16
    or a3,t0,a3
    li t0, 65535
    and ra,s8,t0
    li t0, 65535
    and t0,t5,t0
    add ra,t0,ra
    srai s9,ra,    16
    srai s8,s8,    16
    li t0, 65535
    and s8,s8,t0
    srai t0,t5,    16
    li t5, 65535
    and t0,t0,t5
    add t0,t0,s8
    add t5,t0,s9
    li t0, 65535
    and t0,t5,t0
    li t5, 65535
    and t5,ra,t5
    slli t0,t0,    16
    or t5,t0,t5
    li t0, 65535
    and t0,t5,t0
    li ra, 65535
    and ra,a3,ra
    add t0,ra,t0
    srai ra,t0,    16
    srai t5,t5,    16
    li s8, 65535
    and s8,t5,s8
    srai a3,a3,    16
    li t5, 65535
    and t5,a3,t5
    add t5,t5,s8
    add t5,t5,ra
    li a3, 65535
    and t5,t5,a3
    li a3, 65535
    and t0,t0,a3
    slli t5,t5,    16
    or t5,t5,t0
    slli t0,t4,    2
    addi t0,t0,    4
    add t0,s0,t0
    lw a3, 0(t0)
    slli t0,a4,    2
    addi t0,t0,    4
    add t0,a3,t0
    lw t0, 0(t0)
    li a3, 65535
    and ra,t0,a3
    li a3, 65535
    and a3,t5,a3
    add a3,a3,ra
    srai s8,a3,    16
    srai t0,t0,    16
    li ra, 65535
    and ra,t0,ra
    srai t5,t5,    16
    li t0, 65535
    and t0,t5,t0
    add t0,t0,ra
    add t0,t0,s8
    li t5, 65535
    and t0,t0,t5
    li t5, 65535
    and t5,a3,t5
    slli t0,t0,    16
    or t0,t0,t5
    mv	a3,a0 
    mv	a0,a1 
    srai t5,t3,    2
    li a1, 1073741823
    and a1,t5,a1
    andi t5,t3,    3
    slli t5,t5,    30
    or a1,t5,a1
    mv	t3,t1 
    mv	t1,t0 
    addi a4,a4,    1
    j	_forcondBB15
_if_elseBB12:
    xor t0,t3,a1
    xor t5,t0,a0
    li s8, -899497514
    j	_if_end7
_if_thenBB17:
    xor t0,t3,a1
    xor t5,t0,a0
    li s8, 1859775393
    j	_if_end7
_if_thenBB16:
    xori t0,t3,    -1
    and t0,t0,a0
    and t5,t3,a1
    or t5,t5,t0
    li s8, 1518500249
    j	_if_end7
_afterForBB13:
    li t0, 65535
    and t5,t1,t0
    li t0, 65535
    and t0,a5,t0
    add t0,t0,t5
    srai a4,t0,    16
    srai t1,t1,    16
    li t5, 65535
    and t5,t1,t5
    srai t1,a5,    16
    li a5, 65535
    and t1,t1,a5
    add t1,t1,t5
    add t1,t1,a4
    li a5, 65535
    and t1,t1,a5
    li a5, 65535
    and a5,t0,a5
    slli t0,t1,    16
    or a5,t0,a5
    li t0, 65535
    and t0,t3,t0
    li t1, 65535
    and t1,a7,t1
    add t0,t1,t0
    srai a4,t0,    16
    srai t5,t3,    16
    li t1, 65535
    and t5,t5,t1
    srai a7,a7,    16
    li t1, 65535
    and t1,a7,t1
    add t1,t1,t5
    add t5,t1,a4
    li t1, 65535
    and t1,t5,t1
    li t5, 65535
    and t5,t0,t5
    slli t0,t1,    16
    or a7,t0,t5
    li t0, 65535
    and t0,a1,t0
    li t1, 65535
    and t1,t6,t1
    add t0,t1,t0
    srai a4,t0,    16
    srai t1,a1,    16
    li t5, 65535
    and t5,t1,t5
    srai t6,t6,    16
    li t1, 65535
    and t1,t6,t1
    add t1,t1,t5
    add t1,t1,a4
    li t6, 65535
    and t1,t1,t6
    li t6, 65535
    and t6,t0,t6
    slli t0,t1,    16
    or t6,t0,t6
    li t0, 65535
    and t0,a0,t0
    li t1, 65535
    and t1,a6,t1
    add t0,t1,t0
    srai t5,t0,    16
    srai t1,a0,    16
    li a4, 65535
    and a4,t1,a4
    srai t1,a6,    16
    li a6, 65535
    and t1,t1,a6
    add t1,t1,a4
    add t1,t1,t5
    li t5, 65535
    and t1,t1,t5
    li t5, 65535
    and t0,t0,t5
    slli t1,t1,    16
    or a6,t1,t0
    li t0, 65535
    and t0,a3,t0
    li t1, 65535
    and t1,t2,t1
    add t0,t1,t0
    srai a4,t0,    16
    srai t5,a3,    16
    li t1, 65535
    and t3,t5,t1
    srai t5,t2,    16
    li t1, 65535
    and t1,t5,t1
    add t1,t1,t3
    add t1,t1,a4
    li t5, 65535
    and t1,t1,t5
    li t5, 65535
    and t5,t0,t5
    slli t0,t1,    16
    or t2,t0,t5
    addi t4,t4,    1
    j	_forcondBB13
_afterForBB11:
    sw a5,4(s7)
    sw a7,8(s7)
    sw t6,12(s7)
    sw a6,16(s7)
    sw t2,20(s7)
    mv	s8,s7 
    j	afterCallBB7
_forbodyBB11:
    mv	a5,zero 
    j	_forcondBB16
_forcondBB16:
    li t4, 80
    blt	a5,t4,	_forbodyBB16
    j	_forupdateBB5
_forupdateBB5:
    addi t1,t1,    1
    j	_forcondBB11
_forbodyBB16:
    slli t4,t1,    2
    addi t4,t4,    4
    add t4,s0,t4
    lw t6, 0(t4)
    slli t4,a5,    2
    addi t4,t4,    4
    add t6,t6,t4
    li t4, 0
    sw t4,0(t6)
    addi a5,a5,    1
    j	_forcondBB16
__forbodyBB6:
    mv	a0,s8 
    mv	a1,s9 
    call	_stringOrd
    slli t0,s9,    2
    addi t0,t0,    4
    add t0,s4,t0
    sw a0,0(t0)
    addi s9,s9,    1
    j	__forcondBB6
afterCallBB1:
    mv	s5,s3 
    lw s4, 36(sp) 
    lw s3, 0(sp) 
    lw s2, 40(sp) 
    lw s1, 12(sp) 
    lw s0, 4(sp) 
    lw s11, 28(sp) 
    lw s10, 32(sp) 
    lw s9, 20(sp) 
    lw s8, 8(sp) 
    lw s7, 16(sp) 
    lw ra, 24(sp) 
    mv	a0,zero 
    addi sp,sp,    48
    ret
forupdateBB1:
    li a0, 324
    call malloc
    li t0, 80
    sw t0,0(a0)
    sw a0,0(s9)
    addi s9,s9,    4
    j	forcondBB1
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
