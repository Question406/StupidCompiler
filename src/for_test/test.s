    .text
    .globl	gcd				#begin
    .p2align	2
    .type	gcd,@function
gcd:
gcd.entryBB1:
    addi sp,sp,    -16
    sw ra, 0(sp) 
    mv	t2,a1 
    beq	t2,zero,	if_thenBB1
    j	if_end1
if_thenBB1:
    j	gcd.exitBB1
gcd.exitBB1:
    lw ra, 0(sp) 
    addi sp,sp,    16
    ret
if_end1:
    blt	a0,t2,	if_thenBB2
    j	if_elseBB1
if_thenBB2:
    mv	a1,t2 
    beq	a0,zero,	_copy_if_thenBB1
    j	_copy_if_end1
_copy_if_end1:
    blt	a1,a0,	_copy_if_thenBB2
    j	_copy_if_elseBB1
_copy_if_elseBB1:
    rem a1,a1,a0
    call	gcd
    j	afterCallBB1
afterCallBB1:
    j	gcd.exitBB1
_copy_if_thenBB2:
    call	gcd
    j	afterCallBB1
_copy_if_thenBB1:
    mv	a0,a1 
    j	afterCallBB1
if_elseBB1:
    rem a0,a0,t2
    beq	a0,zero,	_copy_if_thenBB3
    j	_copy_if_end2
_copy_if_thenBB3:
    mv	a1,t2 
    j	afterCallBB2
afterCallBB2:
    mv	a0,a1 
    j	gcd.exitBB1
_copy_if_end2:
    blt	t2,a0,	_copy_if_thenBB4
    j	_copy_if_elseBB2
_copy_if_elseBB2:
    rem a1,t2,a0
    call	gcd
    mv	a1,a0 
    j	afterCallBB2
_copy_if_thenBB4:
    mv	a1,a0 
    mv	a0,t2 
    beq	a0,zero,	_copy_if_thenBB5
    j	_copy_if_end3
_copy_if_thenBB5:
    j	afterCallBB3
afterCallBB3:
    j	afterCallBB2
_copy_if_end3:
    blt	a1,a0,	_copy_if_thenBB6
    j	_copy_if_elseBB3
_copy_if_thenBB6:
    call	gcd
    mv	a1,a0 
    j	afterCallBB3
_copy_if_elseBB3:
    rem a1,a1,a0
    call	gcd
    mv	a1,a0 
    j	afterCallBB3
								 # func end
    .globl	update				#begin
    .p2align	2
    .type	update,@function
update:
update.entryBB1:
    addi sp,sp,    -48
    sw ra, 8(sp) 
    sw s4, 12(sp) 
    sw s5, 4(sp) 
    sw s6, 32(sp) 
    sw s7, 28(sp) 
    sw s8, 16(sp) 
    sw s9, 24(sp) 
    sw s10, 0(sp) 
    sw s11, 20(sp) 
    mv	s5,s0 
    mv	s4,s1 
    mv	s0,a2 
    mv	ra,a1 
    mv	s9,a0 
    la t2,now    
    lw a1, 0(t2)
    la t2,t    
    lw t3, 0(t2)
    la t2,pr    
    lw t2, 0(t2)
    la a0,s    
    lw a4, 0(a0)
    la a0,sum    
    lw a2, 0(a0)
    la a0,flag    
    lw t4, 0(a0)
    la a0,L    
    lw t0, 0(a0)
    la a0,pl    
    lw a0, 0(a0)
    la a7,b    
    lw a3, 0(a7)
    la a7,p    
    lw a7, 0(a7)
    ble	a0,ra,	ifTrue1
    j	if_end2
ifTrue1:
    bge	t2,s0,	ifTrue2
    j	if_end2
ifTrue2:
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,t4,t1
    lw t1, 0(t1)
    bgt	t1,zero,	if_thenBB3
    j	if_end2
if_thenBB3:
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,a1,t1
    lw t1, 0(t1)
    addi t1,t1,    1
    rem ra,t1,t0
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,a1,t1
    sw ra,0(t1)
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,a4,t1
    slli ra,s9,    2
    addi ra,ra,    4
    add ra,a1,ra
    lw t6, 0(t1)
    lw t1, 0(ra)
    slli t1,t1,    2
    addi t1,t1,    4
    add t1,t6,t1
    slli ra,s9,    2
    addi ra,ra,    4
    add ra,a2,ra
    lw t1, 0(t1)
    sw t1,0(ra)
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,t3,t1
    lw t1, 0(t1)
    addi t1,t1,    1
    rem t1,t1,t0
    slli ra,s9,    2
    addi ra,ra,    4
    add ra,t3,ra
    sw t1,0(ra)
    mv	t6,a3 
    mv	t1,a4 
    mv	t5,a2 
    mv	a4,t0 
    mv	a3,t4 
    mv	t0,a1 
    mv	a2,t2 
    mv	t4,t3 
    mv	ra,a0 
    j	update.exitBB1
update.exitBB1:
    lui t2,%hi(p)
    sw a7, %lo(p)(t2)
    lui t2,%hi(b)
    sw t6, %lo(b)(t2)
    lui t2,%hi(pl)
    sw ra, %lo(pl)(t2)
    lui t2,%hi(L)
    sw a4, %lo(L)(t2)
    lui t2,%hi(flag)
    sw a3, %lo(flag)(t2)
    lui t2,%hi(sum)
    sw t5, %lo(sum)(t2)
    lui t2,%hi(s)
    sw t1, %lo(s)(t2)
    lui t2,%hi(pr)
    sw a2, %lo(pr)(t2)
    lui t2,%hi(t)
    sw t4, %lo(t)(t2)
    lui t2,%hi(now)
    sw t0, %lo(now)(t2)
    mv	s1,s4 
    mv	s0,s5 
    lw s11, 20(sp) 
    lw s10, 0(sp) 
    lw s9, 24(sp) 
    lw s8, 16(sp) 
    lw s7, 28(sp) 
    lw s6, 32(sp) 
    lw s5, 4(sp) 
    lw s4, 12(sp) 
    lw ra, 8(sp) 
    addi sp,sp,    48
    ret
if_end2:
    beq	ra,s0,	if_thenBB4
    j	if_end3
if_thenBB4:
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,a2,t1
    lw t1, 0(t1)
    rem t1,t1,a7
    mul t1,t1,t1
    rem ra,t1,a7
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,a2,t1
    sw ra,0(t1)
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,a2,t1
    lw t1, 0(t1)
    slli t1,t1,    2
    addi t1,t1,    4
    add t1,a3,t1
    lw t1, 0(t1)
    bgt	t1,zero,	if_thenBB5
    j	paracopy1
if_thenBB5:
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,t4,t1
    li ra, 1
    sw ra,0(t1)
    slli t1,s9,    2
    addi t1,t1,    4
    add ra,a2,t1
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,a4,t1
    lw t1, 0(t1)
    lw ra, 0(ra)
    sw ra,4(t1)
    li ra, 1
    j	forcondBB1
forcondBB1:
    blt	ra,t0,	forbodyBB1
    j	paracopy2
paracopy2:
    mv	t6,a3 
    mv	t1,a4 
    mv	t5,a2 
    mv	a4,t0 
    mv	a3,t4 
    mv	t0,a1 
    mv	a2,t2 
    mv	t4,t3 
    mv	ra,a0 
    j	update.exitBB1
forbodyBB1:
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,a4,t1
    addi a5,ra,    -1
    lw t6, 0(t1)
    slli t1,a5,    2
    addi t1,t1,    4
    add t1,t6,t1
    lw t1, 0(t1)
    rem t1,t1,a7
    mul t1,t1,t1
    rem t6,t1,a7
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,a4,t1
    lw t1, 0(t1)
    slli a5,ra,    2
    addi a5,a5,    4
    add t1,t1,a5
    sw t6,0(t1)
    addi ra,ra,    1
    j	forcondBB1
paracopy1:
    mv	t6,a3 
    mv	t1,a4 
    mv	t5,a2 
    mv	a4,t0 
    mv	a3,t4 
    mv	t0,a1 
    mv	a2,t2 
    mv	t4,t3 
    mv	ra,a0 
    j	update.exitBB1
if_end3:
    slli t1,s9,    2
    addi t1,t1,    4
    add t1,t3,t1
    lw t1, 0(t1)
    bgt	t1,zero,	if_thenBB6
    j	if_end4
if_end4:
    slli t1,s9,    1
    mv	s7,t1 
    slli t1,s9,    1
    addi t1,t1,    1
    mv	s6,t1 
    add t1,ra,s0
    srai t1,t1,    1
    mv	s11,t1 
    ble	a0,s11,	if_thenBB7
    j	paracopy3
if_thenBB7:
    ble	a0,ra,	_copy_ifTrue1
    j	_copy_if_end4
_copy_if_end4:
    beq	ra,s11,	_copy_if_thenBB7
    j	_copy_if_end5
_copy_if_thenBB7:
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,a2,t1
    lw t1, 0(t1)
    rem t1,t1,a7
    mul t1,t1,t1
    rem t1,t1,a7
    slli ra,s7,    2
    addi ra,ra,    4
    add ra,a2,ra
    sw t1,0(ra)
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,a2,t1
    lw t1, 0(t1)
    slli t1,t1,    2
    addi t1,t1,    4
    add t1,a3,t1
    lw t1, 0(t1)
    bgt	t1,zero,	_copy_if_thenBB8
    j	paracopy4
_copy_if_thenBB8:
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,t4,t1
    li ra, 1
    sw ra,0(t1)
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,a2,t1
    slli ra,s7,    2
    addi ra,ra,    4
    add ra,a4,ra
    lw ra, 0(ra)
    lw t1, 0(t1)
    sw t1,4(ra)
    li ra, 1
    j	_copy_forcondBB1
_copy_forcondBB1:
    blt	ra,t0,	_copy_forbodyBB1
    j	paracopy5
_copy_forbodyBB1:
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,a4,t1
    addi t6,ra,    -1
    lw t1, 0(t1)
    slli t6,t6,    2
    addi t6,t6,    4
    add t1,t1,t6
    lw t1, 0(t1)
    rem t1,t1,a7
    mul t1,t1,t1
    rem a5,t1,a7
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,a4,t1
    lw t6, 0(t1)
    slli t1,ra,    2
    addi t1,t1,    4
    add t1,t6,t1
    sw a5,0(t1)
    addi ra,ra,    1
    j	_copy_forcondBB1
paracopy5:
    mv	t1,a4 
    mv	a4,t2 
    mv	ra,a0 
    j	if_end5
if_end5:
    addi t2,s11,    1
    bge	a4,t2,	if_thenBB8
    j	paracopy6
paracopy6:
    mv	t2,a3 
    mv	a3,a2 
    mv	a0,t0 
    mv	a5,t4 
    mv	t0,a1 
    mv	a2,a4 
    mv	t4,t3 
    j	if_end6
if_end6:
    slli t3,s6,    2
    addi t3,t3,    4
    add a1,a3,t3
    slli t3,s7,    2
    addi t3,t3,    4
    add t3,a3,t3
    lw a4, 0(t3)
    lw t3, 0(a1)
    add t3,a4,t3
    slli a1,s9,    2
    addi a1,a1,    4
    add a1,a3,a1
    sw t3,0(a1)
    slli t3,s6,    2
    addi t3,t3,    4
    add a4,a5,t3
    slli t3,s7,    2
    addi t3,t3,    4
    add t3,a5,t3
    lw a1, 0(t3)
    lw t3, 0(a4)
    and a1,a1,t3
    slli t3,s9,    2
    addi t3,t3,    4
    add t3,a5,t3
    sw a1,0(t3)
    slli t3,s9,    2
    addi t3,t3,    4
    add t3,a5,t3
    lw t3, 0(t3)
    bgt	t3,zero,	if_thenBB9
    j	paracopy7
paracopy7:
    mv	t6,t2 
    mv	t5,a3 
    mv	a4,a0 
    mv	a3,a5 
    j	update.exitBB1
if_thenBB9:
    mv	t3,zero 
    j	forcondBB2
forcondBB2:
    blt	t3,a0,	forbodyBB2
    j	afterForBB1
forbodyBB2:
    slli a1,s6,    2
    addi a1,a1,    4
    add a4,t1,a1
    slli a1,s6,    2
    addi a1,a1,    4
    add a1,t0,a1
    lw a1, 0(a1)
    add a1,t3,a1
    rem a1,a1,a0
    lw a4, 0(a4)
    slli a1,a1,    2
    addi a1,a1,    4
    add t6,a4,a1
    slli a1,s7,    2
    addi a1,a1,    4
    add a4,t1,a1
    slli a1,s7,    2
    addi a1,a1,    4
    add a1,t0,a1
    lw a1, 0(a1)
    add a1,t3,a1
    rem a1,a1,a0
    lw a4, 0(a4)
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,a4,a1
    lw a1, 0(a1)
    lw a4, 0(t6)
    add a1,a1,a4
    slli a4,s9,    2
    addi a4,a4,    4
    add a4,t1,a4
    lw a4, 0(a4)
    slli t6,t3,    2
    addi t6,t6,    4
    add a4,a4,t6
    sw a1,0(a4)
    addi t3,t3,    1
    j	forcondBB2
afterForBB1:
    slli t3,s9,    2
    addi t3,t3,    4
    add t3,t0,t3
    li a1, 0
    sw a1,0(t3)
    mv	t6,t2 
    mv	t5,a3 
    mv	a4,a0 
    mv	a3,a5 
    j	update.exitBB1
if_thenBB8:
    addi t2,s11,    1
    mv	s11,s6 
    ble	ra,t2,	_copy_ifTrue2
    j	_copy_if_end6
_copy_if_end6:
    beq	t2,s0,	_copy_if_thenBB9
    j	_copy_if_end7
_copy_if_end7:
    slli a0,s11,    2
    addi a0,a0,    4
    add a0,t3,a0
    lw a0, 0(a0)
    bgt	a0,zero,	_copy_if_thenBB10
    j	_copy_if_end8
_copy_if_thenBB10:
    mv	a0,s11 
    slli t6,a0,    2
    addi t6,t6,    4
    add t6,t3,t6
    lw t6, 0(t6)
    bgt	t6,zero,	_copy__if_thenBB1
    j	_copy_if_end8
_copy__if_thenBB1:
    slli a5,a0,    1
    slli t6,a0,    1
    addi t6,t6,    1
    slli t5,a0,    2
    addi t5,t5,    4
    add a6,t3,t5
    slli t5,a5,    2
    addi t5,t5,    4
    add t5,a1,t5
    lw s1, 0(t5)
    lw t5, 0(a6)
    add t5,s1,t5
    rem a6,t5,t0
    slli t5,a5,    2
    addi t5,t5,    4
    add t5,a1,t5
    sw a6,0(t5)
    slli t5,a5,    2
    addi t5,t5,    4
    add a6,t1,t5
    slli t5,a5,    2
    addi t5,t5,    4
    add s1,a1,t5
    lw t5, 0(a6)
    lw a6, 0(s1)
    slli a6,a6,    2
    addi a6,a6,    4
    add s1,t5,a6
    slli t5,a5,    2
    addi t5,t5,    4
    add a6,a2,t5
    lw t5, 0(s1)
    sw t5,0(a6)
    slli t5,a0,    2
    addi t5,t5,    4
    add t5,t3,t5
    slli a6,a5,    2
    addi a6,a6,    4
    add a6,t3,a6
    lw a6, 0(a6)
    lw t5, 0(t5)
    add t5,a6,t5
    rem t5,t5,t0
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,t3,a5
    sw t5,0(a5)
    slli a5,a0,    2
    addi a5,a5,    4
    add a6,t3,a5
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,a1,a5
    lw t5, 0(a5)
    lw a5, 0(a6)
    add a5,t5,a5
    rem t5,a5,t0
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,a1,a5
    sw t5,0(a5)
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,t1,a5
    slli t5,t6,    2
    addi t5,t5,    4
    add t5,a1,t5
    lw a5, 0(a5)
    lw t5, 0(t5)
    slli t5,t5,    2
    addi t5,t5,    4
    add a5,a5,t5
    slli t5,t6,    2
    addi t5,t5,    4
    add t5,a2,t5
    lw a5, 0(a5)
    sw a5,0(t5)
    slli a5,a0,    2
    addi a5,a5,    4
    add a5,t3,a5
    slli t5,t6,    2
    addi t5,t5,    4
    add t5,t3,t5
    lw t5, 0(t5)
    lw a5, 0(a5)
    add a5,t5,a5
    rem a5,a5,t0
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,t3,t6
    sw a5,0(t6)
    slli a0,a0,    2
    addi a0,a0,    4
    add a0,t3,a0
    li t6, 0
    sw t6,0(a0)
    j	_copy_if_end8
_copy_if_end8:
    slli a0,s11,    1
    mv	s10,a0 
    slli a0,s11,    1
    addi a0,a0,    1
    mv	s1,a0 
    add a0,t2,s0
    srai a0,a0,    1
    mv	s8,a0 
    ble	ra,s8,	_copy_if_thenBB11
    j	paracopy8
paracopy8:
    mv	t6,a3 
    mv	a0,t1 
    mv	a3,a2 
    mv	t2,t0 
    mv	t1,t4 
    mv	t0,a7 
    mv	a2,a4 
    mv	t4,t3 
    j	_copy_if_end9
_copy_if_end9:
    addi a7,s8,    1
    bge	a2,a7,	_copy_if_thenBB12
    j	paracopy9
paracopy9:
    mv	a7,t6 
    mv	t3,t2 
    mv	a4,t1 
    mv	t6,t0 
    mv	t0,a1 
    j	_copy_if_end10
_copy_if_end10:
    slli t2,s1,    2
    addi t2,t2,    4
    add t2,a3,t2
    slli t1,s10,    2
    addi t1,t1,    4
    add t1,a3,t1
    lw t1, 0(t1)
    lw t2, 0(t2)
    add t2,t1,t2
    slli t1,s11,    2
    addi t1,t1,    4
    add t1,a3,t1
    sw t2,0(t1)
    slli t2,s1,    2
    addi t2,t2,    4
    add t1,a4,t2
    slli t2,s10,    2
    addi t2,t2,    4
    add t2,a4,t2
    lw a1, 0(t2)
    lw t2, 0(t1)
    and t1,a1,t2
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,a4,t2
    sw t1,0(t2)
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,a4,t2
    lw t2, 0(t2)
    bgt	t2,zero,	_copy_if_thenBB13
    j	paracopy10
paracopy10:
    mv	t2,a7 
    mv	t1,a0 
    mv	a0,t3 
    mv	a5,a4 
    mv	a7,t6 
    j	if_end6
_copy_if_thenBB13:
    mv	t2,zero 
    j	_copy_forcondBB2
_copy_forcondBB2:
    blt	t2,t3,	_copy_forbodyBB2
    j	_copy_afterForBB1
_copy_afterForBB1:
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,t0,t2
    li t1, 0
    sw t1,0(t2)
    mv	t2,a7 
    mv	t1,a0 
    mv	a0,t3 
    mv	a5,a4 
    mv	a7,t6 
    j	if_end6
_copy_forbodyBB2:
    slli t1,s1,    2
    addi t1,t1,    4
    add t1,a0,t1
    slli a1,s1,    2
    addi a1,a1,    4
    add a1,t0,a1
    lw a1, 0(a1)
    add a1,t2,a1
    rem a1,a1,t3
    lw a5, 0(t1)
    slli t1,a1,    2
    addi t1,t1,    4
    add a1,a5,t1
    slli t1,s10,    2
    addi t1,t1,    4
    add a5,a0,t1
    slli t1,s10,    2
    addi t1,t1,    4
    add t1,t0,t1
    lw t1, 0(t1)
    add t1,t2,t1
    rem t1,t1,t3
    lw a5, 0(a5)
    slli t1,t1,    2
    addi t1,t1,    4
    add t1,a5,t1
    lw t1, 0(t1)
    lw a1, 0(a1)
    add a5,t1,a1
    slli t1,s11,    2
    addi t1,t1,    4
    add t1,a0,t1
    lw a1, 0(t1)
    slli t1,t2,    2
    addi t1,t1,    4
    add t1,a1,t1
    sw a5,0(t1)
    addi t2,t2,    1
    j	_copy_forcondBB2
_copy_if_thenBB12:
    addi a7,s8,    1
    lui t3,%hi(p)
    sw t0, %lo(p)(t3)
    lui t0,%hi(b)
    sw t6, %lo(b)(t0)
    lui t0,%hi(pl)
    sw ra, %lo(pl)(t0)
    lui t0,%hi(L)
    sw t2, %lo(L)(t0)
    lui t2,%hi(flag)
    sw t1, %lo(flag)(t2)
    lui t2,%hi(sum)
    sw a3, %lo(sum)(t2)
    lui t2,%hi(s)
    sw a0, %lo(s)(t2)
    lui t2,%hi(pr)
    sw a2, %lo(pr)(t2)
    lui t2,%hi(t)
    sw t4, %lo(t)(t2)
    lui t2,%hi(now)
    sw a1, %lo(now)(t2)
    mv	a0,s1 
    mv	a1,a7 
    mv	a2,s0 
    call	update
    la t2,now    
    lw t0, 0(t2)
    la t2,t    
    lw t4, 0(t2)
    la t2,pr    
    lw a2, 0(t2)
    la t2,s    
    lw t2, 0(t2)
    la a0,sum    
    lw a3, 0(a0)
    la a0,flag    
    lw t1, 0(a0)
    la a0,L    
    lw t3, 0(a0)
    la a0,pl    
    lw ra, 0(a0)
    la a0,b    
    lw a7, 0(a0)
    la a0,p    
    lw a1, 0(a0)
    mv	a0,t2 
    mv	a4,t1 
    mv	t6,a1 
    j	_copy_if_end10
_copy_if_thenBB11:
    lui a0,%hi(p)
    sw a7, %lo(p)(a0)
    lui a0,%hi(b)
    sw a3, %lo(b)(a0)
    lui a0,%hi(pl)
    sw ra, %lo(pl)(a0)
    lui a0,%hi(L)
    sw t0, %lo(L)(a0)
    lui a0,%hi(flag)
    sw t4, %lo(flag)(a0)
    lui a0,%hi(sum)
    sw a2, %lo(sum)(a0)
    lui a0,%hi(s)
    sw t1, %lo(s)(a0)
    lui a0,%hi(pr)
    sw a4, %lo(pr)(a0)
    lui a0,%hi(t)
    sw t3, %lo(t)(a0)
    lui a0,%hi(now)
    sw a1, %lo(now)(a0)
    mv	a0,s10 
    mv	a1,t2 
    mv	a2,s8 
    call	update
    la t2,now    
    lw t3, 0(t2)
    la t2,t    
    lw t4, 0(t2)
    la t2,pr    
    lw a2, 0(t2)
    la t2,s    
    lw t2, 0(t2)
    la a0,sum    
    lw a3, 0(a0)
    la a0,flag    
    lw t1, 0(a0)
    la a0,L    
    lw a7, 0(a0)
    la a0,pl    
    lw ra, 0(a0)
    la a0,b    
    lw t6, 0(a0)
    la a0,p    
    lw t0, 0(a0)
    mv	a0,t2 
    mv	t2,a7 
    mv	a1,t3 
    j	_copy_if_end9
_copy_if_thenBB9:
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,a2,t2
    lw t2, 0(t2)
    rem t2,t2,a7
    mul t2,t2,t2
    rem a0,t2,a7
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,a2,t2
    sw a0,0(t2)
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,a2,t2
    lw t2, 0(t2)
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,a3,t2
    lw t2, 0(t2)
    bgt	t2,zero,	_copy_if_thenBB14
    j	paracopy11
_copy_if_thenBB14:
    slli t2,s11,    2
    addi t2,t2,    4
    add a0,t4,t2
    li t2, 1
    sw t2,0(a0)
    slli t2,s11,    2
    addi t2,t2,    4
    add a0,a2,t2
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,t1,t2
    lw t2, 0(t2)
    lw a0, 0(a0)
    sw a0,4(t2)
    li t2, 1
    j	_copy_forcondBB3
_copy_forcondBB3:
    blt	t2,t0,	_copy_forbodyBB3
    j	paracopy12
_copy_forbodyBB3:
    slli a0,s11,    2
    addi a0,a0,    4
    add a0,t1,a0
    addi t6,t2,    -1
    lw a0, 0(a0)
    slli t6,t6,    2
    addi t6,t6,    4
    add a0,a0,t6
    lw a0, 0(a0)
    rem a0,a0,a7
    mul a0,a0,a0
    rem a5,a0,a7
    slli a0,s11,    2
    addi a0,a0,    4
    add a0,t1,a0
    lw t6, 0(a0)
    slli a0,t2,    2
    addi a0,a0,    4
    add a0,t6,a0
    sw a5,0(a0)
    addi t2,t2,    1
    j	_copy_forcondBB3
paracopy12:
    mv	t2,a3 
    mv	a3,a2 
    mv	a0,t0 
    mv	a5,t4 
    mv	t0,a1 
    mv	a2,a4 
    mv	t4,t3 
    j	if_end6
paracopy11:
    mv	t2,a3 
    mv	a3,a2 
    mv	a0,t0 
    mv	a5,t4 
    mv	t0,a1 
    mv	a2,a4 
    mv	t4,t3 
    j	if_end6
_copy_ifTrue2:
    bge	a4,s0,	_copy_ifTrue3
    j	_copy_if_end6
_copy_ifTrue3:
    slli a0,s11,    2
    addi a0,a0,    4
    add a0,t4,a0
    lw a0, 0(a0)
    bgt	a0,zero,	_copy_if_thenBB15
    j	_copy_if_end6
_copy_if_thenBB15:
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,a1,t2
    lw t2, 0(t2)
    addi t2,t2,    1
    rem a0,t2,t0
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,a1,t2
    sw a0,0(t2)
    slli t2,s11,    2
    addi t2,t2,    4
    add a0,t1,t2
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,a1,t2
    lw a0, 0(a0)
    lw t2, 0(t2)
    slli t2,t2,    2
    addi t2,t2,    4
    add a0,a0,t2
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,a2,t2
    lw a0, 0(a0)
    sw a0,0(t2)
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,t3,t2
    lw t2, 0(t2)
    addi t2,t2,    1
    rem a0,t2,t0
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,t3,t2
    sw a0,0(t2)
    mv	t2,a3 
    mv	a3,a2 
    mv	a0,t0 
    mv	a5,t4 
    mv	t0,a1 
    mv	a2,a4 
    mv	t4,t3 
    j	if_end6
paracopy4:
    mv	t1,a4 
    mv	a4,t2 
    mv	ra,a0 
    j	if_end5
_copy_if_end5:
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,t3,t1
    lw t1, 0(t1)
    bgt	t1,zero,	_copy_if_thenBB16
    j	_copy_if_end11
_copy_if_thenBB16:
    mv	t1,s7 
    slli t6,t1,    2
    addi t6,t6,    4
    add t6,t3,t6
    lw t6, 0(t6)
    bgt	t6,zero,	_copy__if_thenBB2
    j	_copy_if_end11
_copy_if_end11:
    slli t1,s7,    1
    mv	s8,t1 
    slli t1,s7,    1
    addi t1,t1,    1
    mv	s10,t1 
    add t1,ra,s11
    srai t1,t1,    1
    mv	s1,t1 
    ble	a0,s1,	_copy_if_thenBB17
    j	paracopy13
paracopy13:
    mv	t1,a4 
    j	_copy_if_end12
_copy_if_end12:
    addi a4,s1,    1
    bge	t2,a4,	_copy_if_thenBB18
    j	paracopy14
paracopy14:
    j	_copy_if_end13
_copy_if_end13:
    slli a4,s10,    2
    addi a4,a4,    4
    add ra,a2,a4
    slli a4,s8,    2
    addi a4,a4,    4
    add a4,a2,a4
    lw a4, 0(a4)
    lw ra, 0(ra)
    add ra,a4,ra
    slli a4,s7,    2
    addi a4,a4,    4
    add a4,a2,a4
    sw ra,0(a4)
    slli a4,s10,    2
    addi a4,a4,    4
    add a4,t4,a4
    slli ra,s8,    2
    addi ra,ra,    4
    add ra,t4,ra
    lw ra, 0(ra)
    lw a4, 0(a4)
    and a4,ra,a4
    slli ra,s7,    2
    addi ra,ra,    4
    add ra,t4,ra
    sw a4,0(ra)
    slli a4,s7,    2
    addi a4,a4,    4
    add a4,t4,a4
    lw a4, 0(a4)
    bgt	a4,zero,	_copy_if_thenBB19
    j	paracopy15
_copy_if_thenBB19:
    mv	a4,zero 
    j	_copy_forcondBB4
_copy_forcondBB4:
    blt	a4,t0,	_copy_forbodyBB4
    j	_copy_afterForBB2
_copy_forbodyBB4:
    slli ra,s10,    2
    addi ra,ra,    4
    add t6,t1,ra
    slli ra,s10,    2
    addi ra,ra,    4
    add ra,a1,ra
    lw ra, 0(ra)
    add ra,a4,ra
    rem ra,ra,t0
    lw t6, 0(t6)
    slli ra,ra,    2
    addi ra,ra,    4
    add t6,t6,ra
    slli ra,s8,    2
    addi ra,ra,    4
    add a5,t1,ra
    slli ra,s8,    2
    addi ra,ra,    4
    add ra,a1,ra
    lw ra, 0(ra)
    add ra,a4,ra
    rem ra,ra,t0
    lw a5, 0(a5)
    slli ra,ra,    2
    addi ra,ra,    4
    add ra,a5,ra
    lw ra, 0(ra)
    lw t6, 0(t6)
    add t6,ra,t6
    slli ra,s7,    2
    addi ra,ra,    4
    add ra,t1,ra
    lw a5, 0(ra)
    slli ra,a4,    2
    addi ra,ra,    4
    add ra,a5,ra
    sw t6,0(ra)
    addi a4,a4,    1
    j	_copy_forcondBB4
_copy_afterForBB2:
    slli a4,s7,    2
    addi a4,a4,    4
    add a4,a1,a4
    li ra, 0
    sw ra,0(a4)
    mv	a4,t2 
    mv	ra,a0 
    j	if_end5
paracopy15:
    mv	a4,t2 
    mv	ra,a0 
    j	if_end5
_copy_if_thenBB18:
    addi a4,s1,    1
    lui ra,%hi(p)
    sw a7, %lo(p)(ra)
    lui a7,%hi(b)
    sw a3, %lo(b)(a7)
    lui a7,%hi(pl)
    sw a0, %lo(pl)(a7)
    lui a0,%hi(L)
    sw t0, %lo(L)(a0)
    lui a0,%hi(flag)
    sw t4, %lo(flag)(a0)
    lui a0,%hi(sum)
    sw a2, %lo(sum)(a0)
    lui a0,%hi(s)
    sw t1, %lo(s)(a0)
    lui a0,%hi(pr)
    sw t2, %lo(pr)(a0)
    lui t2,%hi(t)
    sw t3, %lo(t)(t2)
    lui t2,%hi(now)
    sw a1, %lo(now)(t2)
    mv	a0,s10 
    mv	a1,a4 
    mv	a2,s11 
    call	update
    la t2,now    
    lw a4, 0(t2)
    la t2,t    
    lw t3, 0(t2)
    la t2,pr    
    lw ra, 0(t2)
    la t2,s    
    lw t1, 0(t2)
    la t2,sum    
    lw a7, 0(t2)
    la t2,flag    
    lw t2, 0(t2)
    la a0,L    
    lw t4, 0(a0)
    la a0,pl    
    lw a0, 0(a0)
    la a3,b    
    lw a3, 0(a3)
    la a2,p    
    lw a1, 0(a2)
    mv	a2,a7 
    mv	t0,t4 
    mv	t4,t2 
    mv	a7,a1 
    mv	a1,a4 
    mv	t2,ra 
    j	_copy_if_end13
_copy_if_thenBB17:
    lui t1,%hi(p)
    sw a7, %lo(p)(t1)
    lui a7,%hi(b)
    sw a3, %lo(b)(a7)
    lui a7,%hi(pl)
    sw a0, %lo(pl)(a7)
    lui a0,%hi(L)
    sw t0, %lo(L)(a0)
    lui a0,%hi(flag)
    sw t4, %lo(flag)(a0)
    lui a0,%hi(sum)
    sw a2, %lo(sum)(a0)
    lui a0,%hi(s)
    sw a4, %lo(s)(a0)
    lui a0,%hi(pr)
    sw t2, %lo(pr)(a0)
    lui t2,%hi(t)
    sw t3, %lo(t)(t2)
    lui t2,%hi(now)
    sw a1, %lo(now)(t2)
    mv	a0,s8 
    mv	a1,ra 
    mv	a2,s1 
    call	update
    la t2,now    
    lw a1, 0(t2)
    la t2,t    
    lw t3, 0(t2)
    la t2,pr    
    lw ra, 0(t2)
    la t2,s    
    lw t2, 0(t2)
    la a0,sum    
    lw a2, 0(a0)
    la a0,flag    
    lw a0, 0(a0)
    la a7,L    
    lw a7, 0(a7)
    la a3,pl    
    lw a4, 0(a3)
    la a3,b    
    lw a3, 0(a3)
    la t1,p    
    lw t6, 0(t1)
    mv	t1,t2 
    mv	t0,a7 
    mv	t4,a0 
    mv	a7,t6 
    mv	t2,ra 
    mv	a0,a4 
    j	_copy_if_end12
_copy__if_thenBB2:
    slli t6,t1,    1
    slli a5,t1,    1
    addi a5,a5,    1
    slli t5,t1,    2
    addi t5,t5,    4
    add a6,t3,t5
    slli t5,t6,    2
    addi t5,t5,    4
    add t5,a1,t5
    lw t5, 0(t5)
    lw a6, 0(a6)
    add t5,t5,a6
    rem a6,t5,t0
    slli t5,t6,    2
    addi t5,t5,    4
    add t5,a1,t5
    sw a6,0(t5)
    slli t5,t6,    2
    addi t5,t5,    4
    add a6,a4,t5
    slli t5,t6,    2
    addi t5,t5,    4
    add t5,a1,t5
    lw a6, 0(a6)
    lw t5, 0(t5)
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,a6,t5
    slli a6,t6,    2
    addi a6,a6,    4
    add a6,a2,a6
    lw t5, 0(t5)
    sw t5,0(a6)
    slli t5,t1,    2
    addi t5,t5,    4
    add a6,t3,t5
    slli t5,t6,    2
    addi t5,t5,    4
    add t5,t3,t5
    lw t5, 0(t5)
    lw a6, 0(a6)
    add t5,t5,a6
    rem t5,t5,t0
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,t3,t6
    sw t5,0(t6)
    slli t6,t1,    2
    addi t6,t6,    4
    add t5,t3,t6
    slli t6,a5,    2
    addi t6,t6,    4
    add t6,a1,t6
    lw t6, 0(t6)
    lw t5, 0(t5)
    add t6,t6,t5
    rem t6,t6,t0
    slli t5,a5,    2
    addi t5,t5,    4
    add t5,a1,t5
    sw t6,0(t5)
    slli t6,a5,    2
    addi t6,t6,    4
    add t5,a4,t6
    slli t6,a5,    2
    addi t6,t6,    4
    add t6,a1,t6
    lw t5, 0(t5)
    lw t6, 0(t6)
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,t5,t6
    slli t5,a5,    2
    addi t5,t5,    4
    add t5,a2,t5
    lw t6, 0(t6)
    sw t6,0(t5)
    slli t6,t1,    2
    addi t6,t6,    4
    add t5,t3,t6
    slli t6,a5,    2
    addi t6,t6,    4
    add t6,t3,t6
    lw a6, 0(t6)
    lw t6, 0(t5)
    add t6,a6,t6
    rem t6,t6,t0
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,t3,a5
    sw t6,0(a5)
    slli t1,t1,    2
    addi t1,t1,    4
    add t6,t3,t1
    li t1, 0
    sw t1,0(t6)
    j	_copy_if_end11
_copy_ifTrue1:
    bge	t2,s11,	_copy_ifTrue4
    j	_copy_if_end4
_copy_ifTrue4:
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,t4,t1
    lw t1, 0(t1)
    bgt	t1,zero,	_copy_if_thenBB20
    j	_copy_if_end4
_copy_if_thenBB20:
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,a1,t1
    lw t1, 0(t1)
    addi t1,t1,    1
    rem ra,t1,t0
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,a1,t1
    sw ra,0(t1)
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,a4,t1
    slli ra,s7,    2
    addi ra,ra,    4
    add ra,a1,ra
    lw t1, 0(t1)
    lw ra, 0(ra)
    slli ra,ra,    2
    addi ra,ra,    4
    add t6,t1,ra
    slli t1,s7,    2
    addi t1,t1,    4
    add ra,a2,t1
    lw t1, 0(t6)
    sw t1,0(ra)
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,t3,t1
    lw t1, 0(t1)
    addi t1,t1,    1
    rem t1,t1,t0
    slli ra,s7,    2
    addi ra,ra,    4
    add ra,t3,ra
    sw t1,0(ra)
    mv	t1,a4 
    mv	a4,t2 
    mv	ra,a0 
    j	if_end5
paracopy3:
    mv	t1,a4 
    mv	a4,t2 
    mv	ra,a0 
    j	if_end5
if_thenBB6:
    mv	t1,s9 
    slli t6,t1,    2
    addi t6,t6,    4
    add t6,t3,t6
    lw t6, 0(t6)
    bgt	t6,zero,	_if_thenBB1
    j	if_end4
_if_thenBB1:
    slli a5,t1,    1
    slli t6,t1,    1
    addi t6,t6,    1
    slli t5,t1,    2
    addi t5,t5,    4
    add a6,t3,t5
    slli t5,a5,    2
    addi t5,t5,    4
    add t5,a1,t5
    lw t5, 0(t5)
    lw a6, 0(a6)
    add t5,t5,a6
    rem t5,t5,t0
    slli a6,a5,    2
    addi a6,a6,    4
    add a6,a1,a6
    sw t5,0(a6)
    slli t5,a5,    2
    addi t5,t5,    4
    add a6,a4,t5
    slli t5,a5,    2
    addi t5,t5,    4
    add s7,a1,t5
    lw t5, 0(a6)
    lw a6, 0(s7)
    slli a6,a6,    2
    addi a6,a6,    4
    add a6,t5,a6
    slli t5,a5,    2
    addi t5,t5,    4
    add t5,a2,t5
    lw a6, 0(a6)
    sw a6,0(t5)
    slli t5,t1,    2
    addi t5,t5,    4
    add a6,t3,t5
    slli t5,a5,    2
    addi t5,t5,    4
    add t5,t3,t5
    lw t5, 0(t5)
    lw a6, 0(a6)
    add t5,t5,a6
    rem t5,t5,t0
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,t3,a5
    sw t5,0(a5)
    slli a5,t1,    2
    addi a5,a5,    4
    add a5,t3,a5
    slli t5,t6,    2
    addi t5,t5,    4
    add t5,a1,t5
    lw t5, 0(t5)
    lw a5, 0(a5)
    add a5,t5,a5
    rem t5,a5,t0
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,a1,a5
    sw t5,0(a5)
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,a4,a5
    slli t5,t6,    2
    addi t5,t5,    4
    add t5,a1,t5
    lw a6, 0(a5)
    lw a5, 0(t5)
    slli a5,a5,    2
    addi a5,a5,    4
    add t5,a6,a5
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,a2,a5
    lw t5, 0(t5)
    sw t5,0(a5)
    slli a5,t1,    2
    addi a5,a5,    4
    add t5,t3,a5
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,t3,a5
    lw a5, 0(a5)
    lw t5, 0(t5)
    add a5,a5,t5
    rem a5,a5,t0
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,t3,t6
    sw a5,0(t6)
    slli t1,t1,    2
    addi t1,t1,    4
    add t1,t3,t1
    li t6, 0
    sw t6,0(t1)
    j	if_end4
								 # func end
    .globl	query				#begin
    .p2align	2
    .type	query,@function
query:
query.entryBB1:
    addi sp,sp,    -32
    sw ra, 20(sp) 
    sw s4, 0(sp) 
    sw s5, 8(sp) 
    sw s6, 12(sp) 
    sw s7, 24(sp) 
    sw s8, 4(sp) 
    sw s9, 16(sp) 
    mv	s5,s10 
    mv	s6,a2 
    mv	a4,a1 
    la t2,now    
    lw t4, 0(t2)
    la t2,MOD    
    lw a2, 0(t2)
    la t2,t    
    lw t3, 0(t2)
    la t2,pr    
    lw t1, 0(t2)
    la t2,s    
    lw a1, 0(t2)
    la t2,sum    
    lw a7, 0(t2)
    la t2,L    
    lw a3, 0(t2)
    la t2,pl    
    lw t0, 0(t2)
    ble	t0,a4,	ifTrue3
    j	if_end7
if_end7:
    slli ra,a0,    1
    slli t2,a0,    1
    addi t2,t2,    1
    mv	s4,t2 
    add t2,a4,s6
    srai t2,t2,    1
    mv	s9,t2 
    slli t2,a0,    2
    addi t2,t2,    4
    add t2,t3,t2
    lw t2, 0(t2)
    bgt	t2,zero,	if_thenBB10
    j	if_end8
if_end8:
    ble	t0,s9,	if_thenBB11
    j	paracopy16
if_thenBB11:
    ble	t0,a4,	_copy_ifTrue5
    j	_copy_if_end14
_copy_ifTrue5:
    bge	t1,s9,	_copy_if_thenBB21
    j	_copy_if_end14
_copy_if_end14:
    slli a0,ra,    1
    slli t2,ra,    1
    addi t2,t2,    1
    mv	s10,t2 
    add t2,a4,s9
    srai t2,t2,    1
    mv	s7,t2 
    slli t2,ra,    2
    addi t2,t2,    4
    add t2,t3,t2
    lw t2, 0(t2)
    bgt	t2,zero,	_copy_if_thenBB22
    j	_copy_if_end15
_copy_if_thenBB22:
    slli t2,ra,    2
    addi t2,t2,    4
    add t2,t3,t2
    lw t2, 0(t2)
    bgt	t2,zero,	_copy__if_thenBB3
    j	_copy_if_end15
_copy__if_thenBB3:
    slli t2,ra,    1
    slli t6,ra,    1
    addi t6,t6,    1
    slli a5,ra,    2
    addi a5,a5,    4
    add a5,t3,a5
    slli t5,t2,    2
    addi t5,t5,    4
    add t5,t4,t5
    lw t5, 0(t5)
    lw a5, 0(a5)
    add a5,t5,a5
    rem a5,a5,a3
    slli t5,t2,    2
    addi t5,t5,    4
    add t5,t4,t5
    sw a5,0(t5)
    slli a5,t2,    2
    addi a5,a5,    4
    add t5,a1,a5
    slli a5,t2,    2
    addi a5,a5,    4
    add a5,t4,a5
    lw t5, 0(t5)
    lw a5, 0(a5)
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,t5,a5
    slli t5,t2,    2
    addi t5,t5,    4
    add t5,a7,t5
    lw a5, 0(a5)
    sw a5,0(t5)
    slli a5,ra,    2
    addi a5,a5,    4
    add t5,t3,a5
    slli a5,t2,    2
    addi a5,a5,    4
    add a5,t3,a5
    lw a5, 0(a5)
    lw t5, 0(t5)
    add a5,a5,t5
    rem a5,a5,a3
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,t3,t2
    sw a5,0(t2)
    slli t2,ra,    2
    addi t2,t2,    4
    add a5,t3,t2
    slli t2,t6,    2
    addi t2,t2,    4
    add t2,t4,t2
    lw t2, 0(t2)
    lw a5, 0(a5)
    add t2,t2,a5
    rem a5,t2,a3
    slli t2,t6,    2
    addi t2,t2,    4
    add t2,t4,t2
    sw a5,0(t2)
    slli t2,t6,    2
    addi t2,t2,    4
    add t2,a1,t2
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,t4,a5
    lw t5, 0(t2)
    lw t2, 0(a5)
    slli t2,t2,    2
    addi t2,t2,    4
    add a5,t5,t2
    slli t2,t6,    2
    addi t2,t2,    4
    add t2,a7,t2
    lw a5, 0(a5)
    sw a5,0(t2)
    slli t2,ra,    2
    addi t2,t2,    4
    add a5,t3,t2
    slli t2,t6,    2
    addi t2,t2,    4
    add t2,t3,t2
    lw t2, 0(t2)
    lw a5, 0(a5)
    add t2,t2,a5
    rem t2,t2,a3
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,t3,t6
    sw t2,0(t6)
    slli t2,ra,    2
    addi t2,t2,    4
    add ra,t3,t2
    li t2, 0
    sw t2,0(ra)
    j	_copy_if_end15
_copy_if_end15:
    ble	t0,s7,	_copy_if_thenBB23
    j	paracopy17
_copy_if_thenBB23:
    lui t2,%hi(pl)
    sw t0, %lo(pl)(t2)
    lui t2,%hi(L)
    sw a3, %lo(L)(t2)
    lui t2,%hi(sum)
    sw a7, %lo(sum)(t2)
    lui t2,%hi(s)
    sw a1, %lo(s)(t2)
    lui t2,%hi(pr)
    sw t1, %lo(pr)(t2)
    lui t2,%hi(t)
    sw t3, %lo(t)(t2)
    lui t2,%hi(MOD)
    sw a2, %lo(MOD)(t2)
    lui t2,%hi(now)
    sw t4, %lo(now)(t2)
    mv	a1,a4 
    mv	a2,s7 
    call	query
    mv	t2,a0 
    la a0,now    
    lw t4, 0(a0)
    la a0,MOD    
    lw a2, 0(a0)
    la a0,t    
    lw a0, 0(a0)
    la a7,pr    
    lw t1, 0(a7)
    la a7,s    
    lw a1, 0(a7)
    la a7,sum    
    lw a7, 0(a7)
    la a3,L    
    lw a3, 0(a3)
    la t0,pl    
    lw t0, 0(t0)
    add t2,t2,zero
    rem t2,t2,a2
    mv	s8,t2 
    j	_copy_if_end16
_copy_if_end16:
    addi t2,s7,    1
    bge	t1,t2,	_copy_if_thenBB24
    j	paracopy18
paracopy18:
    mv	t3,s8 
    mv	t2,a1 
    j	_copy_if_end17
_copy_if_end17:
    mv	a4,t3 
    j	afterCallBB4
afterCallBB4:
    add t3,a4,zero
    rem s10,t3,a2
    mv	a1,t2 
    mv	t3,a0 
    j	if_end9
if_end9:
    addi t2,s9,    1
    bge	t1,t2,	if_thenBB12
    j	paracopy19
paracopy19:
    mv	t2,a7 
    mv	a0,s10 
    j	if_end10
if_end10:
    j	query.exitBB1
query.exitBB1:
    lui a7,%hi(pl)
    sw t0, %lo(pl)(a7)
    lui a7,%hi(L)
    sw a3, %lo(L)(a7)
    lui a7,%hi(sum)
    sw t2, %lo(sum)(a7)
    lui t2,%hi(s)
    sw a1, %lo(s)(t2)
    lui t2,%hi(pr)
    sw t1, %lo(pr)(t2)
    lui t2,%hi(t)
    sw t3, %lo(t)(t2)
    lui t2,%hi(MOD)
    sw a2, %lo(MOD)(t2)
    lui t2,%hi(now)
    sw t4, %lo(now)(t2)
    mv	s10,s5 
    lw s9, 16(sp) 
    lw s8, 4(sp) 
    lw s7, 24(sp) 
    lw s6, 12(sp) 
    lw s5, 8(sp) 
    lw s4, 0(sp) 
    lw ra, 20(sp) 
    addi sp,sp,    32
    ret
if_thenBB12:
    addi ra,s9,    1
    mv	t2,s4 
    mv	s7,s6 
    ble	t0,ra,	_copy_ifTrue6
    j	_copy_if_end18
_copy_if_end18:
    slli a4,t2,    1
    slli a0,t2,    1
    addi a0,a0,    1
    mv	s9,a0 
    add a0,ra,s7
    srai a0,a0,    1
    mv	s6,a0 
    slli a0,t2,    2
    addi a0,a0,    4
    add a0,t3,a0
    lw a0, 0(a0)
    bgt	a0,zero,	_copy_if_thenBB25
    j	_copy_if_end19
_copy_if_thenBB25:
    slli a0,t2,    2
    addi a0,a0,    4
    add a0,t3,a0
    lw a0, 0(a0)
    bgt	a0,zero,	_copy__if_thenBB4
    j	_copy_if_end19
_copy_if_end19:
    ble	t0,s6,	_copy_if_thenBB26
    j	paracopy20
paracopy20:
    mv	a0,t0 
    mv	t2,a7 
    mv	s8,zero 
    j	_copy_if_end20
_copy_if_end20:
    addi a7,s6,    1
    bge	t1,a7,	_copy_if_thenBB27
    j	paracopy21
_copy_if_thenBB27:
    addi a7,s6,    1
    lui t0,%hi(pl)
    sw a0, %lo(pl)(t0)
    lui a0,%hi(L)
    sw a3, %lo(L)(a0)
    lui a0,%hi(sum)
    sw t2, %lo(sum)(a0)
    lui t2,%hi(s)
    sw a1, %lo(s)(t2)
    lui t2,%hi(pr)
    sw t1, %lo(pr)(t2)
    lui t2,%hi(t)
    sw t3, %lo(t)(t2)
    lui t2,%hi(MOD)
    sw a2, %lo(MOD)(t2)
    lui t2,%hi(now)
    sw t4, %lo(now)(t2)
    mv	a0,s9 
    mv	a1,a7 
    mv	a2,s7 
    call	query
    la t2,now    
    lw t4, 0(t2)
    la t2,MOD    
    lw a2, 0(t2)
    la t2,t    
    lw t3, 0(t2)
    la t2,pr    
    lw t1, 0(t2)
    la t2,s    
    lw a1, 0(t2)
    la t2,sum    
    lw t2, 0(t2)
    la a7,L    
    lw a3, 0(a7)
    la a7,pl    
    lw a7, 0(a7)
    add a0,s8,a0
    rem a0,a0,a2
    j	_copy_if_end21
_copy_if_end21:
    mv	t0,a7 
    j	afterCallBB5
afterCallBB5:
    add a0,s10,a0
    rem a0,a0,a2
    j	if_end10
paracopy21:
    mv	a7,a0 
    mv	a0,s8 
    j	_copy_if_end21
_copy_if_thenBB26:
    lui t2,%hi(pl)
    sw t0, %lo(pl)(t2)
    lui t2,%hi(L)
    sw a3, %lo(L)(t2)
    lui t2,%hi(sum)
    sw a7, %lo(sum)(t2)
    lui t2,%hi(s)
    sw a1, %lo(s)(t2)
    lui t2,%hi(pr)
    sw t1, %lo(pr)(t2)
    lui t2,%hi(t)
    sw t3, %lo(t)(t2)
    lui t2,%hi(MOD)
    sw a2, %lo(MOD)(t2)
    lui t2,%hi(now)
    sw t4, %lo(now)(t2)
    mv	a0,a4 
    mv	a1,ra 
    mv	a2,s6 
    call	query
    mv	a7,a0 
    la t2,now    
    lw t4, 0(t2)
    la t2,MOD    
    lw a2, 0(t2)
    la t2,t    
    lw t3, 0(t2)
    la t2,pr    
    lw t1, 0(t2)
    la t2,s    
    lw a1, 0(t2)
    la t2,sum    
    lw t2, 0(t2)
    la a0,L    
    lw a3, 0(a0)
    la a0,pl    
    lw a0, 0(a0)
    add a7,a7,zero
    rem s8,a7,a2
    j	_copy_if_end20
_copy__if_thenBB4:
    slli a0,t2,    1
    slli t6,t2,    1
    addi t6,t6,    1
    slli a5,t2,    2
    addi a5,a5,    4
    add t5,t3,a5
    slli a5,a0,    2
    addi a5,a5,    4
    add a5,t4,a5
    lw a6, 0(a5)
    lw a5, 0(t5)
    add a5,a6,a5
    rem t5,a5,a3
    slli a5,a0,    2
    addi a5,a5,    4
    add a5,t4,a5
    sw t5,0(a5)
    slli a5,a0,    2
    addi a5,a5,    4
    add t5,a1,a5
    slli a5,a0,    2
    addi a5,a5,    4
    add a6,t4,a5
    lw a5, 0(t5)
    lw t5, 0(a6)
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,a5,t5
    slli a5,a0,    2
    addi a5,a5,    4
    add a5,a7,a5
    lw t5, 0(t5)
    sw t5,0(a5)
    slli a5,t2,    2
    addi a5,a5,    4
    add t5,t3,a5
    slli a5,a0,    2
    addi a5,a5,    4
    add a5,t3,a5
    lw a6, 0(a5)
    lw a5, 0(t5)
    add a5,a6,a5
    rem a5,a5,a3
    slli a0,a0,    2
    addi a0,a0,    4
    add a0,t3,a0
    sw a5,0(a0)
    slli a0,t2,    2
    addi a0,a0,    4
    add a5,t3,a0
    slli a0,t6,    2
    addi a0,a0,    4
    add a0,t4,a0
    lw t5, 0(a0)
    lw a0, 0(a5)
    add a0,t5,a0
    rem a5,a0,a3
    slli a0,t6,    2
    addi a0,a0,    4
    add a0,t4,a0
    sw a5,0(a0)
    slli a0,t6,    2
    addi a0,a0,    4
    add a0,a1,a0
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,t4,a5
    lw t5, 0(a0)
    lw a0, 0(a5)
    slli a0,a0,    2
    addi a0,a0,    4
    add t5,t5,a0
    slli a0,t6,    2
    addi a0,a0,    4
    add a5,a7,a0
    lw a0, 0(t5)
    sw a0,0(a5)
    slli a0,t2,    2
    addi a0,a0,    4
    add a5,t3,a0
    slli a0,t6,    2
    addi a0,a0,    4
    add a0,t3,a0
    lw t5, 0(a0)
    lw a0, 0(a5)
    add a0,t5,a0
    rem a5,a0,a3
    slli a0,t6,    2
    addi a0,a0,    4
    add a0,t3,a0
    sw a5,0(a0)
    slli t2,t2,    2
    addi t2,t2,    4
    add a0,t3,t2
    li t2, 0
    sw t2,0(a0)
    j	_copy_if_end19
_copy_ifTrue6:
    bge	t1,s7,	_copy_if_thenBB28
    j	_copy_if_end18
_copy_if_thenBB28:
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,a7,t2
    lw a0, 0(t2)
    mv	t2,a7 
    j	afterCallBB5
_copy_if_thenBB24:
    addi t2,s7,    1
    lui t3,%hi(pl)
    sw t0, %lo(pl)(t3)
    lui t0,%hi(L)
    sw a3, %lo(L)(t0)
    lui a3,%hi(sum)
    sw a7, %lo(sum)(a3)
    lui a7,%hi(s)
    sw a1, %lo(s)(a7)
    lui a7,%hi(pr)
    sw t1, %lo(pr)(a7)
    lui a7,%hi(t)
    sw a0, %lo(t)(a7)
    lui a0,%hi(MOD)
    sw a2, %lo(MOD)(a0)
    lui a0,%hi(now)
    sw t4, %lo(now)(a0)
    mv	a0,s10 
    mv	a1,t2 
    mv	a2,s9 
    call	query
    mv	t3,a0 
    la t2,now    
    lw t4, 0(t2)
    la t2,MOD    
    lw a2, 0(t2)
    la t2,t    
    lw a0, 0(t2)
    la t2,pr    
    lw t1, 0(t2)
    la t2,s    
    lw t2, 0(t2)
    la a7,sum    
    lw a7, 0(a7)
    la a3,L    
    lw a3, 0(a3)
    la t0,pl    
    lw t0, 0(t0)
    add t3,s8,t3
    rem t3,t3,a2
    j	_copy_if_end17
paracopy17:
    mv	a0,t3 
    mv	s8,zero 
    j	_copy_if_end16
_copy_if_thenBB21:
    slli t2,ra,    2
    addi t2,t2,    4
    add t2,a7,t2
    lw a4, 0(t2)
    mv	t2,a1 
    mv	a0,t3 
    j	afterCallBB4
paracopy16:
    mv	s10,zero 
    j	if_end9
if_thenBB10:
    slli t2,a0,    2
    addi t2,t2,    4
    add t2,t3,t2
    lw t2, 0(t2)
    bgt	t2,zero,	_if_thenBB2
    j	if_end8
_if_thenBB2:
    slli t6,a0,    1
    slli t2,a0,    1
    addi t2,t2,    1
    slli a5,a0,    2
    addi a5,a5,    4
    add a5,t3,a5
    slli t5,t6,    2
    addi t5,t5,    4
    add t5,t4,t5
    lw t5, 0(t5)
    lw a5, 0(a5)
    add a5,t5,a5
    rem t5,a5,a3
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,t4,a5
    sw t5,0(a5)
    slli a5,t6,    2
    addi a5,a5,    4
    add t5,a1,a5
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,t4,a5
    lw t5, 0(t5)
    lw a5, 0(a5)
    slli a5,a5,    2
    addi a5,a5,    4
    add t5,t5,a5
    slli a5,t6,    2
    addi a5,a5,    4
    add a5,a7,a5
    lw t5, 0(t5)
    sw t5,0(a5)
    slli a5,a0,    2
    addi a5,a5,    4
    add a5,t3,a5
    slli t5,t6,    2
    addi t5,t5,    4
    add t5,t3,t5
    lw t5, 0(t5)
    lw a5, 0(a5)
    add a5,t5,a5
    rem a5,a5,a3
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,t3,t6
    sw a5,0(t6)
    slli t6,a0,    2
    addi t6,t6,    4
    add t5,t3,t6
    slli t6,t2,    2
    addi t6,t6,    4
    add t6,t4,t6
    lw a5, 0(t6)
    lw t6, 0(t5)
    add t6,a5,t6
    rem a5,t6,a3
    slli t6,t2,    2
    addi t6,t6,    4
    add t6,t4,t6
    sw a5,0(t6)
    slli t6,t2,    2
    addi t6,t6,    4
    add t6,a1,t6
    slli a5,t2,    2
    addi a5,a5,    4
    add t5,t4,a5
    lw a5, 0(t6)
    lw t6, 0(t5)
    slli t6,t6,    2
    addi t6,t6,    4
    add a5,a5,t6
    slli t6,t2,    2
    addi t6,t6,    4
    add t5,a7,t6
    lw t6, 0(a5)
    sw t6,0(t5)
    slli t6,a0,    2
    addi t6,t6,    4
    add t5,t3,t6
    slli t6,t2,    2
    addi t6,t6,    4
    add t6,t3,t6
    lw a5, 0(t6)
    lw t6, 0(t5)
    add t6,a5,t6
    rem t6,t6,a3
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,t3,t2
    sw t6,0(t2)
    slli t2,a0,    2
    addi t2,t2,    4
    add a0,t3,t2
    li t2, 0
    sw t2,0(a0)
    j	if_end8
ifTrue3:
    bge	t1,s6,	if_thenBB13
    j	if_end7
if_thenBB13:
    slli t2,a0,    2
    addi t2,t2,    4
    add t2,a7,t2
    lw t2, 0(t2)
    mv	a0,t2 
    mv	t2,a7 
    j	query.exitBB1
								 # func end
    .globl	build				#begin
    .p2align	2
    .type	build,@function
build:
build.entryBB1:
    addi sp,sp,    -48
    sw ra, 0(sp) 
    sw s4, 24(sp) 
    sw s5, 8(sp) 
    sw s6, 4(sp) 
    sw s7, 32(sp) 
    sw s8, 28(sp) 
    sw s9, 20(sp) 
    sw s10, 16(sp) 
    sw s11, 12(sp) 
    mv	s5,s0 
    mv	s4,s1 
    mv	s10,a2 
    mv	s9,a0 
    la t2,now    
    lw t3, 0(t2)
    la t2,a    
    lw t4, 0(t2)
    la t2,s    
    lw a0, 0(t2)
    la t2,flag    
    lw t0, 0(t2)
    la t2,sum    
    lw t1, 0(t2)
    la t2,L    
    lw a7, 0(t2)
    la t2,b    
    lw a3, 0(t2)
    la t2,p    
    lw a2, 0(t2)
    beq	a1,s10,	if_thenBB14
    j	if_elseBB2
if_thenBB14:
    slli t2,a1,    2
    addi t2,t2,    4
    add a4,t4,t2
    slli t2,s9,    2
    addi t2,t2,    4
    add t2,t1,t2
    lw a4, 0(a4)
    sw a4,0(t2)
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,t4,t2
    lw t2, 0(t2)
    blt	t2,a2,	ifTrue4
    j	if_end11
if_end11:
    slli t2,s9,    2
    addi t2,t2,    4
    add t2,t3,t2
    li a1, 0
    sw a1,0(t2)
    mv	t2,t3 
    j	if_end12
if_end12:
    lui t3,%hi(p)
    sw a2, %lo(p)(t3)
    lui a2,%hi(b)
    sw a3, %lo(b)(a2)
    lui a3,%hi(L)
    sw a7, %lo(L)(a3)
    lui a7,%hi(sum)
    sw t1, %lo(sum)(a7)
    lui a7,%hi(flag)
    sw t0, %lo(flag)(a7)
    lui a7,%hi(s)
    sw a0, %lo(s)(a7)
    lui a0,%hi(a)
    sw t4, %lo(a)(a0)
    lui a0,%hi(now)
    sw t2, %lo(now)(a0)
    mv	s1,s4 
    mv	s0,s5 
    lw s11, 12(sp) 
    lw s10, 16(sp) 
    lw s9, 20(sp) 
    lw s8, 28(sp) 
    lw s7, 32(sp) 
    lw s6, 4(sp) 
    lw s5, 8(sp) 
    lw s4, 24(sp) 
    lw ra, 0(sp) 
    addi sp,sp,    48
    ret
ifTrue4:
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,t4,t2
    lw t2, 0(t2)
    bge	t2,zero,	ifTrue5
    j	if_end11
ifTrue5:
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,t4,t2
    lw t2, 0(t2)
    rem t2,t2,a2
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,a3,t2
    lw t2, 0(t2)
    bgt	t2,zero,	if_thenBB15
    j	if_end11
if_thenBB15:
    slli t2,s9,    2
    addi t2,t2,    4
    add t2,t0,t2
    li a4, 1
    sw a4,0(t2)
    slli t2,a1,    2
    addi t2,t2,    4
    add a1,t4,t2
    slli t2,s9,    2
    addi t2,t2,    4
    add t2,a0,t2
    lw t2, 0(t2)
    lw a1, 0(a1)
    sw a1,4(t2)
    li a1, 1
    j	forcondBB3
forcondBB3:
    blt	a1,a7,	forbodyBB3
    j	if_end11
forbodyBB3:
    slli t2,s9,    2
    addi t2,t2,    4
    add t2,a0,t2
    addi a4,a1,    -1
    lw ra, 0(t2)
    slli t2,a4,    2
    addi t2,t2,    4
    add t2,ra,t2
    lw t2, 0(t2)
    rem t2,t2,a2
    mul t2,t2,t2
    rem a4,t2,a2
    slli t2,s9,    2
    addi t2,t2,    4
    add t2,a0,t2
    lw ra, 0(t2)
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,ra,t2
    sw a4,0(t2)
    addi a1,a1,    1
    j	forcondBB3
if_elseBB2:
    slli t2,s9,    1
    mv	s7,t2 
    slli t2,s9,    1
    addi t2,t2,    1
    mv	s8,t2 
    add t2,a1,s10
    srai t2,t2,    1
    mv	s6,t2 
    beq	a1,s6,	_copy_if_thenBB29
    j	_copy_if_elseBB4
_copy_if_elseBB4:
    slli t2,s7,    1
    mv	s0,t2 
    slli t2,s7,    1
    addi t2,t2,    1
    mv	s11,t2 
    add t2,a1,s6
    srai t2,t2,    1
    mv	s1,t2 
    lui t2,%hi(p)
    sw a2, %lo(p)(t2)
    lui t2,%hi(b)
    sw a3, %lo(b)(t2)
    lui t2,%hi(L)
    sw a7, %lo(L)(t2)
    lui t2,%hi(sum)
    sw t1, %lo(sum)(t2)
    lui t2,%hi(flag)
    sw t0, %lo(flag)(t2)
    lui t2,%hi(s)
    sw a0, %lo(s)(t2)
    lui t2,%hi(a)
    sw t4, %lo(a)(t2)
    lui t2,%hi(now)
    sw t3, %lo(now)(t2)
    mv	a0,s0 
    mv	a2,s1 
    call	build
    la t2,now    
    lw t1, 0(t2)
    la t2,a    
    lw a2, 0(t2)
    la t2,s    
    lw a3, 0(t2)
    la t2,flag    
    lw t0, 0(t2)
    la t2,sum    
    lw t2, 0(t2)
    la a0,L    
    lw a0, 0(a0)
    la a7,b    
    lw t4, 0(a7)
    la a7,p    
    lw t3, 0(a7)
    addi a1,s1,    1
    lui a7,%hi(p)
    sw t3, %lo(p)(a7)
    lui a7,%hi(b)
    sw t4, %lo(b)(a7)
    lui a7,%hi(L)
    sw a0, %lo(L)(a7)
    lui a0,%hi(sum)
    sw t2, %lo(sum)(a0)
    lui t2,%hi(flag)
    sw t0, %lo(flag)(t2)
    lui t2,%hi(s)
    sw a3, %lo(s)(t2)
    lui t2,%hi(a)
    sw a2, %lo(a)(t2)
    lui t2,%hi(now)
    sw t1, %lo(now)(t2)
    mv	a0,s11 
    mv	a2,s6 
    call	build
    la t2,now    
    lw t3, 0(t2)
    la t2,a    
    lw t4, 0(t2)
    la t2,s    
    lw a1, 0(t2)
    la t2,flag    
    lw t0, 0(t2)
    la t2,sum    
    lw a7, 0(t2)
    la t2,L    
    lw a0, 0(t2)
    la t2,b    
    lw a3, 0(t2)
    la t2,p    
    lw t2, 0(t2)
    slli t1,s11,    2
    addi t1,t1,    4
    add t1,a7,t1
    slli a2,s0,    2
    addi a2,a2,    4
    add a2,a7,a2
    lw a2, 0(a2)
    lw t1, 0(t1)
    add a2,a2,t1
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,a7,t1
    sw a2,0(t1)
    slli t1,s11,    2
    addi t1,t1,    4
    add t1,t0,t1
    slli a2,s0,    2
    addi a2,a2,    4
    add a2,t0,a2
    lw a2, 0(a2)
    lw t1, 0(t1)
    and a2,a2,t1
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,t0,t1
    sw a2,0(t1)
    slli t1,s7,    2
    addi t1,t1,    4
    add t1,t0,t1
    lw t1, 0(t1)
    bgt	t1,zero,	_copy_if_thenBB30
    j	paracopy22
_copy_if_thenBB30:
    mv	t1,zero 
    j	_copy_forcondBB5
_copy_forcondBB5:
    blt	t1,a0,	_copy_forbodyBB5
    j	_copy_afterForBB3
_copy_forbodyBB5:
    slli a2,s11,    2
    addi a2,a2,    4
    add a2,a1,a2
    lw a4, 0(a2)
    slli a2,t1,    2
    addi a2,a2,    4
    add ra,a4,a2
    slli a2,s0,    2
    addi a2,a2,    4
    add a2,a1,a2
    lw a4, 0(a2)
    slli a2,t1,    2
    addi a2,a2,    4
    add a2,a4,a2
    lw a4, 0(a2)
    lw a2, 0(ra)
    add a4,a4,a2
    slli a2,s7,    2
    addi a2,a2,    4
    add a2,a1,a2
    lw ra, 0(a2)
    slli a2,t1,    2
    addi a2,a2,    4
    add a2,ra,a2
    sw a4,0(a2)
    addi t1,t1,    1
    j	_copy_forcondBB5
_copy_afterForBB3:
    li t1, 0
    sw t1,4(t3)
    mv	t1,a7 
    mv	a7,a0 
    mv	a2,t2 
    mv	a0,a1 
    j	afterCallBB6
afterCallBB6:
    addi a1,s6,    1
    mv	s11,s8 
    mv	s0,s10 
    beq	a1,s0,	_copy_if_thenBB31
    j	_copy_if_elseBB5
_copy_if_elseBB5:
    slli t2,s11,    1
    mv	s6,t2 
    slli t2,s11,    1
    addi t2,t2,    1
    mv	s1,t2 
    add t2,a1,s0
    srai t2,t2,    1
    mv	s10,t2 
    lui t2,%hi(p)
    sw a2, %lo(p)(t2)
    lui t2,%hi(b)
    sw a3, %lo(b)(t2)
    lui t2,%hi(L)
    sw a7, %lo(L)(t2)
    lui t2,%hi(sum)
    sw t1, %lo(sum)(t2)
    lui t2,%hi(flag)
    sw t0, %lo(flag)(t2)
    lui t2,%hi(s)
    sw a0, %lo(s)(t2)
    lui t2,%hi(a)
    sw t4, %lo(a)(t2)
    lui t2,%hi(now)
    sw t3, %lo(now)(t2)
    mv	a0,s6 
    mv	a2,s10 
    call	build
    la t2,now    
    lw a0, 0(t2)
    la t2,a    
    lw a2, 0(t2)
    la t2,s    
    lw a3, 0(t2)
    la t2,flag    
    lw t0, 0(t2)
    la t2,sum    
    lw t4, 0(t2)
    la t2,L    
    lw t1, 0(t2)
    la t2,b    
    lw t2, 0(t2)
    la a7,p    
    lw t3, 0(a7)
    addi a1,s10,    1
    lui a7,%hi(p)
    sw t3, %lo(p)(a7)
    lui a7,%hi(b)
    sw t2, %lo(b)(a7)
    lui t2,%hi(L)
    sw t1, %lo(L)(t2)
    lui t2,%hi(sum)
    sw t4, %lo(sum)(t2)
    lui t2,%hi(flag)
    sw t0, %lo(flag)(t2)
    lui t2,%hi(s)
    sw a3, %lo(s)(t2)
    lui t2,%hi(a)
    sw a2, %lo(a)(t2)
    lui t2,%hi(now)
    sw a0, %lo(now)(t2)
    mv	a0,s1 
    mv	a2,s0 
    call	build
    la t2,now    
    lw t2, 0(t2)
    la a0,a    
    lw t4, 0(a0)
    la a0,s    
    lw a0, 0(a0)
    la a7,flag    
    lw t0, 0(a7)
    la a7,sum    
    lw t1, 0(a7)
    la a7,L    
    lw a7, 0(a7)
    la a3,b    
    lw a3, 0(a3)
    la a2,p    
    lw a2, 0(a2)
    slli t3,s1,    2
    addi t3,t3,    4
    add a1,t1,t3
    slli t3,s6,    2
    addi t3,t3,    4
    add t3,t1,t3
    lw a4, 0(t3)
    lw t3, 0(a1)
    add a1,a4,t3
    slli t3,s11,    2
    addi t3,t3,    4
    add t3,t1,t3
    sw a1,0(t3)
    slli t3,s1,    2
    addi t3,t3,    4
    add a4,t0,t3
    slli t3,s6,    2
    addi t3,t3,    4
    add t3,t0,t3
    lw a1, 0(t3)
    lw t3, 0(a4)
    and a1,a1,t3
    slli t3,s11,    2
    addi t3,t3,    4
    add t3,t0,t3
    sw a1,0(t3)
    slli t3,s11,    2
    addi t3,t3,    4
    add t3,t0,t3
    lw t3, 0(t3)
    bgt	t3,zero,	_copy_if_thenBB32
    j	paracopy23
paracopy23:
    j	afterCallBB7
afterCallBB7:
    slli t3,s8,    2
    addi t3,t3,    4
    add a1,t1,t3
    slli t3,s7,    2
    addi t3,t3,    4
    add t3,t1,t3
    lw a4, 0(t3)
    lw t3, 0(a1)
    add a1,a4,t3
    slli t3,s9,    2
    addi t3,t3,    4
    add t3,t1,t3
    sw a1,0(t3)
    slli t3,s8,    2
    addi t3,t3,    4
    add a1,t0,t3
    slli t3,s7,    2
    addi t3,t3,    4
    add t3,t0,t3
    lw a4, 0(t3)
    lw t3, 0(a1)
    and t3,a4,t3
    slli a1,s9,    2
    addi a1,a1,    4
    add a1,t0,a1
    sw t3,0(a1)
    slli t3,s9,    2
    addi t3,t3,    4
    add t3,t0,t3
    lw t3, 0(t3)
    bgt	t3,zero,	if_thenBB16
    j	paracopy24
paracopy24:
    j	if_end12
if_thenBB16:
    mv	t3,zero 
    j	forcondBB4
forcondBB4:
    blt	t3,a7,	forbodyBB4
    j	afterForBB2
forbodyBB4:
    slli a1,s8,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw a4, 0(a1)
    slli a1,t3,    2
    addi a1,a1,    4
    add ra,a4,a1
    slli a1,s7,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw a4, 0(a1)
    slli a1,t3,    2
    addi a1,a1,    4
    add a1,a4,a1
    lw a1, 0(a1)
    lw a4, 0(ra)
    add a4,a1,a4
    slli a1,s9,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw ra, 0(a1)
    slli a1,t3,    2
    addi a1,a1,    4
    add a1,ra,a1
    sw a4,0(a1)
    addi t3,t3,    1
    j	forcondBB4
afterForBB2:
    li t3, 0
    sw t3,4(t2)
    j	if_end12
_copy_if_thenBB32:
    mv	t3,zero 
    j	_copy_forcondBB6
_copy_forcondBB6:
    blt	t3,a7,	_copy_forbodyBB6
    j	_copy_afterForBB4
_copy_forbodyBB6:
    slli a1,s1,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw a1, 0(a1)
    slli a4,t3,    2
    addi a4,a4,    4
    add a4,a1,a4
    slli a1,s6,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw a1, 0(a1)
    slli ra,t3,    2
    addi ra,ra,    4
    add a1,a1,ra
    lw ra, 0(a1)
    lw a1, 0(a4)
    add a4,ra,a1
    slli a1,s11,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw ra, 0(a1)
    slli a1,t3,    2
    addi a1,a1,    4
    add a1,ra,a1
    sw a4,0(a1)
    addi t3,t3,    1
    j	_copy_forcondBB6
_copy_afterForBB4:
    li t3, 0
    sw t3,4(t2)
    j	afterCallBB7
_copy_if_thenBB31:
    slli t2,a1,    2
    addi t2,t2,    4
    add a4,t4,t2
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,t1,t2
    lw a4, 0(a4)
    sw a4,0(t2)
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,t4,t2
    lw t2, 0(t2)
    blt	t2,a2,	_copy_ifTrue7
    j	_copy_if_end22
_copy_ifTrue7:
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,t4,t2
    lw t2, 0(t2)
    bge	t2,zero,	_copy_ifTrue8
    j	_copy_if_end22
_copy_ifTrue8:
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,t4,t2
    lw t2, 0(t2)
    rem t2,t2,a2
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,a3,t2
    lw t2, 0(t2)
    bgt	t2,zero,	_copy_if_thenBB33
    j	_copy_if_end22
_copy_if_end22:
    slli t2,s11,    2
    addi t2,t2,    4
    add a1,t3,t2
    li t2, 0
    sw t2,0(a1)
    mv	t2,t3 
    j	afterCallBB7
_copy_if_thenBB33:
    slli t2,s11,    2
    addi t2,t2,    4
    add a4,t0,t2
    li t2, 1
    sw t2,0(a4)
    slli t2,a1,    2
    addi t2,t2,    4
    add a1,t4,t2
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,a0,t2
    lw a4, 0(t2)
    lw t2, 0(a1)
    sw t2,4(a4)
    li a1, 1
    j	_copy_forcondBB7
_copy_forcondBB7:
    blt	a1,a7,	_copy_forbodyBB7
    j	_copy_if_end22
_copy_forbodyBB7:
    slli t2,s11,    2
    addi t2,t2,    4
    add a4,a0,t2
    addi t2,a1,    -1
    lw a4, 0(a4)
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,a4,t2
    lw t2, 0(t2)
    rem t2,t2,a2
    mul t2,t2,t2
    rem a4,t2,a2
    slli t2,s11,    2
    addi t2,t2,    4
    add t2,a0,t2
    lw ra, 0(t2)
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,ra,t2
    sw a4,0(t2)
    addi a1,a1,    1
    j	_copy_forcondBB7
paracopy22:
    mv	t1,a7 
    mv	a7,a0 
    mv	a2,t2 
    mv	a0,a1 
    j	afterCallBB6
_copy_if_thenBB29:
    slli t2,a1,    2
    addi t2,t2,    4
    add a4,t4,t2
    slli t2,s7,    2
    addi t2,t2,    4
    add ra,t1,t2
    lw t2, 0(a4)
    sw t2,0(ra)
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,t4,t2
    lw t2, 0(t2)
    blt	t2,a2,	_copy_ifTrue9
    j	_copy_if_end23
_copy_ifTrue9:
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,t4,t2
    lw t2, 0(t2)
    bge	t2,zero,	_copy_ifTrue10
    j	_copy_if_end23
_copy_ifTrue10:
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,t4,t2
    lw t2, 0(t2)
    rem t2,t2,a2
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,a3,t2
    lw t2, 0(t2)
    bgt	t2,zero,	_copy_if_thenBB34
    j	_copy_if_end23
_copy_if_thenBB34:
    slli t2,s7,    2
    addi t2,t2,    4
    add t2,t0,t2
    li a4, 1
    sw a4,0(t2)
    slli t2,a1,    2
    addi t2,t2,    4
    add a4,t4,t2
    slli t2,s7,    2
    addi t2,t2,    4
    add t2,a0,t2
    lw a1, 0(t2)
    lw t2, 0(a4)
    sw t2,4(a1)
    li t2, 1
    j	_copy_forcondBB8
_copy_forcondBB8:
    blt	t2,a7,	_copy_forbodyBB8
    j	_copy_if_end23
_copy_forbodyBB8:
    slli a1,s7,    2
    addi a1,a1,    4
    add a1,a0,a1
    addi ra,t2,    -1
    lw a4, 0(a1)
    slli a1,ra,    2
    addi a1,a1,    4
    add a1,a4,a1
    lw a1, 0(a1)
    rem a1,a1,a2
    mul a1,a1,a1
    rem a4,a1,a2
    slli a1,s7,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw ra, 0(a1)
    slli a1,t2,    2
    addi a1,a1,    4
    add a1,ra,a1
    sw a4,0(a1)
    addi t2,t2,    1
    j	_copy_forcondBB8
_copy_if_end23:
    slli t2,s7,    2
    addi t2,t2,    4
    add t2,t3,t2
    li a1, 0
    sw a1,0(t2)
    j	afterCallBB6
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -96
    sw ra, 56(sp) 
    sw s4, 64(sp) 
    sw s5, 76(sp) 
    sw s6, 80(sp) 
    sw s7, 44(sp) 
    sw s8, 40(sp) 
    sw s9, 68(sp) 
    sw s10, 52(sp) 
    sw s11, 24(sp) 
    sw s0, 28(sp) 
    sw s1, 20(sp) 
    sw s2, 72(sp) 
    sw s3, 4(sp) 
    li a0, 2000024
    call malloc
    li t2, 500005
    sw t2,0(a0)
    mv	s10,a0 
    li a0, 2000024
    call malloc
    li t2, 500005
    sw t2,0(a0)
    mv	s6,a0 
    li a0, 2000024
    call malloc
    li t2, 500005
    sw t2,0(a0)
    sw a0, 60(sp) 
    li a0, 800024
    call malloc
    li t2, 200005
    sw t2,0(a0)
    mv	s8,a0 
    li a0, 2000024
    call malloc
    li t2, 500005
    sw t2,0(a0)
    sw a0, 12(sp) 
    li a0, 2000024
    call malloc
    mv	s7,a0 
    li t2, 500005
    sw t2,0(s7)
    addi s2,s7,    4
    li t2, 2000020
    add s9,s7,t2
    j	forcondBB5
forcondBB5:
    ble	s2,s9,	forupdateBB1
    j	afterForBB3
afterForBB3:
    mv	s1,s7 
    li a0, 2000024
    call malloc
    li t2, 500005
    sw t2,0(a0)
    mv	s7,a0 
    call	getInt
    mv	s0,a0 
    call	getInt
    mv	s11,a0 
    call	getInt
    mv	s2,a0 
    li a7, 1
    li s9, 1
    j	_forcondBB1
_forcondBB1:
    ble	a7,s0,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    li a0, 560024
    call malloc
    li t2, 140005
    sw t2,0(a0)
    mv	s3,a0 
    li t2, 2
    j	__forcondBB1
__forcondBB1:
    blt	t2,s2,	__forbodyBB1
    j	__afterForBB1
__forbodyBB1:
    slli a0,t2,    2
    addi a0,a0,    4
    add a0,s3,a0
    sw t2,0(a0)
    addi t2,t2,    1
    j	__forcondBB1
__afterForBB1:
    li a0, 2
    j	__forcondBB2
__forcondBB2:
    blt	a0,s2,	__forbodyBB2
    j	__afterForBB2
__forbodyBB2:
    li a7, 1
    j	__forcondBB3
__forcondBB3:
    li t2, 15
    ble	a7,t2,	__forbodyBB3
    j	__forupdateBB1
__forupdateBB1:
    addi a0,a0,    1
    j	__forcondBB2
__forbodyBB3:
    slli t2,a0,    2
    addi t2,t2,    4
    add t2,s3,t2
    lw t2, 0(t2)
    rem t2,t2,s2
    mul t2,t2,t2
    rem a3,t2,s2
    slli t2,a0,    2
    addi t2,t2,    4
    add t2,s3,t2
    sw a3,0(t2)
    addi a7,a7,    1
    j	__forcondBB3
__afterForBB2:
    li s4, 2
    li a0, 1
    j	__forcondBB4
__forcondBB4:
    blt	s4,s2,	__forbodyBB4
    j	_afterCallBB1
__forbodyBB4:
    slli t2,s4,    2
    addi t2,t2,    4
    add t2,s3,t2
    lw t2, 0(t2)
    li a7, 1
    j	__forbodyBB5
__forbodyBB5:
    rem t2,t2,s2
    mul t2,t2,t2
    rem t2,t2,s2
    slli a3,t2,    2
    addi a3,a3,    4
    add a3,s10,a3
    li t1, 1
    sw t1,0(a3)
    slli a3,s4,    2
    addi a3,a3,    4
    add a3,s3,a3
    lw a3, 0(a3)
    beq	t2,a3,	__afterForBB3
    j	__forupdateBB2
__afterForBB3:
    mv	s5,a0 
    sw a7, 16(sp) 
    mv	a1,s5 
    lw a0, 16(sp) 
    beq	a0,zero,	_copy_if_thenBB35
    j	_copy_if_end24
_copy_if_end24:
    blt	a1,a0,	_copy_if_thenBB36
    j	_copy_if_elseBB6
_copy_if_elseBB6:
    rem a1,a1,a0
    call	gcd
    j	afterCallBB8
afterCallBB8:
    div a0,s5,a0
    lw t2, 16(sp) 
    mul a0,a0,t2
    addi t2,s4,    1
    mv	s4,t2 
    j	__forcondBB4
_copy_if_thenBB36:
    call	gcd
    j	afterCallBB8
_copy_if_thenBB35:
    mv	a0,a1 
    j	afterCallBB8
__forupdateBB2:
    addi a7,a7,    1
    j	__forbodyBB5
_afterCallBB1:
    li t2, 1
    sw t2,4(s10)
    li t2, 1
    sw t2,8(s10)
    li t2, 1
    beq	t2,s0,	_copy_if_thenBB37
    j	_copy_if_elseBB7
_copy_if_thenBB37:
    lw t2, 8(s8)
    sw t2,8(s7)
    lw t2, 8(s8)
    blt	t2,s2,	_copy_ifTrue11
    j	_copy_if_end25
_copy_ifTrue11:
    lw t2, 8(s8)
    bge	t2,zero,	_copy_ifTrue12
    j	_copy_if_end25
_copy_if_end25:
    li t2, 0
    sw t2,8(s6)
    mv	a7,s8 
    sw a7, 48(sp) 
    mv	s5,s11 
    mv	s11,s2 
    mv	s4,s6 
    mv	s3,s7 
    lw t2, 12(sp) 
    mv	s6,t2 
    mv	s7,s10 
    mv	s8,s1 
    mv	s2,a0 
    mv	a0,s9 
    lw t2, 60(sp) 
    mv	s10,t2 
    mv	s1,zero 
    li t2, 32761
    mv	s9,t2 
    mv	t3,zero 
    sw t3, 8(sp) 
    mv	t4,zero 
    sw t4, 0(sp) 
    j	_whileCondBB1
_whileCondBB1:
    bgt	s5,zero,	_whileBodyBB1
    j	afterCallBB9
afterCallBB9:
    mv	a0,s1 
    call	printInt
    lui t2,%hi(p)
    sw s11, %lo(p)(t2)
    lui t2,%hi(pl)
    lw a0, 0(sp) 
    sw a0, %lo(pl)(t2)
    lui t2,%hi(a)
    lw a0, 48(sp) 
    sw a0, %lo(a)(t2)
    lui t2,%hi(MOD)
    sw s9, %lo(MOD)(t2)
    lui t2,%hi(now)
    sw s4, %lo(now)(t2)
    lui t2,%hi(b)
    sw s7, %lo(b)(t2)
    lui t2,%hi(L)
    sw s2, %lo(L)(t2)
    lui t2,%hi(flag)
    sw s6, %lo(flag)(t2)
    lui t2,%hi(sum)
    sw s3, %lo(sum)(t2)
    lui t2,%hi(s)
    sw s8, %lo(s)(t2)
    lui a0,%hi(pr)
    lw t2, 8(sp) 
    sw t2, %lo(pr)(a0)
    lui t2,%hi(t)
    sw s10, %lo(t)(t2)
    lw s3, 4(sp) 
    lw s2, 72(sp) 
    lw s1, 20(sp) 
    lw s0, 28(sp) 
    lw s11, 24(sp) 
    lw s10, 52(sp) 
    lw s9, 68(sp) 
    lw s8, 40(sp) 
    lw s7, 44(sp) 
    lw s6, 80(sp) 
    lw s5, 76(sp) 
    lw s4, 64(sp) 
    lw ra, 56(sp) 
    mv	a0,zero 
    addi sp,sp,    96
    ret
_whileBodyBB1:
    li t2, 1
    j	__forcondBB5
__forcondBB5:
    li a7, 3
    blt	t2,a7,	__forbodyBB6
    j	__afterForBB4
__forbodyBB6:
    li a7, 13131
    mul a0,a0,a7
    li a7, 5353
    add a0,a0,a7
    rem a0,a0,s9
    addi t2,t2,    1
    j	__forcondBB5
__afterForBB4:
    blt	a0,zero,	__if_thenBB1
    j	paracopy25
__if_thenBB1:
    sub a0,zero,a0
    j	_afterCallBB2
_afterCallBB2:
    li t2, 1
    and t2,a0,t2
    sw t2, 36(sp) 
    mv	t2,s0 
    li a7, 1
    sub t2,t2,a7
    addi a3,t2,    1
    li t2, 1
    j	_forcondBB2
_forcondBB2:
    li a7, 3
    blt	t2,a7,	_forbodyBB2
    j	_afterForBB2
_forbodyBB2:
    li a7, 13131
    mul a7,a0,a7
    li a0, 5353
    add a0,a7,a0
    rem a0,a0,s9
    addi t2,t2,    1
    j	_forcondBB2
_afterForBB2:
    blt	a0,zero,	_if_thenBB3
    j	paracopy26
paracopy26:
    j	afterCallBB10
afterCallBB10:
    rem t2,a0,a3
    addi t2,t2,    1
    addi t4,t2,    1
    mv	t2,s0 
    li a7, 1
    sub t2,t2,a7
    addi a3,t2,    1
    li t2, 1
    j	_forcondBB3
_forcondBB3:
    li a7, 3
    blt	t2,a7,	_forbodyBB3
    j	_afterForBB3
_afterForBB3:
    blt	a0,zero,	_if_thenBB4
    j	paracopy27
paracopy27:
    j	afterCallBB11
afterCallBB11:
    rem t2,a0,a3
    addi t2,t2,    1
    addi t3,t2,    1
    sw a0, 32(sp) 
    j	_whileCondBB2
_whileCondBB2:
    ble	t3,t4,	_whileBodyBB2
    j	_afterWhileBB1
_afterWhileBB1:
    lw t2, 36(sp) 
    beq	t2,zero,	_if_thenBB5
    j	paracopy28
paracopy28:
    mv	a2,s4 
    mv	a3,s3 
    mv	a7,s8 
    mv	t0,s2 
    mv	a1,s10 
    j	_if_end1
_if_end1:
    li a0, 1
    lw t2, 36(sp) 
    beq	t2,a0,	_if_thenBB6
    j	paracopy29
_if_thenBB6:
    lui t2,%hi(pl)
    sw t4, %lo(pl)(t2)
    lui t2,%hi(MOD)
    sw s9, %lo(MOD)(t2)
    lui t2,%hi(now)
    sw a2, %lo(now)(t2)
    lui t2,%hi(L)
    sw t0, %lo(L)(t2)
    lui t2,%hi(sum)
    sw a3, %lo(sum)(t2)
    lui t2,%hi(s)
    sw a7, %lo(s)(t2)
    lui t2,%hi(pr)
    sw t3, %lo(pr)(t2)
    lui t2,%hi(t)
    sw a1, %lo(t)(t2)
    li a0, 1
    li a1, 1
    mv	a2,s0 
    call	query
    la t2,t    
    lw a1, 0(t2)
    la t2,pr    
    lw t3, 0(t2)
    la t2,s    
    lw a7, 0(t2)
    la t2,sum    
    lw a3, 0(t2)
    la t2,L    
    lw t0, 0(t2)
    la t2,now    
    lw a2, 0(t2)
    la t2,MOD    
    lw t2, 0(t2)
    la t1,pl    
    lw t4, 0(t1)
    add a0,s1,a0
    rem t1,a0,t2
    j	_if_end2
_if_end2:
    addi a0,s5,    -1
    mv	s1,t1 
    mv	s9,t2 
    sw t3, 8(sp) 
    mv	s5,a0 
    sw t4, 0(sp) 
    mv	s4,a2 
    mv	s3,a3 
    mv	s8,a7 
    mv	s2,t0 
    lw a0, 32(sp) 
    mv	s10,a1 
    j	_whileCondBB1
paracopy29:
    mv	t1,s1 
    mv	t2,s9 
    j	_if_end2
_if_thenBB5:
    lui t2,%hi(p)
    sw s11, %lo(p)(t2)
    lui t2,%hi(pl)
    sw t4, %lo(pl)(t2)
    lui t2,%hi(now)
    sw s4, %lo(now)(t2)
    lui t2,%hi(b)
    sw s7, %lo(b)(t2)
    lui t2,%hi(L)
    sw s2, %lo(L)(t2)
    lui t2,%hi(flag)
    sw s6, %lo(flag)(t2)
    lui t2,%hi(sum)
    sw s3, %lo(sum)(t2)
    lui t2,%hi(s)
    sw s8, %lo(s)(t2)
    lui t2,%hi(pr)
    sw t3, %lo(pr)(t2)
    lui t2,%hi(t)
    sw s10, %lo(t)(t2)
    li a0, 1
    li a1, 1
    mv	a2,s0 
    call	update
    la t2,t    
    lw a1, 0(t2)
    la t2,pr    
    lw t3, 0(t2)
    la t2,s    
    lw a7, 0(t2)
    la t2,sum    
    lw a3, 0(t2)
    la t2,flag    
    lw t2, 0(t2)
    la a0,L    
    lw t0, 0(a0)
    la a0,b    
    lw t1, 0(a0)
    la a0,now    
    lw a2, 0(a0)
    la a0,pl    
    lw t4, 0(a0)
    la a0,p    
    lw a0, 0(a0)
    mv	s11,a0 
    mv	s6,t2 
    mv	s7,t1 
    j	_if_end1
_whileBodyBB2:
    mv	t2,s0 
    li a0, 1
    sub t2,t2,a0
    addi a3,t2,    1
    lw a0, 32(sp) 
    li t2, 1
    j	_forcondBB4
_forcondBB4:
    li a7, 3
    blt	t2,a7,	_forbodyBB4
    j	_afterForBB4
_forbodyBB4:
    li a7, 13131
    mul a7,a0,a7
    li a0, 5353
    add a0,a7,a0
    rem a0,a0,s9
    addi t2,t2,    1
    j	_forcondBB4
_afterForBB4:
    blt	a0,zero,	_if_thenBB7
    j	paracopy30
paracopy30:
    j	afterCallBB12
afterCallBB12:
    rem t2,a0,a3
    addi t2,t2,    1
    addi t3,t2,    1
    sw a0, 32(sp) 
    j	_whileCondBB2
_if_thenBB7:
    sub a0,zero,a0
    j	afterCallBB12
_if_thenBB4:
    sub a0,zero,a0
    j	afterCallBB11
_forbodyBB3:
    li a7, 13131
    mul a7,a0,a7
    li a0, 5353
    add a0,a7,a0
    rem a0,a0,s9
    addi t2,t2,    1
    j	_forcondBB3
_if_thenBB3:
    sub a0,zero,a0
    j	afterCallBB10
paracopy25:
    j	_afterCallBB2
_copy_ifTrue12:
    lw t2, 8(s8)
    rem t2,t2,s2
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,s10,t2
    lw t2, 0(t2)
    bgt	t2,zero,	_copy_if_thenBB38
    j	_copy_if_end25
_copy_if_thenBB38:
    li t2, 1
    lw a7, 12(sp) 
    sw t2,8(a7)
    lw a7, 8(s1)
    lw t2, 8(s8)
    sw t2,4(a7)
    li a7, 1
    j	_copy_forcondBB9
_copy_forcondBB9:
    blt	a7,a0,	_copy_forbodyBB9
    j	_copy_if_end25
_copy_forbodyBB9:
    addi t2,a7,    -1
    lw a3, 8(s1)
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,a3,t2
    lw t2, 0(t2)
    rem t2,t2,s2
    mul t2,t2,t2
    rem t2,t2,s2
    lw t1, 8(s1)
    slli a3,a7,    2
    addi a3,a3,    4
    add a3,t1,a3
    sw t2,0(a3)
    addi a7,a7,    1
    j	_copy_forcondBB9
_copy_if_elseBB7:
    addi t2,s0,    1
    srai s3,t2,    1
    lui t2,%hi(p)
    sw s2, %lo(p)(t2)
    lui t2,%hi(a)
    sw s8, %lo(a)(t2)
    lui t2,%hi(now)
    sw s6, %lo(now)(t2)
    lui t2,%hi(b)
    sw s10, %lo(b)(t2)
    lui t2,%hi(L)
    sw a0, %lo(L)(t2)
    lui a0,%hi(flag)
    lw t2, 12(sp) 
    sw t2, %lo(flag)(a0)
    lui t2,%hi(sum)
    sw s7, %lo(sum)(t2)
    lui t2,%hi(s)
    sw s1, %lo(s)(t2)
    li a0, 2
    li a1, 1
    mv	a2,s3 
    call	build
    la t2,s    
    lw t3, 0(t2)
    la t2,sum    
    lw t4, 0(t2)
    la t2,flag    
    lw a2, 0(t2)
    la t2,L    
    lw t0, 0(t2)
    la t2,b    
    lw t1, 0(t2)
    la t2,now    
    lw a3, 0(t2)
    la t2,a    
    lw a0, 0(t2)
    la t2,p    
    lw t2, 0(t2)
    addi a1,s3,    1
    lui a7,%hi(p)
    sw t2, %lo(p)(a7)
    lui t2,%hi(a)
    sw a0, %lo(a)(t2)
    lui t2,%hi(now)
    sw a3, %lo(now)(t2)
    lui t2,%hi(b)
    sw t1, %lo(b)(t2)
    lui t2,%hi(L)
    sw t0, %lo(L)(t2)
    lui t2,%hi(flag)
    sw a2, %lo(flag)(t2)
    lui t2,%hi(sum)
    sw t4, %lo(sum)(t2)
    lui t2,%hi(s)
    sw t3, %lo(s)(t2)
    li a0, 3
    mv	a2,s0 
    call	build
    la t2,s    
    lw a0, 0(t2)
    la t2,sum    
    lw t4, 0(t2)
    la t2,flag    
    lw a2, 0(t2)
    la t2,L    
    lw t0, 0(t2)
    la t2,b    
    lw t2, 0(t2)
    la a7,now    
    lw a3, 0(a7)
    la a7,a    
    lw a7, 0(a7)
    la t1,p    
    lw t1, 0(t1)
    lw t3, 12(t4)
    lw a1, 16(t4)
    add t3,t3,a1
    sw t3,8(t4)
    lw a1, 12(a2)
    lw t3, 16(a2)
    and t3,a1,t3
    sw t3,8(a2)
    lw t3, 8(a2)
    bgt	t3,zero,	_copy_if_thenBB39
    j	paracopy31
paracopy31:
    sw a7, 48(sp) 
    mv	s5,s11 
    mv	s11,t1 
    mv	s4,a3 
    mv	s3,t4 
    mv	s6,a2 
    mv	s7,t2 
    mv	s8,a0 
    mv	s2,t0 
    mv	a0,s9 
    lw t2, 60(sp) 
    mv	s10,t2 
    mv	s1,zero 
    li t2, 32761
    mv	s9,t2 
    mv	t3,zero 
    sw t3, 8(sp) 
    mv	t4,zero 
    sw t4, 0(sp) 
    j	_whileCondBB1
_copy_if_thenBB39:
    mv	t3,zero 
    j	_copy_forcondBB10
_copy_forcondBB10:
    blt	t3,t0,	_copy_forbodyBB10
    j	_copy_afterForBB5
_copy_forbodyBB10:
    lw a4, 16(a0)
    slli a1,t3,    2
    addi a1,a1,    4
    add ra,a4,a1
    lw a1, 12(a0)
    slli a4,t3,    2
    addi a4,a4,    4
    add a1,a1,a4
    lw a1, 0(a1)
    lw a4, 0(ra)
    add a1,a1,a4
    lw ra, 8(a0)
    slli a4,t3,    2
    addi a4,a4,    4
    add a4,ra,a4
    sw a1,0(a4)
    addi t3,t3,    1
    j	_copy_forcondBB10
_copy_afterForBB5:
    li t3, 0
    sw t3,4(a3)
    sw a7, 48(sp) 
    mv	s5,s11 
    mv	s11,t1 
    mv	s4,a3 
    mv	s3,t4 
    mv	s6,a2 
    mv	s7,t2 
    mv	s8,a0 
    mv	s2,t0 
    mv	a0,s9 
    lw t2, 60(sp) 
    mv	s10,t2 
    mv	s1,zero 
    li t2, 32761
    mv	s9,t2 
    mv	t3,zero 
    sw t3, 8(sp) 
    mv	t4,zero 
    sw t4, 0(sp) 
    j	_whileCondBB1
_forbodyBB1:
    mv	t2,s2 
    sub t2,t2,zero
    addi a3,t2,    1
    mv	t2,s9 
    li a0, 1
    j	_forcondBB5
_forcondBB5:
    li t1, 3
    blt	a0,t1,	_forbodyBB5
    j	_afterForBB5
_afterForBB5:
    blt	t2,zero,	_if_thenBB8
    j	paracopy32
paracopy32:
    j	afterCallBB13
afterCallBB13:
    rem a0,t2,a3
    add a0,a0,zero
    addi a0,a0,    1
    slli a3,a7,    2
    addi a3,a3,    4
    add a3,s8,a3
    sw a0,0(a3)
    addi a7,a7,    1
    mv	s9,t2 
    j	_forcondBB1
_if_thenBB8:
    sub t2,zero,t2
    j	afterCallBB13
_forbodyBB5:
    li t1, 13131
    mul t2,t2,t1
    li t1, 5353
    add t1,t2,t1
    li t2, 32761
    rem t2,t1,t2
    addi a0,a0,    1
    j	_forcondBB5
forupdateBB1:
    li a0, 324
    call malloc
    li t2, 80
    sw t2,0(a0)
    sw a0,0(s2)
    addi s2,s2,    4
    j	forcondBB5
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	aa					#@aa
    .p2align	2
aa:
    .word	0
     
    .globl	bb					#@bb
    .p2align	2
bb:
    .word	0
     
    .globl	a					#@a
    .p2align	2
a:
    .word	0
     
    .globl	op					#@op
    .p2align	2
op:
    .word	0
     
    .globl	no					#@no
    .p2align	2
no:
    .word	0
     
    .globl	b					#@b
    .p2align	2
b:
    .word	0
     
    .globl	pr					#@pr
    .p2align	2
pr:
    .word	0
     
    .globl	flag					#@flag
    .p2align	2
flag:
    .word	0
     
    .globl	MOD					#@MOD
    .p2align	2
MOD:
    .word	0
     
    .globl	ans					#@ans
    .p2align	2
ans:
    .word	0
     
    .globl	sum					#@sum
    .p2align	2
sum:
    .word	0
     
    .globl	L					#@L
    .p2align	2
L:
    .word	0
     
    .globl	m					#@m
    .p2align	2
m:
    .word	0
     
    .globl	n					#@n
    .p2align	2
n:
    .word	0
     
    .globl	p					#@p
    .p2align	2
p:
    .word	0
     
    .globl	s					#@s
    .p2align	2
s:
    .word	0
     
    .globl	t					#@t
    .p2align	2
t:
    .word	0
     
    .globl	now					#@now
    .p2align	2
now:
    .word	0
     
    .globl	pl					#@pl
    .p2align	2
pl:
    .word	0
     
