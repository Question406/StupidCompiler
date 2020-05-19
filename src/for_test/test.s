    .text
    .globl	search				#begin
    .p2align	2
    .type	search,@function
search:
search.entryBB1:
    addi sp,sp,    -32
    sw ra, 20(sp) 
    sw s1, 24(sp) 
    sw s0, 4(sp) 
    sw s11, 12(sp) 
    sw s10, 0(sp) 
    sw s9, 8(sp) 
    sw s8, 16(sp) 
    mv	s9,s7 
    mv	s10,a2 
    mv	s1,a1 
    mv	s8,a0 
    la t4,make    
    lw s7, 0(t4)
    la t4,color    
    lw s11, 0(t4)
    la t4,count    
    lw s0, 0(t4)
    bgt	s1,zero,	if_thenBB1
    j	iffalse1
iffalse1:
    blt	s1,zero,	if_thenBB1
    j	iffalse2
iffalse2:
    beq	s8,zero,	if_thenBB1
    j	iffalse3
iffalse3:
    li t4, 1
    sub t4,s8,t4
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,s7,t4
    lw t1, 0(t4)
    li t4, 1
    sub t4,s8,t4
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,s7,t4
    lw a0, 0(t4)
    lw t4, 4(t1)
    lw t1, 8(a0)
    add t1,t4,t1
    li t4, 1
    sub t4,s8,t4
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,s7,t4
    lw t4, 0(t4)
    lw t4, 12(t4)
    add t1,t1,t4
    li t4, 15
    beq	t1,t4,	if_thenBB1
    j	paracopy1
if_thenBB1:
    li t4, 2
    beq	s8,t4,	ifTrue1
    j	if_elseBB1
if_elseBB1:
    li t4, 2
    beq	s1,t4,	if_thenBB2
    j	if_elseBB2
if_elseBB2:
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    li s7, 1
    j	forcondBB1
forcondBB1:
    li a0, 9
    ble	s7,a0,	forbodyBB1
    j	paracopy2
paracopy2:
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
if_end1:
    lui a0,%hi(count)
    sw a5, %lo(count)(a0)
    lui a0,%hi(color)
    sw t4, %lo(color)(a0)
    lui t4,%hi(make)
    sw t1, %lo(make)(t4)
    mv	s7,s9 
    lw s8, 16(sp) 
    lw s9, 8(sp) 
    lw s10, 0(sp) 
    lw s11, 12(sp) 
    lw s0, 4(sp) 
    lw s1, 24(sp) 
    lw ra, 20(sp) 
    addi sp,sp,    32
    ret
forbodyBB1:
    slli a0,s7,    2
    addi a0,a0,    4
    add a0,t4,a0
    lw a0, 0(a0)
    beq	a0,zero,	if_thenBB3
    j	paracopy3
paracopy3:
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	forupdateBB1
forupdateBB1:
    addi s7,s7,    1
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,s7 
    mv	a0,t4 
    j	forcondBB1
if_thenBB3:
    slli a0,s7,    2
    addi a0,a0,    4
    add a0,t4,a0
    li a1, 1
    sw a1,0(a0)
    slli a0,s8,    2
    addi a0,a0,    4
    add a0,t1,a0
    lw a1, 0(a0)
    slli a0,s1,    2
    addi a0,a0,    4
    add a0,a1,a0
    sw s7,0(a0)
    li a0, 2
    beq	s1,a0,	if_thenBB4
    j	if_elseBB3
if_elseBB3:
    addi a1,s1,    1
    add a2,s10,s7
    lui a0,%hi(count)
    sw a5, %lo(count)(a0)
    lui a0,%hi(color)
    sw t4, %lo(color)(a0)
    lui t4,%hi(make)
    sw t1, %lo(make)(t4)
    mv	a0,s8 
    call	search
    la t4,make    
    lw t1, 0(t4)
    la t4,color    
    lw t4, 0(t4)
    la a0,count    
    lw a5, 0(a0)
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end2
if_end2:
    slli a0,s8,    2
    addi a0,a0,    4
    add a0,t1,a0
    lw a1, 0(a0)
    slli a0,s1,    2
    addi a0,a0,    4
    add a1,a1,a0
    li a0, 0
    sw a0,0(a1)
    slli a0,s7,    2
    addi a0,a0,    4
    add a0,t4,a0
    li a1, 0
    sw a1,0(a0)
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	forupdateBB1
if_thenBB4:
    addi a0,s8,    1
    add a2,s10,s7
    lui a1,%hi(count)
    sw a5, %lo(count)(a1)
    lui a1,%hi(color)
    sw t4, %lo(color)(a1)
    lui t4,%hi(make)
    sw t1, %lo(make)(t4)
    mv	a1,zero 
    call	search
    la t4,make    
    lw t1, 0(t4)
    la t4,color    
    lw t4, 0(t4)
    la a0,count    
    lw a5, 0(a0)
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end2
if_thenBB2:
    slli t4,s8,    2
    addi t4,t4,    4
    add t4,s7,t4
    lw t4, 0(t4)
    lw t4, 4(t4)
    li t1, 15
    sub t4,t1,t4
    slli t1,s8,    2
    addi t1,t1,    4
    add t1,s7,t1
    lw t1, 0(t1)
    lw t1, 8(t1)
    sub t4,t4,t1
    slli t1,s8,    2
    addi t1,t1,    4
    add t1,s7,t1
    lw a0, 0(t1)
    slli t1,s1,    2
    addi t1,t1,    4
    add t1,a0,t1
    sw t4,0(t1)
    slli t4,s8,    2
    addi t4,t4,    4
    add t4,s7,t4
    lw t4, 0(t4)
    slli t1,s1,    2
    addi t1,t1,    4
    add t4,t4,t1
    lw t4, 0(t4)
    bgt	t4,zero,	ifTrue2
    j	paracopy4
ifTrue2:
    slli t4,s8,    2
    addi t4,t4,    4
    add t4,s7,t4
    lw t1, 0(t4)
    slli t4,s1,    2
    addi t4,t4,    4
    add t4,t1,t4
    lw t4, 0(t4)
    li t1, 10
    blt	t4,t1,	ifTrue3
    j	paracopy5
ifTrue3:
    slli t4,s8,    2
    addi t4,t4,    4
    add t4,s7,t4
    lw t1, 0(t4)
    slli t4,s1,    2
    addi t4,t4,    4
    add t4,t1,t4
    lw t4, 0(t4)
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,s11,t4
    lw t4, 0(t4)
    beq	t4,zero,	if_thenBB5
    j	paracopy6
if_thenBB5:
    slli t4,s8,    2
    addi t4,t4,    4
    add t4,s7,t4
    lw t1, 0(t4)
    slli t4,s1,    2
    addi t4,t4,    4
    add t4,t1,t4
    lw t4, 0(t4)
    slli t4,t4,    2
    addi t4,t4,    4
    add t4,s11,t4
    li t1, 1
    sw t1,0(t4)
    li t4, 2
    beq	s1,t4,	if_thenBB6
    j	if_elseBB4
if_thenBB6:
    addi a0,s8,    1
    slli t4,s8,    2
    addi t4,t4,    4
    add t4,s7,t4
    lw t4, 0(t4)
    slli t1,s1,    2
    addi t1,t1,    4
    add t4,t4,t1
    lw t4, 0(t4)
    add a2,s10,t4
    lui t4,%hi(count)
    sw s0, %lo(count)(t4)
    lui t4,%hi(color)
    sw s11, %lo(color)(t4)
    lui t4,%hi(make)
    sw s7, %lo(make)(t4)
    mv	a1,zero 
    call	search
    la t4,make    
    lw t1, 0(t4)
    la t4,color    
    lw t4, 0(t4)
    la a0,count    
    lw a5, 0(a0)
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end3
if_end3:
    slli a0,s8,    2
    addi a0,a0,    4
    add a0,t1,a0
    lw a1, 0(a0)
    slli a0,s1,    2
    addi a0,a0,    4
    add a0,a1,a0
    lw a0, 0(a0)
    slli a0,a0,    2
    addi a0,a0,    4
    add a0,t4,a0
    li a1, 0
    sw a1,0(a0)
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
if_elseBB4:
    addi a1,s1,    1
    slli t4,s8,    2
    addi t4,t4,    4
    add t4,s7,t4
    lw t4, 0(t4)
    slli t1,s1,    2
    addi t1,t1,    4
    add t4,t4,t1
    lw t4, 0(t4)
    add a2,s10,t4
    lui t4,%hi(count)
    sw s0, %lo(count)(t4)
    lui t4,%hi(color)
    sw s11, %lo(color)(t4)
    lui t4,%hi(make)
    sw s7, %lo(make)(t4)
    mv	a0,s8 
    call	search
    la t4,make    
    lw t1, 0(t4)
    la t4,color    
    lw t4, 0(t4)
    la a0,count    
    lw a5, 0(a0)
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end3
paracopy6:
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
paracopy5:
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
paracopy4:
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
ifTrue1:
    li t4, 2
    beq	s1,t4,	if_thenBB7
    j	if_elseBB1
if_thenBB7:
    li t4, 45
    sub t1,t4,s10
    lw t4, 12(s7)
    sw t1,12(t4)
    lw t4, 4(s7)
    lw t1, 4(s7)
    lw a0, 4(t4)
    lw t4, 8(t1)
    add t1,a0,t4
    lw t4, 4(s7)
    lw t4, 12(t4)
    add t4,t1,t4
    lw t1, 8(s7)
    lw a0, 8(s7)
    lw a1, 4(t1)
    lw t1, 8(a0)
    add a0,a1,t1
    lw t1, 8(s7)
    lw t1, 12(t1)
    add t1,a0,t1
    beq	t1,t4,	ifTrue4
    j	paracopy7
ifTrue4:
    lw t1, 12(s7)
    lw a0, 12(s7)
    lw a1, 4(t1)
    lw t1, 8(a0)
    add t1,a1,t1
    lw a0, 12(s7)
    lw a0, 12(a0)
    add t1,t1,a0
    beq	t1,t4,	ifTrue5
    j	paracopy8
paracopy8:
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
ifTrue5:
    lw t1, 4(s7)
    lw a0, 8(s7)
    lw a1, 4(t1)
    lw t1, 4(a0)
    add t1,a1,t1
    lw a0, 12(s7)
    lw a0, 4(a0)
    add t1,t1,a0
    beq	t1,t4,	ifTrue6
    j	paracopy9
ifTrue6:
    lw a0, 4(s7)
    lw t1, 8(s7)
    lw a0, 8(a0)
    lw t1, 8(t1)
    add t1,a0,t1
    lw a0, 12(s7)
    lw a0, 8(a0)
    add t1,t1,a0
    beq	t1,t4,	ifTrue7
    j	paracopy10
paracopy10:
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
ifTrue7:
    lw a0, 4(s7)
    lw t1, 8(s7)
    lw a0, 12(a0)
    lw t1, 12(t1)
    add a0,a0,t1
    lw t1, 12(s7)
    lw t1, 12(t1)
    add t1,a0,t1
    beq	t1,t4,	ifTrue8
    j	paracopy11
ifTrue8:
    lw a0, 4(s7)
    lw t1, 8(s7)
    lw a0, 4(a0)
    lw t1, 8(t1)
    add a0,a0,t1
    lw t1, 12(s7)
    lw t1, 12(t1)
    add t1,a0,t1
    beq	t1,t4,	ifTrue9
    j	paracopy12
ifTrue9:
    lw a0, 12(s7)
    lw t1, 8(s7)
    lw a0, 4(a0)
    lw t1, 8(t1)
    add t1,a0,t1
    lw a0, 4(s7)
    lw a0, 12(a0)
    add t1,t1,a0
    beq	t1,t4,	if_thenBB8
    j	paracopy13
if_thenBB8:
    lw t4, 4(s0)
    addi t4,t4,    1
    sw t4,4(s0)
    mv	s10,zero 
    j	forcondBB2
forcondBB2:
    li t4, 2
    ble	s10,t4,	forbodyBB2
    j	afterForBB1
forbodyBB2:
    mv	s8,zero 
    j	forcondBB3
forcondBB3:
    li t4, 2
    ble	s8,t4,	forbodyBB3
    j	afterForBB2
forbodyBB3:
    slli t4,s10,    2
    addi t4,t4,    4
    add t4,s7,t4
    lw t1, 0(t4)
    slli t4,s8,    2
    addi t4,t4,    4
    add t4,t1,t4
    lw a0, 0(t4)
    call	toString
    call	print
    la a0,_globalStr0    
    call	print
    addi s8,s8,    1
    j	forcondBB3
afterForBB2:
    la a0,_globalStr1    
    call	print
    addi s10,s10,    1
    j	forcondBB2
afterForBB1:
    la a0,_globalStr1    
    call	print
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
paracopy13:
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
paracopy12:
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
paracopy11:
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
paracopy9:
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
paracopy7:
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
paracopy1:
    mv	a5,s0 
    mv	t1,s7 
    mv	t4,s11 
    mv	a0,a5 
    mv	a0,t1 
    mv	a0,t4 
    j	if_end1
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -32
    sw ra, 16(sp) 
    sw s1, 4(sp) 
    sw s0, 0(sp) 
    sw s11, 12(sp) 
    sw s10, 8(sp) 
    li a0, 44
    call malloc
    li t4, 10
    sw t4,0(a0)
    mv	s1,a0 
    li a0, 8
    call malloc
    li t4, 1
    sw t4,0(a0)
    mv	s0,a0 
    li t4, 0
    sw t4,4(s0)
    li a0, 16
    call malloc
    li t4, 3
    sw t4,0(a0)
    mv	s11,a0 
    mv	s10,zero 
    j	__forcondBB1
__forcondBB1:
    li t4, 3
    blt	s10,t4,	__forbodyBB1
    j	afterCallBB1
__forbodyBB1:
    li a0, 16
    call malloc
    li t4, 3
    sw t4,0(a0)
    slli t4,s10,    2
    addi t4,t4,    4
    add t4,s11,t4
    sw a0,0(t4)
    mv	t4,zero 
    j	__forcondBB2
__forcondBB2:
    li t1, 3
    blt	t4,t1,	__forbodyBB2
    j	__forupdateBB1
__forbodyBB2:
    slli t1,s10,    2
    addi t1,t1,    4
    add t1,s11,t1
    lw a0, 0(t1)
    slli t1,t4,    2
    addi t1,t1,    4
    add t1,a0,t1
    li a0, 0
    sw a0,0(t1)
    addi t4,t4,    1
    j	__forcondBB2
__forupdateBB1:
    addi t4,s10,    1
    mv	s10,t4 
    mv	t4,s10 
    j	__forcondBB1
afterCallBB1:
    lui t4,%hi(count)
    sw s0, %lo(count)(t4)
    lui t4,%hi(color)
    sw s1, %lo(color)(t4)
    lui t4,%hi(make)
    sw s11, %lo(make)(t4)
    mv	a0,zero 
    mv	a1,zero 
    mv	a2,zero 
    call	search
    la t4,make    
    lw s10, 0(t4)
    la t4,color    
    lw s0, 0(t4)
    la t4,count    
    lw s11, 0(t4)
    lw a0, 4(s11)
    call	toString
    call	println
    lui t4,%hi(count)
    sw s11, %lo(count)(t4)
    lui t4,%hi(color)
    sw s0, %lo(color)(t4)
    lui t4,%hi(make)
    sw s10, %lo(make)(t4)
    lw s10, 8(sp) 
    lw s11, 12(sp) 
    lw s0, 0(sp) 
    lw s1, 4(sp) 
    lw ra, 16(sp) 
    mv	a0,zero 
    addi sp,sp,    32
    ret
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	color					#@color
    .p2align	2
color:
    .word	0
     
    .globl	count					#@count
    .p2align	2
count:
    .word	0
     
    .globl	i					#@i
    .p2align	2
i:
    .word	0
     
    .globl	j					#@j
    .p2align	2
j:
    .word	0
     
    .globl	make					#@make
    .p2align	2
make:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  " "    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  "\n"    
