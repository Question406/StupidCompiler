    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init__init.entryBB1:
    addi sp,sp,    -64
    sw ra, 24(sp) 
    sw s0, 40(sp) 
    sw s1, 8(sp) 
    sw s2, 4(sp) 
    sw s3, 16(sp) 
    sw s4, 36(sp) 
    sw s5, 0(sp) 
    sw s6, 28(sp) 
    sw s7, 32(sp) 
    sw s8, 44(sp) 
    sw s9, 12(sp) 
    sw s10, 20(sp) 
    mv	s0,s11 
    la s5,_globalStr2    
    li a0, 404
    call malloc
    mv	s11,a0 
    li t4, 100
    sw t4,0(s11)
    addi s1,s11,    4
    addi s4,s11,    400
__initforcondBB1:
    ble	s1,s4,	__initforupdateBB1
__initafterForBB1:
    mv	s3,s11 
    li a0, 25284
    call malloc
    li t4, 6320
    sw t4,0(a0)
    mv	s1,a0 
    li a0, 24
    call malloc
    li t4, 5
    sw t4,0(a0)
    mv	s7,a0 
__init_whileBodyBB1:
    call	getInt
    beq	a0,zero,	__initafterCallBB1
__init_if_end1:
    li t4, 1
    beq	a0,t4,	__init_if_thenBB1
__init_if_elseBB1:
    li t4, 2
    beq	a0,t4,	__init_if_thenBB2
    j	__init_whileBodyBB1
__init_if_thenBB2:
    call	getString
    mv	s6,a0 
    li a0, 24
    call malloc
    li t4, 5
    sw t4,0(a0)
    mv	s4,a0 
    mv	a0,s6 
    call	stringLength
    li t4, 40
    bne	a0,t4,	__init__if_thenBB1
__init__if_end1:
    mv	t4,zero 
__init__forcondBB1:
    li a5, 5
    blt	t4,a5,	__init__forbodyBB1
__init__afterForBB1:
    mv	s9,zero 
__init__forcondBB2:
    li t4, 40
    blt	s9,t4,	__init__forbodyBB2
__init__afterForBB2:
    li s11, 1
__init__forcondBB3:
    li t4, 4
    ble	s11,t4,	__init__forbodyBB3
__init__afterForBB3:
    la a0,_globalStr3    
    call	println
    j	__init_whileBodyBB1
__init__forbodyBB3:
    mv	t4,zero 
__init__forcondBB4:
    blt	t4,s11,	__init__forbodyBB4
__init__whileBodyBB1:
    mv	t4,s1 
    addi a5,s11,    64
    addi a5,a5,    -56
    srai a5,a5,    6
    addi t2,a5,    1
    li a5, 100
    bgt	t2,a5,	__init_if_thenBB3
__init_if_end2:
    mv	a5,zero 
__init_forcondBB1:
    blt	a5,t2,	__init_forbodyBB1
__init_afterForBB1:
    mv	a5,zero 
__init_forcondBB2:
    blt	a5,s11,	__init_forbodyBB2
__init_afterForBB2:
    andi ra,a5,    3
    li t4, 3
    sub t4,t4,ra
    slli t4,t4,    3
    li ra, 128
    sll ra,ra,t4
    srai t4,a5,    6
    slli t4,t4,    2
    addi t4,t4,    4
    add a2,s3,t4
    andi t4,a5,    63
    srai t1,t4,    2
    lw t4, 0(a2)
    slli a2,t1,    2
    addi a2,a2,    4
    add t4,t4,a2
    lw t4, 0(t4)
    or ra,t4,ra
    srai t4,a5,    6
    slli t4,t4,    2
    addi t4,t4,    4
    add a2,s3,t4
    andi t4,a5,    63
    srai t4,t4,    2
    lw a5, 0(a2)
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,a5,t4
    sw ra,0(t4)
    slli a5,s11,    3
    addi t4,t2,    -1
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,s3,t4
    lw t4, 0(t4)
    sw a5,64(t4)
    srai t4,s11,    29
    andi t4,t4,    7
    addi a5,t2,    -1
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,s3,a5
    lw a5, 0(a5)
    sw t4,60(a5)
    li a2, -271733879
    li a6, -1009589776
    li a7, 271733878
    li ra, -1732584194
    mv	t6,zero 
    li t0, 1732584193
__init_forcondBB3:
    blt	t6,t2,	__init_forbodyBB3
__init_afterForBB3:
    sw t0,4(s7)
    sw a2,8(s7)
    sw ra,12(s7)
    sw a7,16(s7)
    sw a6,20(s7)
    mv	a5,s7 
__initafterCallBB2:
    mv	t4,s4 
    lw a2, 0(t4)
    lw ra, 0(a5)
    bne	ra,a2,	__init_if_thenBB4
__init_if_end3:
    mv	ra,zero 
__init_forcondBB4:
    lw a2, 0(a5)
    blt	ra,a2,	__init_forbodyBB4
__init_afterForBB4:
    li t4, 1
__initafterCallBB3:
    bne	t4, zero, __init__if_thenBB2
__init__if_end2:
    mv	t4,s1 
    addi a5,s11,    -1
__init_forcondBB5:
    bge	a5,zero,	__init_forbodyBB5
__init_afterForBB5:
    mv	t4,zero 
__initafterCallBB4:
    bne	t4, zero, __init__whileBodyBB1
__init__forupdateBB1:
    addi s11,s11,    1
    j	__init__forcondBB3
__init_forbodyBB5:
    slli ra,a5,    2
    addi ra,ra,    4
    add ra,t4,ra
    lw ra, 0(ra)
    li a2, 122
    beq	ra,a2,	__init__if_thenBB3
__init__if_end3:
    li a2, 90
    beq	ra,a2,	__init__if_thenBB4
__init__if_end4:
    li a2, 57
    beq	ra,a2,	__init__if_thenBB5
__init__if_end5:
    addi ra,ra,    1
__init_afterCallBB1:
    slli a2,a5,    2
    addi a2,a2,    4
    add a2,t4,a2
    sw ra,0(a2)
    slli ra,a5,    2
    addi ra,ra,    4
    add ra,t4,ra
    lw ra, 0(ra)
    li a2, -1
    beq	ra,a2,	__init_if_thenBB5
__init_if_elseBB2:
    li t4, 1
    j	__initafterCallBB4
__init_if_thenBB5:
    slli ra,a5,    2
    addi ra,ra,    4
    add a2,t4,ra
    li ra, 48
    sw ra,0(a2)
    addi a5,a5,    -1
    j	__init_forcondBB5
__init__if_thenBB5:
    li ra, 65
    j	__init_afterCallBB1
__init__if_thenBB4:
    li ra, 97
    j	__init_afterCallBB1
__init__if_thenBB3:
    li ra, -1
    j	__init_afterCallBB1
__init__if_thenBB2:
    mv	s4,zero 
__init__forcondBB5:
    blt	s4,s11,	__init__forbodyBB5
__init__afterForBB4:
    la a0,_globalStr0    
    call	println
    j	__init_whileBodyBB1
__init__forbodyBB5:
    slli t4,s4,    2
    addi t4,t4,    4
    add t4,s1,t4
    lw t4, 0(t4)
    li a5, 32
    bge	t4,a5,	__init_ifTrue1
__init_if_end4:
    la a0,_globalStr0    
__initafterCallBB5:
    call	print
    addi s4,s4,    1
    j	__init__forcondBB5
__init_ifTrue1:
    li a5, 126
    ble	t4,a5,	__init_if_thenBB6
    j	__init_if_end4
__init_if_thenBB6:
    addi a1,t4,    -32
    addi a2,t4,    -31
    mv	a0,s5 
    call	_stringSubstring
    j	__initafterCallBB5
__init_forbodyBB4:
    slli a2,ra,    2
    addi a2,a2,    4
    add t1,t4,a2
    slli a2,ra,    2
    addi a2,a2,    4
    add a2,a5,a2
    lw a2, 0(a2)
    lw t1, 0(t1)
    bne	a2,t1,	__init_if_thenBB7
__init_forupdateBB1:
    addi ra,ra,    1
    j	__init_forcondBB4
__init_if_thenBB7:
    mv	t4,zero 
    j	__initafterCallBB3
__init_if_thenBB4:
    mv	t4,zero 
    j	__initafterCallBB3
__init_forbodyBB3:
    li t4, 16
__init_forcondBB6:
    li a5, 80
    blt	t4,a5,	__init_forbodyBB6
__init_afterForBB6:
    mv	a5,t0 
    mv	a0,a6 
    mv	t5,a2 
    mv	t3,ra 
    mv	a3,a7 
    mv	t1,zero 
__init_forcondBB7:
    li t4, 80
    blt	t1,t4,	__init_forbodyBB7
__init_afterForBB7:
    li t4, 65535
    and t4,a5,t4
    li t1, 65535
    and t1,t0,t1
    add t4,t1,t4
    srai a1,t4,    16
    srai a5,a5,    16
    li t1, 65535
    and a4,a5,t1
    srai a5,t0,    16
    li t1, 65535
    and a5,a5,t1
    add a5,a5,a4
    add t1,a5,a1
    li a5, 65535
    and a5,t1,a5
    li t1, 65535
    and t4,t4,t1
    slli a5,a5,    16
    or t0,a5,t4
    li t4, 65535
    and t4,t5,t4
    li a5, 65535
    and a5,a2,a5
    add a5,a5,t4
    srai a4,a5,    16
    srai t1,t5,    16
    li t4, 65535
    and t1,t1,t4
    srai t4,a2,    16
    li a2, 65535
    and t4,t4,a2
    add t4,t4,t1
    add a2,t4,a4
    li t4, 65535
    and t4,a2,t4
    li a2, 65535
    and a5,a5,a2
    slli t4,t4,    16
    or a2,t4,a5
    li t4, 65535
    and a5,t3,t4
    li t4, 65535
    and t4,ra,t4
    add a5,t4,a5
    srai t5,a5,    16
    srai t4,t3,    16
    li t1, 65535
    and t1,t4,t1
    srai t4,ra,    16
    li ra, 65535
    and t4,t4,ra
    add t4,t4,t1
    add t4,t4,t5
    li ra, 65535
    and t4,t4,ra
    li ra, 65535
    and a5,a5,ra
    slli t4,t4,    16
    or ra,t4,a5
    li t4, 65535
    and a5,a3,t4
    li t4, 65535
    and t4,a7,t4
    add a5,t4,a5
    srai t3,a5,    16
    srai t4,a3,    16
    li t1, 65535
    and t4,t4,t1
    srai a7,a7,    16
    li t1, 65535
    and t1,a7,t1
    add t4,t1,t4
    add t4,t4,t3
    li t1, 65535
    and t4,t4,t1
    li t1, 65535
    and a5,a5,t1
    slli t4,t4,    16
    or a7,t4,a5
    li t4, 65535
    and a5,a0,t4
    li t4, 65535
    and t4,a6,t4
    add t4,t4,a5
    srai t1,t4,    16
    srai a3,a0,    16
    li a5, 65535
    and a3,a3,a5
    srai a5,a6,    16
    li a6, 65535
    and a5,a5,a6
    add a5,a5,a3
    add t1,a5,t1
    li a5, 65535
    and a5,t1,a5
    li t1, 65535
    and t4,t4,t1
    slli a5,a5,    16
    or a6,a5,t4
    addi t6,t6,    1
    j	__init_forcondBB3
__init_forbodyBB7:
    li t4, 20
    blt	t1,t4,	__init_if_thenBB8
__init_if_elseBB3:
    li t4, 40
    blt	t1,t4,	__init_if_thenBB9
__init_if_elseBB4:
    li t4, 60
    blt	t1,t4,	__init_if_thenBB10
__init_if_elseBB5:
    xor t4,t5,t3
    xor a4,t4,a3
    li a1, -899497514
__init_if_end5:
    srai t4,a5,    27
    andi s10,t4,    31
    li t4, 134217727
    and t4,a5,t4
    slli t4,t4,    5
    or s10,t4,s10
    li t4, 65535
    and s6,a0,t4
    li t4, 65535
    and t4,s10,t4
    add t4,t4,s6
    srai s6,t4,    16
    srai s2,a0,    16
    li a0, 65535
    and s2,s2,a0
    srai a0,s10,    16
    li s10, 65535
    and a0,a0,s10
    add a0,a0,s2
    add a0,a0,s6
    li s10, 65535
    and a0,a0,s10
    li s10, 65535
    and t4,t4,s10
    slli a0,a0,    16
    or a0,a0,t4
    li t4, 65535
    and s10,a1,t4
    li t4, 65535
    and t4,a4,t4
    add t4,t4,s10
    srai s10,t4,    16
    srai s6,a1,    16
    li a1, 65535
    and a1,s6,a1
    srai a4,a4,    16
    li s6, 65535
    and a4,a4,s6
    add a4,a4,a1
    add a4,a4,s10
    li a1, 65535
    and a4,a4,a1
    li a1, 65535
    and t4,t4,a1
    slli a4,a4,    16
    or t4,a4,t4
    li a4, 65535
    and a4,t4,a4
    li a1, 65535
    and a1,a0,a1
    add a4,a1,a4
    srai a1,a4,    16
    srai s10,t4,    16
    li t4, 65535
    and s10,s10,t4
    srai a0,a0,    16
    li t4, 65535
    and t4,a0,t4
    add t4,t4,s10
    add a0,t4,a1
    li t4, 65535
    and t4,a0,t4
    li a0, 65535
    and a0,a4,a0
    slli t4,t4,    16
    or a4,t4,a0
    slli t4,t6,    2
    addi t4,t4,    4
    add t4,s3,t4
    lw t4, 0(t4)
    slli a0,t1,    2
    addi a0,a0,    4
    add t4,t4,a0
    lw t4, 0(t4)
    li a0, 65535
    and a1,t4,a0
    li a0, 65535
    and a0,a4,a0
    add a0,a0,a1
    srai s10,a0,    16
    srai t4,t4,    16
    li a1, 65535
    and t4,t4,a1
    srai a4,a4,    16
    li a1, 65535
    and a4,a4,a1
    add t4,a4,t4
    add t4,t4,s10
    li a4, 65535
    and t4,t4,a4
    li a4, 65535
    and a0,a0,a4
    slli t4,t4,    16
    or t4,t4,a0
    mv	a0,a3 
    mv	a3,t3 
    srai a4,t5,    2
    li t3, 1073741823
    and t3,a4,t3
    andi t5,t5,    3
    slli t5,t5,    30
    or t3,t5,t3
    addi t1,t1,    1
    mv	t5,a5 
    mv	a5,t4 
    j	__init_forcondBB7
__init_if_thenBB10:
    and a4,t3,a3
    and a1,t5,a3
    and t4,t5,t3
    or t4,t4,a1
    or a4,t4,a4
    li a1, -1894007588
    j	__init_if_end5
__init_if_thenBB9:
    xor t4,t5,t3
    xor a4,t4,a3
    li a1, 1859775393
    j	__init_if_end5
__init_if_thenBB8:
    xori t4,t5,    -1
    and t4,t4,a3
    and a4,t5,t3
    or a4,a4,t4
    li a1, 1518500249
    j	__init_if_end5
__init_forbodyBB6:
    slli a5,t6,    2
    addi a5,a5,    4
    add t1,s3,a5
    addi a5,t4,    -16
    lw t1, 0(t1)
    slli a5,a5,    2
    addi a5,a5,    4
    add a3,t1,a5
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,s3,a5
    addi t1,t4,    -14
    lw t3, 0(a5)
    slli a5,t1,    2
    addi a5,a5,    4
    add t5,t3,a5
    slli a5,t6,    2
    addi a5,a5,    4
    add t1,s3,a5
    addi a5,t4,    -8
    lw t1, 0(t1)
    slli a5,a5,    2
    addi a5,a5,    4
    add t1,t1,a5
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,s3,a5
    addi t3,t4,    -3
    lw a5, 0(a5)
    slli t3,t3,    2
    addi t3,t3,    4
    add a5,a5,t3
    lw t3, 0(a5)
    lw a5, 0(t1)
    xor a5,t3,a5
    lw t1, 0(t5)
    xor t1,a5,t1
    lw a5, 0(a3)
    xor a5,t1,a5
    srai t1,a5,    31
    andi t1,t1,    1
    li a3, 2147483647
    and a5,a5,a3
    slli a5,a5,    1
    or a5,a5,t1
    slli t1,t6,    2
    addi t1,t1,    4
    add t1,s3,t1
    lw a3, 0(t1)
    slli t1,t4,    2
    addi t1,t1,    4
    add t1,a3,t1
    sw a5,0(t1)
    addi t4,t4,    1
    j	__init_forcondBB6
__init_forbodyBB2:
    andi ra,a5,    3
    li a2, 3
    sub ra,a2,ra
    slli ra,ra,    3
    slli a2,a5,    2
    addi a2,a2,    4
    add a2,t4,a2
    lw a2, 0(a2)
    sll a2,a2,ra
    srai ra,a5,    6
    slli ra,ra,    2
    addi ra,ra,    4
    add t1,s3,ra
    andi ra,a5,    63
    srai ra,ra,    2
    lw t1, 0(t1)
    slli ra,ra,    2
    addi ra,ra,    4
    add ra,t1,ra
    lw ra, 0(ra)
    or a2,ra,a2
    srai ra,a5,    6
    slli ra,ra,    2
    addi ra,ra,    4
    add t1,s3,ra
    andi ra,a5,    63
    srai ra,ra,    2
    lw t1, 0(t1)
    slli ra,ra,    2
    addi ra,ra,    4
    add ra,t1,ra
    sw a2,0(ra)
    addi a5,a5,    1
    j	__init_forcondBB2
__init_forbodyBB1:
    mv	ra,zero 
__init_forcondBB8:
    li a2, 80
    blt	ra,a2,	__init_forbodyBB8
__init_forupdateBB2:
    addi a5,a5,    1
    j	__init_forcondBB1
__init_forbodyBB8:
    slli a2,a5,    2
    addi a2,a2,    4
    add a2,s3,a2
    lw a2, 0(a2)
    slli t1,ra,    2
    addi t1,t1,    4
    add a2,a2,t1
    sw zero,0(a2)
    addi ra,ra,    1
    j	__init_forcondBB8
__init_if_thenBB3:
    la a0,_globalStr4    
    call	println
    mv	a5,zero 
    j	__initafterCallBB2
__init__forbodyBB4:
    slli a5,t4,    2
    addi a5,a5,    4
    add a5,s1,a5
    li ra, 48
    sw ra,0(a5)
    addi t4,t4,    1
    j	__init__forcondBB4
__init__forbodyBB2:
    srai t4,s9,    2
    andi a5,t4,    1
    li t4, 1
    sub t4,t4,a5
    slli s8,t4,    4
    addi a2,s9,    4
    mv	a0,s6 
    mv	a1,s9 
    call	_stringSubstring
    mv	s11,a0 
    mv	s2,zero 
    mv	s10,zero 
__init_forcondBB9:
    mv	a0,s11 
    call	stringLength
    blt	s2,a0,	__init_forbodyBB9
__init_afterForBB8:
    mv	t4,s10 
__initafterCallBB6:
    sll a5,t4,s8
    srai t4,s9,    3
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,s4,t4
    lw t4, 0(t4)
    or t4,t4,a5
    srai a5,s9,    3
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,s4,a5
    sw t4,0(a5)
    addi t4,s9,    4
    mv	s9,t4 
    j	__init__forcondBB2
__init_forbodyBB9:
    mv	a0,s11 
    mv	a1,s2 
    call	_stringOrd
    li t4, 48
    bge	a0,t4,	__init_ifTrue2
__init_if_elseBB6:
    li t4, 65
    bge	a0,t4,	__init_ifTrue3
__init_if_elseBB7:
    li t4, 97
    bge	a0,t4,	__init_ifTrue4
__init_if_elseBB8:
    mv	t4,zero 
    j	__initafterCallBB6
__init_ifTrue4:
    li t4, 102
    ble	a0,t4,	__init_if_thenBB11
    j	__init_if_elseBB8
__init_if_thenBB11:
    slli t4,s10,    4
    add t4,t4,a0
    addi t4,t4,    -97
    addi a5,t4,    10
__init_forupdateBB3:
    addi t4,s2,    1
    mv	s2,t4 
    mv	s10,a5 
    j	__init_forcondBB9
__init_ifTrue3:
    li t4, 70
    ble	a0,t4,	__init_if_thenBB12
    j	__init_if_elseBB7
__init_if_thenBB12:
    slli t4,s10,    4
    add t4,t4,a0
    addi t4,t4,    -65
    addi a5,t4,    10
    j	__init_forupdateBB3
__init_ifTrue2:
    li t4, 57
    ble	a0,t4,	__init_if_thenBB13
    j	__init_if_elseBB6
__init_if_thenBB13:
    slli t4,s10,    4
    add t4,t4,a0
    addi a5,t4,    -48
    j	__init_forupdateBB3
__init__forbodyBB1:
    slli a5,t4,    2
    addi a5,a5,    4
    add a5,s4,a5
    sw zero,0(a5)
    addi t4,t4,    1
    j	__init__forcondBB1
__init__if_thenBB1:
    la a0,_globalStr1    
    call	println
    j	__init_whileBodyBB1
__init_if_thenBB1:
    call	getString
    mv	s4,a0 
    mv	s11,zero 
__init__forcondBB6:
    mv	a0,s4 
    call	stringLength
    blt	s11,a0,	__init__forbodyBB6
__init__afterForBB5:
    mv	a0,s4 
    call	stringLength
    mv	t4,s1 
    addi a5,a0,    64
    addi a5,a5,    -56
    srai a5,a5,    6
    addi t0,a5,    1
    li a5, 100
    bgt	t0,a5,	__init_if_thenBB14
__init_if_end6:
    mv	a5,zero 
__init_forcondBB10:
    blt	a5,t0,	__init_forbodyBB10
__init_afterForBB9:
    mv	a5,zero 
__init_forcondBB11:
    blt	a5,a0,	__init_forbodyBB11
__init_afterForBB10:
    andi t4,a5,    3
    li ra, 3
    sub t4,ra,t4
    slli t4,t4,    3
    li ra, 128
    sll a2,ra,t4
    srai t4,a5,    6
    slli t4,t4,    2
    addi t4,t4,    4
    add ra,s3,t4
    andi t4,a5,    63
    srai t4,t4,    2
    lw ra, 0(ra)
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,ra,t4
    lw t4, 0(t4)
    or a2,t4,a2
    srai t4,a5,    6
    slli t4,t4,    2
    addi t4,t4,    4
    add ra,s3,t4
    andi t4,a5,    63
    srai t4,t4,    2
    lw a5, 0(ra)
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,a5,t4
    sw a2,0(t4)
    slli t4,a0,    3
    addi a5,t0,    -1
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,s3,a5
    lw a5, 0(a5)
    sw t4,64(a5)
    srai t4,a0,    29
    andi a5,t4,    7
    addi t4,t0,    -1
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,s3,t4
    lw t4, 0(t4)
    sw a5,60(t4)
    li a3, -1732584194
    li t6, 271733878
    mv	a6,zero 
    li a5, 1732584193
    li t2, -271733879
    li a7, -1009589776
__init_forcondBB12:
    blt	a6,t0,	__init_forbodyBB12
__init_afterForBB11:
    sw a5,4(s7)
    sw t2,8(s7)
    sw a3,12(s7)
    sw t6,16(s7)
    sw a7,20(s7)
    mv	s11,s7 
__initafterCallBB7:
    mv	s2,zero 
__init__forcondBB7:
    lw t4, 0(s11)
    blt	s2,t4,	__init__forbodyBB7
__init_afterCallBB2:
    la a0,_globalStr0    
    call	println
    j	__init_whileBodyBB1
__init__forbodyBB7:
    slli t4,s2,    2
    addi t4,t4,    4
    add t4,s11,t4
    lw s10, 0(t4)
    la s4,_globalStr0    
    li s6, 28
__init_forcondBB13:
    bge	s6,zero,	__init_forbodyBB13
__initafterCallBB8:
    mv	a0,s4 
    call	print
    addi s2,s2,    1
    j	__init__forcondBB7
__init_forbodyBB13:
    sra t4,s10,s6
    andi t4,t4,    15
    li a5, 10
    blt	t4,a5,	__init_if_thenBB15
__init_if_elseBB9:
    addi t4,t4,    65
    addi t4,t4,    -10
    li a5, 32
    bge	t4,a5,	__init__ifTrue1
__init__if_end6:
    la a0,_globalStr0    
__init_afterCallBB3:
    mv	a1,a0 
    mv	a0,s4 
    call	_stringAdd
    mv	s4,a0 
__init_forupdateBB4:
    addi s6,s6,    -4
    j	__init_forcondBB13
__init__ifTrue1:
    li a5, 126
    ble	t4,a5,	__init__if_thenBB6
    j	__init__if_end6
__init__if_thenBB6:
    addi a1,t4,    -32
    addi a2,t4,    -31
    mv	a0,s5 
    call	_stringSubstring
    j	__init_afterCallBB3
__init_if_thenBB15:
    addi t4,t4,    48
    li a5, 32
    bge	t4,a5,	__init__ifTrue2
__init__if_end7:
    la a1,_globalStr0    
__init_afterCallBB4:
    mv	a0,s4 
    call	_stringAdd
    mv	s4,a0 
    j	__init_forupdateBB4
__init__ifTrue2:
    li a5, 126
    ble	t4,a5,	__init__if_thenBB7
    j	__init__if_end7
__init__if_thenBB7:
    addi a1,t4,    -32
    addi a2,t4,    -31
    mv	a0,s5 
    call	_stringSubstring
    mv	a1,a0 
    j	__init_afterCallBB4
__init_forbodyBB12:
    li t4, 16
__init_forcondBB14:
    li ra, 80
    blt	t4,ra,	__init_forbodyBB14
__init_afterForBB12:
    mv	a2,a5 
    mv	t3,a3 
    mv	a0,t6 
    mv	ra,a7 
    mv	t5,t2 
    mv	a1,zero 
__init_forcondBB15:
    li t4, 80
    blt	a1,t4,	__init_forbodyBB15
__init_afterForBB13:
    li t4, 65535
    and t1,a2,t4
    li t4, 65535
    and t4,a5,t4
    add t4,t4,t1
    srai t1,t4,    16
    srai a4,a2,    16
    li a2, 65535
    and a4,a4,a2
    srai a5,a5,    16
    li a2, 65535
    and a5,a5,a2
    add a5,a5,a4
    add a2,a5,t1
    li a5, 65535
    and a5,a2,a5
    li a2, 65535
    and t4,t4,a2
    slli a5,a5,    16
    or a5,a5,t4
    li t4, 65535
    and a2,t5,t4
    li t4, 65535
    and t4,t2,t4
    add t4,t4,a2
    srai a4,t4,    16
    srai t1,t5,    16
    li a2, 65535
    and t1,t1,a2
    srai a2,t2,    16
    li t2, 65535
    and a2,a2,t2
    add a2,a2,t1
    add a2,a2,a4
    li t1, 65535
    and a2,a2,t1
    li t1, 65535
    and t1,t4,t1
    slli t4,a2,    16
    or t2,t4,t1
    li t4, 65535
    and t4,t3,t4
    li a2, 65535
    and a2,a3,a2
    add t4,a2,t4
    srai t5,t4,    16
    srai a2,t3,    16
    li t1, 65535
    and a2,a2,t1
    srai t1,a3,    16
    li a3, 65535
    and t1,t1,a3
    add a2,t1,a2
    add a2,a2,t5
    li t1, 65535
    and a2,a2,t1
    li t1, 65535
    and t1,t4,t1
    slli t4,a2,    16
    or a3,t4,t1
    li t4, 65535
    and a2,a0,t4
    li t4, 65535
    and t4,t6,t4
    add a2,t4,a2
    srai t5,a2,    16
    srai t1,a0,    16
    li t4, 65535
    and t3,t1,t4
    srai t4,t6,    16
    li t1, 65535
    and t4,t4,t1
    add t4,t4,t3
    add t1,t4,t5
    li t4, 65535
    and t4,t1,t4
    li t1, 65535
    and a2,a2,t1
    slli t4,t4,    16
    or t6,t4,a2
    li t4, 65535
    and a2,ra,t4
    li t4, 65535
    and t4,a7,t4
    add a2,t4,a2
    srai t1,a2,    16
    srai ra,ra,    16
    li t4, 65535
    and t3,ra,t4
    srai ra,a7,    16
    li t4, 65535
    and t4,ra,t4
    add t4,t4,t3
    add ra,t4,t1
    li t4, 65535
    and t4,ra,t4
    li ra, 65535
    and ra,a2,ra
    slli t4,t4,    16
    or a7,t4,ra
    addi a6,a6,    1
    j	__init_forcondBB12
__init_forbodyBB15:
    li t4, 20
    blt	a1,t4,	__init_if_thenBB16
__init_if_elseBB10:
    li t4, 40
    blt	a1,t4,	__init_if_thenBB17
__init_if_elseBB11:
    li t4, 60
    blt	a1,t4,	__init_if_thenBB18
__init_if_elseBB12:
    xor t4,t5,t3
    xor a4,t4,a0
    li t4, -899497514
__init_if_end7:
    srai t1,a2,    27
    andi t1,t1,    31
    li s11, 134217727
    and s11,a2,s11
    slli s11,s11,    5
    or t1,s11,t1
    li s11, 65535
    and s4,ra,s11
    li s11, 65535
    and s11,t1,s11
    add s11,s11,s4
    srai s4,s11,    16
    srai ra,ra,    16
    li s10, 65535
    and ra,ra,s10
    srai t1,t1,    16
    li s10, 65535
    and t1,t1,s10
    add ra,t1,ra
    add t1,ra,s4
    li ra, 65535
    and ra,t1,ra
    li t1, 65535
    and t1,s11,t1
    slli ra,ra,    16
    or ra,ra,t1
    li t1, 65535
    and s11,t4,t1
    li t1, 65535
    and t1,a4,t1
    add t1,t1,s11
    srai s4,t1,    16
    srai t4,t4,    16
    li s11, 65535
    and s11,t4,s11
    srai a4,a4,    16
    li t4, 65535
    and t4,a4,t4
    add t4,t4,s11
    add a4,t4,s4
    li t4, 65535
    and t4,a4,t4
    li a4, 65535
    and t1,t1,a4
    slli t4,t4,    16
    or t4,t4,t1
    li t1, 65535
    and t1,t4,t1
    li a4, 65535
    and a4,ra,a4
    add t1,a4,t1
    srai s11,t1,    16
    srai a4,t4,    16
    li t4, 65535
    and a4,a4,t4
    srai ra,ra,    16
    li t4, 65535
    and t4,ra,t4
    add t4,t4,a4
    add ra,t4,s11
    li t4, 65535
    and t4,ra,t4
    li ra, 65535
    and ra,t1,ra
    slli t4,t4,    16
    or ra,t4,ra
    slli t4,a6,    2
    addi t4,t4,    4
    add t4,s3,t4
    lw t1, 0(t4)
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,t1,t4
    lw t1, 0(t4)
    li t4, 65535
    and a4,t1,t4
    li t4, 65535
    and t4,ra,t4
    add t4,t4,a4
    srai s11,t4,    16
    srai t1,t1,    16
    li a4, 65535
    and t1,t1,a4
    srai a4,ra,    16
    li ra, 65535
    and ra,a4,ra
    add ra,ra,t1
    add ra,ra,s11
    li t1, 65535
    and ra,ra,t1
    li t1, 65535
    and t4,t4,t1
    slli ra,ra,    16
    or t1,ra,t4
    mv	t4,t3 
    srai ra,t5,    2
    li t3, 1073741823
    and t3,ra,t3
    andi ra,t5,    3
    slli ra,ra,    30
    or t3,ra,t3
    mv	t5,a2 
    addi a1,a1,    1
    mv	ra,a0 
    mv	a0,t4 
    mv	a2,t1 
    j	__init_forcondBB15
__init_if_thenBB18:
    and a4,t3,a0
    and t4,t5,a0
    and t1,t5,t3
    or t4,t1,t4
    or a4,t4,a4
    li t4, -1894007588
    j	__init_if_end7
__init_if_thenBB17:
    xor t4,t5,t3
    xor a4,t4,a0
    li t4, 1859775393
    j	__init_if_end7
__init_if_thenBB16:
    xori t4,t5,    -1
    and t4,t4,a0
    and t1,t5,t3
    or a4,t1,t4
    li t4, 1518500249
    j	__init_if_end7
__init_forbodyBB14:
    slli ra,a6,    2
    addi ra,ra,    4
    add ra,s3,ra
    addi t1,t4,    -16
    lw a2, 0(ra)
    slli ra,t1,    2
    addi ra,ra,    4
    add a2,a2,ra
    slli ra,a6,    2
    addi ra,ra,    4
    add ra,s3,ra
    addi t1,t4,    -14
    lw t3, 0(ra)
    slli ra,t1,    2
    addi ra,ra,    4
    add t3,t3,ra
    slli ra,a6,    2
    addi ra,ra,    4
    add ra,s3,ra
    addi t1,t4,    -8
    lw t5, 0(ra)
    slli ra,t1,    2
    addi ra,ra,    4
    add t1,t5,ra
    slli ra,a6,    2
    addi ra,ra,    4
    add ra,s3,ra
    addi t5,t4,    -3
    lw ra, 0(ra)
    slli t5,t5,    2
    addi t5,t5,    4
    add ra,ra,t5
    lw ra, 0(ra)
    lw t1, 0(t1)
    xor t1,ra,t1
    lw ra, 0(t3)
    xor t1,t1,ra
    lw ra, 0(a2)
    xor ra,t1,ra
    srai a2,ra,    31
    andi a2,a2,    1
    li t1, 2147483647
    and ra,ra,t1
    slli ra,ra,    1
    or ra,ra,a2
    slli a2,a6,    2
    addi a2,a2,    4
    add a2,s3,a2
    lw t1, 0(a2)
    slli a2,t4,    2
    addi a2,a2,    4
    add a2,t1,a2
    sw ra,0(a2)
    addi t4,t4,    1
    j	__init_forcondBB14
__init_forbodyBB11:
    andi a2,a5,    3
    li ra, 3
    sub ra,ra,a2
    slli ra,ra,    3
    slli a2,a5,    2
    addi a2,a2,    4
    add a2,t4,a2
    lw a2, 0(a2)
    sll ra,a2,ra
    srai a2,a5,    6
    slli a2,a2,    2
    addi a2,a2,    4
    add t1,s3,a2
    andi a2,a5,    63
    srai a2,a2,    2
    lw t1, 0(t1)
    slli a2,a2,    2
    addi a2,a2,    4
    add a2,t1,a2
    lw a2, 0(a2)
    or a2,a2,ra
    srai ra,a5,    6
    slli ra,ra,    2
    addi ra,ra,    4
    add t1,s3,ra
    andi ra,a5,    63
    srai ra,ra,    2
    lw t1, 0(t1)
    slli ra,ra,    2
    addi ra,ra,    4
    add ra,t1,ra
    sw a2,0(ra)
    addi a5,a5,    1
    j	__init_forcondBB11
__init_forbodyBB10:
    mv	ra,zero 
__init_forcondBB16:
    li a2, 80
    blt	ra,a2,	__init_forbodyBB16
__init_forupdateBB5:
    addi a5,a5,    1
    j	__init_forcondBB10
__init_forbodyBB16:
    slli a2,a5,    2
    addi a2,a2,    4
    add a2,s3,a2
    lw a2, 0(a2)
    slli t1,ra,    2
    addi t1,t1,    4
    add a2,a2,t1
    sw zero,0(a2)
    addi ra,ra,    1
    j	__init_forcondBB16
__init_if_thenBB14:
    la a0,_globalStr4    
    call	println
    mv	s11,zero 
    j	__initafterCallBB7
__init__forbodyBB6:
    mv	a0,s4 
    mv	a1,s11 
    call	_stringOrd
    slli t4,s11,    2
    addi t4,t4,    4
    add t4,s1,t4
    sw a0,0(t4)
    addi s11,s11,    1
    j	__init__forcondBB6
__initafterCallBB1:
    mv	s11,s0 
    lw s10, 20(sp) 
    lw s9, 12(sp) 
    lw s8, 44(sp) 
    lw s7, 32(sp) 
    lw s6, 28(sp) 
    lw s5, 0(sp) 
    lw s4, 36(sp) 
    lw s3, 16(sp) 
    lw s2, 4(sp) 
    lw s1, 8(sp) 
    lw s0, 40(sp) 
    lw ra, 24(sp) 
    mv	a0,zero 
    addi sp,sp,    64
    ret
__initforupdateBB1:
    li a0, 324
    call malloc
    li t4, 80
    sw t4,0(a0)
    sw a0,0(s1)
    addi s1,s1,    4
    j	__initforcondBB1
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
