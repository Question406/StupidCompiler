    .text
    .globl	gcd				#begin
    .p2align	2
    .type	gcd,@function
gcd:
gcd.entryBB1:
    addi sp,sp,    -16
    sw ra, 0(sp) 
    mv	t4,a1 
    beq	t4,zero,	if_thenBB1
if_end1:
    blt	a0,t4,	if_thenBB2
if_elseBB1:
    rem a3,a0,t4
    beq	a3,zero,	_copy_if_thenBB1
_copy_if_end1:
    blt	t4,a3,	_copy_if_thenBB2
_copy_if_elseBB1:
    rem a1,t4,a3
    mv	a0,a3 
    call	gcd
    mv	a3,a0 
afterCallBB1:
    mv	a0,a3 
gcd.exitBB1:
    lw ra, 0(sp) 
    addi sp,sp,    16
    ret
_copy_if_thenBB2:
    beq	t4,zero,	_copy_if_thenBB3
_copy_if_end2:
    blt	a3,t4,	_copy_if_thenBB4
_copy_if_elseBB2:
    rem a1,a3,t4
    mv	a0,t4 
    call	gcd
    mv	a3,a0 
afterCallBB2:
    j	afterCallBB1
_copy_if_thenBB4:
    mv	a0,t4 
    mv	a1,a3 
    call	gcd
    mv	a3,a0 
    j	afterCallBB2
_copy_if_thenBB3:
    j	afterCallBB2
_copy_if_thenBB1:
    mv	a3,t4 
    j	afterCallBB1
if_thenBB2:
    mv	a1,t4 
    beq	a0,zero,	_copy_if_thenBB5
_copy_if_end3:
    blt	a1,a0,	_copy_if_thenBB6
_copy_if_elseBB3:
    rem a1,a1,a0
    call	gcd
afterCallBB3:
    j	gcd.exitBB1
_copy_if_thenBB6:
    call	gcd
    j	afterCallBB3
_copy_if_thenBB5:
    mv	a0,a1 
    j	afterCallBB3
if_thenBB1:
    j	gcd.exitBB1
								 # func end
    .globl	update				#begin
    .p2align	2
    .type	update,@function
update:
update.entryBB1:
    addi sp,sp,    -48
    sw ra, 16(sp) 
    sw s11, 32(sp) 
    sw s10, 0(sp) 
    sw s9, 28(sp) 
    sw s8, 12(sp) 
    sw s7, 24(sp) 
    sw s6, 20(sp) 
    sw s5, 8(sp) 
    sw s4, 4(sp) 
    mv	s8,s3 
    mv	s11,s2 
    mv	s2,a2 
    mv	s4,a0 
    la t4,now    
    lw a0, 0(t4)
    la t4,t    
    lw a4, 0(t4)
    la t4,pr    
    lw t3, 0(t4)
    la t4,s    
    lw t0, 0(t4)
    la t4,sum    
    lw a5, 0(t4)
    la t4,flag    
    lw ra, 0(t4)
    la t4,L    
    lw a2, 0(t4)
    la t4,pl    
    lw a6, 0(t4)
    la t4,b    
    lw t4, 0(t4)
    la a3,p    
    lw a3, 0(a3)
    ble	a6,a1,	ifTrue1
if_end2:
    beq	a1,s2,	if_thenBB3
if_end3:
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,a4,t6
    lw t6, 0(t6)
    bgt	t6,zero,	if_thenBB4
if_end4:
    slli t6,s4,    1
    mv	s5,t6 
    slli t6,s4,    1
    addi t6,t6,    1
    mv	s10,t6 
    add t6,a1,s2
    srai t6,t6,    1
    mv	s3,t6 
    ble	a6,s3,	if_thenBB5
paracopy1:
    mv	t6,t0 
    mv	t0,a6 
if_end5:
    addi a6,s3,    1
    bge	t3,a6,	if_thenBB6
paracopy2:
    mv	a1,t6 
    mv	a6,a5 
    mv	t6,a2 
    mv	a5,ra 
    mv	ra,a0 
if_end6:
    slli a2,s10,    2
    addi a2,a2,    4
    add a0,a6,a2
    slli a2,s5,    2
    addi a2,a2,    4
    add a2,a6,a2
    lw a2, 0(a2)
    lw a0, 0(a0)
    add a0,a2,a0
    slli a2,s4,    2
    addi a2,a2,    4
    add a2,a6,a2
    sw a0,0(a2)
    slli a2,s10,    2
    addi a2,a2,    4
    add a0,a5,a2
    slli a2,s5,    2
    addi a2,a2,    4
    add a2,a5,a2
    lw t1, 0(a2)
    lw a2, 0(a0)
    and a2,t1,a2
    slli a0,s4,    2
    addi a0,a0,    4
    add a0,a5,a0
    sw a2,0(a0)
    slli a2,s4,    2
    addi a2,a2,    4
    add a2,a5,a2
    lw a2, 0(a2)
    bgt	a2,zero,	if_thenBB7
paracopy3:
    mv	t1,a6 
    mv	a2,a5 
update.exitBB1:
    lui a6,%hi(p)
    sw a3, %lo(p)(a6)
    lui a3,%hi(b)
    sw t4, %lo(b)(a3)
    lui t4,%hi(pl)
    sw t0, %lo(pl)(t4)
    lui t4,%hi(L)
    sw t6, %lo(L)(t4)
    lui t4,%hi(flag)
    sw a2, %lo(flag)(t4)
    lui t4,%hi(sum)
    sw t1, %lo(sum)(t4)
    lui t4,%hi(s)
    sw a1, %lo(s)(t4)
    lui t4,%hi(pr)
    sw t3, %lo(pr)(t4)
    lui t4,%hi(t)
    sw a4, %lo(t)(t4)
    lui t4,%hi(now)
    sw ra, %lo(now)(t4)
    mv	s2,s11 
    mv	s3,s8 
    lw s4, 4(sp) 
    lw s5, 8(sp) 
    lw s6, 20(sp) 
    lw s7, 24(sp) 
    lw s8, 12(sp) 
    lw s9, 28(sp) 
    lw s10, 0(sp) 
    lw s11, 32(sp) 
    lw ra, 16(sp) 
    addi sp,sp,    48
    ret
if_thenBB7:
    mv	a2,zero 
forcondBB1:
    blt	a2,t6,	forbodyBB1
afterForBB1:
    slli a2,s4,    2
    addi a2,a2,    4
    add a2,ra,a2
    li a0, 0
    sw a0,0(a2)
    mv	t1,a6 
    mv	a2,a5 
    j	update.exitBB1
forbodyBB1:
    slli a0,s10,    2
    addi a0,a0,    4
    add t1,a1,a0
    slli a0,s10,    2
    addi a0,a0,    4
    add a0,ra,a0
    lw a0, 0(a0)
    add a0,a2,a0
    rem a0,a0,t6
    lw t1, 0(t1)
    slli a0,a0,    2
    addi a0,a0,    4
    add t2,t1,a0
    slli a0,s5,    2
    addi a0,a0,    4
    add a0,a1,a0
    slli t1,s5,    2
    addi t1,t1,    4
    add t1,ra,t1
    lw t1, 0(t1)
    add t1,a2,t1
    rem t1,t1,t6
    lw t5, 0(a0)
    slli a0,t1,    2
    addi a0,a0,    4
    add a0,t5,a0
    lw a0, 0(a0)
    lw t1, 0(t2)
    add t2,a0,t1
    slli a0,s4,    2
    addi a0,a0,    4
    add a0,a1,a0
    lw t1, 0(a0)
    slli a0,a2,    2
    addi a0,a0,    4
    add a0,t1,a0
    sw t2,0(a0)
    addi a2,a2,    1
    j	forcondBB1
if_thenBB6:
    addi a1,s3,    1
    mv	s6,s10 
    mv	s3,s2 
    ble	t0,a1,	_copy_ifTrue1
_copy_if_end4:
    beq	a1,s3,	_copy_if_thenBB7
_copy_if_end5:
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,a4,a6
    lw a6, 0(a6)
    bgt	a6,zero,	_copy_if_thenBB8
_copy_if_end6:
    slli a6,s6,    1
    mv	s2,a6 
    slli a6,s6,    1
    addi a6,a6,    1
    mv	s7,a6 
    add a6,a1,s3
    srai a6,a6,    1
    mv	s9,a6 
    ble	t0,s9,	_copy_if_thenBB9
paracopy4:
    mv	a6,t4 
    mv	a1,t6 
    mv	t6,a2 
    mv	t4,a0 
    mv	a2,a4 
_copy_if_end7:
    addi a4,s9,    1
    bge	t3,a4,	_copy_if_thenBB10
paracopy5:
    mv	a4,a1 
    mv	a0,t4 
_copy_if_end8:
    slli t4,s7,    2
    addi t4,t4,    4
    add t4,a5,t4
    slli a1,s2,    2
    addi a1,a1,    4
    add a1,a5,a1
    lw a1, 0(a1)
    lw t4, 0(t4)
    add a1,a1,t4
    slli t4,s6,    2
    addi t4,t4,    4
    add t4,a5,t4
    sw a1,0(t4)
    slli t4,s7,    2
    addi t4,t4,    4
    add t4,ra,t4
    slli a1,s2,    2
    addi a1,a1,    4
    add a1,ra,a1
    lw a1, 0(a1)
    lw t4, 0(t4)
    and a1,a1,t4
    slli t4,s6,    2
    addi t4,t4,    4
    add t4,ra,t4
    sw a1,0(t4)
    slli t4,s6,    2
    addi t4,t4,    4
    add t4,ra,t4
    lw t4, 0(t4)
    bgt	t4,zero,	_copy_if_thenBB11
paracopy6:
    mv	t4,a6 
    mv	a1,a4 
    mv	a6,a5 
    mv	a5,ra 
    mv	ra,a0 
    mv	a4,a2 
    j	if_end6
_copy_if_thenBB11:
    mv	t4,zero 
_copy_forcondBB1:
    blt	t4,t6,	_copy_forbodyBB1
_copy_afterForBB1:
    slli t4,s6,    2
    addi t4,t4,    4
    add t4,a0,t4
    li a1, 0
    sw a1,0(t4)
    mv	t4,a6 
    mv	a1,a4 
    mv	a6,a5 
    mv	a5,ra 
    mv	ra,a0 
    mv	a4,a2 
    j	if_end6
_copy_forbodyBB1:
    slli a1,s7,    2
    addi a1,a1,    4
    add t1,a4,a1
    slli a1,s7,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw a1, 0(a1)
    add a1,t4,a1
    rem t2,a1,t6
    lw a1, 0(t1)
    slli t1,t2,    2
    addi t1,t1,    4
    add t1,a1,t1
    slli a1,s2,    2
    addi a1,a1,    4
    add t2,a4,a1
    slli a1,s2,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw a1, 0(a1)
    add a1,t4,a1
    rem a1,a1,t6
    lw t2, 0(t2)
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,t2,a1
    lw t2, 0(a1)
    lw a1, 0(t1)
    add t2,t2,a1
    slli a1,s6,    2
    addi a1,a1,    4
    add a1,a4,a1
    lw t1, 0(a1)
    slli a1,t4,    2
    addi a1,a1,    4
    add a1,t1,a1
    sw t2,0(a1)
    addi t4,t4,    1
    j	_copy_forcondBB1
_copy_if_thenBB10:
    addi a4,s9,    1
    lui a0,%hi(p)
    sw a3, %lo(p)(a0)
    lui a3,%hi(b)
    sw a6, %lo(b)(a3)
    lui a3,%hi(pl)
    sw t0, %lo(pl)(a3)
    lui a3,%hi(L)
    sw t6, %lo(L)(a3)
    lui a3,%hi(flag)
    sw ra, %lo(flag)(a3)
    lui a3,%hi(sum)
    sw a5, %lo(sum)(a3)
    lui a3,%hi(s)
    sw a1, %lo(s)(a3)
    lui a3,%hi(pr)
    sw t3, %lo(pr)(a3)
    lui a3,%hi(t)
    sw a2, %lo(t)(a3)
    lui a3,%hi(now)
    sw t4, %lo(now)(a3)
    mv	a0,s7 
    mv	a1,a4 
    mv	a2,s3 
    call	update
    la t4,now    
    lw t4, 0(t4)
    la a3,t    
    lw a2, 0(a3)
    la a3,pr    
    lw a1, 0(a3)
    la a3,s    
    lw a3, 0(a3)
    la t6,sum    
    lw a5, 0(t6)
    la t6,flag    
    lw t3, 0(t6)
    la t6,L    
    lw t6, 0(t6)
    la a6,pl    
    lw t0, 0(a6)
    la a6,b    
    lw a6, 0(a6)
    la a4,p    
    lw a0, 0(a4)
    mv	a4,a3 
    mv	ra,t3 
    mv	a3,a0 
    mv	a0,t4 
    mv	t3,a1 
    j	_copy_if_end8
_copy_if_thenBB9:
    lui a6,%hi(p)
    sw a3, %lo(p)(a6)
    lui a3,%hi(b)
    sw t4, %lo(b)(a3)
    lui t4,%hi(pl)
    sw t0, %lo(pl)(t4)
    lui t4,%hi(L)
    sw a2, %lo(L)(t4)
    lui t4,%hi(flag)
    sw ra, %lo(flag)(t4)
    lui t4,%hi(sum)
    sw a5, %lo(sum)(t4)
    lui t4,%hi(s)
    sw t6, %lo(s)(t4)
    lui t4,%hi(pr)
    sw t3, %lo(pr)(t4)
    lui t4,%hi(t)
    sw a4, %lo(t)(t4)
    lui t4,%hi(now)
    sw a0, %lo(now)(t4)
    mv	a0,s2 
    mv	a2,s9 
    call	update
    la t4,now    
    lw t4, 0(t4)
    la a3,t    
    lw a2, 0(a3)
    la a3,pr    
    lw t3, 0(a3)
    la a3,s    
    lw a5, 0(a3)
    la a3,sum    
    lw a3, 0(a3)
    la t6,flag    
    lw ra, 0(t6)
    la t6,L    
    lw t6, 0(t6)
    la a6,pl    
    lw a0, 0(a6)
    la a6,b    
    lw a6, 0(a6)
    la a4,p    
    lw a4, 0(a4)
    mv	a1,a5 
    mv	a5,a3 
    mv	a3,a4 
    mv	t0,a0 
    j	_copy_if_end7
_copy_if_thenBB8:
    mv	a6,s6 
    slli t1,a6,    2
    addi t1,t1,    4
    add t1,a4,t1
    lw t1, 0(t1)
    bgt	t1,zero,	_copy__if_thenBB1
    j	_copy_if_end6
_copy__if_thenBB1:
    slli t2,a6,    1
    slli t1,a6,    1
    addi t1,t1,    1
    slli t5,a6,    2
    addi t5,t5,    4
    add a7,a4,t5
    slli t5,t2,    2
    addi t5,t5,    4
    add t5,a0,t5
    lw t5, 0(t5)
    lw a7, 0(a7)
    add t5,t5,a7
    rem t5,t5,a2
    slli a7,t2,    2
    addi a7,a7,    4
    add a7,a0,a7
    sw t5,0(a7)
    slli t5,t2,    2
    addi t5,t5,    4
    add t5,t6,t5
    slli a7,t2,    2
    addi a7,a7,    4
    add s9,a0,a7
    lw a7, 0(t5)
    lw t5, 0(s9)
    slli t5,t5,    2
    addi t5,t5,    4
    add s9,a7,t5
    slli t5,t2,    2
    addi t5,t5,    4
    add a7,a5,t5
    lw t5, 0(s9)
    sw t5,0(a7)
    slli t5,a6,    2
    addi t5,t5,    4
    add a7,a4,t5
    slli t5,t2,    2
    addi t5,t5,    4
    add t5,a4,t5
    lw t5, 0(t5)
    lw a7, 0(a7)
    add t5,t5,a7
    rem t5,t5,a2
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,a4,t2
    sw t5,0(t2)
    slli t2,a6,    2
    addi t2,t2,    4
    add t5,a4,t2
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,a0,t2
    lw a7, 0(t2)
    lw t2, 0(t5)
    add t2,a7,t2
    rem t2,t2,a2
    slli t5,t1,    2
    addi t5,t5,    4
    add t5,a0,t5
    sw t2,0(t5)
    slli t2,t1,    2
    addi t2,t2,    4
    add t5,t6,t2
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,a0,t2
    lw t5, 0(t5)
    lw t2, 0(t2)
    slli t2,t2,    2
    addi t2,t2,    4
    add t5,t5,t2
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,a5,t2
    lw t5, 0(t5)
    sw t5,0(t2)
    slli t2,a6,    2
    addi t2,t2,    4
    add t5,a4,t2
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,a4,t2
    lw a7, 0(t2)
    lw t2, 0(t5)
    add t2,a7,t2
    rem t2,t2,a2
    slli t1,t1,    2
    addi t1,t1,    4
    add t1,a4,t1
    sw t2,0(t1)
    slli a6,a6,    2
    addi a6,a6,    4
    add t1,a4,a6
    li a6, 0
    sw a6,0(t1)
    j	_copy_if_end6
_copy_if_thenBB7:
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,a5,a6
    lw a6, 0(a6)
    rem a6,a6,a3
    mul a6,a6,a6
    rem a1,a6,a3
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,a5,a6
    sw a1,0(a6)
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,a5,a6
    lw a6, 0(a6)
    slli a6,a6,    2
    addi a6,a6,    4
    add a6,t4,a6
    lw a6, 0(a6)
    bgt	a6,zero,	_copy_if_thenBB12
paracopy7:
    mv	a1,t6 
    mv	a6,a5 
    mv	t6,a2 
    mv	a5,ra 
    mv	ra,a0 
    j	if_end6
_copy_if_thenBB12:
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,ra,a6
    li a1, 1
    sw a1,0(a6)
    slli a6,s6,    2
    addi a6,a6,    4
    add a1,a5,a6
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,t6,a6
    lw a6, 0(a6)
    lw a1, 0(a1)
    sw a1,4(a6)
    li a6, 1
_copy_forcondBB2:
    blt	a6,a2,	_copy_forbodyBB2
paracopy8:
    mv	a1,t6 
    mv	a6,a5 
    mv	t6,a2 
    mv	a5,ra 
    mv	ra,a0 
    j	if_end6
_copy_forbodyBB2:
    slli a1,s6,    2
    addi a1,a1,    4
    add a1,t6,a1
    addi t2,a6,    -1
    lw t1, 0(a1)
    slli a1,t2,    2
    addi a1,a1,    4
    add a1,t1,a1
    lw a1, 0(a1)
    rem a1,a1,a3
    mul a1,a1,a1
    rem t1,a1,a3
    slli a1,s6,    2
    addi a1,a1,    4
    add a1,t6,a1
    lw t2, 0(a1)
    slli a1,a6,    2
    addi a1,a1,    4
    add a1,t2,a1
    sw t1,0(a1)
    addi a6,a6,    1
    j	_copy_forcondBB2
_copy_ifTrue1:
    bge	t3,s3,	_copy_ifTrue2
    j	_copy_if_end4
_copy_ifTrue2:
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,ra,a6
    lw a6, 0(a6)
    bgt	a6,zero,	_copy_if_thenBB13
    j	_copy_if_end4
_copy_if_thenBB13:
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,a0,a6
    lw a6, 0(a6)
    addi a6,a6,    1
    rem a1,a6,a2
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,a0,a6
    sw a1,0(a6)
    slli a6,s6,    2
    addi a6,a6,    4
    add a1,t6,a6
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,a0,a6
    lw a1, 0(a1)
    lw a6, 0(a6)
    slli a6,a6,    2
    addi a6,a6,    4
    add a1,a1,a6
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,a5,a6
    lw a1, 0(a1)
    sw a1,0(a6)
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,a4,a6
    lw a6, 0(a6)
    addi a6,a6,    1
    rem a1,a6,a2
    slli a6,s6,    2
    addi a6,a6,    4
    add a6,a4,a6
    sw a1,0(a6)
    mv	a1,t6 
    mv	a6,a5 
    mv	t6,a2 
    mv	a5,ra 
    mv	ra,a0 
    j	if_end6
if_thenBB5:
    ble	a6,a1,	_copy_ifTrue3
_copy_if_end9:
    beq	a1,s3,	_copy_if_thenBB14
_copy_if_end10:
    slli t6,s5,    2
    addi t6,t6,    4
    add t6,a4,t6
    lw t6, 0(t6)
    bgt	t6,zero,	_copy_if_thenBB15
_copy_if_end11:
    slli t6,s5,    1
    mv	s7,t6 
    slli t6,s5,    1
    addi t6,t6,    1
    mv	s6,t6 
    add t6,a1,s3
    srai t6,t6,    1
    mv	s9,t6 
    ble	a6,s9,	_copy_if_thenBB16
paracopy9:
    mv	t6,t0 
_copy_if_end12:
    addi t0,s9,    1
    bge	t3,t0,	_copy_if_thenBB17
paracopy10:
_copy_if_end13:
    slli t0,s6,    2
    addi t0,t0,    4
    add t0,a5,t0
    slli a1,s7,    2
    addi a1,a1,    4
    add a1,a5,a1
    lw a1, 0(a1)
    lw t0, 0(t0)
    add t0,a1,t0
    slli a1,s5,    2
    addi a1,a1,    4
    add a1,a5,a1
    sw t0,0(a1)
    slli t0,s6,    2
    addi t0,t0,    4
    add a1,ra,t0
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t0, 0(t0)
    lw a1, 0(a1)
    and t0,t0,a1
    slli a1,s5,    2
    addi a1,a1,    4
    add a1,ra,a1
    sw t0,0(a1)
    slli t0,s5,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t0, 0(t0)
    bgt	t0,zero,	_copy_if_thenBB18
paracopy11:
    mv	t0,a6 
    j	if_end5
_copy_if_thenBB18:
    mv	t0,zero 
_copy_forcondBB3:
    blt	t0,a2,	_copy_forbodyBB3
_copy_afterForBB2:
    slli t0,s5,    2
    addi t0,t0,    4
    add t0,a0,t0
    li a1, 0
    sw a1,0(t0)
    mv	t0,a6 
    j	if_end5
_copy_forbodyBB3:
    slli a1,s6,    2
    addi a1,a1,    4
    add t1,t6,a1
    slli a1,s6,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw a1, 0(a1)
    add a1,t0,a1
    rem a1,a1,a2
    lw t1, 0(t1)
    slli a1,a1,    2
    addi a1,a1,    4
    add t1,t1,a1
    slli a1,s7,    2
    addi a1,a1,    4
    add t2,t6,a1
    slli a1,s7,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw a1, 0(a1)
    add a1,t0,a1
    rem a1,a1,a2
    lw t2, 0(t2)
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,t2,a1
    lw a1, 0(a1)
    lw t1, 0(t1)
    add t1,a1,t1
    slli a1,s5,    2
    addi a1,a1,    4
    add a1,t6,a1
    lw a1, 0(a1)
    slli t2,t0,    2
    addi t2,t2,    4
    add a1,a1,t2
    sw t1,0(a1)
    addi t0,t0,    1
    j	_copy_forcondBB3
_copy_if_thenBB17:
    addi t0,s9,    1
    lui a1,%hi(p)
    sw a3, %lo(p)(a1)
    lui a3,%hi(b)
    sw t4, %lo(b)(a3)
    lui t4,%hi(pl)
    sw a6, %lo(pl)(t4)
    lui t4,%hi(L)
    sw a2, %lo(L)(t4)
    lui t4,%hi(flag)
    sw ra, %lo(flag)(t4)
    lui t4,%hi(sum)
    sw a5, %lo(sum)(t4)
    lui t4,%hi(s)
    sw t6, %lo(s)(t4)
    lui t4,%hi(pr)
    sw t3, %lo(pr)(t4)
    lui t4,%hi(t)
    sw a4, %lo(t)(t4)
    lui t4,%hi(now)
    sw a0, %lo(now)(t4)
    mv	a0,s6 
    mv	a1,t0 
    mv	a2,s3 
    call	update
    la t4,now    
    lw a0, 0(t4)
    la t4,t    
    lw a1, 0(t4)
    la t4,pr    
    lw t3, 0(t4)
    la t4,s    
    lw t6, 0(t4)
    la t4,sum    
    lw a2, 0(t4)
    la t4,flag    
    lw a3, 0(t4)
    la t4,L    
    lw a6, 0(t4)
    la t4,pl    
    lw t0, 0(t4)
    la t4,b    
    lw t4, 0(t4)
    la a5,p    
    lw a4, 0(a5)
    mv	a5,a2 
    mv	a2,a6 
    mv	ra,a3 
    mv	a3,a4 
    mv	a4,a1 
    mv	a6,t0 
    j	_copy_if_end13
_copy_if_thenBB16:
    lui t6,%hi(p)
    sw a3, %lo(p)(t6)
    lui a3,%hi(b)
    sw t4, %lo(b)(a3)
    lui t4,%hi(pl)
    sw a6, %lo(pl)(t4)
    lui t4,%hi(L)
    sw a2, %lo(L)(t4)
    lui t4,%hi(flag)
    sw ra, %lo(flag)(t4)
    lui t4,%hi(sum)
    sw a5, %lo(sum)(t4)
    lui t4,%hi(s)
    sw t0, %lo(s)(t4)
    lui t4,%hi(pr)
    sw t3, %lo(pr)(t4)
    lui t4,%hi(t)
    sw a4, %lo(t)(t4)
    lui t4,%hi(now)
    sw a0, %lo(now)(t4)
    mv	a0,s7 
    mv	a2,s9 
    call	update
    la t4,now    
    lw a6, 0(t4)
    la t4,t    
    lw a1, 0(t4)
    la t4,pr    
    lw a4, 0(t4)
    la t4,s    
    lw a3, 0(t4)
    la t4,sum    
    lw a2, 0(t4)
    la t4,flag    
    lw ra, 0(t4)
    la t4,L    
    lw a0, 0(t4)
    la t4,pl    
    lw t0, 0(t4)
    la t4,b    
    lw t4, 0(t4)
    la t6,p    
    lw t3, 0(t6)
    mv	t6,a3 
    mv	a5,a2 
    mv	a2,a0 
    mv	a3,t3 
    mv	a0,a6 
    mv	t3,a4 
    mv	a4,a1 
    mv	a6,t0 
    j	_copy_if_end12
_copy_if_thenBB15:
    mv	t6,s5 
    slli t1,t6,    2
    addi t1,t1,    4
    add t1,a4,t1
    lw t1, 0(t1)
    bgt	t1,zero,	_copy__if_thenBB2
    j	_copy_if_end11
_copy__if_thenBB2:
    slli t1,t6,    1
    slli t2,t6,    1
    addi t2,t2,    1
    slli t5,t6,    2
    addi t5,t5,    4
    add a7,a4,t5
    slli t5,t1,    2
    addi t5,t5,    4
    add t5,a0,t5
    lw t5, 0(t5)
    lw a7, 0(a7)
    add t5,t5,a7
    rem a7,t5,a2
    slli t5,t1,    2
    addi t5,t5,    4
    add t5,a0,t5
    sw a7,0(t5)
    slli t5,t1,    2
    addi t5,t5,    4
    add a7,t0,t5
    slli t5,t1,    2
    addi t5,t5,    4
    add t5,a0,t5
    lw a7, 0(a7)
    lw t5, 0(t5)
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,a7,t5
    slli a7,t1,    2
    addi a7,a7,    4
    add a7,a5,a7
    lw t5, 0(t5)
    sw t5,0(a7)
    slli t5,t6,    2
    addi t5,t5,    4
    add t5,a4,t5
    slli a7,t1,    2
    addi a7,a7,    4
    add a7,a4,a7
    lw a7, 0(a7)
    lw t5, 0(t5)
    add t5,a7,t5
    rem t5,t5,a2
    slli t1,t1,    2
    addi t1,t1,    4
    add t1,a4,t1
    sw t5,0(t1)
    slli t1,t6,    2
    addi t1,t1,    4
    add t5,a4,t1
    slli t1,t2,    2
    addi t1,t1,    4
    add t1,a0,t1
    lw a7, 0(t1)
    lw t1, 0(t5)
    add t1,a7,t1
    rem t5,t1,a2
    slli t1,t2,    2
    addi t1,t1,    4
    add t1,a0,t1
    sw t5,0(t1)
    slli t1,t2,    2
    addi t1,t1,    4
    add t5,t0,t1
    slli t1,t2,    2
    addi t1,t1,    4
    add t1,a0,t1
    lw t5, 0(t5)
    lw t1, 0(t1)
    slli t1,t1,    2
    addi t1,t1,    4
    add t5,t5,t1
    slli t1,t2,    2
    addi t1,t1,    4
    add a7,a5,t1
    lw t1, 0(t5)
    sw t1,0(a7)
    slli t1,t6,    2
    addi t1,t1,    4
    add t5,a4,t1
    slli t1,t2,    2
    addi t1,t1,    4
    add t1,a4,t1
    lw t1, 0(t1)
    lw t5, 0(t5)
    add t1,t1,t5
    rem t5,t1,a2
    slli t1,t2,    2
    addi t1,t1,    4
    add t1,a4,t1
    sw t5,0(t1)
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,a4,t6
    li t1, 0
    sw t1,0(t6)
    j	_copy_if_end11
_copy_if_thenBB14:
    slli t6,s5,    2
    addi t6,t6,    4
    add t6,a5,t6
    lw t6, 0(t6)
    rem t6,t6,a3
    mul t6,t6,t6
    rem t6,t6,a3
    slli a1,s5,    2
    addi a1,a1,    4
    add a1,a5,a1
    sw t6,0(a1)
    slli t6,s5,    2
    addi t6,t6,    4
    add t6,a5,t6
    lw t6, 0(t6)
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,t4,t6
    lw t6, 0(t6)
    bgt	t6,zero,	_copy_if_thenBB19
paracopy12:
    mv	t6,t0 
    mv	t0,a6 
    j	if_end5
_copy_if_thenBB19:
    slli t6,s5,    2
    addi t6,t6,    4
    add a1,ra,t6
    li t6, 1
    sw t6,0(a1)
    slli t6,s5,    2
    addi t6,t6,    4
    add t1,a5,t6
    slli t6,s5,    2
    addi t6,t6,    4
    add t6,t0,t6
    lw a1, 0(t6)
    lw t6, 0(t1)
    sw t6,4(a1)
    li a1, 1
_copy_forcondBB4:
    blt	a1,a2,	_copy_forbodyBB4
paracopy13:
    mv	t6,t0 
    mv	t0,a6 
    j	if_end5
_copy_forbodyBB4:
    slli t6,s5,    2
    addi t6,t6,    4
    add t6,t0,t6
    addi t2,a1,    -1
    lw t1, 0(t6)
    slli t6,t2,    2
    addi t6,t6,    4
    add t6,t1,t6
    lw t6, 0(t6)
    rem t6,t6,a3
    mul t6,t6,t6
    rem t1,t6,a3
    slli t6,s5,    2
    addi t6,t6,    4
    add t6,t0,t6
    lw t2, 0(t6)
    slli t6,a1,    2
    addi t6,t6,    4
    add t6,t2,t6
    sw t1,0(t6)
    addi a1,a1,    1
    j	_copy_forcondBB4
_copy_ifTrue3:
    bge	t3,s3,	_copy_ifTrue4
    j	_copy_if_end9
_copy_ifTrue4:
    slli t6,s5,    2
    addi t6,t6,    4
    add t6,ra,t6
    lw t6, 0(t6)
    bgt	t6,zero,	_copy_if_thenBB20
    j	_copy_if_end9
_copy_if_thenBB20:
    slli t6,s5,    2
    addi t6,t6,    4
    add t6,a0,t6
    lw t6, 0(t6)
    addi t6,t6,    1
    rem a1,t6,a2
    slli t6,s5,    2
    addi t6,t6,    4
    add t6,a0,t6
    sw a1,0(t6)
    slli t6,s5,    2
    addi t6,t6,    4
    add t6,t0,t6
    slli a1,s5,    2
    addi a1,a1,    4
    add a1,a0,a1
    lw t6, 0(t6)
    lw a1, 0(a1)
    slli a1,a1,    2
    addi a1,a1,    4
    add t1,t6,a1
    slli t6,s5,    2
    addi t6,t6,    4
    add a1,a5,t6
    lw t6, 0(t1)
    sw t6,0(a1)
    slli t6,s5,    2
    addi t6,t6,    4
    add t6,a4,t6
    lw t6, 0(t6)
    addi t6,t6,    1
    rem a1,t6,a2
    slli t6,s5,    2
    addi t6,t6,    4
    add t6,a4,t6
    sw a1,0(t6)
    mv	t6,t0 
    mv	t0,a6 
    j	if_end5
if_thenBB4:
    mv	t6,s4 
    slli t1,t6,    2
    addi t1,t1,    4
    add t1,a4,t1
    lw t1, 0(t1)
    bgt	t1,zero,	_if_thenBB1
    j	if_end4
_if_thenBB1:
    slli t2,t6,    1
    slli t1,t6,    1
    addi t1,t1,    1
    slli t5,t6,    2
    addi t5,t5,    4
    add a7,a4,t5
    slli t5,t2,    2
    addi t5,t5,    4
    add t5,a0,t5
    lw s5, 0(t5)
    lw t5, 0(a7)
    add t5,s5,t5
    rem a7,t5,a2
    slli t5,t2,    2
    addi t5,t5,    4
    add t5,a0,t5
    sw a7,0(t5)
    slli t5,t2,    2
    addi t5,t5,    4
    add a7,t0,t5
    slli t5,t2,    2
    addi t5,t5,    4
    add t5,a0,t5
    lw a7, 0(a7)
    lw t5, 0(t5)
    slli t5,t5,    2
    addi t5,t5,    4
    add t5,a7,t5
    slli a7,t2,    2
    addi a7,a7,    4
    add a7,a5,a7
    lw t5, 0(t5)
    sw t5,0(a7)
    slli t5,t6,    2
    addi t5,t5,    4
    add a7,a4,t5
    slli t5,t2,    2
    addi t5,t5,    4
    add t5,a4,t5
    lw t5, 0(t5)
    lw a7, 0(a7)
    add t5,t5,a7
    rem t5,t5,a2
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,a4,t2
    sw t5,0(t2)
    slli t2,t6,    2
    addi t2,t2,    4
    add t2,a4,t2
    slli t5,t1,    2
    addi t5,t5,    4
    add t5,a0,t5
    lw t5, 0(t5)
    lw t2, 0(t2)
    add t2,t5,t2
    rem t5,t2,a2
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,a0,t2
    sw t5,0(t2)
    slli t2,t1,    2
    addi t2,t2,    4
    add t5,t0,t2
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,a0,t2
    lw t5, 0(t5)
    lw t2, 0(t2)
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,t5,t2
    slli t5,t1,    2
    addi t5,t5,    4
    add t5,a5,t5
    lw t2, 0(t2)
    sw t2,0(t5)
    slli t2,t6,    2
    addi t2,t2,    4
    add t5,a4,t2
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,a4,t2
    lw a7, 0(t2)
    lw t2, 0(t5)
    add t2,a7,t2
    rem t2,t2,a2
    slli t1,t1,    2
    addi t1,t1,    4
    add t1,a4,t1
    sw t2,0(t1)
    slli t6,t6,    2
    addi t6,t6,    4
    add t1,a4,t6
    li t6, 0
    sw t6,0(t1)
    j	if_end4
if_thenBB3:
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,a5,t6
    lw t6, 0(t6)
    rem t6,t6,a3
    mul t6,t6,t6
    rem a1,t6,a3
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,a5,t6
    sw a1,0(t6)
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,a5,t6
    lw t6, 0(t6)
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,t4,t6
    lw t6, 0(t6)
    bgt	t6,zero,	if_thenBB8
paracopy14:
    mv	a1,t0 
    mv	t1,a5 
    mv	t6,a2 
    mv	a2,ra 
    mv	ra,a0 
    mv	t0,a6 
    j	update.exitBB1
if_thenBB8:
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,ra,t6
    li a1, 1
    sw a1,0(t6)
    slli t6,s4,    2
    addi t6,t6,    4
    add a1,a5,t6
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,t0,t6
    lw t6, 0(t6)
    lw a1, 0(a1)
    sw a1,4(t6)
    li a1, 1
forcondBB2:
    blt	a1,a2,	forbodyBB2
paracopy15:
    mv	a1,t0 
    mv	t1,a5 
    mv	t6,a2 
    mv	a2,ra 
    mv	ra,a0 
    mv	t0,a6 
    j	update.exitBB1
forbodyBB2:
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,t0,t6
    addi t2,a1,    -1
    lw t1, 0(t6)
    slli t6,t2,    2
    addi t6,t6,    4
    add t6,t1,t6
    lw t6, 0(t6)
    rem t6,t6,a3
    mul t6,t6,t6
    rem t2,t6,a3
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,t0,t6
    lw t6, 0(t6)
    slli t1,a1,    2
    addi t1,t1,    4
    add t6,t6,t1
    sw t2,0(t6)
    addi a1,a1,    1
    j	forcondBB2
ifTrue1:
    bge	t3,s2,	ifTrue2
    j	if_end2
ifTrue2:
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,ra,t6
    lw t6, 0(t6)
    bgt	t6,zero,	if_thenBB9
    j	if_end2
if_thenBB9:
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,a0,t6
    lw t6, 0(t6)
    addi t6,t6,    1
    rem a1,t6,a2
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,a0,t6
    sw a1,0(t6)
    slli t6,s4,    2
    addi t6,t6,    4
    add a1,t0,t6
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,a0,t6
    lw a1, 0(a1)
    lw t6, 0(t6)
    slli t6,t6,    2
    addi t6,t6,    4
    add a1,a1,t6
    slli t6,s4,    2
    addi t6,t6,    4
    add t1,a5,t6
    lw t6, 0(a1)
    sw t6,0(t1)
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,a4,t6
    lw t6, 0(t6)
    addi t6,t6,    1
    rem a1,t6,a2
    slli t6,s4,    2
    addi t6,t6,    4
    add t6,a4,t6
    sw a1,0(t6)
    mv	a1,t0 
    mv	t1,a5 
    mv	t6,a2 
    mv	a2,ra 
    mv	ra,a0 
    mv	t0,a6 
    j	update.exitBB1
								 # func end
    .globl	query				#begin
    .p2align	2
    .type	query,@function
query:
query.entryBB1:
    addi sp,sp,    -32
    sw ra, 24(sp) 
    sw s11, 16(sp) 
    sw s10, 12(sp) 
    sw s9, 8(sp) 
    sw s8, 20(sp) 
    sw s7, 4(sp) 
    sw s6, 0(sp) 
    mv	s8,s5 
    mv	s9,a2 
    mv	ra,a1 
    mv	t0,a0 
    la t4,now    
    lw t6, 0(t4)
    la t4,MOD    
    lw a6, 0(t4)
    la t4,t    
    lw a5, 0(t4)
    la t4,pr    
    lw a4, 0(t4)
    la t4,s    
    lw a2, 0(t4)
    la t4,sum    
    lw a3, 0(t4)
    la t4,L    
    lw t3, 0(t4)
    la t4,pl    
    lw a0, 0(t4)
    ble	a0,ra,	ifTrue3
if_end7:
    slli a1,t0,    1
    slli t4,t0,    1
    addi t4,t4,    1
    mv	s7,t4 
    add t4,ra,s9
    srai t4,t4,    1
    mv	s5,t4 
    slli t4,t0,    2
    addi t4,t4,    4
    add t4,a5,t4
    lw t4, 0(t4)
    bgt	t4,zero,	if_thenBB10
if_end8:
    ble	a0,s5,	if_thenBB11
paracopy16:
    mv	ra,t3 
    mv	t3,a0 
    mv	s6,zero 
if_end9:
    addi t4,s5,    1
    bge	a4,t4,	if_thenBB12
paracopy17:
    mv	a1,t3 
    mv	t0,a2 
    mv	a2,a5 
    mv	t4,s6 
if_end10:
    mv	t3,ra 
    mv	a0,a1 
query.exitBB1:
    lui a5,%hi(pl)
    sw a0, %lo(pl)(a5)
    lui a5,%hi(L)
    sw t3, %lo(L)(a5)
    lui a5,%hi(sum)
    sw a3, %lo(sum)(a5)
    lui a3,%hi(s)
    sw t0, %lo(s)(a3)
    lui a3,%hi(pr)
    sw a4, %lo(pr)(a3)
    lui a3,%hi(t)
    sw a2, %lo(t)(a3)
    lui a3,%hi(MOD)
    sw a6, %lo(MOD)(a3)
    lui a3,%hi(now)
    sw t6, %lo(now)(a3)
    mv	s5,s8 
    lw s6, 0(sp) 
    lw s7, 4(sp) 
    lw s8, 20(sp) 
    lw s9, 8(sp) 
    lw s10, 12(sp) 
    lw s11, 16(sp) 
    lw ra, 24(sp) 
    mv	a0,t4 
    addi sp,sp,    32
    ret
if_thenBB12:
    addi t0,s5,    1
    mv	t4,s7 
    mv	s5,s9 
    ble	t3,t0,	_copy_ifTrue5
_copy_if_end14:
    slli a0,t4,    1
    slli a1,t4,    1
    addi a1,a1,    1
    mv	s7,a1 
    add a1,t0,s5
    srai a1,a1,    1
    mv	s9,a1 
    slli a1,t4,    2
    addi a1,a1,    4
    add a1,a5,a1
    lw a1, 0(a1)
    bgt	a1,zero,	_copy_if_thenBB21
_copy_if_end15:
    ble	t3,s9,	_copy_if_thenBB22
paracopy18:
    mv	t0,a2 
    mv	a2,a5 
    mv	s10,zero 
_copy_if_end16:
    addi t4,s9,    1
    bge	a4,t4,	_copy_if_thenBB23
paracopy19:
    mv	a1,t3 
    mv	t4,s10 
_copy_if_end17:
afterCallBB4:
    add t4,s6,t4
    rem t4,t4,a6
    j	if_end10
_copy_if_thenBB23:
    addi t4,s9,    1
    lui a5,%hi(pl)
    sw t3, %lo(pl)(a5)
    lui a5,%hi(L)
    sw ra, %lo(L)(a5)
    lui a5,%hi(sum)
    sw a3, %lo(sum)(a5)
    lui a3,%hi(s)
    sw t0, %lo(s)(a3)
    lui a3,%hi(pr)
    sw a4, %lo(pr)(a3)
    lui a3,%hi(t)
    sw a2, %lo(t)(a3)
    lui a3,%hi(MOD)
    sw a6, %lo(MOD)(a3)
    lui a3,%hi(now)
    sw t6, %lo(now)(a3)
    mv	a0,s7 
    mv	a1,t4 
    mv	a2,s5 
    call	query
    la t4,now    
    lw t6, 0(t4)
    la t4,MOD    
    lw a6, 0(t4)
    la t4,t    
    lw a2, 0(t4)
    la t4,pr    
    lw a4, 0(t4)
    la t4,s    
    lw t0, 0(t4)
    la t4,sum    
    lw a3, 0(t4)
    la t4,L    
    lw ra, 0(t4)
    la t4,pl    
    lw a1, 0(t4)
    add t4,s10,a0
    rem t4,t4,a6
    j	_copy_if_end17
_copy_if_thenBB22:
    lui t4,%hi(pl)
    sw t3, %lo(pl)(t4)
    lui t4,%hi(L)
    sw ra, %lo(L)(t4)
    lui t4,%hi(sum)
    sw a3, %lo(sum)(t4)
    lui t4,%hi(s)
    sw a2, %lo(s)(t4)
    lui t4,%hi(pr)
    sw a4, %lo(pr)(t4)
    lui t4,%hi(t)
    sw a5, %lo(t)(t4)
    lui t4,%hi(MOD)
    sw a6, %lo(MOD)(t4)
    lui t4,%hi(now)
    sw t6, %lo(now)(t4)
    mv	a1,t0 
    mv	a2,s9 
    call	query
    mv	t4,a0 
    la a3,now    
    lw t6, 0(a3)
    la a3,MOD    
    lw a6, 0(a3)
    la a3,t    
    lw a2, 0(a3)
    la a3,pr    
    lw a4, 0(a3)
    la a3,s    
    lw t0, 0(a3)
    la a3,sum    
    lw a3, 0(a3)
    la a5,L    
    lw ra, 0(a5)
    la a5,pl    
    lw t3, 0(a5)
    add t4,t4,zero
    rem t4,t4,a6
    mv	s10,t4 
    j	_copy_if_end16
_copy_if_thenBB21:
    slli a1,t4,    2
    addi a1,a1,    4
    add a1,a5,a1
    lw a1, 0(a1)
    bgt	a1,zero,	_copy__if_thenBB3
    j	_copy_if_end15
_copy__if_thenBB3:
    slli a1,t4,    1
    slli t1,t4,    1
    addi t1,t1,    1
    slli t2,t4,    2
    addi t2,t2,    4
    add a7,a5,t2
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,t6,t2
    lw t5, 0(t2)
    lw t2, 0(a7)
    add t2,t5,t2
    rem t5,t2,ra
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,t6,t2
    sw t5,0(t2)
    slli t2,a1,    2
    addi t2,t2,    4
    add t5,a2,t2
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,t6,t2
    lw t5, 0(t5)
    lw t2, 0(t2)
    slli t2,t2,    2
    addi t2,t2,    4
    add t5,t5,t2
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,a3,t2
    lw t5, 0(t5)
    sw t5,0(t2)
    slli t2,t4,    2
    addi t2,t2,    4
    add t5,a5,t2
    slli t2,a1,    2
    addi t2,t2,    4
    add t2,a5,t2
    lw a7, 0(t2)
    lw t2, 0(t5)
    add t2,a7,t2
    rem t2,t2,ra
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,a5,a1
    sw t2,0(a1)
    slli a1,t4,    2
    addi a1,a1,    4
    add t2,a5,a1
    slli a1,t1,    2
    addi a1,a1,    4
    add a1,t6,a1
    lw t5, 0(a1)
    lw a1, 0(t2)
    add a1,t5,a1
    rem t2,a1,ra
    slli a1,t1,    2
    addi a1,a1,    4
    add a1,t6,a1
    sw t2,0(a1)
    slli a1,t1,    2
    addi a1,a1,    4
    add a1,a2,a1
    slli t2,t1,    2
    addi t2,t2,    4
    add t5,t6,t2
    lw t2, 0(a1)
    lw a1, 0(t5)
    slli a1,a1,    2
    addi a1,a1,    4
    add a1,t2,a1
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,a3,t2
    lw a1, 0(a1)
    sw a1,0(t2)
    slli a1,t4,    2
    addi a1,a1,    4
    add t5,a5,a1
    slli a1,t1,    2
    addi a1,a1,    4
    add a1,a5,a1
    lw t2, 0(a1)
    lw a1, 0(t5)
    add a1,t2,a1
    rem t2,a1,ra
    slli a1,t1,    2
    addi a1,a1,    4
    add a1,a5,a1
    sw t2,0(a1)
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,a5,t4
    li a1, 0
    sw a1,0(t4)
    j	_copy_if_end15
_copy_ifTrue5:
    bge	a4,s5,	_copy_if_thenBB24
    j	_copy_if_end14
_copy_if_thenBB24:
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,a3,t4
    lw t4, 0(t4)
    mv	a1,t3 
    mv	t0,a2 
    mv	a2,a5 
    j	afterCallBB4
if_thenBB11:
    ble	a0,ra,	_copy_ifTrue6
_copy_if_end18:
    slli t0,a1,    1
    slli t4,a1,    1
    addi t4,t4,    1
    mv	s6,t4 
    add t4,ra,s5
    srai t4,t4,    1
    mv	s10,t4 
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a5,t4
    lw t4, 0(t4)
    bgt	t4,zero,	_copy_if_thenBB25
_copy_if_end19:
    ble	a0,s10,	_copy_if_thenBB26
paracopy20:
    mv	ra,a0 
    mv	s11,zero 
_copy_if_end20:
    addi t4,s10,    1
    bge	a4,t4,	_copy_if_thenBB27
paracopy21:
    mv	t0,s11 
    mv	t4,a5 
_copy_if_end21:
    mv	a0,ra 
    mv	ra,t0 
afterCallBB5:
    add a5,ra,zero
    rem s6,a5,a6
    mv	ra,t3 
    mv	t3,a0 
    mv	a5,t4 
    j	if_end9
_copy_if_thenBB27:
    addi t4,s10,    1
    lui a0,%hi(pl)
    sw ra, %lo(pl)(a0)
    lui ra,%hi(L)
    sw t3, %lo(L)(ra)
    lui t3,%hi(sum)
    sw a3, %lo(sum)(t3)
    lui a3,%hi(s)
    sw a2, %lo(s)(a3)
    lui a3,%hi(pr)
    sw a4, %lo(pr)(a3)
    lui a3,%hi(t)
    sw a5, %lo(t)(a3)
    lui a3,%hi(MOD)
    sw a6, %lo(MOD)(a3)
    lui a3,%hi(now)
    sw t6, %lo(now)(a3)
    mv	a0,s6 
    mv	a1,t4 
    mv	a2,s5 
    call	query
    la t4,now    
    lw t6, 0(t4)
    la t4,MOD    
    lw a6, 0(t4)
    la t4,t    
    lw t4, 0(t4)
    la a3,pr    
    lw a4, 0(a3)
    la a3,s    
    lw a2, 0(a3)
    la a3,sum    
    lw a3, 0(a3)
    la a5,L    
    lw t3, 0(a5)
    la a5,pl    
    lw ra, 0(a5)
    add a5,s11,a0
    rem t0,a5,a6
    j	_copy_if_end21
_copy_if_thenBB26:
    lui t4,%hi(pl)
    sw a0, %lo(pl)(t4)
    lui t4,%hi(L)
    sw t3, %lo(L)(t4)
    lui t4,%hi(sum)
    sw a3, %lo(sum)(t4)
    lui t4,%hi(s)
    sw a2, %lo(s)(t4)
    lui t4,%hi(pr)
    sw a4, %lo(pr)(t4)
    lui t4,%hi(t)
    sw a5, %lo(t)(t4)
    lui t4,%hi(MOD)
    sw a6, %lo(MOD)(t4)
    lui t4,%hi(now)
    sw t6, %lo(now)(t4)
    mv	a0,t0 
    mv	a1,ra 
    mv	a2,s10 
    call	query
    la t4,now    
    lw t6, 0(t4)
    la t4,MOD    
    lw a6, 0(t4)
    la t4,t    
    lw a5, 0(t4)
    la t4,pr    
    lw a4, 0(t4)
    la t4,s    
    lw a2, 0(t4)
    la t4,sum    
    lw a3, 0(t4)
    la t4,L    
    lw t3, 0(t4)
    la t4,pl    
    lw ra, 0(t4)
    add t4,a0,zero
    rem t4,t4,a6
    mv	s11,t4 
    j	_copy_if_end20
_copy_if_thenBB25:
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a5,t4
    lw t4, 0(t4)
    bgt	t4,zero,	_copy__if_thenBB4
    j	_copy_if_end19
_copy__if_thenBB4:
    slli t4,a1,    1
    slli t1,a1,    1
    addi t1,t1,    1
    slli t2,a1,    2
    addi t2,t2,    4
    add t5,a5,t2
    slli t2,t4,    2
    addi t2,t2,    4
    add t2,t6,t2
    lw t2, 0(t2)
    lw t5, 0(t5)
    add t2,t2,t5
    rem t5,t2,t3
    slli t2,t4,    2
    addi t2,t2,    4
    add t2,t6,t2
    sw t5,0(t2)
    slli t2,t4,    2
    addi t2,t2,    4
    add t5,a2,t2
    slli t2,t4,    2
    addi t2,t2,    4
    add t2,t6,t2
    lw t5, 0(t5)
    lw t2, 0(t2)
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,t5,t2
    slli t5,t4,    2
    addi t5,t5,    4
    add t5,a3,t5
    lw t2, 0(t2)
    sw t2,0(t5)
    slli t2,a1,    2
    addi t2,t2,    4
    add t5,a5,t2
    slli t2,t4,    2
    addi t2,t2,    4
    add t2,a5,t2
    lw t2, 0(t2)
    lw t5, 0(t5)
    add t2,t2,t5
    rem t2,t2,t3
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,a5,t4
    sw t2,0(t4)
    slli t4,a1,    2
    addi t4,t4,    4
    add t2,a5,t4
    slli t4,t1,    2
    addi t4,t4,    4
    add t4,t6,t4
    lw t5, 0(t4)
    lw t4, 0(t2)
    add t4,t5,t4
    rem t2,t4,t3
    slli t4,t1,    2
    addi t4,t4,    4
    add t4,t6,t4
    sw t2,0(t4)
    slli t4,t1,    2
    addi t4,t4,    4
    add t4,a2,t4
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,t6,t2
    lw t5, 0(t4)
    lw t4, 0(t2)
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,t5,t4
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,a3,t2
    lw t4, 0(t4)
    sw t4,0(t2)
    slli t4,a1,    2
    addi t4,t4,    4
    add t2,a5,t4
    slli t4,t1,    2
    addi t4,t4,    4
    add t4,a5,t4
    lw t4, 0(t4)
    lw t2, 0(t2)
    add t4,t4,t2
    rem t4,t4,t3
    slli t1,t1,    2
    addi t1,t1,    4
    add t1,a5,t1
    sw t4,0(t1)
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a5,t4
    li a1, 0
    sw a1,0(t4)
    j	_copy_if_end19
_copy_ifTrue6:
    bge	a4,s5,	_copy_if_thenBB28
    j	_copy_if_end18
_copy_if_thenBB28:
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    lw ra, 0(t4)
    mv	t4,a5 
    j	afterCallBB5
if_thenBB10:
    slli t4,t0,    2
    addi t4,t4,    4
    add t4,a5,t4
    lw t4, 0(t4)
    bgt	t4,zero,	_if_thenBB2
    j	if_end8
_if_thenBB2:
    slli t1,t0,    1
    slli t4,t0,    1
    addi t4,t4,    1
    slli t2,t0,    2
    addi t2,t2,    4
    add t5,a5,t2
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,t6,t2
    lw t2, 0(t2)
    lw t5, 0(t5)
    add t2,t2,t5
    rem t5,t2,t3
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,t6,t2
    sw t5,0(t2)
    slli t2,t1,    2
    addi t2,t2,    4
    add t5,a2,t2
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,t6,t2
    lw t5, 0(t5)
    lw t2, 0(t2)
    slli t2,t2,    2
    addi t2,t2,    4
    add t5,t5,t2
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,a3,t2
    lw t5, 0(t5)
    sw t5,0(t2)
    slli t2,t0,    2
    addi t2,t2,    4
    add a7,a5,t2
    slli t2,t1,    2
    addi t2,t2,    4
    add t2,a5,t2
    lw t5, 0(t2)
    lw t2, 0(a7)
    add t2,t5,t2
    rem t2,t2,t3
    slli t1,t1,    2
    addi t1,t1,    4
    add t1,a5,t1
    sw t2,0(t1)
    slli t1,t0,    2
    addi t1,t1,    4
    add t2,a5,t1
    slli t1,t4,    2
    addi t1,t1,    4
    add t1,t6,t1
    lw t1, 0(t1)
    lw t2, 0(t2)
    add t1,t1,t2
    rem t2,t1,t3
    slli t1,t4,    2
    addi t1,t1,    4
    add t1,t6,t1
    sw t2,0(t1)
    slli t1,t4,    2
    addi t1,t1,    4
    add t1,a2,t1
    slli t2,t4,    2
    addi t2,t2,    4
    add t2,t6,t2
    lw t1, 0(t1)
    lw t2, 0(t2)
    slli t2,t2,    2
    addi t2,t2,    4
    add t2,t1,t2
    slli t1,t4,    2
    addi t1,t1,    4
    add t5,a3,t1
    lw t1, 0(t2)
    sw t1,0(t5)
    slli t1,t0,    2
    addi t1,t1,    4
    add t2,a5,t1
    slli t1,t4,    2
    addi t1,t1,    4
    add t1,a5,t1
    lw t5, 0(t1)
    lw t1, 0(t2)
    add t1,t5,t1
    rem t1,t1,t3
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,a5,t4
    sw t1,0(t4)
    slli t4,t0,    2
    addi t4,t4,    4
    add t4,a5,t4
    li t0, 0
    sw t0,0(t4)
    j	if_end8
ifTrue3:
    bge	a4,s9,	if_thenBB13
    j	if_end7
if_thenBB13:
    slli t4,t0,    2
    addi t4,t4,    4
    add t4,a3,t4
    lw t4, 0(t4)
    mv	t0,a2 
    mv	a2,a5 
    j	query.exitBB1
								 # func end
    .globl	build				#begin
    .p2align	2
    .type	build,@function
build:
build.entryBB1:
    addi sp,sp,    -48
    sw ra, 12(sp) 
    sw s11, 28(sp) 
    sw s10, 24(sp) 
    sw s9, 20(sp) 
    sw s8, 16(sp) 
    sw s7, 0(sp) 
    sw s6, 32(sp) 
    sw s5, 4(sp) 
    sw s4, 8(sp) 
    mv	s8,s3 
    mv	s11,s2 
    mv	s2,a2 
    mv	s9,a0 
    la t4,now    
    lw a5, 0(t4)
    la t4,a    
    lw a3, 0(t4)
    la t4,s    
    lw ra, 0(t4)
    la t4,flag    
    lw a6, 0(t4)
    la t4,sum    
    lw a4, 0(t4)
    la t4,L    
    lw t3, 0(t4)
    la t4,b    
    lw t6, 0(t4)
    la t4,p    
    lw a2, 0(t4)
    beq	a1,s2,	if_thenBB14
if_elseBB2:
    slli t4,s9,    1
    mv	s5,t4 
    slli t4,s9,    1
    addi t4,t4,    1
    mv	s4,t4 
    add t4,a1,s2
    srai t4,t4,    1
    mv	s3,t4 
    beq	a1,s3,	_copy_if_thenBB29
_copy_if_elseBB4:
    slli t4,s5,    1
    mv	s10,t4 
    slli t4,s5,    1
    addi t4,t4,    1
    mv	s7,t4 
    add t4,a1,s3
    srai t4,t4,    1
    mv	s6,t4 
    lui t4,%hi(p)
    sw a2, %lo(p)(t4)
    lui t4,%hi(b)
    sw t6, %lo(b)(t4)
    lui t4,%hi(L)
    sw t3, %lo(L)(t4)
    lui t4,%hi(sum)
    sw a4, %lo(sum)(t4)
    lui t4,%hi(flag)
    sw a6, %lo(flag)(t4)
    lui t4,%hi(s)
    sw ra, %lo(s)(t4)
    lui t4,%hi(a)
    sw a3, %lo(a)(t4)
    lui t4,%hi(now)
    sw a5, %lo(now)(t4)
    mv	a0,s10 
    mv	a2,s6 
    call	build
    la t4,now    
    lw a5, 0(t4)
    la t4,a    
    lw a3, 0(t4)
    la t4,s    
    lw a4, 0(t4)
    la t4,flag    
    lw a6, 0(t4)
    la t4,sum    
    lw a2, 0(t4)
    la t4,L    
    lw t6, 0(t4)
    la t4,b    
    lw ra, 0(t4)
    la t4,p    
    lw t4, 0(t4)
    addi a1,s6,    1
    lui t3,%hi(p)
    sw t4, %lo(p)(t3)
    lui t4,%hi(b)
    sw ra, %lo(b)(t4)
    lui t4,%hi(L)
    sw t6, %lo(L)(t4)
    lui t4,%hi(sum)
    sw a2, %lo(sum)(t4)
    lui t4,%hi(flag)
    sw a6, %lo(flag)(t4)
    lui t4,%hi(s)
    sw a4, %lo(s)(t4)
    lui t4,%hi(a)
    sw a3, %lo(a)(t4)
    lui t4,%hi(now)
    sw a5, %lo(now)(t4)
    mv	a0,s7 
    mv	a2,s3 
    call	build
    la t4,now    
    lw t4, 0(t4)
    la a3,a    
    lw a0, 0(a3)
    la a3,s    
    lw ra, 0(a3)
    la a3,flag    
    lw a3, 0(a3)
    la t6,sum    
    lw a4, 0(t6)
    la t6,L    
    lw t3, 0(t6)
    la t6,b    
    lw t6, 0(t6)
    la a6,p    
    lw a2, 0(a6)
    slli a6,s7,    2
    addi a6,a6,    4
    add a6,a4,a6
    slli a5,s10,    2
    addi a5,a5,    4
    add a5,a4,a5
    lw a5, 0(a5)
    lw a6, 0(a6)
    add a5,a5,a6
    slli a6,s5,    2
    addi a6,a6,    4
    add a6,a4,a6
    sw a5,0(a6)
    slli a6,s7,    2
    addi a6,a6,    4
    add a5,a3,a6
    slli a6,s10,    2
    addi a6,a6,    4
    add a6,a3,a6
    lw t0, 0(a6)
    lw a6, 0(a5)
    and a6,t0,a6
    slli a5,s5,    2
    addi a5,a5,    4
    add a5,a3,a5
    sw a6,0(a5)
    slli a6,s5,    2
    addi a6,a6,    4
    add a6,a3,a6
    lw a6, 0(a6)
    bgt	a6,zero,	_copy_if_thenBB30
paracopy22:
    mv	a5,t4 
    mv	a6,a3 
    mv	a3,a0 
afterCallBB6:
    addi a1,s3,    1
    mv	s6,s4 
    mv	s3,s2 
    beq	a1,s3,	_copy_if_thenBB31
_copy_if_elseBB5:
    slli t4,s6,    1
    mv	s7,t4 
    slli t4,s6,    1
    addi t4,t4,    1
    mv	s2,t4 
    add t4,a1,s3
    srai t4,t4,    1
    mv	s10,t4 
    lui t4,%hi(p)
    sw a2, %lo(p)(t4)
    lui t4,%hi(b)
    sw t6, %lo(b)(t4)
    lui t4,%hi(L)
    sw t3, %lo(L)(t4)
    lui t4,%hi(sum)
    sw a4, %lo(sum)(t4)
    lui t4,%hi(flag)
    sw a6, %lo(flag)(t4)
    lui t4,%hi(s)
    sw ra, %lo(s)(t4)
    lui t4,%hi(a)
    sw a3, %lo(a)(t4)
    lui t4,%hi(now)
    sw a5, %lo(now)(t4)
    mv	a0,s7 
    mv	a2,s10 
    call	build
    la t4,now    
    lw a3, 0(t4)
    la t4,a    
    lw a2, 0(t4)
    la t4,s    
    lw a5, 0(t4)
    la t4,flag    
    lw a4, 0(t4)
    la t4,sum    
    lw t3, 0(t4)
    la t4,L    
    lw t4, 0(t4)
    la t6,b    
    lw a6, 0(t6)
    la t6,p    
    lw t6, 0(t6)
    addi a1,s10,    1
    lui ra,%hi(p)
    sw t6, %lo(p)(ra)
    lui t6,%hi(b)
    sw a6, %lo(b)(t6)
    lui t6,%hi(L)
    sw t4, %lo(L)(t6)
    lui t4,%hi(sum)
    sw t3, %lo(sum)(t4)
    lui t4,%hi(flag)
    sw a4, %lo(flag)(t4)
    lui t4,%hi(s)
    sw a5, %lo(s)(t4)
    lui t4,%hi(a)
    sw a2, %lo(a)(t4)
    lui t4,%hi(now)
    sw a3, %lo(now)(t4)
    mv	a0,s2 
    mv	a2,s3 
    call	build
    la t4,now    
    lw a5, 0(t4)
    la t4,a    
    lw a3, 0(t4)
    la t4,s    
    lw ra, 0(t4)
    la t4,flag    
    lw a6, 0(t4)
    la t4,sum    
    lw t4, 0(t4)
    la t6,L    
    lw t3, 0(t6)
    la t6,b    
    lw t6, 0(t6)
    la a2,p    
    lw a2, 0(a2)
    slli a4,s2,    2
    addi a4,a4,    4
    add a0,t4,a4
    slli a4,s7,    2
    addi a4,a4,    4
    add a4,t4,a4
    lw t0, 0(a4)
    lw a4, 0(a0)
    add a0,t0,a4
    slli a4,s6,    2
    addi a4,a4,    4
    add a4,t4,a4
    sw a0,0(a4)
    slli a4,s2,    2
    addi a4,a4,    4
    add a0,a6,a4
    slli a4,s7,    2
    addi a4,a4,    4
    add a4,a6,a4
    lw a4, 0(a4)
    lw a0, 0(a0)
    and a0,a4,a0
    slli a4,s6,    2
    addi a4,a4,    4
    add a4,a6,a4
    sw a0,0(a4)
    slli a4,s6,    2
    addi a4,a4,    4
    add a4,a6,a4
    lw a4, 0(a4)
    bgt	a4,zero,	_copy_if_thenBB32
paracopy23:
afterCallBB7:
    slli a4,s4,    2
    addi a4,a4,    4
    add a0,t4,a4
    slli a4,s5,    2
    addi a4,a4,    4
    add a4,t4,a4
    lw t0, 0(a4)
    lw a4, 0(a0)
    add a0,t0,a4
    slli a4,s9,    2
    addi a4,a4,    4
    add a4,t4,a4
    sw a0,0(a4)
    slli a4,s4,    2
    addi a4,a4,    4
    add a0,a6,a4
    slli a4,s5,    2
    addi a4,a4,    4
    add a4,a6,a4
    lw t0, 0(a4)
    lw a4, 0(a0)
    and a0,t0,a4
    slli a4,s9,    2
    addi a4,a4,    4
    add a4,a6,a4
    sw a0,0(a4)
    slli a4,s9,    2
    addi a4,a4,    4
    add a4,a6,a4
    lw a4, 0(a4)
    bgt	a4,zero,	if_thenBB15
paracopy24:
if_end11:
    lui a4,%hi(p)
    sw a2, %lo(p)(a4)
    lui a2,%hi(b)
    sw t6, %lo(b)(a2)
    lui t6,%hi(L)
    sw t3, %lo(L)(t6)
    lui t6,%hi(sum)
    sw t4, %lo(sum)(t6)
    lui t4,%hi(flag)
    sw a6, %lo(flag)(t4)
    lui t4,%hi(s)
    sw ra, %lo(s)(t4)
    lui t4,%hi(a)
    sw a3, %lo(a)(t4)
    lui t4,%hi(now)
    sw a5, %lo(now)(t4)
    mv	s2,s11 
    mv	s3,s8 
    lw s4, 8(sp) 
    lw s5, 4(sp) 
    lw s6, 32(sp) 
    lw s7, 0(sp) 
    lw s8, 16(sp) 
    lw s9, 20(sp) 
    lw s10, 24(sp) 
    lw s11, 28(sp) 
    lw ra, 12(sp) 
    addi sp,sp,    48
    ret
if_thenBB15:
    mv	a4,zero 
forcondBB3:
    blt	a4,t3,	forbodyBB3
afterForBB2:
    li a4, 0
    sw a4,4(a5)
    j	if_end11
forbodyBB3:
    slli a0,s4,    2
    addi a0,a0,    4
    add a0,ra,a0
    lw a0, 0(a0)
    slli t0,a4,    2
    addi t0,t0,    4
    add a0,a0,t0
    slli t0,s5,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw a1, 0(t0)
    slli t0,a4,    2
    addi t0,t0,    4
    add t0,a1,t0
    lw t0, 0(t0)
    lw a0, 0(a0)
    add a1,t0,a0
    slli a0,s9,    2
    addi a0,a0,    4
    add a0,ra,a0
    lw t0, 0(a0)
    slli a0,a4,    2
    addi a0,a0,    4
    add a0,t0,a0
    sw a1,0(a0)
    addi a4,a4,    1
    j	forcondBB3
_copy_if_thenBB32:
    mv	a4,zero 
_copy_forcondBB5:
    blt	a4,t3,	_copy_forbodyBB5
_copy_afterForBB3:
    li a4, 0
    sw a4,4(a5)
    j	afterCallBB7
_copy_forbodyBB5:
    slli a0,s2,    2
    addi a0,a0,    4
    add a0,ra,a0
    lw t0, 0(a0)
    slli a0,a4,    2
    addi a0,a0,    4
    add t0,t0,a0
    slli a0,s7,    2
    addi a0,a0,    4
    add a0,ra,a0
    lw a1, 0(a0)
    slli a0,a4,    2
    addi a0,a0,    4
    add a0,a1,a0
    lw a0, 0(a0)
    lw t0, 0(t0)
    add t0,a0,t0
    slli a0,s6,    2
    addi a0,a0,    4
    add a0,ra,a0
    lw a1, 0(a0)
    slli a0,a4,    2
    addi a0,a0,    4
    add a0,a1,a0
    sw t0,0(a0)
    addi a4,a4,    1
    j	_copy_forcondBB5
_copy_if_thenBB31:
    slli t4,a1,    2
    addi t4,t4,    4
    add a0,a3,t4
    slli t4,s6,    2
    addi t4,t4,    4
    add t4,a4,t4
    lw a0, 0(a0)
    sw a0,0(t4)
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    lw t4, 0(t4)
    blt	t4,a2,	_copy_ifTrue7
_copy_if_end22:
    slli t4,s6,    2
    addi t4,t4,    4
    add t4,a5,t4
    li a0, 0
    sw a0,0(t4)
    mv	t4,a4 
    j	afterCallBB7
_copy_ifTrue7:
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    lw t4, 0(t4)
    bge	t4,zero,	_copy_ifTrue8
    j	_copy_if_end22
_copy_ifTrue8:
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    lw t4, 0(t4)
    rem t4,t4,a2
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,t6,t4
    lw t4, 0(t4)
    bgt	t4,zero,	_copy_if_thenBB33
    j	_copy_if_end22
_copy_if_thenBB33:
    slli t4,s6,    2
    addi t4,t4,    4
    add t4,a6,t4
    li a0, 1
    sw a0,0(t4)
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    slli a0,s6,    2
    addi a0,a0,    4
    add a0,ra,a0
    lw a0, 0(a0)
    lw t4, 0(t4)
    sw t4,4(a0)
    li a0, 1
_copy_forcondBB6:
    blt	a0,t3,	_copy_forbodyBB6
    j	_copy_if_end22
_copy_forbodyBB6:
    slli t4,s6,    2
    addi t4,t4,    4
    add t4,ra,t4
    addi t0,a0,    -1
    lw t4, 0(t4)
    slli t0,t0,    2
    addi t0,t0,    4
    add t4,t4,t0
    lw t4, 0(t4)
    rem t4,t4,a2
    mul t4,t4,t4
    rem t0,t4,a2
    slli t4,s6,    2
    addi t4,t4,    4
    add t4,ra,t4
    lw t4, 0(t4)
    slli a1,a0,    2
    addi a1,a1,    4
    add t4,t4,a1
    sw t0,0(t4)
    addi a0,a0,    1
    j	_copy_forcondBB6
_copy_if_thenBB30:
    mv	a6,zero 
_copy_forcondBB7:
    blt	a6,t3,	_copy_forbodyBB7
_copy_afterForBB4:
    li a6, 0
    sw a6,4(t4)
    mv	a5,t4 
    mv	a6,a3 
    mv	a3,a0 
    j	afterCallBB6
_copy_forbodyBB7:
    slli a5,s7,    2
    addi a5,a5,    4
    add a5,ra,a5
    lw t0, 0(a5)
    slli a5,a6,    2
    addi a5,a5,    4
    add a5,t0,a5
    slli t0,s10,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t0, 0(t0)
    slli a1,a6,    2
    addi a1,a1,    4
    add t0,t0,a1
    lw t0, 0(t0)
    lw a5, 0(a5)
    add a1,t0,a5
    slli a5,s5,    2
    addi a5,a5,    4
    add a5,ra,a5
    lw t0, 0(a5)
    slli a5,a6,    2
    addi a5,a5,    4
    add a5,t0,a5
    sw a1,0(a5)
    addi a6,a6,    1
    j	_copy_forcondBB7
_copy_if_thenBB29:
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    slli a0,s5,    2
    addi a0,a0,    4
    add a0,a4,a0
    lw t4, 0(t4)
    sw t4,0(a0)
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    lw t4, 0(t4)
    blt	t4,a2,	_copy_ifTrue9
_copy_if_end23:
    slli t4,s5,    2
    addi t4,t4,    4
    add t4,a5,t4
    li a0, 0
    sw a0,0(t4)
    j	afterCallBB6
_copy_ifTrue9:
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    lw t4, 0(t4)
    bge	t4,zero,	_copy_ifTrue10
    j	_copy_if_end23
_copy_ifTrue10:
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    lw t4, 0(t4)
    rem t4,t4,a2
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,t6,t4
    lw t4, 0(t4)
    bgt	t4,zero,	_copy_if_thenBB34
    j	_copy_if_end23
_copy_if_thenBB34:
    slli t4,s5,    2
    addi t4,t4,    4
    add t4,a6,t4
    li a0, 1
    sw a0,0(t4)
    slli t4,a1,    2
    addi t4,t4,    4
    add a0,a3,t4
    slli t4,s5,    2
    addi t4,t4,    4
    add t4,ra,t4
    lw t4, 0(t4)
    lw a0, 0(a0)
    sw a0,4(t4)
    li t4, 1
_copy_forcondBB8:
    blt	t4,t3,	_copy_forbodyBB8
    j	_copy_if_end23
_copy_forbodyBB8:
    slli a0,s5,    2
    addi a0,a0,    4
    add a0,ra,a0
    addi t0,t4,    -1
    lw a0, 0(a0)
    slli t0,t0,    2
    addi t0,t0,    4
    add a0,a0,t0
    lw a0, 0(a0)
    rem a0,a0,a2
    mul a0,a0,a0
    rem a1,a0,a2
    slli a0,s5,    2
    addi a0,a0,    4
    add a0,ra,a0
    lw t0, 0(a0)
    slli a0,t4,    2
    addi a0,a0,    4
    add a0,t0,a0
    sw a1,0(a0)
    addi t4,t4,    1
    j	_copy_forcondBB8
if_thenBB14:
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    slli a0,s9,    2
    addi a0,a0,    4
    add a0,a4,a0
    lw t4, 0(t4)
    sw t4,0(a0)
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    lw t4, 0(t4)
    blt	t4,a2,	ifTrue4
if_end12:
    slli t4,s9,    2
    addi t4,t4,    4
    add t4,a5,t4
    li a0, 0
    sw a0,0(t4)
    mv	t4,a4 
    j	if_end11
ifTrue4:
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    lw t4, 0(t4)
    bge	t4,zero,	ifTrue5
    j	if_end12
ifTrue5:
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,a3,t4
    lw t4, 0(t4)
    rem t4,t4,a2
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,t6,t4
    lw t4, 0(t4)
    bgt	t4,zero,	if_thenBB16
    j	if_end12
if_thenBB16:
    slli t4,s9,    2
    addi t4,t4,    4
    add t4,a6,t4
    li a0, 1
    sw a0,0(t4)
    slli t4,a1,    2
    addi t4,t4,    4
    add a0,a3,t4
    slli t4,s9,    2
    addi t4,t4,    4
    add t4,ra,t4
    lw t0, 0(t4)
    lw t4, 0(a0)
    sw t4,4(t0)
    li a0, 1
forcondBB4:
    blt	a0,t3,	forbodyBB4
    j	if_end12
forbodyBB4:
    slli t4,s9,    2
    addi t4,t4,    4
    add t4,ra,t4
    addi a1,a0,    -1
    lw t0, 0(t4)
    slli t4,a1,    2
    addi t4,t4,    4
    add t4,t0,t4
    lw t4, 0(t4)
    rem t4,t4,a2
    mul t4,t4,t4
    rem t0,t4,a2
    slli t4,s9,    2
    addi t4,t4,    4
    add t4,ra,t4
    lw a1, 0(t4)
    slli t4,a0,    2
    addi t4,t4,    4
    add t4,a1,t4
    sw t0,0(t4)
    addi a0,a0,    1
    j	forcondBB4
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -96
    sw ra, 48(sp) 
    sw s11, 20(sp) 
    sw s10, 24(sp) 
    sw s9, 16(sp) 
    sw s8, 28(sp) 
    sw s7, 68(sp) 
    sw s6, 56(sp) 
    sw s5, 52(sp) 
    sw s4, 36(sp) 
    sw s3, 76(sp) 
    sw s2, 60(sp) 
    sw s1, 44(sp) 
    sw s0, 72(sp) 
    li a0, 2000024
    call malloc
    li t4, 500005
    sw t4,0(a0)
    mv	s7,a0 
    li a0, 2000024
    call malloc
    li t4, 500005
    sw t4,0(a0)
    mv	s0,a0 
    li a0, 2000024
    call malloc
    li t4, 500005
    sw t4,0(a0)
    sw a0, 64(sp) 
    li a0, 800024
    call malloc
    li t4, 200005
    sw t4,0(a0)
    mv	s8,a0 
    li a0, 2000024
    call malloc
    li t4, 500005
    sw t4,0(a0)
    sw a0, 0(sp) 
    li a0, 2000024
    call malloc
    mv	s5,a0 
    li t4, 500005
    sw t4,0(s5)
    addi s6,s5,    4
    li t4, 2000020
    add s3,s5,t4
forcondBB5:
    ble	s6,s3,	forupdateBB1
afterForBB3:
    mv	s9,s5 
    li a0, 2000024
    call malloc
    li t4, 500005
    sw t4,0(a0)
    sw a0, 4(sp) 
    call	getInt
    mv	s6,a0 
    call	getInt
    mv	s4,a0 
    call	getInt
    mv	s5,a0 
    li t6, 1
    li s2, 1
_forcondBB1:
    ble	t6,s6,	_forbodyBB1
_afterForBB1:
    li a0, 560024
    call malloc
    li t4, 140005
    sw t4,0(a0)
    mv	s3,a0 
    li t4, 2
__forcondBB1:
    blt	t4,s5,	__forbodyBB1
__afterForBB1:
    li t6, 2
__forcondBB2:
    blt	t6,s5,	__forbodyBB2
__afterForBB2:
    li s1, 2
    li a3, 1
__forcondBB3:
    blt	s1,s5,	__forbodyBB3
_afterCallBB1:
    li t4, 1
    sw t4,4(s7)
    li t4, 1
    sw t4,8(s7)
    li t4, 1
    beq	t4,s6,	_copy_if_thenBB35
_copy_if_elseBB6:
    addi t4,s6,    1
    srai s3,t4,    1
    lui t4,%hi(p)
    sw s5, %lo(p)(t4)
    lui t4,%hi(a)
    sw s8, %lo(a)(t4)
    lui t4,%hi(now)
    sw s0, %lo(now)(t4)
    lui t4,%hi(b)
    sw s7, %lo(b)(t4)
    lui t4,%hi(L)
    sw a3, %lo(L)(t4)
    lui a3,%hi(flag)
    lw t4, 0(sp) 
    sw t4, %lo(flag)(a3)
    lui t4,%hi(sum)
    lw a3, 4(sp) 
    sw a3, %lo(sum)(t4)
    lui t4,%hi(s)
    sw s9, %lo(s)(t4)
    li a0, 2
    li a1, 1
    mv	a2,s3 
    call	build
    la t4,s    
    lw t3, 0(t4)
    la t4,sum    
    lw a3, 0(t4)
    la t4,flag    
    lw a6, 0(t4)
    la t4,L    
    lw a4, 0(t4)
    la t4,b    
    lw ra, 0(t4)
    la t4,now    
    lw a5, 0(t4)
    la t4,a    
    lw t6, 0(t4)
    la t4,p    
    lw t4, 0(t4)
    addi a1,s3,    1
    lui a2,%hi(p)
    sw t4, %lo(p)(a2)
    lui t4,%hi(a)
    sw t6, %lo(a)(t4)
    lui t4,%hi(now)
    sw a5, %lo(now)(t4)
    lui t4,%hi(b)
    sw ra, %lo(b)(t4)
    lui t4,%hi(L)
    sw a4, %lo(L)(t4)
    lui t4,%hi(flag)
    sw a6, %lo(flag)(t4)
    lui t4,%hi(sum)
    sw a3, %lo(sum)(t4)
    lui t4,%hi(s)
    sw t3, %lo(s)(t4)
    li a0, 3
    mv	a2,s6 
    call	build
    la t4,s    
    lw t6, 0(t4)
    la t4,sum    
    lw a2, 0(t4)
    la t4,flag    
    lw t4, 0(t4)
    la a3,L    
    lw a4, 0(a3)
    la a3,b    
    lw a6, 0(a3)
    la a3,now    
    lw a3, 0(a3)
    la a5,a    
    lw a5, 0(a5)
    la t3,p    
    lw t3, 0(t3)
    lw a0, 12(a2)
    lw ra, 16(a2)
    add ra,a0,ra
    sw ra,8(a2)
    lw ra, 12(t4)
    lw a0, 16(t4)
    and ra,ra,a0
    sw ra,8(t4)
    lw ra, 8(t4)
    bgt	ra,zero,	_copy_if_thenBB36
paracopy25:
    sw a5, 40(sp) 
    mv	a5,s4 
    sw a5, 12(sp) 
    mv	s4,t3 
    mv	s3,a3 
    sw a2, 8(sp) 
    mv	s10,t4 
    mv	s0,a6 
    mv	s1,t6 
    mv	s9,a4 
    mv	a3,s2 
    lw t4, 64(sp) 
    mv	s5,t4 
    mv	s11,zero 
    li t4, 32761
    mv	s8,t4 
    mv	ra,zero 
    sw ra, 32(sp) 
    mv	s7,zero 
_whileCondBB1:
    lw t4, 12(sp) 
    bgt	t4,zero,	_whileBodyBB1
afterCallBB8:
    mv	a0,s11 
    call	printInt
    lui t4,%hi(p)
    sw s4, %lo(p)(t4)
    lui t4,%hi(pl)
    sw s7, %lo(pl)(t4)
    lui a3,%hi(a)
    lw t4, 40(sp) 
    sw t4, %lo(a)(a3)
    lui t4,%hi(MOD)
    sw s8, %lo(MOD)(t4)
    lui t4,%hi(now)
    sw s3, %lo(now)(t4)
    lui t4,%hi(b)
    sw s0, %lo(b)(t4)
    lui t4,%hi(L)
    sw s9, %lo(L)(t4)
    lui t4,%hi(flag)
    sw s10, %lo(flag)(t4)
    lui t4,%hi(sum)
    lw a3, 8(sp) 
    sw a3, %lo(sum)(t4)
    lui t4,%hi(s)
    sw s1, %lo(s)(t4)
    lui t4,%hi(pr)
    lw a3, 32(sp) 
    sw a3, %lo(pr)(t4)
    lui t4,%hi(t)
    sw s5, %lo(t)(t4)
    lw s0, 72(sp) 
    lw s1, 44(sp) 
    lw s2, 60(sp) 
    lw s3, 76(sp) 
    lw s4, 36(sp) 
    lw s5, 52(sp) 
    lw s6, 56(sp) 
    lw s7, 68(sp) 
    lw s8, 28(sp) 
    lw s9, 16(sp) 
    lw s10, 24(sp) 
    lw s11, 20(sp) 
    lw ra, 48(sp) 
    mv	a0,zero 
    addi sp,sp,    96
    ret
_whileBodyBB1:
    li t4, 1
__forcondBB4:
    li t6, 3
    blt	t4,t6,	__forbodyBB4
__afterForBB3:
    blt	a3,zero,	__if_thenBB1
paracopy26:
_afterCallBB2:
    andi t4,a3,    1
    mv	s7,t4 
    mv	t4,s6 
    li t6, 1
    sub t4,t4,t6
    addi t6,t4,    1
    li t4, 1
_forcondBB2:
    li a6, 3
    blt	t4,a6,	_forbodyBB2
_afterForBB2:
    blt	a3,zero,	_if_thenBB3
paracopy27:
afterCallBB9:
    rem t4,a3,t6
    addi t4,t4,    1
    addi a4,t4,    1
    mv	t4,s6 
    li t6, 1
    sub t4,t4,t6
    addi t6,t4,    1
    li t4, 1
_forcondBB3:
    li a6, 3
    blt	t4,a6,	_forbodyBB3
_afterForBB3:
    blt	a3,zero,	_if_thenBB4
paracopy28:
afterCallBB10:
    rem t4,a3,t6
    addi t4,t4,    1
    addi ra,t4,    1
    mv	s2,a3 
_whileCondBB2:
    ble	ra,a4,	_whileBodyBB2
_afterWhileBB1:
    beq	s7,zero,	_if_thenBB5
paracopy29:
    mv	a0,s3 
    lw a2, 8(sp) 
    mv	a3,s1 
    mv	t4,s9 
    mv	t3,s5 
_if_end1:
    li t6, 1
    beq	s7,t6,	_if_thenBB6
paracopy30:
    mv	a6,s11 
    mv	t6,s8 
_if_end2:
    lw a5, 12(sp) 
    addi a5,a5,    -1
    mv	s11,a6 
    mv	s8,t6 
    sw ra, 32(sp) 
    sw a5, 12(sp) 
    mv	s7,a4 
    mv	s3,a0 
    sw a2, 8(sp) 
    mv	s1,a3 
    mv	s9,t4 
    mv	a3,s2 
    mv	s5,t3 
    j	_whileCondBB1
_if_thenBB6:
    lui t6,%hi(pl)
    sw a4, %lo(pl)(t6)
    lui t6,%hi(MOD)
    sw s8, %lo(MOD)(t6)
    lui t6,%hi(now)
    sw a0, %lo(now)(t6)
    lui t6,%hi(L)
    sw t4, %lo(L)(t6)
    lui t4,%hi(sum)
    sw a2, %lo(sum)(t4)
    lui t4,%hi(s)
    sw a3, %lo(s)(t4)
    lui t4,%hi(pr)
    sw ra, %lo(pr)(t4)
    lui t4,%hi(t)
    sw t3, %lo(t)(t4)
    li a0, 1
    li a1, 1
    mv	a2,s6 
    call	query
    mv	a6,a0 
    la t4,t    
    lw t3, 0(t4)
    la t4,pr    
    lw ra, 0(t4)
    la t4,s    
    lw a3, 0(t4)
    la t4,sum    
    lw a2, 0(t4)
    la t4,L    
    lw t4, 0(t4)
    la t6,now    
    lw a0, 0(t6)
    la t6,MOD    
    lw t6, 0(t6)
    la a5,pl    
    lw a4, 0(a5)
    add a6,s11,a6
    rem a6,a6,t6
    j	_if_end2
_if_thenBB5:
    lui t4,%hi(p)
    sw s4, %lo(p)(t4)
    lui t4,%hi(pl)
    sw a4, %lo(pl)(t4)
    lui t4,%hi(now)
    sw s3, %lo(now)(t4)
    lui t4,%hi(b)
    sw s0, %lo(b)(t4)
    lui t4,%hi(L)
    sw s9, %lo(L)(t4)
    lui t4,%hi(flag)
    sw s10, %lo(flag)(t4)
    lui a3,%hi(sum)
    lw t4, 8(sp) 
    sw t4, %lo(sum)(a3)
    lui t4,%hi(s)
    sw s1, %lo(s)(t4)
    lui t4,%hi(pr)
    sw ra, %lo(pr)(t4)
    lui t4,%hi(t)
    sw s5, %lo(t)(t4)
    li a0, 1
    li a1, 1
    mv	a2,s6 
    call	update
    la t4,t    
    lw t3, 0(t4)
    la t4,pr    
    lw ra, 0(t4)
    la t4,s    
    lw a3, 0(t4)
    la t4,sum    
    lw a2, 0(t4)
    la t4,flag    
    lw t6, 0(t4)
    la t4,L    
    lw t4, 0(t4)
    la a6,b    
    lw a6, 0(a6)
    la a5,now    
    lw a0, 0(a5)
    la a5,pl    
    lw a4, 0(a5)
    la a5,p    
    lw a5, 0(a5)
    mv	s4,a5 
    mv	s10,t6 
    mv	s0,a6 
    j	_if_end1
_whileBodyBB2:
    mv	t4,s6 
    li a3, 1
    sub t4,t4,a3
    addi t6,t4,    1
    mv	t4,s2 
    li a3, 1
_forcondBB4:
    li a6, 3
    blt	a3,a6,	_forbodyBB4
_afterForBB4:
    blt	t4,zero,	_if_thenBB7
paracopy31:
afterCallBB11:
    rem a3,t4,t6
    addi a3,a3,    1
    addi ra,a3,    1
    mv	s2,t4 
    j	_whileCondBB2
_if_thenBB7:
    sub t4,zero,t4
    j	afterCallBB11
_forbodyBB4:
    li a6, 13131
    mul a6,t4,a6
    li t4, 5353
    add t4,a6,t4
    rem t4,t4,s8
    addi a3,a3,    1
    j	_forcondBB4
_if_thenBB4:
    sub a3,zero,a3
    j	afterCallBB10
_forbodyBB3:
    li a6, 13131
    mul a6,a3,a6
    li a3, 5353
    add a3,a6,a3
    rem a3,a3,s8
    addi t4,t4,    1
    j	_forcondBB3
_if_thenBB3:
    sub a3,zero,a3
    j	afterCallBB9
_forbodyBB2:
    li a6, 13131
    mul a3,a3,a6
    li a6, 5353
    add a3,a3,a6
    rem a3,a3,s8
    addi t4,t4,    1
    j	_forcondBB2
__if_thenBB1:
    sub a3,zero,a3
    j	_afterCallBB2
__forbodyBB4:
    li t6, 13131
    mul a3,a3,t6
    li t6, 5353
    add a3,a3,t6
    rem a3,a3,s8
    addi t4,t4,    1
    j	__forcondBB4
_copy_if_thenBB36:
    mv	ra,zero 
_copy_forcondBB9:
    blt	ra,a4,	_copy_forbodyBB9
_copy_afterForBB5:
    li ra, 0
    sw ra,4(a3)
    sw a5, 40(sp) 
    mv	a5,s4 
    sw a5, 12(sp) 
    mv	s4,t3 
    mv	s3,a3 
    sw a2, 8(sp) 
    mv	s10,t4 
    mv	s0,a6 
    mv	s1,t6 
    mv	s9,a4 
    mv	a3,s2 
    lw t4, 64(sp) 
    mv	s5,t4 
    mv	s11,zero 
    li t4, 32761
    mv	s8,t4 
    mv	ra,zero 
    sw ra, 32(sp) 
    mv	s7,zero 
    j	_whileCondBB1
_copy_forbodyBB9:
    lw t0, 16(t6)
    slli a0,ra,    2
    addi a0,a0,    4
    add t0,t0,a0
    lw a1, 12(t6)
    slli a0,ra,    2
    addi a0,a0,    4
    add a0,a1,a0
    lw a1, 0(a0)
    lw a0, 0(t0)
    add a0,a1,a0
    lw t0, 8(t6)
    slli a1,ra,    2
    addi a1,a1,    4
    add t0,t0,a1
    sw a0,0(t0)
    addi ra,ra,    1
    j	_copy_forcondBB9
_copy_if_thenBB35:
    lw t6, 8(s8)
    lw t4, 4(sp) 
    sw t6,8(t4)
    lw t4, 8(s8)
    blt	t4,s5,	_copy_ifTrue11
_copy_if_end24:
    li t4, 0
    sw t4,8(s0)
    mv	a5,s8 
    sw a5, 40(sp) 
    mv	a5,s4 
    sw a5, 12(sp) 
    mv	s4,s5 
    mv	s3,s0 
    lw a2, 4(sp) 
    sw a2, 8(sp) 
    lw t4, 0(sp) 
    mv	s10,t4 
    mv	s0,s7 
    mv	s1,s9 
    mv	s9,a3 
    mv	a3,s2 
    lw t4, 64(sp) 
    mv	s5,t4 
    mv	s11,zero 
    li t4, 32761
    mv	s8,t4 
    mv	ra,zero 
    sw ra, 32(sp) 
    mv	s7,zero 
    j	_whileCondBB1
_copy_ifTrue11:
    lw t4, 8(s8)
    bge	t4,zero,	_copy_ifTrue12
    j	_copy_if_end24
_copy_ifTrue12:
    lw t4, 8(s8)
    rem t4,t4,s5
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,s7,t4
    lw t4, 0(t4)
    bgt	t4,zero,	_copy_if_thenBB37
    j	_copy_if_end24
_copy_if_thenBB37:
    li t6, 1
    lw t4, 0(sp) 
    sw t6,8(t4)
    lw t6, 8(s9)
    lw t4, 8(s8)
    sw t4,4(t6)
    li t6, 1
_copy_forcondBB10:
    blt	t6,a3,	_copy_forbodyBB10
    j	_copy_if_end24
_copy_forbodyBB10:
    addi a6,t6,    -1
    lw t4, 8(s9)
    slli a6,a6,    2
    addi a6,a6,    4
    add t4,t4,a6
    lw t4, 0(t4)
    rem t4,t4,s5
    mul t4,t4,t4
    rem a2,t4,s5
    lw a6, 8(s9)
    slli t4,t6,    2
    addi t4,t4,    4
    add t4,a6,t4
    sw a2,0(t4)
    addi t6,t6,    1
    j	_copy_forcondBB10
__forbodyBB3:
    slli t4,s1,    2
    addi t4,t4,    4
    add t4,s3,t4
    lw t6, 0(t4)
    li t4, 1
__forbodyBB5:
    rem t6,t6,s5
    mul t6,t6,t6
    rem t6,t6,s5
    slli a6,t6,    2
    addi a6,a6,    4
    add a2,s7,a6
    li a6, 1
    sw a6,0(a2)
    slli a6,s1,    2
    addi a6,a6,    4
    add a6,s3,a6
    lw a6, 0(a6)
    beq	t6,a6,	__afterForBB4
__forupdateBB1:
    addi t4,t4,    1
    j	__forbodyBB5
__afterForBB4:
    mv	s10,a3 
    mv	s11,t4 
    mv	a1,s10 
    mv	a0,s11 
    beq	a0,zero,	_copy_if_thenBB38
_copy_if_end25:
    blt	a1,a0,	_copy_if_thenBB39
_copy_if_elseBB7:
    rem a1,a1,a0
    call	gcd
afterCallBB12:
    div t4,s10,a0
    mul a3,t4,s11
    addi t4,s1,    1
    mv	s1,t4 
    j	__forcondBB3
_copy_if_thenBB39:
    call	gcd
    j	afterCallBB12
_copy_if_thenBB38:
    mv	a0,a1 
    j	afterCallBB12
__forbodyBB2:
    li t4, 1
__forcondBB5:
    li a3, 15
    ble	t4,a3,	__forbodyBB6
__forupdateBB2:
    addi t6,t6,    1
    j	__forcondBB2
__forbodyBB6:
    slli a3,t6,    2
    addi a3,a3,    4
    add a3,s3,a3
    lw a3, 0(a3)
    rem a3,a3,s5
    mul a3,a3,a3
    rem a6,a3,s5
    slli a3,t6,    2
    addi a3,a3,    4
    add a3,s3,a3
    sw a6,0(a3)
    addi t4,t4,    1
    j	__forcondBB5
__forbodyBB1:
    slli a3,t4,    2
    addi a3,a3,    4
    add a3,s3,a3
    sw t4,0(a3)
    addi t4,t4,    1
    j	__forcondBB1
_forbodyBB1:
    mv	t4,s5 
    sub t4,t4,zero
    addi a2,t4,    1
    mv	t4,s2 
    li a3, 1
_forcondBB5:
    li a6, 3
    blt	a3,a6,	_forbodyBB5
_afterForBB5:
    blt	t4,zero,	_if_thenBB8
paracopy32:
afterCallBB13:
    rem a3,t4,a2
    add a3,a3,zero
    addi a3,a3,    1
    slli a6,t6,    2
    addi a6,a6,    4
    add a6,s8,a6
    sw a3,0(a6)
    addi t6,t6,    1
    mv	s2,t4 
    j	_forcondBB1
_if_thenBB8:
    sub t4,zero,t4
    j	afterCallBB13
_forbodyBB5:
    li a6, 13131
    mul a6,t4,a6
    li t4, 5353
    add a6,a6,t4
    li t4, 32761
    rem t4,a6,t4
    addi a3,a3,    1
    j	_forcondBB5
forupdateBB1:
    li a0, 324
    call malloc
    li t4, 80
    sw t4,0(a0)
    sw a0,0(s6)
    addi s6,s6,    4
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
     
