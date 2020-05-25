    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init__init.entryBB1:
    addi sp,sp,    -64
    sw ra, 40(sp) 
    sw s11, 8(sp) 
    sw s10, 4(sp) 
    sw s9, 20(sp) 
    sw s8, 36(sp) 
    sw s7, 0(sp) 
    sw s6, 28(sp) 
    sw s5, 32(sp) 
    sw s4, 44(sp) 
    sw s3, 12(sp) 
    sw s2, 24(sp) 
    sw s1, 16(sp) 
    mv	s7,s0 
    la s6,_globalStr2    
    li a0, 404
    call malloc
    mv	s10,a0 
    li a1, 100
    sw a1,0(s10)
    addi s5,s10,    4
    addi s8,s10,    400
__initforcondBB1:
    ble	s5,s8,	__initforupdateBB1
__initafterForBB1:
    li a0, 25284
    call malloc
    li a1, 6320
    sw a1,0(a0)
    mv	s4,a0 
    li a0, 24
    call malloc
    li a1, 5
    sw a1,0(a0)
    mv	s0,a0 
__init_whileBodyBB1:
    call	getInt
    beq	a0,zero,	__initafterCallBB1
__init_if_end1:
    li a1, 1
    beq	a0,a1,	__init_if_thenBB1
__init_if_elseBB1:
    li a1, 2
    beq	a0,a1,	__init_if_thenBB2
    j	__init_whileBodyBB1
__init_if_thenBB2:
    call	getString
    mv	s11,a0 
    li a0, 24
    call malloc
    li a1, 5
    sw a1,0(a0)
    mv	s5,a0 
    mv	a0,s11 
    call	stringLength
    li a1, 40
    bne	a0,a1,	__init__if_thenBB1
__init__if_end1:
    mv	a1,zero 
__init__forcondBB1:
    li a0, 5
    blt	a1,a0,	__init__forbodyBB1
__init__afterForBB1:
    mv	s9,zero 
__init__forcondBB2:
    li a1, 40
    blt	s9,a1,	__init__forbodyBB2
__init__afterForBB2:
    li s8, 1
__init__forcondBB3:
    li a1, 4
    ble	s8,a1,	__init__forbodyBB3
__init__afterForBB3:
    la a0,_globalStr3    
    call	println
    j	__init_whileBodyBB1
__init__forbodyBB3:
    mv	a1,zero 
__init__forcondBB4:
    blt	a1,s8,	__init__forbodyBB4
__init__whileBodyBB1:
    mv	a1,s4 
    addi a0,s8,    64
    addi a0,a0,    -56
    srai a0,a0,    6
    addi t6,a0,    1
    li a0, 100
    bgt	t6,a0,	__init_if_thenBB3
__init_if_end2:
    mv	a0,zero 
__init_forcondBB1:
    blt	a0,t6,	__init_forbodyBB1
__init_afterForBB1:
    mv	a0,zero 
__init_forcondBB2:
    blt	a0,s8,	__init_forbodyBB2
__init_afterForBB2:
    andi a1,a0,    3
    li t5, 3
    sub a1,t5,a1
    slli t5,a1,    3
    li a1, 128
    sll t5,a1,t5
    srai a1,a0,    6
    slli a1,a1,    2
    addi a1,a1,    4
    add t3,s10,a1
    andi a1,a0,    63
    srai a1,a1,    2
    lw t3, 0(t3)
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,t3,a1
    lw a1, 0(a1)
    or t5,a1,t5
    srai a1,a0,    6
    slli a1,a1,    2
    addi a1,a1,    4
    add t3,s10,a1
    andi a1,a0,    63
    srai a1,a1,    2
    lw a0, 0(t3)
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,a0,a1
    sw t5,0(a1)
    slli a0,s8,    3
    addi a1,t6,    -1
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,s10,a1
    lw a1, 0(a1)
    sw a0,64(a1)
    srai a1,s8,    29
    andi a0,a1,    7
    addi a1,t6,    -1
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,s10,a1
    lw a1, 0(a1)
    sw a0,60(a1)
    li t3, -1732584194
    mv	a2,zero 
    li a6, -1009589776
    li t1, 1732584193
    li a4, 271733878
    li t4, -271733879
__init_forcondBB3:
    blt	a2,t6,	__init_forbodyBB3
__init_afterForBB3:
    sw t1,4(s0)
    sw t4,8(s0)
    sw t3,12(s0)
    sw a4,16(s0)
    sw a6,20(s0)
    mv	a0,s0 
__initafterCallBB2:
    mv	a1,s5 
    lw t5, 0(a1)
    lw t3, 0(a0)
    bne	t3,t5,	__init_if_thenBB4
__init_if_end3:
    mv	t5,zero 
__init_forcondBB4:
    lw t3, 0(a0)
    blt	t5,t3,	__init_forbodyBB4
__init_afterForBB4:
    li a1, 1
__initafterCallBB3:
    bne	a1, zero, __init__if_thenBB2
__init__if_end2:
    mv	a1,s4 
    addi a0,s8,    -1
__init_forcondBB5:
    bge	a0,zero,	__init_forbodyBB5
__init_afterForBB5:
    mv	a1,zero 
__initafterCallBB4:
    bne	a1, zero, __init__whileBodyBB1
__init__forupdateBB1:
    addi s8,s8,    1
    j	__init__forcondBB3
__init_forbodyBB5:
    slli t5,a0,    2
    addi t5,t5,    4
    add t5,a1,t5
    lw t5, 0(t5)
    li t3, 122
    beq	t5,t3,	__init__if_thenBB3
__init__if_end3:
    li t3, 90
    beq	t5,t3,	__init__if_thenBB4
__init__if_end4:
    li t3, 57
    beq	t5,t3,	__init__if_thenBB5
__init__if_end5:
    addi t5,t5,    1
__init_afterCallBB1:
    slli t3,a0,    2
    addi t3,t3,    4
    add t3,a1,t3
    sw t5,0(t3)
    slli t5,a0,    2
    addi t5,t5,    4
    add t5,a1,t5
    lw t3, 0(t5)
    li t5, -1
    beq	t3,t5,	__init_if_thenBB5
__init_if_elseBB2:
    li a1, 1
    j	__initafterCallBB4
__init_if_thenBB5:
    slli t5,a0,    2
    addi t5,t5,    4
    add t3,a1,t5
    li t5, 48
    sw t5,0(t3)
    addi a0,a0,    -1
    j	__init_forcondBB5
__init__if_thenBB5:
    li t5, 65
    j	__init_afterCallBB1
__init__if_thenBB4:
    li t5, 97
    j	__init_afterCallBB1
__init__if_thenBB3:
    li t5, -1
    j	__init_afterCallBB1
__init__if_thenBB2:
    mv	s5,zero 
__init__forcondBB5:
    blt	s5,s8,	__init__forbodyBB5
__init__afterForBB4:
    la a0,_globalStr0    
    call	println
    j	__init_whileBodyBB1
__init__forbodyBB5:
    slli a1,s5,    2
    addi a1,a1,    4
    add a1,s4,a1
    lw a0, 0(a1)
    li a1, 32
    bge	a0,a1,	__init_ifTrue1
__init_if_end4:
    la a0,_globalStr0    
__initafterCallBB5:
    call	print
    addi s5,s5,    1
    j	__init__forcondBB5
__init_ifTrue1:
    li a1, 126
    ble	a0,a1,	__init_if_thenBB6
    j	__init_if_end4
__init_if_thenBB6:
    addi a1,a0,    -32
    addi a2,a0,    -31
    mv	a0,s6 
    call	_stringSubstring
    j	__initafterCallBB5
__init_forbodyBB4:
    slli t3,t5,    2
    addi t3,t3,    4
    add t4,a1,t3
    slli t3,t5,    2
    addi t3,t3,    4
    add t3,a0,t3
    lw a7, 0(t3)
    lw t3, 0(t4)
    bne	a7,t3,	__init_if_thenBB7
__init_forupdateBB1:
    addi t5,t5,    1
    j	__init_forcondBB4
__init_if_thenBB7:
    mv	a1,zero 
    j	__initafterCallBB3
__init_if_thenBB4:
    mv	a1,zero 
    j	__initafterCallBB3
__init_forbodyBB3:
    li a1, 16
__init_forcondBB6:
    li a0, 80
    blt	a1,a0,	__init_forbodyBB6
__init_afterForBB6:
    mv	t0,t1 
    mv	ra,t4 
    mv	a3,a4 
    mv	a0,a6 
    mv	t5,t3 
    mv	a7,zero 
__init_forcondBB7:
    li a1, 80
    blt	a7,a1,	__init_forbodyBB7
__init_afterForBB7:
    li a1, 65535
    and a7,t0,a1
    li a1, 65535
    and a1,t1,a1
    add a7,a1,a7
    srai t2,a7,    16
    srai a5,t0,    16
    li a1, 65535
    and a1,a5,a1
    srai t1,t1,    16
    li a5, 65535
    and a5,t1,a5
    add a1,a5,a1
    add a5,a1,t2
    li a1, 65535
    and a1,a5,a1
    li a5, 65535
    and a7,a7,a5
    slli a1,a1,    16
    or t1,a1,a7
    li a1, 65535
    and a7,ra,a1
    li a1, 65535
    and a1,t4,a1
    add a1,a1,a7
    srai a7,a1,    16
    srai ra,ra,    16
    li a5, 65535
    and ra,ra,a5
    srai t4,t4,    16
    li a5, 65535
    and t4,t4,a5
    add t4,t4,ra
    add t4,t4,a7
    li a7, 65535
    and t4,t4,a7
    li a7, 65535
    and a1,a1,a7
    slli t4,t4,    16
    or t4,t4,a1
    li a1, 65535
    and a7,t5,a1
    li a1, 65535
    and a1,t3,a1
    add a7,a1,a7
    srai ra,a7,    16
    srai a1,t5,    16
    li t5, 65535
    and t5,a1,t5
    srai a1,t3,    16
    li t3, 65535
    and a1,a1,t3
    add a1,a1,t5
    add t5,a1,ra
    li a1, 65535
    and a1,t5,a1
    li t5, 65535
    and t5,a7,t5
    slli a1,a1,    16
    or t3,a1,t5
    li a1, 65535
    and t5,a3,a1
    li a1, 65535
    and a1,a4,a1
    add t5,a1,t5
    srai a7,t5,    16
    srai a1,a3,    16
    li ra, 65535
    and a5,a1,ra
    srai a1,a4,    16
    li ra, 65535
    and a1,a1,ra
    add a1,a1,a5
    add a7,a1,a7
    li a1, 65535
    and a1,a7,a1
    li a7, 65535
    and t5,t5,a7
    slli a1,a1,    16
    or a4,a1,t5
    li a1, 65535
    and t5,a0,a1
    li a1, 65535
    and a1,a6,a1
    add a1,a1,t5
    srai a7,a1,    16
    srai t5,a0,    16
    li a0, 65535
    and t5,t5,a0
    srai a0,a6,    16
    li ra, 65535
    and a0,a0,ra
    add a0,a0,t5
    add t5,a0,a7
    li a0, 65535
    and a0,t5,a0
    li t5, 65535
    and a1,a1,t5
    slli a0,a0,    16
    or a6,a0,a1
    addi a2,a2,    1
    j	__init_forcondBB3
__init_forbodyBB7:
    li a1, 20
    blt	a7,a1,	__init_if_thenBB8
__init_if_elseBB3:
    li a1, 40
    blt	a7,a1,	__init_if_thenBB9
__init_if_elseBB4:
    li a1, 60
    blt	a7,a1,	__init_if_thenBB10
__init_if_elseBB5:
    xor a1,ra,t5
    xor t2,a1,a3
    li a1, -899497514
__init_if_end5:
    srai a5,t0,    27
    andi s9,a5,    31
    li a5, 134217727
    and a5,t0,a5
    slli a5,a5,    5
    or a5,a5,s9
    li s9, 65535
    and s11,a0,s9
    li s9, 65535
    and s9,a5,s9
    add s9,s9,s11
    srai s11,s9,    16
    srai a0,a0,    16
    li s2, 65535
    and s2,a0,s2
    srai a0,a5,    16
    li a5, 65535
    and a0,a0,a5
    add a0,a0,s2
    add a0,a0,s11
    li a5, 65535
    and a0,a0,a5
    li a5, 65535
    and a5,s9,a5
    slli a0,a0,    16
    or a0,a0,a5
    li a5, 65535
    and a5,a1,a5
    li s9, 65535
    and s9,t2,s9
    add a5,s9,a5
    srai s11,a5,    16
    srai a1,a1,    16
    li s9, 65535
    and s9,a1,s9
    srai a1,t2,    16
    li t2, 65535
    and a1,a1,t2
    add a1,a1,s9
    add t2,a1,s11
    li a1, 65535
    and a1,t2,a1
    li t2, 65535
    and a5,a5,t2
    slli a1,a1,    16
    or a1,a1,a5
    li a5, 65535
    and a5,a1,a5
    li t2, 65535
    and t2,a0,t2
    add a5,t2,a5
    srai t2,a5,    16
    srai a1,a1,    16
    li s9, 65535
    and s9,a1,s9
    srai a1,a0,    16
    li a0, 65535
    and a1,a1,a0
    add a1,a1,s9
    add a1,a1,t2
    li a0, 65535
    and a1,a1,a0
    li a0, 65535
    and a0,a5,a0
    slli a1,a1,    16
    or a5,a1,a0
    slli a1,a2,    2
    addi a1,a1,    4
    add a1,s10,a1
    lw a0, 0(a1)
    slli a1,a7,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw a0, 0(a1)
    li a1, 65535
    and t2,a0,a1
    li a1, 65535
    and a1,a5,a1
    add a1,a1,t2
    srai s9,a1,    16
    srai t2,a0,    16
    li a0, 65535
    and a0,t2,a0
    srai t2,a5,    16
    li a5, 65535
    and a5,t2,a5
    add a0,a5,a0
    add a0,a0,s9
    li a5, 65535
    and a0,a0,a5
    li a5, 65535
    and a5,a1,a5
    slli a1,a0,    16
    or a1,a1,a5
    mv	a0,a3 
    mv	a3,t5 
    srai t5,ra,    2
    li a5, 1073741823
    and a5,t5,a5
    andi t5,ra,    3
    slli t5,t5,    30
    or t5,t5,a5
    mv	ra,t0 
    addi a7,a7,    1
    mv	t0,a1 
    j	__init_forcondBB7
__init_if_thenBB10:
    and a5,t5,a3
    and a1,ra,a3
    and t2,ra,t5
    or a1,t2,a1
    or t2,a1,a5
    li a1, -1894007588
    j	__init_if_end5
__init_if_thenBB9:
    xor a1,ra,t5
    xor t2,a1,a3
    li a1, 1859775393
    j	__init_if_end5
__init_if_thenBB8:
    xori a1,ra,    -1
    and a5,a1,a3
    and a1,ra,t5
    or t2,a1,a5
    li a1, 1518500249
    j	__init_if_end5
__init_forbodyBB6:
    slli a0,a2,    2
    addi a0,a0,    4
    add a0,s10,a0
    addi a7,a1,    -16
    lw t5, 0(a0)
    slli a0,a7,    2
    addi a0,a0,    4
    add a7,t5,a0
    slli a0,a2,    2
    addi a0,a0,    4
    add a0,s10,a0
    addi ra,a1,    -14
    lw t5, 0(a0)
    slli a0,ra,    2
    addi a0,a0,    4
    add ra,t5,a0
    slli a0,a2,    2
    addi a0,a0,    4
    add a0,s10,a0
    addi a5,a1,    -8
    lw t5, 0(a0)
    slli a0,a5,    2
    addi a0,a0,    4
    add t5,t5,a0
    slli a0,a2,    2
    addi a0,a0,    4
    add a5,s10,a0
    addi a0,a1,    -3
    lw a5, 0(a5)
    slli a0,a0,    2
    addi a0,a0,    4
    add a0,a5,a0
    lw a0, 0(a0)
    lw t5, 0(t5)
    xor a0,a0,t5
    lw t5, 0(ra)
    xor a0,a0,t5
    lw t5, 0(a7)
    xor a0,a0,t5
    srai t5,a0,    31
    andi t5,t5,    1
    li a7, 2147483647
    and a0,a0,a7
    slli a0,a0,    1
    or a0,a0,t5
    slli t5,a2,    2
    addi t5,t5,    4
    add t5,s10,t5
    lw a7, 0(t5)
    slli t5,a1,    2
    addi t5,t5,    4
    add t5,a7,t5
    sw a0,0(t5)
    addi a1,a1,    1
    j	__init_forcondBB6
__init_forbodyBB2:
    andi t5,a0,    3
    li t3, 3
    sub t5,t3,t5
    slli t3,t5,    3
    slli t5,a0,    2
    addi t5,t5,    4
    add t5,a1,t5
    lw t5, 0(t5)
    sll t5,t5,t3
    srai t3,a0,    6
    slli t3,t3,    2
    addi t3,t3,    4
    add t4,s10,t3
    andi t3,a0,    63
    srai t3,t3,    2
    lw t4, 0(t4)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,t4,t3
    lw t3, 0(t3)
    or t4,t3,t5
    srai t5,a0,    6
    slli t5,t5,    2
    addi t5,t5,    4
    add t3,s10,t5
    andi t5,a0,    63
    srai t5,t5,    2
    lw t3, 0(t3)
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,t3,t5
    sw t4,0(t5)
    addi a0,a0,    1
    j	__init_forcondBB2
__init_forbodyBB1:
    mv	t5,zero 
__init_forcondBB8:
    li t3, 80
    blt	t5,t3,	__init_forbodyBB8
__init_forupdateBB2:
    addi a0,a0,    1
    j	__init_forcondBB1
__init_forbodyBB8:
    slli t3,a0,    2
    addi t3,t3,    4
    add t3,s10,t3
    lw t4, 0(t3)
    slli t3,t5,    2
    addi t3,t3,    4
    add t3,t4,t3
    sw zero,0(t3)
    addi t5,t5,    1
    j	__init_forcondBB8
__init_if_thenBB3:
    la a0,_globalStr4    
    call	println
    mv	a0,zero 
    j	__initafterCallBB2
__init__forbodyBB4:
    slli a0,a1,    2
    addi a0,a0,    4
    add t5,s4,a0
    li a0, 48
    sw a0,0(t5)
    addi a1,a1,    1
    j	__init__forcondBB4
__init__forbodyBB2:
    srai a1,s9,    2
    andi a0,a1,    1
    li a1, 1
    sub a1,a1,a0
    slli s1,a1,    4
    addi a2,s9,    4
    mv	a0,s11 
    mv	a1,s9 
    call	_stringSubstring
    mv	s3,a0 
    mv	s2,zero 
    mv	s8,zero 
__init_forcondBB9:
    mv	a0,s3 
    call	stringLength
    blt	s2,a0,	__init_forbodyBB9
__init_afterForBB8:
    mv	a1,s8 
__initafterCallBB6:
    sll a1,a1,s1
    srai a0,s9,    3
    slli a0,a0,    2
    addi a0,a0,    4
    add a0,s5,a0
    lw a0, 0(a0)
    or a0,a0,a1
    srai a1,s9,    3
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,s5,a1
    sw a0,0(a1)
    addi a1,s9,    4
    mv	s9,a1 
    j	__init__forcondBB2
__init_forbodyBB9:
    mv	a0,s3 
    mv	a1,s2 
    call	_stringOrd
    li a1, 48
    bge	a0,a1,	__init_ifTrue2
__init_if_elseBB6:
    li a1, 65
    bge	a0,a1,	__init_ifTrue3
__init_if_elseBB7:
    li a1, 97
    bge	a0,a1,	__init_ifTrue4
__init_if_elseBB8:
    mv	a1,zero 
    j	__initafterCallBB6
__init_ifTrue4:
    li a1, 102
    ble	a0,a1,	__init_if_thenBB11
    j	__init_if_elseBB8
__init_if_thenBB11:
    slli a1,s8,    4
    add a1,a1,a0
    addi a1,a1,    -97
    addi a1,a1,    10
__init_forupdateBB3:
    addi a0,s2,    1
    mv	s2,a0 
    mv	s8,a1 
    j	__init_forcondBB9
__init_ifTrue3:
    li a1, 70
    ble	a0,a1,	__init_if_thenBB12
    j	__init_if_elseBB7
__init_if_thenBB12:
    slli a1,s8,    4
    add a1,a1,a0
    addi a1,a1,    -65
    addi a1,a1,    10
    j	__init_forupdateBB3
__init_ifTrue2:
    li a1, 57
    ble	a0,a1,	__init_if_thenBB13
    j	__init_if_elseBB6
__init_if_thenBB13:
    slli a1,s8,    4
    add a1,a1,a0
    addi a1,a1,    -48
    j	__init_forupdateBB3
__init__forbodyBB1:
    slli a0,a1,    2
    addi a0,a0,    4
    add a0,s5,a0
    sw zero,0(a0)
    addi a1,a1,    1
    j	__init__forcondBB1
__init__if_thenBB1:
    la a0,_globalStr1    
    call	println
    j	__init_whileBodyBB1
__init_if_thenBB1:
    call	getString
    mv	s5,a0 
    mv	s8,zero 
__init__forcondBB6:
    mv	a0,s5 
    call	stringLength
    blt	s8,a0,	__init__forbodyBB6
__init__afterForBB5:
    mv	a0,s5 
    call	stringLength
    mv	a1,s4 
    addi t5,a0,    64
    addi t5,t5,    -56
    srai t5,t5,    6
    addi a5,t5,    1
    li t5, 100
    bgt	a5,t5,	__init_if_thenBB14
__init_if_end6:
    mv	t5,zero 
__init_forcondBB10:
    blt	t5,a5,	__init_forbodyBB10
__init_afterForBB9:
    mv	t5,zero 
__init_forcondBB11:
    blt	t5,a0,	__init_forbodyBB11
__init_afterForBB10:
    andi a1,t5,    3
    li t3, 3
    sub a1,t3,a1
    slli t3,a1,    3
    li a1, 128
    sll t4,a1,t3
    srai a1,t5,    6
    slli a1,a1,    2
    addi a1,a1,    4
    add t3,s10,a1
    andi a1,t5,    63
    srai a1,a1,    2
    lw t3, 0(t3)
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,t3,a1
    lw a1, 0(a1)
    or t4,a1,t4
    srai a1,t5,    6
    slli a1,a1,    2
    addi a1,a1,    4
    add t3,s10,a1
    andi a1,t5,    63
    srai a1,a1,    2
    lw t5, 0(t3)
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,t5,a1
    sw t4,0(a1)
    slli a1,a0,    3
    addi t5,a5,    -1
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,s10,t5
    lw t5, 0(t5)
    sw a1,64(t5)
    srai a1,a0,    29
    andi a0,a1,    7
    addi a1,a5,    -1
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,s10,a1
    lw a1, 0(a1)
    sw a0,60(a1)
    li t3, -271733879
    li t1, -1732584194
    li a1, -1009589776
    li a4, 1732584193
    mv	t6,zero 
    li a6, 271733878
__init_forcondBB12:
    blt	t6,a5,	__init_forbodyBB12
__init_afterForBB11:
    sw a4,4(s0)
    sw t3,8(s0)
    sw t1,12(s0)
    sw a6,16(s0)
    sw a1,20(s0)
    mv	s5,s0 
__initafterCallBB7:
    mv	s11,zero 
__init__forcondBB7:
    lw a1, 0(s5)
    blt	s11,a1,	__init__forbodyBB7
__init_afterCallBB2:
    la a0,_globalStr0    
    call	println
    j	__init_whileBodyBB1
__init__forbodyBB7:
    slli a1,s11,    2
    addi a1,a1,    4
    add a1,s5,a1
    lw s9, 0(a1)
    la s8,_globalStr0    
    li s2, 28
__init_forcondBB13:
    bge	s2,zero,	__init_forbodyBB13
__initafterCallBB8:
    mv	a0,s8 
    call	print
    addi s11,s11,    1
    j	__init__forcondBB7
__init_forbodyBB13:
    sra a1,s9,s2
    andi a1,a1,    15
    li a0, 10
    blt	a1,a0,	__init_if_thenBB15
__init_if_elseBB9:
    addi a1,a1,    65
    addi a0,a1,    -10
    li a1, 32
    bge	a0,a1,	__init__ifTrue1
__init__if_end6:
    la a1,_globalStr0    
__init_afterCallBB3:
    mv	a0,s8 
    call	_stringAdd
    mv	s8,a0 
__init_forupdateBB4:
    addi s2,s2,    -4
    j	__init_forcondBB13
__init__ifTrue1:
    li a1, 126
    ble	a0,a1,	__init__if_thenBB6
    j	__init__if_end6
__init__if_thenBB6:
    addi a1,a0,    -32
    addi a2,a0,    -31
    mv	a0,s6 
    call	_stringSubstring
    mv	a1,a0 
    j	__init_afterCallBB3
__init_if_thenBB15:
    addi a0,a1,    48
    li a1, 32
    bge	a0,a1,	__init__ifTrue2
__init__if_end7:
    la a0,_globalStr0    
__init_afterCallBB4:
    mv	a1,a0 
    mv	a0,s8 
    call	_stringAdd
    mv	s8,a0 
    j	__init_forupdateBB4
__init__ifTrue2:
    li a1, 126
    ble	a0,a1,	__init__if_thenBB7
    j	__init__if_end7
__init__if_thenBB7:
    addi a1,a0,    -32
    addi a2,a0,    -31
    mv	a0,s6 
    call	_stringSubstring
    j	__init_afterCallBB4
__init_forbodyBB12:
    li t5, 16
__init_forcondBB14:
    li a0, 80
    blt	t5,a0,	__init_forbodyBB14
__init_afterForBB12:
    mv	a7,a4 
    mv	t0,t3 
    mv	a3,t1 
    mv	a2,a6 
    mv	a0,a1 
    mv	t2,zero 
__init_forcondBB15:
    li t5, 80
    blt	t2,t5,	__init_forbodyBB15
__init_afterForBB13:
    li t5, 65535
    and t4,a7,t5
    li t5, 65535
    and t5,a4,t5
    add t5,t5,t4
    srai t2,t5,    16
    srai a7,a7,    16
    li t4, 65535
    and t4,a7,t4
    srai ra,a4,    16
    li a7, 65535
    and a7,ra,a7
    add t4,a7,t4
    add a7,t4,t2
    li t4, 65535
    and t4,a7,t4
    li a7, 65535
    and t5,t5,a7
    slli t4,t4,    16
    or a4,t4,t5
    li t5, 65535
    and t4,t0,t5
    li t5, 65535
    and t5,t3,t5
    add t5,t5,t4
    srai a7,t5,    16
    srai t4,t0,    16
    li ra, 65535
    and t4,t4,ra
    srai t3,t3,    16
    li ra, 65535
    and t3,t3,ra
    add t3,t3,t4
    add t3,t3,a7
    li t4, 65535
    and t3,t3,t4
    li t4, 65535
    and t5,t5,t4
    slli t3,t3,    16
    or t3,t3,t5
    li t5, 65535
    and t4,a3,t5
    li t5, 65535
    and t5,t1,t5
    add t5,t5,t4
    srai ra,t5,    16
    srai t4,a3,    16
    li a7, 65535
    and a7,t4,a7
    srai t1,t1,    16
    li t4, 65535
    and t4,t1,t4
    add t4,t4,a7
    add a7,t4,ra
    li t4, 65535
    and t4,a7,t4
    li a7, 65535
    and a7,t5,a7
    slli t5,t4,    16
    or t1,t5,a7
    li t5, 65535
    and t5,a2,t5
    li t4, 65535
    and t4,a6,t4
    add t5,t4,t5
    srai ra,t5,    16
    srai a7,a2,    16
    li t4, 65535
    and a7,a7,t4
    srai t4,a6,    16
    li a2, 65535
    and t4,t4,a2
    add t4,t4,a7
    add t4,t4,ra
    li a7, 65535
    and t4,t4,a7
    li a7, 65535
    and a7,t5,a7
    slli t5,t4,    16
    or a6,t5,a7
    li t5, 65535
    and t4,a0,t5
    li t5, 65535
    and t5,a1,t5
    add t5,t5,t4
    srai a7,t5,    16
    srai a0,a0,    16
    li t4, 65535
    and a0,a0,t4
    srai t4,a1,    16
    li a1, 65535
    and a1,t4,a1
    add a1,a1,a0
    add a1,a1,a7
    li a0, 65535
    and a1,a1,a0
    li a0, 65535
    and a0,t5,a0
    slli a1,a1,    16
    or a1,a1,a0
    addi t6,t6,    1
    j	__init_forcondBB12
__init_forbodyBB15:
    li t5, 20
    blt	t2,t5,	__init_if_thenBB16
__init_if_elseBB10:
    li t5, 40
    blt	t2,t5,	__init_if_thenBB17
__init_if_elseBB11:
    li t5, 60
    blt	t2,t5,	__init_if_thenBB18
__init_if_elseBB12:
    xor t5,t0,a3
    xor s5,t5,a2
    li ra, -899497514
__init_if_end7:
    srai t5,a7,    27
    andi t4,t5,    31
    li t5, 134217727
    and t5,a7,t5
    slli t5,t5,    5
    or t5,t5,t4
    li t4, 65535
    and t4,a0,t4
    li s8, 65535
    and s8,t5,s8
    add t4,s8,t4
    srai s9,t4,    16
    srai a0,a0,    16
    li s8, 65535
    and s8,a0,s8
    srai t5,t5,    16
    li a0, 65535
    and a0,t5,a0
    add a0,a0,s8
    add a0,a0,s9
    li t5, 65535
    and a0,a0,t5
    li t5, 65535
    and t5,t4,t5
    slli a0,a0,    16
    or a0,a0,t5
    li t5, 65535
    and t5,ra,t5
    li t4, 65535
    and t4,s5,t4
    add t4,t4,t5
    srai t5,t4,    16
    srai s8,ra,    16
    li ra, 65535
    and s8,s8,ra
    srai s5,s5,    16
    li ra, 65535
    and ra,s5,ra
    add ra,ra,s8
    add t5,ra,t5
    li ra, 65535
    and t5,t5,ra
    li ra, 65535
    and t4,t4,ra
    slli t5,t5,    16
    or t4,t5,t4
    li t5, 65535
    and ra,t4,t5
    li t5, 65535
    and t5,a0,t5
    add t5,t5,ra
    srai ra,t5,    16
    srai s5,t4,    16
    li t4, 65535
    and s5,s5,t4
    srai t4,a0,    16
    li a0, 65535
    and a0,t4,a0
    add a0,a0,s5
    add a0,a0,ra
    li t4, 65535
    and a0,a0,t4
    li t4, 65535
    and t5,t5,t4
    slli a0,a0,    16
    or t4,a0,t5
    slli a0,t6,    2
    addi a0,a0,    4
    add a0,s10,a0
    lw a0, 0(a0)
    slli t5,t2,    2
    addi t5,t5,    4
    add a0,a0,t5
    lw a0, 0(a0)
    li t5, 65535
    and ra,a0,t5
    li t5, 65535
    and t5,t4,t5
    add t5,t5,ra
    srai s5,t5,    16
    srai a0,a0,    16
    li ra, 65535
    and ra,a0,ra
    srai a0,t4,    16
    li t4, 65535
    and a0,a0,t4
    add a0,a0,ra
    add t4,a0,s5
    li a0, 65535
    and a0,t4,a0
    li t4, 65535
    and t5,t5,t4
    slli a0,a0,    16
    or t5,a0,t5
    mv	a0,a2 
    mv	a2,a3 
    srai ra,t0,    2
    li t4, 1073741823
    and ra,ra,t4
    andi t4,t0,    3
    slli t4,t4,    30
    or a3,t4,ra
    mv	t0,a7 
    addi t2,t2,    1
    mv	a7,t5 
    j	__init_forcondBB15
__init_if_thenBB18:
    and t5,a3,a2
    and t4,t0,a2
    and ra,t0,a3
    or t4,ra,t4
    or s5,t4,t5
    li ra, -1894007588
    j	__init_if_end7
__init_if_thenBB17:
    xor t5,t0,a3
    xor s5,t5,a2
    li ra, 1859775393
    j	__init_if_end7
__init_if_thenBB16:
    xori t5,t0,    -1
    and t5,t5,a2
    and t4,t0,a3
    or s5,t4,t5
    li ra, 1518500249
    j	__init_if_end7
__init_forbodyBB14:
    slli a0,t6,    2
    addi a0,a0,    4
    add a0,s10,a0
    addi t4,t5,    -16
    lw a0, 0(a0)
    slli t4,t4,    2
    addi t4,t4,    4
    add a0,a0,t4
    slli t4,t6,    2
    addi t4,t4,    4
    add t4,s10,t4
    addi ra,t5,    -14
    lw a7, 0(t4)
    slli t4,ra,    2
    addi t4,t4,    4
    add ra,a7,t4
    slli t4,t6,    2
    addi t4,t4,    4
    add t4,s10,t4
    addi a2,t5,    -8
    lw a7, 0(t4)
    slli t4,a2,    2
    addi t4,t4,    4
    add a7,a7,t4
    slli t4,t6,    2
    addi t4,t4,    4
    add a2,s10,t4
    addi t4,t5,    -3
    lw a2, 0(a2)
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,a2,t4
    lw t4, 0(t4)
    lw a7, 0(a7)
    xor t4,t4,a7
    lw a7, 0(ra)
    xor t4,t4,a7
    lw a0, 0(a0)
    xor a0,t4,a0
    srai t4,a0,    31
    andi a7,t4,    1
    li t4, 2147483647
    and a0,a0,t4
    slli a0,a0,    1
    or a0,a0,a7
    slli t4,t6,    2
    addi t4,t4,    4
    add t4,s10,t4
    lw t4, 0(t4)
    slli a7,t5,    2
    addi a7,a7,    4
    add t4,t4,a7
    sw a0,0(t4)
    addi t5,t5,    1
    j	__init_forcondBB14
__init_forbodyBB11:
    andi t4,t5,    3
    li t3, 3
    sub t3,t3,t4
    slli t3,t3,    3
    slli t4,t5,    2
    addi t4,t4,    4
    add t4,a1,t4
    lw t4, 0(t4)
    sll t4,t4,t3
    srai t3,t5,    6
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,s10,t3
    andi a7,t5,    63
    srai ra,a7,    2
    lw a7, 0(t3)
    slli t3,ra,    2
    addi t3,t3,    4
    add t3,a7,t3
    lw t3, 0(t3)
    or t4,t3,t4
    srai t3,t5,    6
    slli t3,t3,    2
    addi t3,t3,    4
    add a7,s10,t3
    andi t3,t5,    63
    srai t3,t3,    2
    lw a7, 0(a7)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,a7,t3
    sw t4,0(t3)
    addi t5,t5,    1
    j	__init_forcondBB11
__init_forbodyBB10:
    mv	t3,zero 
__init_forcondBB16:
    li t4, 80
    blt	t3,t4,	__init_forbodyBB16
__init_forupdateBB5:
    addi t5,t5,    1
    j	__init_forcondBB10
__init_forbodyBB16:
    slli t4,t5,    2
    addi t4,t4,    4
    add t4,s10,t4
    lw a7, 0(t4)
    slli t4,t3,    2
    addi t4,t4,    4
    add t4,a7,t4
    sw zero,0(t4)
    addi t3,t3,    1
    j	__init_forcondBB16
__init_if_thenBB14:
    la a0,_globalStr4    
    call	println
    mv	s5,zero 
    j	__initafterCallBB7
__init__forbodyBB6:
    mv	a0,s5 
    mv	a1,s8 
    call	_stringOrd
    slli a1,s8,    2
    addi a1,a1,    4
    add a1,s4,a1
    sw a0,0(a1)
    addi s8,s8,    1
    j	__init__forcondBB6
__initafterCallBB1:
    mv	s0,s7 
    lw s1, 16(sp) 
    lw s2, 24(sp) 
    lw s3, 12(sp) 
    lw s4, 44(sp) 
    lw s5, 32(sp) 
    lw s6, 28(sp) 
    lw s7, 0(sp) 
    lw s8, 36(sp) 
    lw s9, 20(sp) 
    lw s10, 4(sp) 
    lw s11, 8(sp) 
    lw ra, 40(sp) 
    mv	a0,zero 
    addi sp,sp,    64
    ret
__initforupdateBB1:
    li a0, 324
    call malloc
    li a1, 80
    sw a1,0(a0)
    sw a0,0(s5)
    addi s5,s5,    4
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
