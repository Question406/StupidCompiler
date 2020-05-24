    .text
    .globl	sort				#begin
    .p2align	2
    .type	sort,@function
sort:
sort.entryBB1:
    addi sp,sp,    -48
    sw ra, 4(sp) 
    sw s7, 8(sp) 
    sw s8, 28(sp) 
    sw s9, 16(sp) 
    sw s10, 24(sp) 
    sw s11, 20(sp) 
    sw s0, 12(sp) 
    sw s1, 0(sp) 
    mv	s1,s2 
    mv	s0,a1 
    mv	s8,a0 
    la t0,edges    
    lw ra, 0(t0)
    la t0,buffer    
    lw t3, 0(t0)
    addi t0,s8,    1
    beq	t0,s0,	paracopy1
if_end1:
    add t0,s8,s0
    srai t0,t0,    1
    mv	s9,t0 
    addi t0,s8,    1
    beq	t0,s9,	paracopy2
_copy_if_end1:
    add t0,s8,s9
    srai t0,t0,    1
    mv	s11,t0 
    mv	s2,s8 
    addi t0,s2,    1
    beq	t0,s11,	paracopy3
_copy_if_end2:
    add t0,s2,s11
    srai t0,t0,    1
    mv	s10,t0 
    lui t0,%hi(buffer)
    sw t3, %lo(buffer)(t0)
    lui t0,%hi(edges)
    sw ra, %lo(edges)(t0)
    mv	a0,s2 
    mv	a1,s10 
    call	sort
    la t0,edges    
    lw ra, 0(t0)
    la t0,buffer    
    lw t0, 0(t0)
    lui t3,%hi(buffer)
    sw t0, %lo(buffer)(t3)
    lui t0,%hi(edges)
    sw ra, %lo(edges)(t0)
    mv	a0,s10 
    mv	a1,s11 
    call	sort
    la t0,edges    
    lw ra, 0(t0)
    la t0,buffer    
    lw t3, 0(t0)
    mv	t6,s2 
    mv	t0,s10 
    mv	a0,zero 
_copy_forcondBB1:
    sub t4,s11,s2
    blt	a0,t4,	_copy_forbodyBB1
    j	_copy_afterForBB1
_copy_forbodyBB1:
    beq	t6,s10,	_copy_if_thenBB1
_copy_if_end3:
    beq	t0,s11,	_copy_if_thenBB2
_copy_if_end4:
    slli a6,t0,    2
    addi a6,a6,    4
    add a6,ra,a6
    lw t4, 0(a6)
    slli a6,t6,    2
    addi a6,a6,    4
    add a6,ra,a6
    lw a6, 0(a6)
    lw a6, 8(a6)
    lw t4, 8(t4)
    blt	a6,t4,	_copy_if_thenBB3
    j	_copy_if_end5
_copy_if_thenBB3:
    addi a6,t6,    1
    slli t6,t6,    2
    addi t6,t6,    4
    add t4,ra,t6
    slli t6,a0,    2
    addi t6,t6,    4
    add a4,t3,t6
    lw t6, 0(t4)
    sw t6,0(a4)
    mv	t6,a6 
_copy_forupdateBB1:
    addi a0,a0,    1
    j	_copy_forcondBB1
_copy_if_end5:
    addi a6,t0,    1
    slli t0,t0,    2
    addi t0,t0,    4
    add t4,ra,t0
    slli t0,a0,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw t4, 0(t4)
    sw t4,0(t0)
    mv	t0,a6 
    j	_copy_forupdateBB1
_copy_if_thenBB2:
    mv	a6,t6 
    addi t6,t6,    1
    slli a6,a6,    2
    addi a6,a6,    4
    add a6,ra,a6
    slli t4,a0,    2
    addi t4,t4,    4
    add t4,t3,t4
    lw a6, 0(a6)
    sw a6,0(t4)
    j	_copy_forupdateBB1
_copy_if_thenBB1:
    mv	a6,t0 
    addi t0,t0,    1
    slli a6,a6,    2
    addi a6,a6,    4
    add t4,ra,a6
    slli a6,a0,    2
    addi a6,a6,    4
    add a6,t3,a6
    lw t4, 0(t4)
    sw t4,0(a6)
    j	_copy_forupdateBB1
_copy_afterForBB1:
    mv	t0,zero 
_copy_forcondBB2:
    blt	t0,t4,	_copy_forbodyBB2
    j	paracopy4
_copy_forbodyBB2:
    slli a6,t0,    2
    addi a6,a6,    4
    add t6,t3,a6
    add a6,s2,t0
    slli a6,a6,    2
    addi a6,a6,    4
    add a6,ra,a6
    lw t6, 0(t6)
    sw t6,0(a6)
    addi t0,t0,    1
    j	_copy_forcondBB2
paracopy4:
afterCallBB1:
    mv	s2,s9 
    addi t0,s11,    1
    beq	t0,s2,	paracopy5
_copy_if_end6:
    add t0,s11,s2
    srai t0,t0,    1
    mv	s10,t0 
    lui t0,%hi(buffer)
    sw t3, %lo(buffer)(t0)
    lui t0,%hi(edges)
    sw ra, %lo(edges)(t0)
    mv	a0,s11 
    mv	a1,s10 
    call	sort
    la t0,edges    
    lw t0, 0(t0)
    la ra,buffer    
    lw t3, 0(ra)
    lui ra,%hi(buffer)
    sw t3, %lo(buffer)(ra)
    lui ra,%hi(edges)
    sw t0, %lo(edges)(ra)
    mv	a0,s10 
    mv	a1,s2 
    call	sort
    la t0,edges    
    lw ra, 0(t0)
    la t0,buffer    
    lw t3, 0(t0)
    mv	t0,s11 
    mv	a6,s10 
    mv	a0,zero 
_copy_forcondBB3:
    sub t4,s2,s11
    blt	a0,t4,	_copy_forbodyBB3
_copy_afterForBB2:
    mv	t0,zero 
_copy_forcondBB4:
    blt	t0,t4,	_copy_forbodyBB4
paracopy6:
afterCallBB2:
    mv	a0,s8 
    mv	a6,s11 
    mv	t6,zero 
_copy_forcondBB5:
    sub t4,s9,s8
    blt	t6,t4,	_copy_forbodyBB5
    j	_copy_afterForBB3
_copy_forbodyBB5:
    beq	a0,s11,	_copy_if_thenBB4
_copy_if_end7:
    beq	a6,s9,	_copy_if_thenBB5
_copy_if_end8:
    slli t0,a6,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t4, 0(t0)
    slli t0,a0,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t0, 0(t0)
    lw t0, 8(t0)
    lw t4, 8(t4)
    blt	t0,t4,	_copy_if_thenBB6
    j	_copy_if_end9
_copy_if_thenBB6:
    mv	t0,a0 
    addi a0,a0,    1
    slli t0,t0,    2
    addi t0,t0,    4
    add t4,ra,t0
    slli t0,t6,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw t4, 0(t4)
    sw t4,0(t0)
_copy_forupdateBB2:
    addi t6,t6,    1
    j	_copy_forcondBB5
_copy_if_end9:
    addi t0,a6,    1
    slli a6,a6,    2
    addi a6,a6,    4
    add a6,ra,a6
    slli t4,t6,    2
    addi t4,t4,    4
    add t4,t3,t4
    lw a6, 0(a6)
    sw a6,0(t4)
    mv	a6,t0 
    j	_copy_forupdateBB2
_copy_if_thenBB5:
    mv	t0,a0 
    addi a0,a0,    1
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,ra,t0
    slli t4,t6,    2
    addi t4,t4,    4
    add t4,t3,t4
    lw t0, 0(t0)
    sw t0,0(t4)
    j	_copy_forupdateBB2
_copy_if_thenBB4:
    addi t0,a6,    1
    slli a6,a6,    2
    addi a6,a6,    4
    add a6,ra,a6
    slli t4,t6,    2
    addi t4,t4,    4
    add t4,t3,t4
    lw a6, 0(a6)
    sw a6,0(t4)
    mv	a6,t0 
    j	_copy_forupdateBB2
_copy_afterForBB3:
    mv	t0,zero 
_copy_forcondBB6:
    blt	t0,t4,	_copy_forbodyBB6
paracopy7:
afterCallBB3:
    mv	s11,s9 
    mv	s2,s0 
    addi t0,s11,    1
    beq	t0,s2,	paracopy8
_copy_if_end10:
    add t0,s11,s2
    srai t0,t0,    1
    mv	s7,t0 
    addi t0,s11,    1
    beq	t0,s7,	paracopy9
_copy_if_end11:
    add t0,s11,s7
    srai t0,t0,    1
    mv	s10,t0 
    lui t0,%hi(buffer)
    sw t3, %lo(buffer)(t0)
    lui t0,%hi(edges)
    sw ra, %lo(edges)(t0)
    mv	a0,s11 
    mv	a1,s10 
    call	sort
    la t0,edges    
    lw t3, 0(t0)
    la t0,buffer    
    lw t0, 0(t0)
    lui ra,%hi(buffer)
    sw t0, %lo(buffer)(ra)
    lui t0,%hi(edges)
    sw t3, %lo(edges)(t0)
    mv	a0,s10 
    mv	a1,s7 
    call	sort
    la t0,edges    
    lw ra, 0(t0)
    la t0,buffer    
    lw t3, 0(t0)
    mv	a6,s11 
    mv	t6,s10 
    mv	a0,zero 
_copy_forcondBB7:
    sub t4,s7,s11
    blt	a0,t4,	_copy_forbodyBB7
_copy_afterForBB4:
    mv	t0,zero 
_copy_forcondBB8:
    blt	t0,t4,	_copy_forbodyBB8
    j	paracopy10
_copy_forbodyBB8:
    slli a6,t0,    2
    addi a6,a6,    4
    add t6,t3,a6
    add a6,s11,t0
    slli a6,a6,    2
    addi a6,a6,    4
    add a0,ra,a6
    lw a6, 0(t6)
    sw a6,0(a0)
    addi t0,t0,    1
    j	_copy_forcondBB8
paracopy10:
afterCallBB4:
    lui t0,%hi(buffer)
    sw t3, %lo(buffer)(t0)
    lui t0,%hi(edges)
    sw ra, %lo(edges)(t0)
    mv	a0,s7 
    mv	a1,s2 
    call	sort
    la t0,edges    
    lw ra, 0(t0)
    la t0,buffer    
    lw t3, 0(t0)
    mv	t0,s11 
    mv	t6,s7 
    mv	a0,zero 
_copy_forcondBB9:
    sub t4,s2,s11
    blt	a0,t4,	_copy_forbodyBB9
    j	_copy_afterForBB5
_copy_forbodyBB9:
    beq	t0,s7,	_copy_if_thenBB7
_copy_if_end12:
    beq	t6,s2,	_copy_if_thenBB8
    j	_copy_if_end13
_copy_if_thenBB8:
    mv	a6,t0 
    addi t0,t0,    1
    slli a6,a6,    2
    addi a6,a6,    4
    add a6,ra,a6
    slli t4,a0,    2
    addi t4,t4,    4
    add t4,t3,t4
    lw a6, 0(a6)
    sw a6,0(t4)
    mv	a6,t6 
_copy_forupdateBB3:
    addi a0,a0,    1
    mv	t6,a6 
    j	_copy_forcondBB9
_copy_if_end13:
    slli a6,t6,    2
    addi a6,a6,    4
    add a6,ra,a6
    lw t4, 0(a6)
    slli a6,t0,    2
    addi a6,a6,    4
    add a6,ra,a6
    lw a6, 0(a6)
    lw a6, 8(a6)
    lw t4, 8(t4)
    blt	a6,t4,	_copy_if_thenBB9
    j	_copy_if_end14
_copy_if_thenBB9:
    mv	a6,t0 
    addi t0,t0,    1
    slli a6,a6,    2
    addi a6,a6,    4
    add t4,ra,a6
    slli a6,a0,    2
    addi a6,a6,    4
    add a4,t3,a6
    lw a6, 0(t4)
    sw a6,0(a4)
    mv	a6,t6 
    j	_copy_forupdateBB3
_copy_if_end14:
    addi a6,t6,    1
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,ra,t6
    slli t4,a0,    2
    addi t4,t4,    4
    add t4,t3,t4
    lw t6, 0(t6)
    sw t6,0(t4)
    j	_copy_forupdateBB3
_copy_if_thenBB7:
    addi a6,t6,    1
    slli t6,t6,    2
    addi t6,t6,    4
    add a4,ra,t6
    slli t6,a0,    2
    addi t6,t6,    4
    add t4,t3,t6
    lw t6, 0(a4)
    sw t6,0(t4)
    j	_copy_forupdateBB3
_copy_afterForBB5:
    mv	t0,zero 
_copy_forcondBB10:
    blt	t0,t4,	_copy_forbodyBB10
paracopy11:
afterCallBB5:
    mv	t0,s8 
    mv	a6,s9 
    mv	t6,zero 
forcondBB1:
    sub a0,s0,s8
    blt	t6,a0,	forbodyBB1
    j	afterForBB1
forbodyBB1:
    beq	t0,s9,	if_thenBB1
    j	if_end2
if_thenBB1:
    mv	a0,a6 
    addi a6,a6,    1
    slli a0,a0,    2
    addi a0,a0,    4
    add a0,ra,a0
    slli t4,t6,    2
    addi t4,t4,    4
    add t4,t3,t4
    lw a0, 0(a0)
    sw a0,0(t4)
forupdateBB1:
    addi t6,t6,    1
    j	forcondBB1
if_end2:
    beq	a6,s0,	if_thenBB2
if_end3:
    slli a0,a6,    2
    addi a0,a0,    4
    add a0,ra,a0
    lw t4, 0(a0)
    slli a0,t0,    2
    addi a0,a0,    4
    add a0,ra,a0
    lw a0, 0(a0)
    lw a0, 8(a0)
    lw t4, 8(t4)
    blt	a0,t4,	if_thenBB3
    j	if_end4
if_thenBB3:
    addi a0,t0,    1
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,ra,t0
    slli t4,t6,    2
    addi t4,t4,    4
    add t4,t3,t4
    lw t0, 0(t0)
    sw t0,0(t4)
    mv	t0,a0 
    j	forupdateBB1
if_end4:
    mv	a0,a6 
    addi a6,a6,    1
    slli a0,a0,    2
    addi a0,a0,    4
    add t4,ra,a0
    slli a0,t6,    2
    addi a0,a0,    4
    add a0,t3,a0
    lw t4, 0(t4)
    sw t4,0(a0)
    j	forupdateBB1
if_thenBB2:
    mv	a0,t0 
    addi t0,t0,    1
    slli a0,a0,    2
    addi a0,a0,    4
    add t4,ra,a0
    slli a0,t6,    2
    addi a0,a0,    4
    add a0,t3,a0
    lw t4, 0(t4)
    sw t4,0(a0)
    j	forupdateBB1
afterForBB1:
    mv	t0,zero 
forcondBB2:
    blt	t0,a0,	forbodyBB2
paracopy12:
sort.exitBB1:
    lui t0,%hi(buffer)
    sw t3, %lo(buffer)(t0)
    lui t0,%hi(edges)
    sw ra, %lo(edges)(t0)
    mv	s2,s1 
    lw s1, 0(sp) 
    lw s0, 12(sp) 
    lw s11, 20(sp) 
    lw s10, 24(sp) 
    lw s9, 16(sp) 
    lw s8, 28(sp) 
    lw s7, 8(sp) 
    lw ra, 4(sp) 
    addi sp,sp,    48
    ret
forbodyBB2:
    slli a6,t0,    2
    addi a6,a6,    4
    add a6,t3,a6
    add t6,s8,t0
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,ra,t6
    lw a6, 0(a6)
    sw a6,0(t6)
    addi t0,t0,    1
    j	forcondBB2
_copy_forbodyBB10:
    slli a6,t0,    2
    addi a6,a6,    4
    add a6,t3,a6
    add t6,s11,t0
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,ra,t6
    lw a6, 0(a6)
    sw a6,0(t6)
    addi t0,t0,    1
    j	_copy_forcondBB10
_copy_forbodyBB7:
    beq	a6,s10,	_copy_if_thenBB10
    j	_copy_if_end15
_copy_if_thenBB10:
    mv	t0,t6 
    addi t6,t6,    1
    slli t0,t0,    2
    addi t0,t0,    4
    add t4,ra,t0
    slli t0,a0,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw t4, 0(t4)
    sw t4,0(t0)
_copy_forupdateBB4:
    addi a0,a0,    1
    j	_copy_forcondBB7
_copy_if_end15:
    beq	t6,s7,	_copy_if_thenBB11
_copy_if_end16:
    slli t0,t6,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t0, 0(t0)
    slli t4,a6,    2
    addi t4,t4,    4
    add t4,ra,t4
    lw t4, 0(t4)
    lw t4, 8(t4)
    lw t0, 8(t0)
    blt	t4,t0,	_copy_if_thenBB12
    j	_copy_if_end17
_copy_if_thenBB12:
    mv	t0,a6 
    addi a6,a6,    1
    slli t0,t0,    2
    addi t0,t0,    4
    add t4,ra,t0
    slli t0,a0,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw t4, 0(t4)
    sw t4,0(t0)
    j	_copy_forupdateBB4
_copy_if_end17:
    addi t0,t6,    1
    slli t6,t6,    2
    addi t6,t6,    4
    add t4,ra,t6
    slli t6,a0,    2
    addi t6,t6,    4
    add t6,t3,t6
    lw t4, 0(t4)
    sw t4,0(t6)
    mv	t6,t0 
    j	_copy_forupdateBB4
_copy_if_thenBB11:
    mv	t0,a6 
    addi a6,a6,    1
    slli t0,t0,    2
    addi t0,t0,    4
    add a4,ra,t0
    slli t0,a0,    2
    addi t0,t0,    4
    add t4,t3,t0
    lw t0, 0(a4)
    sw t0,0(t4)
    j	_copy_forupdateBB4
paracopy9:
    j	afterCallBB4
paracopy8:
    j	afterCallBB5
_copy_forbodyBB6:
    slli a6,t0,    2
    addi a6,a6,    4
    add t6,t3,a6
    add a6,s8,t0
    slli a6,a6,    2
    addi a6,a6,    4
    add a0,ra,a6
    lw a6, 0(t6)
    sw a6,0(a0)
    addi t0,t0,    1
    j	_copy_forcondBB6
_copy_forbodyBB4:
    slli a6,t0,    2
    addi a6,a6,    4
    add a0,t3,a6
    add a6,s11,t0
    slli a6,a6,    2
    addi a6,a6,    4
    add t6,ra,a6
    lw a6, 0(a0)
    sw a6,0(t6)
    addi t0,t0,    1
    j	_copy_forcondBB4
_copy_forbodyBB3:
    beq	t0,s10,	_copy_if_thenBB13
_copy_if_end18:
    beq	a6,s2,	_copy_if_thenBB14
_copy_if_end19:
    slli t6,a6,    2
    addi t6,t6,    4
    add t6,ra,t6
    lw t4, 0(t6)
    slli t6,t0,    2
    addi t6,t6,    4
    add t6,ra,t6
    lw t6, 0(t6)
    lw a4, 8(t6)
    lw t6, 8(t4)
    blt	a4,t6,	_copy_if_thenBB15
    j	_copy_if_end20
_copy_if_thenBB15:
    addi t6,t0,    1
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,ra,t0
    slli t4,a0,    2
    addi t4,t4,    4
    add t4,t3,t4
    lw t0, 0(t0)
    sw t0,0(t4)
_copy_forupdateBB5:
    addi a0,a0,    1
    mv	t0,t6 
    j	_copy_forcondBB3
_copy_if_end20:
    addi t6,a6,    1
    slli a6,a6,    2
    addi a6,a6,    4
    add a4,ra,a6
    slli a6,a0,    2
    addi a6,a6,    4
    add t4,t3,a6
    lw a6, 0(a4)
    sw a6,0(t4)
    mv	a6,t6 
    mv	t6,t0 
    j	_copy_forupdateBB5
_copy_if_thenBB14:
    addi t6,t0,    1
    slli t0,t0,    2
    addi t0,t0,    4
    add a4,ra,t0
    slli t0,a0,    2
    addi t0,t0,    4
    add t4,t3,t0
    lw t0, 0(a4)
    sw t0,0(t4)
    j	_copy_forupdateBB5
_copy_if_thenBB13:
    mv	t6,a6 
    addi a6,a6,    1
    slli t6,t6,    2
    addi t6,t6,    4
    add a4,ra,t6
    slli t6,a0,    2
    addi t6,t6,    4
    add t4,t3,t6
    lw t6, 0(a4)
    sw t6,0(t4)
    mv	t6,t0 
    j	_copy_forupdateBB5
paracopy5:
    j	afterCallBB2
paracopy3:
    j	afterCallBB1
paracopy2:
    j	afterCallBB3
paracopy1:
    j	sort.exitBB1
								 # func end
    .globl	findRoot				#begin
    .p2align	2
    .type	findRoot,@function
findRoot:
findRoot.entryBB1:
    addi sp,sp,    -32
    sw ra, 16(sp) 
    sw s7, 8(sp) 
    sw s8, 4(sp) 
    sw s9, 0(sp) 
    sw s10, 12(sp) 
    mv	s7,s11 
    mv	s10,a0 
    la t0,pnt    
    lw ra, 0(t0)
    slli t0,s10,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t0, 0(t0)
    li t3, -1
    beq	t0,t3,	if_thenBB4
if_end5:
    slli t0,s10,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t0, 0(t0)
    mv	s11,t0 
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t0, 0(t0)
    li t3, -1
    beq	t0,t3,	_copy_if_thenBB16
    j	_copy_if_end21
_copy_if_thenBB16:
    mv	a0,s11 
afterCallBB6:
    slli t0,s10,    2
    addi t0,t0,    4
    add t0,ra,t0
    sw a0,0(t0)
findRoot.exitBB1:
    lui t0,%hi(pnt)
    sw ra, %lo(pnt)(t0)
    mv	s11,s7 
    lw s10, 12(sp) 
    lw s9, 0(sp) 
    lw s8, 4(sp) 
    lw s7, 8(sp) 
    lw ra, 16(sp) 
    addi sp,sp,    32
    ret
_copy_if_end21:
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t0, 0(t0)
    mv	s8,t0 
    slli t0,s8,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t3, 0(t0)
    li t0, -1
    beq	t3,t0,	_copy_if_thenBB17
    j	_copy_if_end22
_copy_if_thenBB17:
    mv	a0,s8 
afterCallBB7:
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,ra,t0
    sw a0,0(t0)
    j	afterCallBB6
_copy_if_end22:
    slli t0,s8,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t0, 0(t0)
    mv	s9,t0 
    slli t0,s9,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw t3, 0(t0)
    li t0, -1
    beq	t3,t0,	_copy_if_thenBB18
    j	_copy_if_end23
_copy_if_thenBB18:
    mv	a0,s9 
afterCallBB8:
    slli t0,s8,    2
    addi t0,t0,    4
    add t0,ra,t0
    sw a0,0(t0)
    j	afterCallBB7
_copy_if_end23:
    slli t0,s9,    2
    addi t0,t0,    4
    add t0,ra,t0
    lw a0, 0(t0)
    lui t0,%hi(pnt)
    sw ra, %lo(pnt)(t0)
    call	findRoot
    la t0,pnt    
    lw ra, 0(t0)
    slli t0,s9,    2
    addi t0,t0,    4
    add t0,ra,t0
    sw a0,0(t0)
    j	afterCallBB8
if_thenBB4:
    mv	a0,s10 
    j	findRoot.exitBB1
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -48
    sw ra, 20(sp) 
    sw s7, 4(sp) 
    sw s8, 36(sp) 
    sw s9, 24(sp) 
    sw s10, 16(sp) 
    sw s11, 32(sp) 
    sw s0, 28(sp) 
    sw s1, 8(sp) 
    sw s2, 0(sp) 
    sw s3, 12(sp) 
    mv	s1,s4 
    call	getInt
    mv	s9,a0 
    call	getInt
    mv	s10,a0 
    slli t0,s10,    2
    addi a0,t0,    4
    call malloc
    mv	s8,a0 
    sw s10,0(s8)
    slli t0,s10,    2
    addi a0,t0,    4
    call malloc
    sw s10,0(a0)
    mv	s11,a0 
    mv	s2,zero 
__forcondBB1:
    blt	s2,s10,	__forbodyBB1
__afterForBB1:
    slli t0,s9,    2
    addi a0,t0,    4
    call malloc
    sw s9,0(a0)
    mv	s0,a0 
    mv	t0,zero 
__forcondBB2:
    blt	t0,s9,	__forbodyBB2
    j	_afterCallBB1
__forbodyBB2:
    slli ra,t0,    2
    addi ra,ra,    4
    add ra,s0,ra
    li t3, -1
    sw t3,0(ra)
    addi t0,t0,    1
    j	__forcondBB2
_afterCallBB1:
    mv	s2,s10 
    li t0, 1
    beq	t0,s2,	paracopy13
    j	_copy_if_end24
paracopy13:
    mv	s9,s8 
    mv	s3,s11 
afterCallBB9:
    mv	s4,s0 
    mv	s2,zero 
    mv	s0,zero 
_forcondBB1:
    blt	s2,s10,	_forbodyBB1
afterCallBB10:
    mv	a0,s0 
    call	printlnInt
    lui t0,%hi(pnt)
    sw s4, %lo(pnt)(t0)
    lui t0,%hi(buffer)
    sw s3, %lo(buffer)(t0)
    lui t0,%hi(edges)
    sw s9, %lo(edges)(t0)
    mv	s4,s1 
    lw s3, 12(sp) 
    lw s2, 0(sp) 
    lw s1, 8(sp) 
    lw s0, 28(sp) 
    lw s11, 32(sp) 
    lw s10, 16(sp) 
    lw s9, 24(sp) 
    lw s8, 36(sp) 
    lw s7, 4(sp) 
    lw ra, 20(sp) 
    mv	a0,zero 
    addi sp,sp,    48
    ret
_forbodyBB1:
    slli t0,s2,    2
    addi t0,t0,    4
    add t0,s9,t0
    lw t0, 0(t0)
    lw t0, 4(t0)
    mv	s8,t0 
    slli t0,s8,    2
    addi t0,t0,    4
    add t0,s4,t0
    lw ra, 0(t0)
    li t0, -1
    beq	ra,t0,	_copy_if_thenBB19
_copy_if_end25:
    slli t0,s8,    2
    addi t0,t0,    4
    add t0,s4,t0
    lw t0, 0(t0)
    mv	s11,t0 
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,s4,t0
    lw ra, 0(t0)
    li t0, -1
    beq	ra,t0,	_copy_if_thenBB20
_copy_if_end26:
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,s4,t0
    lw t0, 0(t0)
    mv	s7,t0 
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,s4,t0
    lw ra, 0(t0)
    li t0, -1
    beq	ra,t0,	_copy_if_thenBB21
_copy_if_end27:
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,s4,t0
    lw a0, 0(t0)
    lui t0,%hi(pnt)
    sw s4, %lo(pnt)(t0)
    call	findRoot
    la t0,pnt    
    lw t3, 0(t0)
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,t3,t0
    sw a0,0(t0)
afterCallBB11:
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,t3,t0
    sw a0,0(t0)
afterCallBB12:
    slli t0,s8,    2
    addi t0,t0,    4
    add t0,t3,t0
    sw a0,0(t0)
afterCallBB13:
    mv	s8,a0 
    slli t0,s2,    2
    addi t0,t0,    4
    add t0,s9,t0
    lw t0, 0(t0)
    lw t0, 0(t0)
    mv	s11,t0 
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw ra, 0(t0)
    li t0, -1
    beq	ra,t0,	_copy_if_thenBB22
    j	_copy_if_end28
_copy_if_thenBB22:
    mv	a0,s11 
afterCallBB14:
    beq	a0,s8,	paracopy14
_if_end1:
    slli t0,s2,    2
    addi t0,t0,    4
    add t0,s9,t0
    lw t0, 0(t0)
    lw t0, 0(t0)
    slli ra,s2,    2
    addi ra,ra,    4
    add ra,s9,ra
    lw ra, 0(ra)
    lw ra, 4(ra)
    mv	s11,t0 
    mv	s8,ra 
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw ra, 0(t0)
    li t0, -1
    beq	ra,t0,	_copy_if_thenBB23
    j	_copy_if_end29
_copy_if_thenBB23:
    mv	a0,s11 
afterCallBB15:
    mv	s11,a0 
    slli t0,s8,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw t0, 0(t0)
    li ra, -1
    beq	t0,ra,	_copy_if_thenBB24
    j	_copy_if_end30
_copy_if_thenBB24:
    mv	a0,s8 
afterCallBB16:
    beq	s11,a0,	_afterCallBB2
    j	__if_end1
_afterCallBB2:
    slli t0,s2,    2
    addi t0,t0,    4
    add t0,s9,t0
    lw t0, 0(t0)
    lw t0, 8(t0)
    add ra,s0,t0
_forupdateBB1:
    addi t0,s2,    1
    mv	s2,t0 
    mv	s4,t3 
    mv	s0,ra 
    j	_forcondBB1
__if_end1:
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,t3,t0
    sw a0,0(t0)
    j	_afterCallBB2
_copy_if_end30:
    slli t0,s8,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw s7, 0(t0)
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw ra, 0(t0)
    li t0, -1
    beq	ra,t0,	_copy_if_thenBB25
_copy_if_end31:
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw a0, 0(t0)
    lui t0,%hi(pnt)
    sw t3, %lo(pnt)(t0)
    call	findRoot
    la t0,pnt    
    lw t3, 0(t0)
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,t3,t0
    sw a0,0(t0)
afterCallBB17:
    slli t0,s8,    2
    addi t0,t0,    4
    add t0,t3,t0
    sw a0,0(t0)
    j	afterCallBB16
_copy_if_thenBB25:
    mv	a0,s7 
    j	afterCallBB17
_copy_if_end29:
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw s7, 0(t0)
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw ra, 0(t0)
    li t0, -1
    beq	ra,t0,	_copy_if_thenBB26
_copy_if_end32:
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw a0, 0(t0)
    lui t0,%hi(pnt)
    sw t3, %lo(pnt)(t0)
    call	findRoot
    la t0,pnt    
    lw t3, 0(t0)
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,t3,t0
    sw a0,0(t0)
afterCallBB18:
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,t3,t0
    sw a0,0(t0)
    j	afterCallBB15
_copy_if_thenBB26:
    mv	a0,s7 
    j	afterCallBB18
paracopy14:
    mv	ra,s0 
    j	_forupdateBB1
_copy_if_end28:
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw t0, 0(t0)
    mv	s7,t0 
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw t0, 0(t0)
    li ra, -1
    beq	t0,ra,	_copy_if_thenBB27
    j	_copy_if_end33
_copy_if_thenBB27:
    mv	a0,s7 
afterCallBB19:
    slli t0,s11,    2
    addi t0,t0,    4
    add t0,t3,t0
    sw a0,0(t0)
    j	afterCallBB14
_copy_if_end33:
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw t0, 0(t0)
    mv	s4,t0 
    slli t0,s4,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw ra, 0(t0)
    li t0, -1
    beq	ra,t0,	_copy_if_thenBB28
_copy_if_end34:
    slli t0,s4,    2
    addi t0,t0,    4
    add t0,t3,t0
    lw a0, 0(t0)
    lui t0,%hi(pnt)
    sw t3, %lo(pnt)(t0)
    call	findRoot
    la t0,pnt    
    lw t3, 0(t0)
    slli t0,s4,    2
    addi t0,t0,    4
    add t0,t3,t0
    sw a0,0(t0)
afterCallBB20:
    slli t0,s7,    2
    addi t0,t0,    4
    add t0,t3,t0
    sw a0,0(t0)
    j	afterCallBB19
_copy_if_thenBB28:
    mv	a0,s4 
    j	afterCallBB20
_copy_if_thenBB21:
    mv	a0,s7 
    mv	t3,s4 
    j	afterCallBB11
_copy_if_thenBB20:
    mv	a0,s11 
    mv	t3,s4 
    j	afterCallBB12
_copy_if_thenBB19:
    mv	a0,s8 
    mv	t3,s4 
    j	afterCallBB13
_copy_if_end24:
    add t0,s2,zero
    srai s9,t0,    1
    lui t0,%hi(buffer)
    sw s11, %lo(buffer)(t0)
    lui t0,%hi(edges)
    sw s8, %lo(edges)(t0)
    mv	a0,zero 
    mv	a1,s9 
    call	sort
    la t0,edges    
    lw t3, 0(t0)
    la t0,buffer    
    lw ra, 0(t0)
    lui t0,%hi(buffer)
    sw ra, %lo(buffer)(t0)
    lui t0,%hi(edges)
    sw t3, %lo(edges)(t0)
    mv	a0,s9 
    mv	a1,s2 
    call	sort
    la t0,edges    
    lw t0, 0(t0)
    la ra,buffer    
    lw ra, 0(ra)
    mv	t6,s9 
    mv	t3,zero 
    mv	a0,zero 
_copy_forcondBB11:
    sub a6,s2,zero
    blt	a0,a6,	_copy_forbodyBB11
    j	_copy_afterForBB6
_copy_forbodyBB11:
    beq	t3,s9,	_copy_if_thenBB29
_copy_if_end35:
    beq	t6,s2,	_copy_if_thenBB30
    j	_copy_if_end36
_copy_if_thenBB30:
    mv	a6,t3 
    addi t3,t3,    1
    slli a6,a6,    2
    addi a6,a6,    4
    add t4,t0,a6
    slli a6,a0,    2
    addi a6,a6,    4
    add a4,ra,a6
    lw a6, 0(t4)
    sw a6,0(a4)
_copy_forupdateBB6:
    addi a0,a0,    1
    j	_copy_forcondBB11
_copy_if_end36:
    slli a6,t6,    2
    addi a6,a6,    4
    add a6,t0,a6
    lw t4, 0(a6)
    slli a6,t3,    2
    addi a6,a6,    4
    add a6,t0,a6
    lw a6, 0(a6)
    lw a6, 8(a6)
    lw t4, 8(t4)
    blt	a6,t4,	_copy_if_thenBB31
    j	_copy_if_end37
_copy_if_thenBB31:
    addi a6,t3,    1
    slli t3,t3,    2
    addi t3,t3,    4
    add t4,t0,t3
    slli t3,a0,    2
    addi t3,t3,    4
    add t3,ra,t3
    lw t4, 0(t4)
    sw t4,0(t3)
    mv	t3,a6 
    j	_copy_forupdateBB6
_copy_if_end37:
    mv	a6,t6 
    addi t6,t6,    1
    slli a6,a6,    2
    addi a6,a6,    4
    add t4,t0,a6
    slli a6,a0,    2
    addi a6,a6,    4
    add a6,ra,a6
    lw t4, 0(t4)
    sw t4,0(a6)
    j	_copy_forupdateBB6
_copy_if_thenBB29:
    addi a6,t6,    1
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,t0,t6
    slli t4,a0,    2
    addi t4,t4,    4
    add t4,ra,t4
    lw t6, 0(t6)
    sw t6,0(t4)
    mv	t6,a6 
    j	_copy_forupdateBB6
_copy_afterForBB6:
    mv	t3,zero 
_copy_forcondBB12:
    blt	t3,a6,	_copy_forbodyBB12
paracopy15:
    mv	s9,t0 
    mv	s3,ra 
    j	afterCallBB9
_copy_forbodyBB12:
    slli t6,t3,    2
    addi t6,t6,    4
    add a0,ra,t6
    add t6,t3,zero
    slli t6,t6,    2
    addi t6,t6,    4
    add t6,t0,t6
    lw a0, 0(a0)
    sw a0,0(t6)
    addi t3,t3,    1
    j	_copy_forcondBB12
__forbodyBB1:
    li a0, 12
    call malloc
    slli t0,s2,    2
    addi t0,t0,    4
    add t0,s8,t0
    sw a0,0(t0)
    call	getInt
    slli t0,s2,    2
    addi t0,t0,    4
    add t0,s8,t0
    lw t0, 0(t0)
    sw a0,0(t0)
    call	getInt
    slli t0,s2,    2
    addi t0,t0,    4
    add t0,s8,t0
    lw t0, 0(t0)
    sw a0,4(t0)
    call	getInt
    slli t0,s2,    2
    addi t0,t0,    4
    add t0,s8,t0
    lw t0, 0(t0)
    sw a0,8(t0)
    addi s2,s2,    1
    j	__forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	pnt					#@pnt
    .p2align	2
pnt:
    .word	0
     
    .globl	edges					#@edges
    .p2align	2
edges:
    .word	0
     
    .globl	buffer					#@buffer
    .p2align	2
buffer:
    .word	0
     
    .globl	m					#@m
    .p2align	2
m:
    .word	0
     
    .globl	n					#@n
    .p2align	2
n:
    .word	0
     
