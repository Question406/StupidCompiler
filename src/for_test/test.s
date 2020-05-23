    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -48
    sw ra, 12(sp) 
    sw s11, 36(sp) 
    sw s10, 32(sp) 
    sw s9, 0(sp) 
    sw s8, 28(sp) 
    sw s7, 40(sp) 
    sw s6, 8(sp) 
    sw s5, 24(sp) 
    sw s4, 16(sp) 
    sw s3, 4(sp) 
    sw s2, 20(sp) 
    mv	s7,s1 
    li a0, 404
    call malloc
    mv	s2,a0 
    li a7, 100
    sw a7,0(s2)
    addi s10,s2,    4
    addi s9,s2,    400
    j	forcondBB1
forcondBB1:
    ble	s10,s9,	forupdateBB1
    j	afterForBB1
afterForBB1:
    mv	s9,s2 
    li a0, 25284
    call malloc
    li a7, 6320
    sw a7,0(a0)
    mv	s6,a0 
    li a0, 24
    call malloc
    li a7, 5
    sw a7,0(a0)
    mv	s8,a0 
    j	_whileBodyBB1
_whileBodyBB1:
    call	getInt
    beq	a0,zero,	afterCallBB1
    j	_if_end1
afterCallBB1:
    mv	s1,s7 
    lw s2, 20(sp) 
    lw s3, 4(sp) 
    lw s4, 16(sp) 
    lw s5, 24(sp) 
    lw s6, 8(sp) 
    lw s7, 40(sp) 
    lw s8, 28(sp) 
    lw s9, 0(sp) 
    lw s10, 32(sp) 
    lw s11, 36(sp) 
    lw ra, 12(sp) 
    mv	a0,zero 
    addi sp,sp,    48
    ret
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
    mv	s5,a0 
    li a0, 24
    call malloc
    li a7, 5
    sw a7,0(a0)
    mv	s1,a0 
    mv	a0,s5 
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
    li t2, 5
    blt	a7,t2,	__forbodyBB1
    j	__afterForBB1
__afterForBB1:
    mv	s11,zero 
    j	__forcondBB2
__forcondBB2:
    li a7, 40
    blt	s11,a7,	__forbodyBB2
    j	__afterForBB2
__afterForBB2:
    li s2, 1
    j	__forcondBB3
__forcondBB3:
    li a7, 4
    ble	s2,a7,	__forbodyBB3
    j	__afterForBB3
__afterForBB3:
    la a0,_globalStr3    
    call	println
    j	_whileBodyBB1
__forbodyBB3:
    mv	a7,zero 
    j	__forcondBB4
__forcondBB4:
    blt	a7,s2,	__forbodyBB4
    j	__whileBodyBB1
__whileBodyBB1:
    mv	a7,s6 
    addi t2,s2,    64
    li a5, 56
    sub t2,t2,a5
    srai t2,t2,    6
    addi t5,t2,    1
    li t2, 100
    bgt	t5,t2,	_if_thenBB3
    j	_if_end2
_if_end2:
    mv	t2,zero 
    j	_forcondBB1
_forcondBB1:
    blt	t2,t5,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	t2,zero 
    j	_forcondBB2
_forcondBB2:
    blt	t2,s2,	_forbodyBB2
    j	_afterForBB2
_forbodyBB2:
    li a5, 4
    rem t6,t2,a5
    li a5, 3
    sub a5,a5,t6
    slli t6,a5,    3
    slli a5,t2,    2
    addi a5,a5,    4
    add a5,a7,a5
    lw a5, 0(a5)
    sll t6,a5,t6
    srai a5,t2,    6
    slli a5,a5,    2
    addi a5,a5,    4
    add t0,s9,a5
    li a5, 64
    rem a5,t2,a5
    srai a5,a5,    2
    lw t0, 0(t0)
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,t0,a5
    lw a5, 0(a5)
    or t0,a5,t6
    srai a5,t2,    6
    slli a5,a5,    2
    addi a5,a5,    4
    add t4,s9,a5
    li a5, 64
    rem a5,t2,a5
    srai t6,a5,    2
    lw a5, 0(t4)
    slli t6,t6,    2
    addi t6,t6,    4
    add a5,a5,t6
    sw t0,0(a5)
    addi t2,t2,    1
    j	_forcondBB2
_afterForBB2:
    li a7, 4
    rem a7,t2,a7
    li a5, 3
    sub a7,a5,a7
    slli a7,a7,    3
    li a5, 128
    sll a5,a5,a7
    srai a7,t2,    6
    slli a7,a7,    2
    addi a7,a7,    4
    add t6,s9,a7
    li a7, 64
    rem a7,t2,a7
    srai a7,a7,    2
    lw t6, 0(t6)
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,t6,a7
    lw a7, 0(a7)
    or t6,a7,a5
    srai a7,t2,    6
    slli a7,a7,    2
    addi a7,a7,    4
    add a5,s9,a7
    li a7, 64
    rem a7,t2,a7
    srai a7,a7,    2
    lw t2, 0(a5)
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,t2,a7
    sw t6,0(a7)
    slli t2,s2,    3
    li a7, 1
    sub a7,t5,a7
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,s9,a7
    lw a7, 0(a7)
    sw t2,64(a7)
    srai a7,s2,    29
    andi t2,a7,    7
    li a7, 1
    sub a7,t5,a7
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,s9,a7
    lw a7, 0(a7)
    sw t2,60(a7)
    li t6, 1732584193
    li t2, -1732584194
    li t4, -271733879
    mv	a2,zero 
    li a1, 271733878
    li t0, -1009589776
    j	_forcondBB3
_forcondBB3:
    blt	a2,t5,	_forbodyBB3
    j	_afterForBB3
_afterForBB3:
    sw t6,4(s8)
    sw t4,8(s8)
    sw t2,12(s8)
    sw a1,16(s8)
    sw t0,20(s8)
    mv	t2,s8 
    j	afterCallBB2
afterCallBB2:
    mv	a7,s1 
    lw a5, 0(a7)
    lw t6, 0(t2)
    bne	t6,a5,	_if_thenBB4
    j	_if_end3
_if_thenBB4:
    mv	a7,zero 
    j	afterCallBB3
afterCallBB3:
    bne	a7, zero, __if_thenBB2
    j	__if_end2
__if_thenBB2:
    mv	s10,zero 
    j	__forcondBB5
__forcondBB5:
    blt	s10,s2,	__forbodyBB5
    j	__afterForBB4
__forbodyBB5:
    slli a7,s10,    2
    addi a7,a7,    4
    add a7,s6,a7
    lw a7, 0(a7)
    li t2, 32
    bge	a7,t2,	_ifTrue1
    j	_if_end4
_ifTrue1:
    li t2, 126
    ble	a7,t2,	_if_thenBB5
    j	_if_end4
_if_end4:
    la a0,_globalStr0    
    j	afterCallBB4
afterCallBB4:
    call	print
    addi s10,s10,    1
    j	__forcondBB5
_if_thenBB5:
    li t2, 32
    sub a1,a7,t2
    li t2, 31
    sub a2,a7,t2
    la a0,_globalStr2    
    call	_stringSubstring
    j	afterCallBB4
__afterForBB4:
    la a0,_globalStr0    
    call	println
    j	_whileBodyBB1
__if_end2:
    mv	a7,s6 
    li t2, 1
    sub t2,s2,t2
    j	_forcondBB4
_forcondBB4:
    bge	t2,zero,	_forbodyBB4
    j	_afterForBB4
_forbodyBB4:
    slli a5,t2,    2
    addi a5,a5,    4
    add a5,a7,a5
    lw a5, 0(a5)
    li t6, 122
    beq	a5,t6,	__if_thenBB3
    j	__if_end3
__if_end3:
    li t6, 90
    beq	a5,t6,	__if_thenBB4
    j	__if_end4
__if_thenBB4:
    li a5, 97
    j	_afterCallBB1
_afterCallBB1:
    slli t6,t2,    2
    addi t6,t6,    4
    add t6,a7,t6
    sw a5,0(t6)
    slli a5,t2,    2
    addi a5,a5,    4
    add a5,a7,a5
    lw t6, 0(a5)
    li a5, -1
    beq	t6,a5,	_if_thenBB6
    j	_if_elseBB2
_if_thenBB6:
    slli a5,t2,    2
    addi a5,a5,    4
    add t6,a7,a5
    li a5, 48
    sw a5,0(t6)
    li a5, 1
    sub t2,t2,a5
    j	_forcondBB4
_if_elseBB2:
    li a7, 1
    j	afterCallBB5
afterCallBB5:
    bne	a7, zero, __whileBodyBB1
    j	__forupdateBB1
__forupdateBB1:
    addi s2,s2,    1
    j	__forcondBB3
__if_end4:
    li t6, 57
    beq	a5,t6,	__if_thenBB5
    j	__if_end5
__if_thenBB5:
    li a5, 65
    j	_afterCallBB1
__if_end5:
    addi a5,a5,    1
    j	_afterCallBB1
__if_thenBB3:
    li a5, -1
    j	_afterCallBB1
_afterForBB4:
    mv	a7,zero 
    j	afterCallBB5
_if_end3:
    mv	a5,zero 
    j	_forcondBB5
_forcondBB5:
    lw t6, 0(t2)
    blt	a5,t6,	_forbodyBB5
    j	_afterForBB5
_afterForBB5:
    li a7, 1
    j	afterCallBB3
_forbodyBB5:
    slli t6,a5,    2
    addi t6,t6,    4
    add t0,a7,t6
    slli t6,a5,    2
    addi t6,t6,    4
    add t6,t2,t6
    lw t4, 0(t6)
    lw t6, 0(t0)
    bne	t4,t6,	_if_thenBB7
    j	_forupdateBB1
_if_thenBB7:
    mv	a7,zero 
    j	afterCallBB3
_forupdateBB1:
    addi a5,a5,    1
    j	_forcondBB5
_forbodyBB3:
    li a5, 16
    j	_forcondBB6
_forcondBB6:
    li a7, 80
    blt	a5,a7,	_forbodyBB6
    j	_afterForBB6
_afterForBB6:
    mv	t1,t6 
    mv	a0,t4 
    mv	a5,t2 
    mv	a6,a1 
    mv	ra,t0 
    mv	a4,zero 
    j	_forcondBB7
_forcondBB7:
    li a7, 80
    blt	a4,a7,	_forbodyBB7
    j	_afterForBB7
_afterForBB7:
    li a7, 65535
    and a4,t1,a7
    li a7, 65535
    and a7,t6,a7
    add a4,a7,a4
    srai t3,a4,    16
    srai t1,t1,    16
    li a7, 65535
    and t1,t1,a7
    srai a7,t6,    16
    li t6, 65535
    and a7,a7,t6
    add a7,a7,t1
    add t6,a7,t3
    li a7, 65535
    and a7,t6,a7
    li t6, 65535
    and t6,a4,t6
    slli a7,a7,    16
    or t6,a7,t6
    li a7, 65535
    and a4,a0,a7
    li a7, 65535
    and a7,t4,a7
    add a4,a7,a4
    srai t3,a4,    16
    srai t1,a0,    16
    li a7, 65535
    and t1,t1,a7
    srai t4,t4,    16
    li a7, 65535
    and a7,t4,a7
    add a7,a7,t1
    add t4,a7,t3
    li a7, 65535
    and a7,t4,a7
    li t4, 65535
    and t4,a4,t4
    slli a7,a7,    16
    or t4,a7,t4
    li a7, 65535
    and a4,a5,a7
    li a7, 65535
    and a7,t2,a7
    add a4,a7,a4
    srai t1,a4,    16
    srai a5,a5,    16
    li a7, 65535
    and a5,a5,a7
    srai a7,t2,    16
    li t2, 65535
    and a7,a7,t2
    add a7,a7,a5
    add t2,a7,t1
    li a7, 65535
    and a7,t2,a7
    li t2, 65535
    and t2,a4,t2
    slli a7,a7,    16
    or t2,a7,t2
    li a7, 65535
    and a5,a6,a7
    li a7, 65535
    and a7,a1,a7
    add a7,a7,a5
    srai a4,a7,    16
    srai a5,a6,    16
    li a6, 65535
    and a5,a5,a6
    srai a6,a1,    16
    li a1, 65535
    and a1,a6,a1
    add a5,a1,a5
    add a1,a5,a4
    li a5, 65535
    and a5,a1,a5
    li a1, 65535
    and a7,a7,a1
    slli a5,a5,    16
    or a1,a5,a7
    li a7, 65535
    and a7,ra,a7
    li a5, 65535
    and a5,t0,a5
    add a7,a5,a7
    srai a6,a7,    16
    srai a5,ra,    16
    li ra, 65535
    and ra,a5,ra
    srai t0,t0,    16
    li a5, 65535
    and a5,t0,a5
    add a5,a5,ra
    add t0,a5,a6
    li a5, 65535
    and a5,t0,a5
    li t0, 65535
    and a7,a7,t0
    slli a5,a5,    16
    or t0,a5,a7
    addi a2,a2,    1
    j	_forcondBB3
_forbodyBB7:
    li a7, 20
    blt	a4,a7,	_if_thenBB8
    j	_if_elseBB3
_if_elseBB3:
    li a7, 40
    blt	a4,a7,	_if_thenBB9
    j	_if_elseBB4
_if_elseBB4:
    li a7, 60
    blt	a4,a7,	_if_thenBB10
    j	_if_elseBB5
_if_thenBB10:
    and a7,a5,a6
    and a3,a0,a6
    and t3,a0,a5
    or t3,t3,a3
    or a7,t3,a7
    li s10, -1894007588
    j	_if_end5
_if_end5:
    srai t3,t1,    27
    andi a3,t3,    31
    li t3, 134217727
    and t3,t1,t3
    slli t3,t3,    5
    or a3,t3,a3
    li t3, 65535
    and s5,ra,t3
    li t3, 65535
    and t3,a3,t3
    add t3,t3,s5
    srai s5,t3,    16
    srai ra,ra,    16
    li s11, 65535
    and ra,ra,s11
    srai s11,a3,    16
    li a3, 65535
    and a3,s11,a3
    add ra,a3,ra
    add a3,ra,s5
    li ra, 65535
    and ra,a3,ra
    li a3, 65535
    and t3,t3,a3
    slli ra,ra,    16
    or ra,ra,t3
    li t3, 65535
    and a3,s10,t3
    li t3, 65535
    and t3,a7,t3
    add t3,t3,a3
    srai a3,t3,    16
    srai s10,s10,    16
    li s5, 65535
    and s10,s10,s5
    srai a7,a7,    16
    li s5, 65535
    and a7,a7,s5
    add a7,a7,s10
    add a3,a7,a3
    li a7, 65535
    and a7,a3,a7
    li a3, 65535
    and t3,t3,a3
    slli a7,a7,    16
    or a7,a7,t3
    li t3, 65535
    and a3,a7,t3
    li t3, 65535
    and t3,ra,t3
    add t3,t3,a3
    srai s10,t3,    16
    srai a7,a7,    16
    li a3, 65535
    and a3,a7,a3
    srai ra,ra,    16
    li a7, 65535
    and a7,ra,a7
    add a7,a7,a3
    add ra,a7,s10
    li a7, 65535
    and a7,ra,a7
    li ra, 65535
    and ra,t3,ra
    slli a7,a7,    16
    or a7,a7,ra
    slli ra,a2,    2
    addi ra,ra,    4
    add ra,s9,ra
    lw ra, 0(ra)
    slli t3,a4,    2
    addi t3,t3,    4
    add ra,ra,t3
    lw t3, 0(ra)
    li ra, 65535
    and a3,t3,ra
    li ra, 65535
    and ra,a7,ra
    add ra,ra,a3
    srai a3,ra,    16
    srai t3,t3,    16
    li s10, 65535
    and s10,t3,s10
    srai t3,a7,    16
    li a7, 65535
    and a7,t3,a7
    add a7,a7,s10
    add t3,a7,a3
    li a7, 65535
    and a7,t3,a7
    li t3, 65535
    and ra,ra,t3
    slli a7,a7,    16
    or a7,a7,ra
    mv	ra,a6 
    mv	a6,a5 
    srai a5,a0,    2
    li t3, 1073741823
    and t3,a5,t3
    andi a5,a0,    3
    slli a5,a5,    30
    or a5,a5,t3
    mv	a0,t1 
    addi a4,a4,    1
    mv	t1,a7 
    j	_forcondBB7
_if_elseBB5:
    xor a7,a0,a5
    xor a7,a7,a6
    li s10, -899497514
    j	_if_end5
_if_thenBB9:
    xor a7,a0,a5
    xor a7,a7,a6
    li s10, 1859775393
    j	_if_end5
_if_thenBB8:
    xori a7,a0,    -1
    and t3,a7,a6
    and a7,a0,a5
    or a7,a7,t3
    li s10, 1518500249
    j	_if_end5
_forbodyBB6:
    slli a7,a2,    2
    addi a7,a7,    4
    add ra,s9,a7
    li a7, 16
    sub a7,a5,a7
    lw ra, 0(ra)
    slli a7,a7,    2
    addi a7,a7,    4
    add a6,ra,a7
    slli a7,a2,    2
    addi a7,a7,    4
    add ra,s9,a7
    li a7, 14
    sub a7,a5,a7
    lw ra, 0(ra)
    slli a7,a7,    2
    addi a7,a7,    4
    add a4,ra,a7
    slli a7,a2,    2
    addi a7,a7,    4
    add ra,s9,a7
    li a7, 8
    sub a7,a5,a7
    lw ra, 0(ra)
    slli a7,a7,    2
    addi a7,a7,    4
    add t1,ra,a7
    slli a7,a2,    2
    addi a7,a7,    4
    add a7,s9,a7
    li ra, 3
    sub ra,a5,ra
    lw a0, 0(a7)
    slli a7,ra,    2
    addi a7,a7,    4
    add a7,a0,a7
    lw a7, 0(a7)
    lw ra, 0(t1)
    xor a7,a7,ra
    lw ra, 0(a4)
    xor ra,a7,ra
    lw a7, 0(a6)
    xor a7,ra,a7
    srai ra,a7,    31
    andi a6,ra,    1
    li ra, 2147483647
    and a7,a7,ra
    slli a7,a7,    1
    or a7,a7,a6
    slli ra,a2,    2
    addi ra,ra,    4
    add ra,s9,ra
    lw a6, 0(ra)
    slli ra,a5,    2
    addi ra,ra,    4
    add ra,a6,ra
    sw a7,0(ra)
    addi a5,a5,    1
    j	_forcondBB6
_forbodyBB1:
    mv	a5,zero 
    j	_forcondBB8
_forcondBB8:
    li t6, 80
    blt	a5,t6,	_forbodyBB8
    j	_forupdateBB2
_forbodyBB8:
    slli t6,t2,    2
    addi t6,t6,    4
    add t6,s9,t6
    lw t0, 0(t6)
    slli t6,a5,    2
    addi t6,t6,    4
    add t6,t0,t6
    li t0, 0
    sw t0,0(t6)
    addi a5,a5,    1
    j	_forcondBB8
_forupdateBB2:
    addi t2,t2,    1
    j	_forcondBB1
_if_thenBB3:
    la a0,_globalStr4    
    call	println
    mv	t2,zero 
    j	afterCallBB2
__forbodyBB4:
    slli t2,a7,    2
    addi t2,t2,    4
    add a5,s6,t2
    li t2, 48
    sw t2,0(a5)
    addi a7,a7,    1
    j	__forcondBB4
__forbodyBB2:
    srai a7,s11,    2
    li t2, 2
    rem a7,a7,t2
    li t2, 1
    sub a7,t2,a7
    slli s2,a7,    4
    addi a2,s11,    4
    mv	a0,s5 
    mv	a1,s11 
    call	_stringSubstring
    mv	s4,a0 
    mv	s10,zero 
    mv	s3,zero 
    j	_forcondBB9
_forcondBB9:
    mv	a0,s4 
    call	stringLength
    blt	s10,a0,	_forbodyBB9
    j	_afterForBB8
_afterForBB8:
    mv	a7,s3 
    j	afterCallBB6
afterCallBB6:
    sll t2,a7,s2
    srai a7,s11,    3
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,s1,a7
    lw a7, 0(a7)
    or t2,a7,t2
    srai a7,s11,    3
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,s1,a7
    sw t2,0(a7)
    addi a7,s11,    4
    mv	s11,a7 
    j	__forcondBB2
_forbodyBB9:
    mv	a0,s4 
    mv	a1,s10 
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
    slli a7,s3,    4
    add a7,a7,a0
    li t2, 65
    sub a7,a7,t2
    addi a7,a7,    10
    j	_forupdateBB3
_forupdateBB3:
    addi t2,s10,    1
    mv	s10,t2 
    mv	s3,a7 
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
    slli a7,s3,    4
    add t2,a7,a0
    li a7, 97
    sub a7,t2,a7
    addi a7,a7,    10
    j	_forupdateBB3
_if_elseBB8:
    mv	a7,zero 
    j	afterCallBB6
_ifTrue2:
    li a7, 57
    ble	a0,a7,	_if_thenBB13
    j	_if_elseBB6
_if_thenBB13:
    slli a7,s3,    4
    add t2,a7,a0
    li a7, 48
    sub a7,t2,a7
    j	_forupdateBB3
__forbodyBB1:
    slli t2,a7,    2
    addi t2,t2,    4
    add a5,s1,t2
    li t2, 0
    sw t2,0(a5)
    addi a7,a7,    1
    j	__forcondBB1
_if_thenBB1:
    call	getString
    mv	s2,a0 
    mv	s10,zero 
    j	__forcondBB6
__forcondBB6:
    mv	a0,s2 
    call	stringLength
    blt	s10,a0,	__forbodyBB6
    j	__afterForBB5
__afterForBB5:
    mv	a0,s2 
    call	stringLength
    mv	a7,s6 
    addi t2,a0,    64
    li a5, 56
    sub t2,t2,a5
    srai t2,t2,    6
    addi t0,t2,    1
    li t2, 100
    bgt	t0,t2,	_if_thenBB14
    j	_if_end6
_if_thenBB14:
    la a0,_globalStr4    
    call	println
    mv	s2,zero 
    j	afterCallBB7
afterCallBB7:
    mv	s10,zero 
    j	__forcondBB7
__forcondBB7:
    lw a7, 0(s2)
    blt	s10,a7,	__forbodyBB7
    j	_afterCallBB2
__forbodyBB7:
    slli a7,s10,    2
    addi a7,a7,    4
    add a7,s2,a7
    lw s4, 0(a7)
    la s11,_globalStr0    
    li s5, 28
    j	_forcondBB10
_forcondBB10:
    bge	s5,zero,	_forbodyBB10
    j	afterCallBB8
afterCallBB8:
    mv	a0,s11 
    call	print
    addi s10,s10,    1
    j	__forcondBB7
_forbodyBB10:
    sra a7,s4,s5
    andi a7,a7,    15
    li t2, 10
    blt	a7,t2,	_if_thenBB15
    j	_if_elseBB9
_if_elseBB9:
    addi t2,a7,    65
    li a7, 10
    sub a7,t2,a7
    li t2, 32
    bge	a7,t2,	__ifTrue1
    j	__if_end6
__if_end6:
    la a1,_globalStr0    
    j	_afterCallBB3
_afterCallBB3:
    mv	a0,s11 
    call	_stringAdd
    j	_forupdateBB4
_forupdateBB4:
    li a7, 4
    sub s5,s5,a7
    mv	s11,a0 
    j	_forcondBB10
__ifTrue1:
    li t2, 126
    ble	a7,t2,	__if_thenBB6
    j	__if_end6
__if_thenBB6:
    li t2, 32
    sub a1,a7,t2
    li t2, 31
    sub a2,a7,t2
    la a0,_globalStr2    
    call	_stringSubstring
    mv	a1,a0 
    j	_afterCallBB3
_if_thenBB15:
    addi a7,a7,    48
    li t2, 32
    bge	a7,t2,	__ifTrue2
    j	__if_end7
__ifTrue2:
    li t2, 126
    ble	a7,t2,	__if_thenBB7
    j	__if_end7
__if_thenBB7:
    li t2, 32
    sub a1,a7,t2
    li t2, 31
    sub a2,a7,t2
    la a0,_globalStr2    
    call	_stringSubstring
    j	_afterCallBB4
_afterCallBB4:
    mv	a1,a0 
    mv	a0,s11 
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
    mv	a5,zero 
    j	_forcondBB11
_forcondBB11:
    blt	a5,t0,	_forbodyBB11
    j	_afterForBB9
_afterForBB9:
    mv	t2,zero 
    j	_forcondBB12
_forcondBB12:
    blt	t2,a0,	_forbodyBB12
    j	_afterForBB10
_forbodyBB12:
    li a5, 4
    rem a5,t2,a5
    li t6, 3
    sub a5,t6,a5
    slli t6,a5,    3
    slli a5,t2,    2
    addi a5,a5,    4
    add a5,a7,a5
    lw a5, 0(a5)
    sll t4,a5,t6
    srai a5,t2,    6
    slli a5,a5,    2
    addi a5,a5,    4
    add t6,s9,a5
    li a5, 64
    rem a5,t2,a5
    srai a5,a5,    2
    lw t6, 0(t6)
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,t6,a5
    lw a5, 0(a5)
    or t4,a5,t4
    srai a5,t2,    6
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,s9,a5
    li t6, 64
    rem t6,t2,t6
    srai t6,t6,    2
    lw t5, 0(a5)
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,t5,a5
    sw t4,0(a5)
    addi t2,t2,    1
    j	_forcondBB12
_afterForBB10:
    li a7, 4
    rem a7,t2,a7
    li a5, 3
    sub a7,a5,a7
    slli a7,a7,    3
    li a5, 128
    sll a5,a5,a7
    srai a7,t2,    6
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,s9,a7
    li t6, 64
    rem t6,t2,t6
    srai t6,t6,    2
    lw t4, 0(a7)
    slli a7,t6,    2
    addi a7,a7,    4
    add a7,t4,a7
    lw a7, 0(a7)
    or a5,a7,a5
    srai a7,t2,    6
    slli a7,a7,    2
    addi a7,a7,    4
    add t6,s9,a7
    li a7, 64
    rem a7,t2,a7
    srai a7,a7,    2
    lw t2, 0(t6)
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,t2,a7
    sw a5,0(a7)
    slli t2,a0,    3
    li a7, 1
    sub a7,t0,a7
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,s9,a7
    lw a7, 0(a7)
    sw t2,64(a7)
    srai a7,a0,    29
    andi t2,a7,    7
    li a7, 1
    sub a7,t0,a7
    slli a7,a7,    2
    addi a7,a7,    4
    add a7,s9,a7
    lw a7, 0(a7)
    sw t2,60(a7)
    li t5, 271733878
    li t4, -1009589776
    li a1, 1732584193
    li ra, -271733879
    mv	a2,zero 
    li a5, -1732584194
    j	_forcondBB13
_forcondBB13:
    blt	a2,t0,	_forbodyBB13
    j	_afterForBB11
_forbodyBB13:
    li t2, 16
    j	_forcondBB14
_forcondBB14:
    li a7, 80
    blt	t2,a7,	_forbodyBB14
    j	_afterForBB12
_forbodyBB14:
    slli a7,a2,    2
    addi a7,a7,    4
    add a7,s9,a7
    li t6, 16
    sub t6,t2,t6
    lw a6, 0(a7)
    slli a7,t6,    2
    addi a7,a7,    4
    add a7,a6,a7
    slli t6,a2,    2
    addi t6,t6,    4
    add a4,s9,t6
    li t6, 14
    sub a6,t2,t6
    lw t6, 0(a4)
    slli a6,a6,    2
    addi a6,a6,    4
    add a6,t6,a6
    slli t6,a2,    2
    addi t6,t6,    4
    add a4,s9,t6
    li t6, 8
    sub t6,t2,t6
    lw a4, 0(a4)
    slli t6,t6,    2
    addi t6,t6,    4
    add a4,a4,t6
    slli t6,a2,    2
    addi t6,t6,    4
    add t1,s9,t6
    li t6, 3
    sub t6,t2,t6
    lw t1, 0(t1)
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,t1,t6
    lw t1, 0(t6)
    lw t6, 0(a4)
    xor a4,t1,t6
    lw t6, 0(a6)
    xor t6,a4,t6
    lw a7, 0(a7)
    xor a7,t6,a7
    srai t6,a7,    31
    andi t6,t6,    1
    li a6, 2147483647
    and a7,a7,a6
    slli a7,a7,    1
    or a7,a7,t6
    slli t6,a2,    2
    addi t6,t6,    4
    add t6,s9,t6
    lw a6, 0(t6)
    slli t6,t2,    2
    addi t6,t6,    4
    add t6,a6,t6
    sw a7,0(t6)
    addi t2,t2,    1
    j	_forcondBB14
_afterForBB12:
    mv	t1,ra 
    mv	t3,t5 
    mv	a6,a1 
    mv	a3,t4 
    mv	t2,a5 
    mv	a4,zero 
    j	_forcondBB15
_forcondBB15:
    li a7, 80
    blt	a4,a7,	_forbodyBB15
    j	_afterForBB13
_forbodyBB15:
    li a7, 20
    blt	a4,a7,	_if_thenBB16
    j	_if_elseBB10
_if_elseBB10:
    li a7, 40
    blt	a4,a7,	_if_thenBB17
    j	_if_elseBB11
_if_elseBB11:
    li a7, 60
    blt	a4,a7,	_if_thenBB18
    j	_if_elseBB12
_if_thenBB18:
    and a0,t2,t3
    and a7,t1,t3
    and t6,t1,t2
    or a7,t6,a7
    or t6,a7,a0
    li a0, -1894007588
    j	_if_end7
_if_end7:
    srai a7,a6,    27
    andi a7,a7,    31
    li s2, 134217727
    and s2,a6,s2
    slli s2,s2,    5
    or a7,s2,a7
    li s2, 65535
    and s10,a3,s2
    li s2, 65535
    and s2,a7,s2
    add s2,s2,s10
    srai s10,s2,    16
    srai s5,a3,    16
    li a3, 65535
    and a3,s5,a3
    srai a7,a7,    16
    li s5, 65535
    and a7,a7,s5
    add a7,a7,a3
    add a7,a7,s10
    li a3, 65535
    and a7,a7,a3
    li a3, 65535
    and a3,s2,a3
    slli a7,a7,    16
    or a3,a7,a3
    li a7, 65535
    and a7,a0,a7
    li s2, 65535
    and s2,t6,s2
    add a7,s2,a7
    srai s2,a7,    16
    srai s10,a0,    16
    li a0, 65535
    and a0,s10,a0
    srai t6,t6,    16
    li s10, 65535
    and t6,t6,s10
    add t6,t6,a0
    add t6,t6,s2
    li a0, 65535
    and t6,t6,a0
    li a0, 65535
    and a7,a7,a0
    slli t6,t6,    16
    or a7,t6,a7
    li t6, 65535
    and a0,a7,t6
    li t6, 65535
    and t6,a3,t6
    add t6,t6,a0
    srai a0,t6,    16
    srai a7,a7,    16
    li s2, 65535
    and s2,a7,s2
    srai a7,a3,    16
    li a3, 65535
    and a7,a7,a3
    add a7,a7,s2
    add a7,a7,a0
    li a0, 65535
    and a7,a7,a0
    li a0, 65535
    and t6,t6,a0
    slli a7,a7,    16
    or a7,a7,t6
    slli t6,a2,    2
    addi t6,t6,    4
    add t6,s9,t6
    lw a0, 0(t6)
    slli t6,a4,    2
    addi t6,t6,    4
    add t6,a0,t6
    lw a0, 0(t6)
    li t6, 65535
    and a3,a0,t6
    li t6, 65535
    and t6,a7,t6
    add t6,t6,a3
    srai s2,t6,    16
    srai a0,a0,    16
    li a3, 65535
    and a0,a0,a3
    srai a7,a7,    16
    li a3, 65535
    and a7,a7,a3
    add a7,a7,a0
    add a7,a7,s2
    li a0, 65535
    and a7,a7,a0
    li a0, 65535
    and t6,t6,a0
    slli a7,a7,    16
    or t6,a7,t6
    mv	a3,t3 
    srai a7,t1,    2
    li a0, 1073741823
    and a0,a7,a0
    andi a7,t1,    3
    slli a7,a7,    30
    or a7,a7,a0
    mv	t1,a6 
    addi a4,a4,    1
    mv	a6,t6 
    mv	t3,t2 
    mv	t2,a7 
    j	_forcondBB15
_if_elseBB12:
    xor a7,t1,t2
    xor t6,a7,t3
    li a0, -899497514
    j	_if_end7
_if_thenBB17:
    xor a7,t1,t2
    xor t6,a7,t3
    li a0, 1859775393
    j	_if_end7
_if_thenBB16:
    xori a7,t1,    -1
    and a7,a7,t3
    and t6,t1,t2
    or t6,t6,a7
    li a0, 1518500249
    j	_if_end7
_afterForBB13:
    li a7, 65535
    and a7,a6,a7
    li t6, 65535
    and t6,a1,t6
    add t6,t6,a7
    srai a4,t6,    16
    srai a6,a6,    16
    li a7, 65535
    and a6,a6,a7
    srai a7,a1,    16
    li a1, 65535
    and a7,a7,a1
    add a7,a7,a6
    add a1,a7,a4
    li a7, 65535
    and a7,a1,a7
    li a1, 65535
    and t6,t6,a1
    slli a7,a7,    16
    or a1,a7,t6
    li a7, 65535
    and t6,t1,a7
    li a7, 65535
    and a7,ra,a7
    add t6,a7,t6
    srai a4,t6,    16
    srai a7,t1,    16
    li a6, 65535
    and a6,a7,a6
    srai a7,ra,    16
    li ra, 65535
    and a7,a7,ra
    add a7,a7,a6
    add a7,a7,a4
    li ra, 65535
    and a7,a7,ra
    li ra, 65535
    and t6,t6,ra
    slli a7,a7,    16
    or ra,a7,t6
    li a7, 65535
    and t6,t2,a7
    li a7, 65535
    and a7,a5,a7
    add a7,a7,t6
    srai a6,a7,    16
    srai t2,t2,    16
    li t6, 65535
    and t6,t2,t6
    srai a5,a5,    16
    li t2, 65535
    and t2,a5,t2
    add t2,t2,t6
    add t2,t2,a6
    li a5, 65535
    and t2,t2,a5
    li a5, 65535
    and a5,a7,a5
    slli a7,t2,    16
    or a5,a7,a5
    li a7, 65535
    and t2,t3,a7
    li a7, 65535
    and a7,t5,a7
    add a7,a7,t2
    srai a6,a7,    16
    srai t6,t3,    16
    li t2, 65535
    and t6,t6,t2
    srai t2,t5,    16
    li t5, 65535
    and t2,t2,t5
    add t2,t2,t6
    add t6,t2,a6
    li t2, 65535
    and t2,t6,t2
    li t6, 65535
    and a7,a7,t6
    slli t2,t2,    16
    or t5,t2,a7
    li a7, 65535
    and a7,a3,a7
    li t2, 65535
    and t2,t4,t2
    add a7,t2,a7
    srai a6,a7,    16
    srai t2,a3,    16
    li t6, 65535
    and t2,t2,t6
    srai t4,t4,    16
    li t6, 65535
    and t6,t4,t6
    add t2,t6,t2
    add t6,t2,a6
    li t2, 65535
    and t2,t6,t2
    li t6, 65535
    and t6,a7,t6
    slli a7,t2,    16
    or t4,a7,t6
    addi a2,a2,    1
    j	_forcondBB13
_afterForBB11:
    sw a1,4(s8)
    sw ra,8(s8)
    sw a5,12(s8)
    sw t5,16(s8)
    sw t4,20(s8)
    mv	s2,s8 
    j	afterCallBB7
_forbodyBB11:
    mv	t2,zero 
    j	_forcondBB16
_forcondBB16:
    li t6, 80
    blt	t2,t6,	_forbodyBB16
    j	_forupdateBB5
_forupdateBB5:
    addi a5,a5,    1
    j	_forcondBB11
_forbodyBB16:
    slli t6,a5,    2
    addi t6,t6,    4
    add t6,s9,t6
    lw t6, 0(t6)
    slli t4,t2,    2
    addi t4,t4,    4
    add t6,t6,t4
    li t4, 0
    sw t4,0(t6)
    addi t2,t2,    1
    j	_forcondBB16
__forbodyBB6:
    mv	a0,s2 
    mv	a1,s10 
    call	_stringOrd
    slli a7,s10,    2
    addi a7,a7,    4
    add a7,s6,a7
    sw a0,0(a7)
    addi s10,s10,    1
    j	__forcondBB6
forupdateBB1:
    li a0, 324
    call malloc
    li a7, 80
    sw a7,0(a0)
    sw a0,0(s10)
    addi s10,s10,    4
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
