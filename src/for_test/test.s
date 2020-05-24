    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -64
    sw ra, 28(sp) 
    sw s10, 40(sp) 
    sw s11, 12(sp) 
    sw s0, 24(sp) 
    sw s1, 20(sp) 
    sw s2, 32(sp) 
    sw s3, 4(sp) 
    sw s4, 16(sp) 
    sw s5, 44(sp) 
    sw s6, 36(sp) 
    sw s7, 0(sp) 
    sw s8, 8(sp) 
    mv	s4,s9 
    la s3,_globalStr2    
    li a0, 404
    call malloc
    mv	s7,a0 
    li a1, 100
    sw a1,0(s7)
    addi s6,s7,    4
    addi s9,s7,    400
forcondBB1:
    ble	s6,s9,	forupdateBB1
afterForBB1:
    mv	s0,s7 
    li a0, 25284
    call malloc
    li a1, 6320
    sw a1,0(a0)
    mv	s5,a0 
    li a0, 24
    call malloc
    li a1, 5
    sw a1,0(a0)
    mv	s10,a0 
_whileBodyBB1:
    call	getInt
    beq	a0,zero,	afterCallBB1
_if_end1:
    li a1, 1
    beq	a0,a1,	_if_thenBB1
_if_elseBB1:
    li a1, 2
    beq	a0,a1,	_if_thenBB2
    j	_whileBodyBB1
_if_thenBB2:
    call	getString
    mv	s1,a0 
    li a0, 24
    call malloc
    li a1, 5
    sw a1,0(a0)
    mv	s11,a0 
    mv	a0,s1 
    call	stringLength
    li a1, 40
    bne	a0,a1,	__if_thenBB1
__if_end1:
    mv	a1,zero 
__forcondBB1:
    li ra, 5
    blt	a1,ra,	__forbodyBB1
__afterForBB1:
    mv	s7,zero 
__forcondBB2:
    li a1, 40
    blt	s7,a1,	__forbodyBB2
__afterForBB2:
    li s7, 1
__forcondBB3:
    li a1, 4
    ble	s7,a1,	__forbodyBB3
__afterForBB3:
    la a0,_globalStr3    
    call	println
    j	_whileBodyBB1
__forbodyBB3:
    mv	a1,zero 
__forcondBB4:
    blt	a1,s7,	__forbodyBB4
__whileBodyBB1:
    mv	a1,s5 
    addi a2,s7,    64
    li ra, 56
    sub ra,a2,ra
    srai ra,ra,    6
    addi a7,ra,    1
    li ra, 100
    bgt	a7,ra,	_if_thenBB3
_if_end2:
    mv	ra,zero 
_forcondBB1:
    blt	ra,a7,	_forbodyBB1
_afterForBB1:
    mv	ra,zero 
_forcondBB2:
    blt	ra,s7,	_forbodyBB2
_afterForBB2:
    li a1, 3
    and a2,ra,a1
    li a1, 3
    sub a1,a1,a2
    slli a2,a1,    3
    li a1, 128
    sll t4,a1,a2
    srai a1,ra,    6
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,s0,a1
    li a2, 63
    and a2,ra,a2
    srai a2,a2,    2
    lw a1, 0(a1)
    slli a2,a2,    2
    addi a2,a2,    4
    add a1,a1,a2
    lw a1, 0(a1)
    or a2,a1,t4
    srai a1,ra,    6
    slli a1,a1,    2
    addi a1,a1,    4
    add t4,s0,a1
    li a1, 63
    and a1,ra,a1
    srai a1,a1,    2
    lw ra, 0(t4)
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,ra,a1
    sw a2,0(a1)
    slli a1,s7,    3
    li ra, 1
    sub ra,a7,ra
    slli ra,ra,    2
    addi ra,ra,    4
    add ra,s0,ra
    lw ra, 0(ra)
    sw a1,64(ra)
    srai a1,s7,    29
    andi ra,a1,    7
    li a1, 1
    sub a1,a7,a1
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,s0,a1
    lw a1, 0(a1)
    sw ra,60(a1)
    li a1, -271733879
    li a4, -1009589776
    li a5, 271733878
    li a2, -1732584194
    mv	a3,zero 
    li t3, 1732584193
_forcondBB3:
    blt	a3,a7,	_forbodyBB3
_afterForBB3:
    sw t3,4(s10)
    sw a1,8(s10)
    sw a2,12(s10)
    sw a5,16(s10)
    sw a4,20(s10)
    mv	ra,s10 
afterCallBB2:
    mv	a1,s11 
    lw a2, 0(a1)
    lw t4, 0(ra)
    bne	t4,a2,	_if_thenBB4
_if_end3:
    mv	a2,zero 
_forcondBB4:
    lw t4, 0(ra)
    blt	a2,t4,	_forbodyBB4
_afterForBB4:
    li a1, 1
afterCallBB3:
    bne	a1, zero, __if_thenBB2
__if_end2:
    mv	a1,s5 
    li ra, 1
    sub ra,s7,ra
_forcondBB5:
    bge	ra,zero,	_forbodyBB5
_afterForBB5:
    mv	a1,zero 
afterCallBB4:
    bne	a1, zero, __whileBodyBB1
__forupdateBB1:
    addi s7,s7,    1
    j	__forcondBB3
_forbodyBB5:
    slli a2,ra,    2
    addi a2,a2,    4
    add a2,a1,a2
    lw a2, 0(a2)
    li t4, 122
    beq	a2,t4,	__if_thenBB3
__if_end3:
    li t4, 90
    beq	a2,t4,	__if_thenBB4
__if_end4:
    li t4, 57
    beq	a2,t4,	__if_thenBB5
__if_end5:
    addi a2,a2,    1
_afterCallBB1:
    slli t4,ra,    2
    addi t4,t4,    4
    add t4,a1,t4
    sw a2,0(t4)
    slli a2,ra,    2
    addi a2,a2,    4
    add a2,a1,a2
    lw a2, 0(a2)
    li t4, -1
    beq	a2,t4,	_if_thenBB5
_if_elseBB2:
    li a1, 1
    j	afterCallBB4
_if_thenBB5:
    slli a2,ra,    2
    addi a2,a2,    4
    add t4,a1,a2
    li a2, 48
    sw a2,0(t4)
    li a2, 1
    sub ra,ra,a2
    j	_forcondBB5
__if_thenBB5:
    li a2, 65
    j	_afterCallBB1
__if_thenBB4:
    li a2, 97
    j	_afterCallBB1
__if_thenBB3:
    li a2, -1
    j	_afterCallBB1
__if_thenBB2:
    mv	s6,zero 
__forcondBB5:
    blt	s6,s7,	__forbodyBB5
__afterForBB4:
    la a0,_globalStr0    
    call	println
    j	_whileBodyBB1
__forbodyBB5:
    slli a1,s6,    2
    addi a1,a1,    4
    add a1,s5,a1
    lw ra, 0(a1)
    li a1, 32
    bge	ra,a1,	_ifTrue1
_if_end4:
    la a0,_globalStr0    
afterCallBB5:
    call	print
    addi s6,s6,    1
    j	__forcondBB5
_ifTrue1:
    li a1, 126
    ble	ra,a1,	_if_thenBB6
    j	_if_end4
_if_thenBB6:
    li a1, 32
    sub a1,ra,a1
    li a2, 31
    sub a2,ra,a2
    mv	a0,s3 
    call	_stringSubstring
    j	afterCallBB5
_forbodyBB4:
    slli t4,a2,    2
    addi t4,t4,    4
    add t4,a1,t4
    slli a5,a2,    2
    addi a5,a5,    4
    add a5,ra,a5
    lw a5, 0(a5)
    lw t4, 0(t4)
    bne	a5,t4,	_if_thenBB7
_forupdateBB1:
    addi a2,a2,    1
    j	_forcondBB4
_if_thenBB7:
    mv	a1,zero 
    j	afterCallBB3
_if_thenBB4:
    mv	a1,zero 
    j	afterCallBB3
_forbodyBB3:
    li t4, 16
_forcondBB6:
    li ra, 80
    blt	t4,ra,	_forbodyBB6
_afterForBB6:
    mv	t0,a4 
    mv	ra,a1 
    mv	a0,a2 
    mv	a6,t3 
    mv	t1,a5 
    mv	t2,zero 
_forcondBB7:
    li t4, 80
    blt	t2,t4,	_forbodyBB7
_afterForBB7:
    li t4, 65535
    and t4,a6,t4
    li t2, 65535
    and t2,t3,t2
    add t4,t2,t4
    srai t2,t4,    16
    srai a6,a6,    16
    li t5, 65535
    and t5,a6,t5
    srai a6,t3,    16
    li t3, 65535
    and t3,a6,t3
    add t3,t3,t5
    add t3,t3,t2
    li a6, 65535
    and t3,t3,a6
    li a6, 65535
    and a6,t4,a6
    slli t4,t3,    16
    or t3,t4,a6
    li t4, 65535
    and a6,ra,t4
    li t4, 65535
    and t4,a1,t4
    add t4,t4,a6
    srai a6,t4,    16
    srai ra,ra,    16
    li t2, 65535
    and ra,ra,t2
    srai a1,a1,    16
    li t2, 65535
    and a1,a1,t2
    add a1,a1,ra
    add a1,a1,a6
    li ra, 65535
    and a1,a1,ra
    li ra, 65535
    and ra,t4,ra
    slli a1,a1,    16
    or a1,a1,ra
    li ra, 65535
    and ra,a0,ra
    li t4, 65535
    and t4,a2,t4
    add t4,t4,ra
    srai ra,t4,    16
    srai a0,a0,    16
    li a6, 65535
    and a6,a0,a6
    srai a2,a2,    16
    li a0, 65535
    and a2,a2,a0
    add a2,a2,a6
    add a2,a2,ra
    li ra, 65535
    and ra,a2,ra
    li a2, 65535
    and a2,t4,a2
    slli ra,ra,    16
    or a2,ra,a2
    li ra, 65535
    and t4,t1,ra
    li ra, 65535
    and ra,a5,ra
    add t4,ra,t4
    srai a6,t4,    16
    srai ra,t1,    16
    li t1, 65535
    and t1,ra,t1
    srai ra,a5,    16
    li a5, 65535
    and ra,ra,a5
    add ra,ra,t1
    add ra,ra,a6
    li a5, 65535
    and ra,ra,a5
    li a5, 65535
    and t4,t4,a5
    slli ra,ra,    16
    or a5,ra,t4
    li ra, 65535
    and ra,t0,ra
    li t4, 65535
    and t4,a4,t4
    add ra,t4,ra
    srai t1,ra,    16
    srai t4,t0,    16
    li a6, 65535
    and a6,t4,a6
    srai a4,a4,    16
    li t4, 65535
    and t4,a4,t4
    add t4,t4,a6
    add t4,t4,t1
    li t1, 65535
    and t4,t4,t1
    li t1, 65535
    and t1,ra,t1
    slli ra,t4,    16
    or a4,ra,t1
    addi a3,a3,    1
    j	_forcondBB3
_forbodyBB7:
    li t4, 20
    blt	t2,t4,	_if_thenBB8
_if_elseBB3:
    li t4, 40
    blt	t2,t4,	_if_thenBB9
_if_elseBB4:
    li t4, 60
    blt	t2,t4,	_if_thenBB10
_if_elseBB5:
    xor t4,ra,a0
    xor t5,t4,t1
    li t4, -899497514
_if_end5:
    srai t6,a6,    27
    andi t6,t6,    31
    li s6, 134217727
    and s6,a6,s6
    slli s6,s6,    5
    or s6,s6,t6
    li t6, 65535
    and s9,t0,t6
    li t6, 65535
    and t6,s6,t6
    add t6,t6,s9
    srai s9,t6,    16
    srai s1,t0,    16
    li t0, 65535
    and s1,s1,t0
    srai t0,s6,    16
    li s6, 65535
    and t0,t0,s6
    add t0,t0,s1
    add s6,t0,s9
    li t0, 65535
    and t0,s6,t0
    li s6, 65535
    and t6,t6,s6
    slli t0,t0,    16
    or t6,t0,t6
    li t0, 65535
    and s6,t4,t0
    li t0, 65535
    and t0,t5,t0
    add t0,t0,s6
    srai s6,t0,    16
    srai s9,t4,    16
    li t4, 65535
    and s9,s9,t4
    srai t5,t5,    16
    li t4, 65535
    and t4,t5,t4
    add t4,t4,s9
    add t5,t4,s6
    li t4, 65535
    and t4,t5,t4
    li t5, 65535
    and t0,t0,t5
    slli t4,t4,    16
    or t4,t4,t0
    li t0, 65535
    and t5,t4,t0
    li t0, 65535
    and t0,t6,t0
    add t0,t0,t5
    srai s6,t0,    16
    srai t5,t4,    16
    li t4, 65535
    and s9,t5,t4
    srai t5,t6,    16
    li t4, 65535
    and t4,t5,t4
    add t4,t4,s9
    add t4,t4,s6
    li t5, 65535
    and t4,t4,t5
    li t5, 65535
    and t0,t0,t5
    slli t4,t4,    16
    or t5,t4,t0
    slli t4,a3,    2
    addi t4,t4,    4
    add t4,s0,t4
    lw t4, 0(t4)
    slli t0,t2,    2
    addi t0,t0,    4
    add t4,t4,t0
    lw t4, 0(t4)
    li t0, 65535
    and t0,t4,t0
    li t6, 65535
    and t6,t5,t6
    add t0,t6,t0
    srai t6,t0,    16
    srai s6,t4,    16
    li t4, 65535
    and t4,s6,t4
    srai t5,t5,    16
    li s6, 65535
    and t5,t5,s6
    add t4,t5,t4
    add t4,t4,t6
    li t5, 65535
    and t4,t4,t5
    li t5, 65535
    and t0,t0,t5
    slli t4,t4,    16
    or t4,t4,t0
    mv	t0,t1 
    mv	t1,a0 
    srai t5,ra,    2
    li a0, 1073741823
    and a0,t5,a0
    andi ra,ra,    3
    slli ra,ra,    30
    or a0,ra,a0
    mv	ra,a6 
    addi t2,t2,    1
    mv	a6,t4 
    j	_forcondBB7
_if_thenBB10:
    and t4,a0,t1
    and t5,ra,t1
    and t6,ra,a0
    or t5,t6,t5
    or t5,t5,t4
    li t4, -1894007588
    j	_if_end5
_if_thenBB9:
    xor t4,ra,a0
    xor t5,t4,t1
    li t4, 1859775393
    j	_if_end5
_if_thenBB8:
    xori t4,ra,    -1
    and t5,t4,t1
    and t4,ra,a0
    or t5,t4,t5
    li t4, 1518500249
    j	_if_end5
_forbodyBB6:
    slli ra,a3,    2
    addi ra,ra,    4
    add t1,s0,ra
    li ra, 16
    sub ra,t4,ra
    lw t1, 0(t1)
    slli ra,ra,    2
    addi ra,ra,    4
    add a6,t1,ra
    slli ra,a3,    2
    addi ra,ra,    4
    add a0,s0,ra
    li ra, 14
    sub t1,t4,ra
    lw ra, 0(a0)
    slli t1,t1,    2
    addi t1,t1,    4
    add t1,ra,t1
    slli ra,a3,    2
    addi ra,ra,    4
    add ra,s0,ra
    li a0, 8
    sub a0,t4,a0
    lw ra, 0(ra)
    slli a0,a0,    2
    addi a0,a0,    4
    add t2,ra,a0
    slli ra,a3,    2
    addi ra,ra,    4
    add a0,s0,ra
    li ra, 3
    sub t0,t4,ra
    lw ra, 0(a0)
    slli a0,t0,    2
    addi a0,a0,    4
    add ra,ra,a0
    lw a0, 0(ra)
    lw ra, 0(t2)
    xor a0,a0,ra
    lw ra, 0(t1)
    xor ra,a0,ra
    lw t1, 0(a6)
    xor ra,ra,t1
    srai t1,ra,    31
    andi a6,t1,    1
    li t1, 2147483647
    and ra,ra,t1
    slli ra,ra,    1
    or ra,ra,a6
    slli t1,a3,    2
    addi t1,t1,    4
    add t1,s0,t1
    lw a6, 0(t1)
    slli t1,t4,    2
    addi t1,t1,    4
    add t1,a6,t1
    sw ra,0(t1)
    addi t4,t4,    1
    j	_forcondBB6
_forbodyBB2:
    li a2, 3
    and t4,ra,a2
    li a2, 3
    sub a2,a2,t4
    slli t4,a2,    3
    slli a2,ra,    2
    addi a2,a2,    4
    add a2,a1,a2
    lw a2, 0(a2)
    sll a5,a2,t4
    srai a2,ra,    6
    slli a2,a2,    2
    addi a2,a2,    4
    add t4,s0,a2
    li a2, 63
    and a2,ra,a2
    srai a2,a2,    2
    lw t4, 0(t4)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,t4,a2
    lw a2, 0(a2)
    or a5,a2,a5
    srai a2,ra,    6
    slli a2,a2,    2
    addi a2,a2,    4
    add t4,s0,a2
    li a2, 63
    and a2,ra,a2
    srai a2,a2,    2
    lw t4, 0(t4)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,t4,a2
    sw a5,0(a2)
    addi ra,ra,    1
    j	_forcondBB2
_forbodyBB1:
    mv	a2,zero 
_forcondBB8:
    li t4, 80
    blt	a2,t4,	_forbodyBB8
_forupdateBB2:
    addi ra,ra,    1
    j	_forcondBB1
_forbodyBB8:
    slli t4,ra,    2
    addi t4,t4,    4
    add t4,s0,t4
    lw t4, 0(t4)
    slli a5,a2,    2
    addi a5,a5,    4
    add a5,t4,a5
    li t4, 0
    sw t4,0(a5)
    addi a2,a2,    1
    j	_forcondBB8
_if_thenBB3:
    la a0,_globalStr4    
    call	println
    mv	ra,zero 
    j	afterCallBB2
__forbodyBB4:
    slli ra,a1,    2
    addi ra,ra,    4
    add a2,s5,ra
    li ra, 48
    sw ra,0(a2)
    addi a1,a1,    1
    j	__forcondBB4
__forbodyBB2:
    srai ra,s7,    2
    li a1, 1
    and ra,ra,a1
    li a1, 1
    sub a1,a1,ra
    slli s6,a1,    4
    addi a2,s7,    4
    mv	a0,s1 
    mv	a1,s7 
    call	_stringSubstring
    mv	s2,a0 
    mv	s9,zero 
    mv	s8,zero 
_forcondBB9:
    mv	a0,s2 
    call	stringLength
    blt	s9,a0,	_forbodyBB9
_afterForBB8:
    mv	a1,s8 
afterCallBB6:
    sll ra,a1,s6
    srai a1,s7,    3
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,s11,a1
    lw a1, 0(a1)
    or ra,a1,ra
    srai a1,s7,    3
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,s11,a1
    sw ra,0(a1)
    addi a1,s7,    4
    mv	s7,a1 
    j	__forcondBB2
_forbodyBB9:
    mv	a0,s2 
    mv	a1,s9 
    call	_stringOrd
    li a1, 48
    bge	a0,a1,	_ifTrue2
_if_elseBB6:
    li a1, 65
    bge	a0,a1,	_ifTrue3
_if_elseBB7:
    li a1, 97
    bge	a0,a1,	_ifTrue4
_if_elseBB8:
    mv	a1,zero 
    j	afterCallBB6
_ifTrue4:
    li a1, 102
    ble	a0,a1,	_if_thenBB11
    j	_if_elseBB8
_if_thenBB11:
    slli a1,s8,    4
    add a1,a1,a0
    li ra, 97
    sub a1,a1,ra
    addi a1,a1,    10
_forupdateBB3:
    addi ra,s9,    1
    mv	s9,ra 
    mv	s8,a1 
    j	_forcondBB9
_ifTrue3:
    li a1, 70
    ble	a0,a1,	_if_thenBB12
    j	_if_elseBB7
_if_thenBB12:
    slli a1,s8,    4
    add ra,a1,a0
    li a1, 65
    sub a1,ra,a1
    addi a1,a1,    10
    j	_forupdateBB3
_ifTrue2:
    li a1, 57
    ble	a0,a1,	_if_thenBB13
    j	_if_elseBB6
_if_thenBB13:
    slli a1,s8,    4
    add ra,a1,a0
    li a1, 48
    sub a1,ra,a1
    j	_forupdateBB3
__forbodyBB1:
    slli ra,a1,    2
    addi ra,ra,    4
    add a2,s11,ra
    li ra, 0
    sw ra,0(a2)
    addi a1,a1,    1
    j	__forcondBB1
__if_thenBB1:
    la a0,_globalStr1    
    call	println
    j	_whileBodyBB1
_if_thenBB1:
    call	getString
    mv	s7,a0 
    mv	s6,zero 
__forcondBB6:
    mv	a0,s7 
    call	stringLength
    blt	s6,a0,	__forbodyBB6
__afterForBB5:
    mv	a0,s7 
    call	stringLength
    mv	a1,s5 
    addi ra,a0,    64
    li a2, 56
    sub ra,ra,a2
    srai ra,ra,    6
    addi a3,ra,    1
    li ra, 100
    bgt	a3,ra,	_if_thenBB14
_if_end6:
    mv	ra,zero 
_forcondBB10:
    blt	ra,a3,	_forbodyBB10
_afterForBB9:
    mv	ra,zero 
_forcondBB11:
    blt	ra,a0,	_forbodyBB11
_afterForBB10:
    li a1, 3
    and a2,ra,a1
    li a1, 3
    sub a1,a1,a2
    slli a1,a1,    3
    li a2, 128
    sll t4,a2,a1
    srai a1,ra,    6
    slli a1,a1,    2
    addi a1,a1,    4
    add a2,s0,a1
    li a1, 63
    and a1,ra,a1
    srai a1,a1,    2
    lw a2, 0(a2)
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,a2,a1
    lw a1, 0(a1)
    or t4,a1,t4
    srai a1,ra,    6
    slli a1,a1,    2
    addi a1,a1,    4
    add a2,s0,a1
    li a1, 63
    and a1,ra,a1
    srai a1,a1,    2
    lw ra, 0(a2)
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,ra,a1
    sw t4,0(a1)
    slli ra,a0,    3
    li a1, 1
    sub a1,a3,a1
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,s0,a1
    lw a1, 0(a1)
    sw ra,64(a1)
    srai a1,a0,    29
    andi ra,a1,    7
    li a1, 1
    sub a1,a3,a1
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,s0,a1
    lw a1, 0(a1)
    sw ra,60(a1)
    li a7, -1732584194
    li a6, 271733878
    mv	a5,zero 
    li ra, 1732584193
    li t3, -271733879
    li a1, -1009589776
_forcondBB12:
    blt	a5,a3,	_forbodyBB12
_afterForBB11:
    sw ra,4(s10)
    sw t3,8(s10)
    sw a7,12(s10)
    sw a6,16(s10)
    sw a1,20(s10)
    mv	s9,s10 
afterCallBB7:
    mv	s1,zero 
__forcondBB7:
    lw a1, 0(s9)
    blt	s1,a1,	__forbodyBB7
_afterCallBB2:
    la a0,_globalStr0    
    call	println
    j	_whileBodyBB1
__forbodyBB7:
    slli a1,s1,    2
    addi a1,a1,    4
    add a1,s9,a1
    lw s6, 0(a1)
    la s7,_globalStr0    
    li s11, 28
_forcondBB13:
    bge	s11,zero,	_forbodyBB13
afterCallBB8:
    mv	a0,s7 
    call	print
    addi s1,s1,    1
    j	__forcondBB7
_forbodyBB13:
    sra a1,s6,s11
    andi a1,a1,    15
    li ra, 10
    blt	a1,ra,	_if_thenBB15
_if_elseBB9:
    addi ra,a1,    65
    li a1, 10
    sub ra,ra,a1
    li a1, 32
    bge	ra,a1,	__ifTrue1
__if_end6:
    la a1,_globalStr0    
_afterCallBB3:
    mv	a0,s7 
    call	_stringAdd
_forupdateBB4:
    li a1, 4
    sub s11,s11,a1
    mv	s7,a0 
    j	_forcondBB13
__ifTrue1:
    li a1, 126
    ble	ra,a1,	__if_thenBB6
    j	__if_end6
__if_thenBB6:
    li a1, 32
    sub a1,ra,a1
    li a2, 31
    sub a2,ra,a2
    mv	a0,s3 
    call	_stringSubstring
    mv	a1,a0 
    j	_afterCallBB3
_if_thenBB15:
    addi ra,a1,    48
    li a1, 32
    bge	ra,a1,	__ifTrue2
__if_end7:
    la a1,_globalStr0    
_afterCallBB4:
    mv	a0,s7 
    call	_stringAdd
    j	_forupdateBB4
__ifTrue2:
    li a1, 126
    ble	ra,a1,	__if_thenBB7
    j	__if_end7
__if_thenBB7:
    li a1, 32
    sub a1,ra,a1
    li a2, 31
    sub a2,ra,a2
    mv	a0,s3 
    call	_stringSubstring
    mv	a1,a0 
    j	_afterCallBB4
_forbodyBB12:
    li t4, 16
_forcondBB14:
    li a2, 80
    blt	t4,a2,	_forbodyBB14
_afterForBB12:
    mv	t0,a7 
    mv	t2,a6 
    mv	a0,t3 
    mv	t4,a1 
    mv	a2,ra 
    mv	a4,zero 
_forcondBB15:
    li t1, 80
    blt	a4,t1,	_forbodyBB15
_afterForBB13:
    li t1, 65535
    and a4,a2,t1
    li t1, 65535
    and t1,ra,t1
    add t1,t1,a4
    srai t5,t1,    16
    srai a2,a2,    16
    li a4, 65535
    and a2,a2,a4
    srai ra,ra,    16
    li a4, 65535
    and ra,ra,a4
    add ra,ra,a2
    add a2,ra,t5
    li ra, 65535
    and ra,a2,ra
    li a2, 65535
    and a2,t1,a2
    slli ra,ra,    16
    or ra,ra,a2
    li a2, 65535
    and t1,a0,a2
    li a2, 65535
    and a2,t3,a2
    add a2,a2,t1
    srai a4,a2,    16
    srai t1,a0,    16
    li a0, 65535
    and t1,t1,a0
    srai a0,t3,    16
    li t3, 65535
    and t3,a0,t3
    add t1,t3,t1
    add a4,t1,a4
    li t1, 65535
    and t1,a4,t1
    li a4, 65535
    and a4,a2,a4
    slli a2,t1,    16
    or t3,a2,a4
    li a2, 65535
    and t1,t0,a2
    li a2, 65535
    and a2,a7,a2
    add a2,a2,t1
    srai a0,a2,    16
    srai a4,t0,    16
    li t1, 65535
    and t1,a4,t1
    srai a4,a7,    16
    li a7, 65535
    and a4,a4,a7
    add t1,a4,t1
    add t1,t1,a0
    li a4, 65535
    and t1,t1,a4
    li a4, 65535
    and a2,a2,a4
    slli t1,t1,    16
    or a7,t1,a2
    li a2, 65535
    and t1,t2,a2
    li a2, 65535
    and a2,a6,a2
    add t1,a2,t1
    srai a0,t1,    16
    srai a2,t2,    16
    li a4, 65535
    and a4,a2,a4
    srai a2,a6,    16
    li a6, 65535
    and a2,a2,a6
    add a2,a2,a4
    add a2,a2,a0
    li a4, 65535
    and a2,a2,a4
    li a4, 65535
    and t1,t1,a4
    slli a2,a2,    16
    or a6,a2,t1
    li a2, 65535
    and t1,t4,a2
    li a2, 65535
    and a2,a1,a2
    add a2,a2,t1
    srai t1,a2,    16
    srai a4,t4,    16
    li t4, 65535
    and t4,a4,t4
    srai a4,a1,    16
    li a1, 65535
    and a1,a4,a1
    add a1,a1,t4
    add t4,a1,t1
    li a1, 65535
    and a1,t4,a1
    li t4, 65535
    and a2,a2,t4
    slli a1,a1,    16
    or a1,a1,a2
    addi a5,a5,    1
    j	_forcondBB12
_forbodyBB15:
    li t1, 20
    blt	a4,t1,	_if_thenBB16
_if_elseBB10:
    li t1, 40
    blt	a4,t1,	_if_thenBB17
_if_elseBB11:
    li t1, 60
    blt	a4,t1,	_if_thenBB18
_if_elseBB12:
    xor t1,a0,t0
    xor t6,t1,t2
    li s7, -899497514
_if_end7:
    srai t1,a2,    27
    andi t5,t1,    31
    li t1, 134217727
    and t1,a2,t1
    slli t1,t1,    5
    or t1,t1,t5
    li t5, 65535
    and s6,t4,t5
    li t5, 65535
    and t5,t1,t5
    add t5,t5,s6
    srai s6,t5,    16
    srai s9,t4,    16
    li t4, 65535
    and s9,s9,t4
    srai t4,t1,    16
    li t1, 65535
    and t4,t4,t1
    add t4,t4,s9
    add t1,t4,s6
    li t4, 65535
    and t4,t1,t4
    li t1, 65535
    and t1,t5,t1
    slli t4,t4,    16
    or t4,t4,t1
    li t1, 65535
    and t1,s7,t1
    li t5, 65535
    and t5,t6,t5
    add t1,t5,t1
    srai t5,t1,    16
    srai s7,s7,    16
    li s6, 65535
    and s6,s7,s6
    srai s7,t6,    16
    li t6, 65535
    and t6,s7,t6
    add t6,t6,s6
    add t5,t6,t5
    li t6, 65535
    and t5,t5,t6
    li t6, 65535
    and t1,t1,t6
    slli t5,t5,    16
    or t1,t5,t1
    li t5, 65535
    and t6,t1,t5
    li t5, 65535
    and t5,t4,t5
    add t5,t5,t6
    srai t6,t5,    16
    srai t1,t1,    16
    li s7, 65535
    and s7,t1,s7
    srai t1,t4,    16
    li t4, 65535
    and t4,t1,t4
    add t4,t4,s7
    add t4,t4,t6
    li t1, 65535
    and t4,t4,t1
    li t1, 65535
    and t1,t5,t1
    slli t4,t4,    16
    or t1,t4,t1
    slli t4,a5,    2
    addi t4,t4,    4
    add t4,s0,t4
    lw t5, 0(t4)
    slli t4,a4,    2
    addi t4,t4,    4
    add t4,t5,t4
    lw t5, 0(t4)
    li t4, 65535
    and t6,t5,t4
    li t4, 65535
    and t4,t1,t4
    add t4,t4,t6
    srai s7,t4,    16
    srai t5,t5,    16
    li t6, 65535
    and t5,t5,t6
    srai t6,t1,    16
    li t1, 65535
    and t1,t6,t1
    add t1,t1,t5
    add t5,t1,s7
    li t1, 65535
    and t1,t5,t1
    li t5, 65535
    and t5,t4,t5
    slli t4,t1,    16
    or t1,t4,t5
    mv	t5,t0 
    srai t0,a0,    2
    li t4, 1073741823
    and t0,t0,t4
    andi t4,a0,    3
    slli t4,t4,    30
    or t0,t4,t0
    addi a4,a4,    1
    mv	a0,a2 
    mv	t4,t2 
    mv	t2,t5 
    mv	a2,t1 
    j	_forcondBB15
_if_thenBB18:
    and t5,t0,t2
    and t1,a0,t2
    and t6,a0,t0
    or t1,t6,t1
    or t6,t1,t5
    li s7, -1894007588
    j	_if_end7
_if_thenBB17:
    xor t1,a0,t0
    xor t6,t1,t2
    li s7, 1859775393
    j	_if_end7
_if_thenBB16:
    xori t1,a0,    -1
    and t5,t1,t2
    and t1,a0,t0
    or t6,t1,t5
    li s7, 1518500249
    j	_if_end7
_forbodyBB14:
    slli a2,a5,    2
    addi a2,a2,    4
    add t1,s0,a2
    li a2, 16
    sub a2,t4,a2
    lw t1, 0(t1)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,t1,a2
    slli t1,a5,    2
    addi t1,t1,    4
    add a4,s0,t1
    li t1, 14
    sub t1,t4,t1
    lw a4, 0(a4)
    slli t1,t1,    2
    addi t1,t1,    4
    add a0,a4,t1
    slli t1,a5,    2
    addi t1,t1,    4
    add a4,s0,t1
    li t1, 8
    sub t1,t4,t1
    lw a4, 0(a4)
    slli t1,t1,    2
    addi t1,t1,    4
    add a4,a4,t1
    slli t1,a5,    2
    addi t1,t1,    4
    add t1,s0,t1
    li t2, 3
    sub t0,t4,t2
    lw t2, 0(t1)
    slli t1,t0,    2
    addi t1,t1,    4
    add t1,t2,t1
    lw t1, 0(t1)
    lw a4, 0(a4)
    xor t1,t1,a4
    lw a4, 0(a0)
    xor t1,t1,a4
    lw a2, 0(a2)
    xor a2,t1,a2
    srai t1,a2,    31
    andi t1,t1,    1
    li a4, 2147483647
    and a2,a2,a4
    slli a2,a2,    1
    or a2,a2,t1
    slli t1,a5,    2
    addi t1,t1,    4
    add t1,s0,t1
    lw t1, 0(t1)
    slli a4,t4,    2
    addi a4,a4,    4
    add t1,t1,a4
    sw a2,0(t1)
    addi t4,t4,    1
    j	_forcondBB14
_forbodyBB11:
    li a2, 3
    and t4,ra,a2
    li a2, 3
    sub a2,a2,t4
    slli a2,a2,    3
    slli t4,ra,    2
    addi t4,t4,    4
    add t4,a1,t4
    lw t4, 0(t4)
    sll t4,t4,a2
    srai a2,ra,    6
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,s0,a2
    li a5, 63
    and a5,ra,a5
    srai a5,a5,    2
    lw a2, 0(a2)
    slli a5,a5,    2
    addi a5,a5,    4
    add a2,a2,a5
    lw a2, 0(a2)
    or a5,a2,t4
    srai a2,ra,    6
    slli a2,a2,    2
    addi a2,a2,    4
    add t4,s0,a2
    li a2, 63
    and a2,ra,a2
    srai a2,a2,    2
    lw t4, 0(t4)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,t4,a2
    sw a5,0(a2)
    addi ra,ra,    1
    j	_forcondBB11
_forbodyBB10:
    mv	a2,zero 
_forcondBB16:
    li t4, 80
    blt	a2,t4,	_forbodyBB16
_forupdateBB5:
    addi ra,ra,    1
    j	_forcondBB10
_forbodyBB16:
    slli t4,ra,    2
    addi t4,t4,    4
    add t4,s0,t4
    lw t4, 0(t4)
    slli a5,a2,    2
    addi a5,a5,    4
    add a5,t4,a5
    li t4, 0
    sw t4,0(a5)
    addi a2,a2,    1
    j	_forcondBB16
_if_thenBB14:
    la a0,_globalStr4    
    call	println
    mv	s9,zero 
    j	afterCallBB7
__forbodyBB6:
    mv	a0,s7 
    mv	a1,s6 
    call	_stringOrd
    slli a1,s6,    2
    addi a1,a1,    4
    add a1,s5,a1
    sw a0,0(a1)
    addi s6,s6,    1
    j	__forcondBB6
afterCallBB1:
    mv	s9,s4 
    lw s8, 8(sp) 
    lw s7, 0(sp) 
    lw s6, 36(sp) 
    lw s5, 44(sp) 
    lw s4, 16(sp) 
    lw s3, 4(sp) 
    lw s2, 32(sp) 
    lw s1, 20(sp) 
    lw s0, 24(sp) 
    lw s11, 12(sp) 
    lw s10, 40(sp) 
    lw ra, 28(sp) 
    mv	a0,zero 
    addi sp,sp,    64
    ret
forupdateBB1:
    li a0, 324
    call malloc
    li a1, 80
    sw a1,0(a0)
    sw a0,0(s6)
    addi s6,s6,    4
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
