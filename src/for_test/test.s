    .text
    .globl	Array_Node.front				#begin
    .p2align	2
    .type	Array_Node.front,@function
Array_Node.front:
Array_Node.front.entryBB1:
    lw t3, 0(a0)
    lw a0, 4(t3)
    ret
								 # func end
    .globl	Array_Node.doubleStorage				#begin
    .p2align	2
    .type	Array_Node.doubleStorage,@function
Array_Node.doubleStorage:
Array_Node.doubleStorage.entryBB1:
    addi sp,sp,    -32
    sw ra, 8(sp) 
    sw s2, 16(sp) 
    sw s3, 12(sp) 
    sw s4, 4(sp) 
    sw s5, 0(sp) 
    mv	s2,s6 
    mv	s5,a0 
    lw s6, 0(s5)
    lw s4, 4(s5)
    lw t3, 0(s6)
    slli s3,t3,    1
    slli t3,s3,    2
    addi a0,t3,    4
    call malloc
    sw s3,0(a0)
    sw a0,0(s5)
    li t3, 0
    sw t3,4(s5)
    j	forcondBB1
forcondBB1:
    lw t3, 4(s5)
    bne	t3,s4,	forbodyBB1
    j	afterForBB1
afterForBB1:
    mv	s6,s2 
    lw s5, 0(sp) 
    lw s4, 4(sp) 
    lw s3, 12(sp) 
    lw s2, 16(sp) 
    lw ra, 8(sp) 
    addi sp,sp,    32
    ret
forbodyBB1:
    lw t3, 4(s5)
    slli t3,t3,    2
    addi t3,t3,    4
    add t0,s6,t3
    lw a5, 0(s5)
    lw t3, 4(s5)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,a5,t3
    lw a5, 0(t0)
    sw a5,0(t3)
    addi t3,s5,    4
    lw a5, 0(t3)
    addi a5,a5,    1
    sw a5,0(t3)
    j	forcondBB1
								 # func end
    .globl	Heap_Node.maxHeapify				#begin
    .p2align	2
    .type	Heap_Node.maxHeapify,@function
Heap_Node.maxHeapify:
Heap_Node.maxHeapify.entryBB1:
    addi sp,sp,    -16
    sw ra, 0(sp) 
    slli t3,a1,    1
    addi a5,t3,    1
    slli t3,a1,    1
    addi t3,t3,    2
    add a2,a0,zero
    lw t0, 0(a2)
    lw t0, 4(t0)
    blt	a5,t0,	ifTrue1
    j	paracopy1
ifTrue1:
    lw t0, 0(a0)
    lw t0, 0(t0)
    slli a3,a1,    2
    addi a3,a3,    4
    add t0,t0,a3
    lw t0, 0(t0)
    addi a3,t0,    4
    lw t0, 0(a3)
    sub t1,zero,t0
    sw t0,0(a3)
    lw t0, 0(a0)
    lw a3, 0(t0)
    slli t0,a5,    2
    addi t0,t0,    4
    add t0,a3,t0
    lw t0, 0(t0)
    addi t0,t0,    4
    lw a3, 0(t0)
    sub a4,zero,a3
    sw a3,0(t0)
    bgt	a4,t1,	if_thenBB1
    j	paracopy2
if_thenBB1:
    j	if_end1
if_end1:
    lw t0, 0(a2)
    lw t0, 4(t0)
    blt	t3,t0,	ifTrue2
    j	paracopy3
ifTrue2:
    lw t0, 0(a0)
    lw a3, 0(t0)
    slli t0,a5,    2
    addi t0,t0,    4
    add t0,a3,t0
    lw t0, 0(t0)
    addi t0,t0,    4
    lw t1, 0(t0)
    sub a3,zero,t1
    sw t1,0(t0)
    lw t0, 0(a0)
    lw t1, 0(t0)
    slli t0,t3,    2
    addi t0,t0,    4
    add t0,t1,t0
    lw t0, 0(t0)
    addi t1,t0,    4
    lw t0, 0(t1)
    sub a4,zero,t0
    sw t0,0(t1)
    bgt	a4,a3,	if_thenBB2
    j	paracopy4
paracopy4:
    j	if_end2
if_end2:
    beq	a5,a1,	Heap_Node.maxHeapify.exitBB1
    j	if_end3
Heap_Node.maxHeapify.exitBB1:
    lw ra, 0(sp) 
    addi sp,sp,    16
    ret
if_end3:
    add a3,a0,zero
    lw t5, 0(a3)
    lw t3, 0(t5)
    slli t0,a1,    2
    addi t0,t0,    4
    add t3,t3,t0
    lw a4, 0(t3)
    lw t0, 0(t5)
    slli t3,a5,    2
    addi t3,t3,    4
    add t1,t0,t3
    lw t0, 0(t5)
    slli t3,a1,    2
    addi t3,t3,    4
    add t3,t0,t3
    lw t0, 0(t1)
    sw t0,0(t3)
    lw t0, 0(t5)
    slli t3,a5,    2
    addi t3,t3,    4
    add t3,t0,t3
    sw a4,0(t3)
    slli t3,a5,    1
    addi t3,t3,    1
    slli t0,a5,    1
    addi t0,t0,    2
    lw a1, 0(a2)
    lw a1, 4(a1)
    blt	t3,a1,	_copy_ifTrue1
    j	paracopy5
_copy_ifTrue1:
    lw a1, 0(a0)
    lw a1, 0(a1)
    slli t1,a5,    2
    addi t1,t1,    4
    add a1,a1,t1
    lw a1, 0(a1)
    addi t1,a1,    4
    lw a1, 0(t1)
    sub a4,zero,a1
    sw a1,0(t1)
    lw a1, 0(a0)
    lw t1, 0(a1)
    slli a1,t3,    2
    addi a1,a1,    4
    add a1,t1,a1
    lw a1, 0(a1)
    addi a1,a1,    4
    lw t1, 0(a1)
    sub t5,zero,t1
    sw t1,0(a1)
    bgt	t5,a4,	_copy_if_thenBB1
    j	paracopy6
paracopy6:
    mv	t3,a5 
    j	_copy_if_end1
_copy_if_end1:
    lw a1, 0(a2)
    lw a1, 4(a1)
    blt	t0,a1,	_copy_ifTrue2
    j	paracopy7
_copy_ifTrue2:
    lw a1, 0(a0)
    lw a1, 0(a1)
    slli t1,t3,    2
    addi t1,t1,    4
    add a1,a1,t1
    lw a1, 0(a1)
    addi a1,a1,    4
    lw t1, 0(a1)
    sub a4,zero,t1
    sw t1,0(a1)
    lw a1, 0(a0)
    lw t1, 0(a1)
    slli a1,t0,    2
    addi a1,a1,    4
    add a1,t1,a1
    lw a1, 0(a1)
    addi t5,a1,    4
    lw a1, 0(t5)
    sub t1,zero,a1
    sw a1,0(t5)
    bgt	t1,a4,	_copy_if_thenBB2
    j	paracopy8
_copy_if_thenBB2:
    mv	t3,t0 
    j	_copy_if_end2
_copy_if_end2:
    beq	t3,a5,	Heap_Node.maxHeapify.exitBB1
    j	_copy_if_end3
_copy_if_end3:
    lw a4, 0(a3)
    lw a1, 0(a4)
    slli t0,a5,    2
    addi t0,t0,    4
    add t0,a1,t0
    lw t0, 0(t0)
    lw a1, 0(a4)
    slli t1,t3,    2
    addi t1,t1,    4
    add t1,a1,t1
    lw a1, 0(a4)
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,a1,a5
    lw a1, 0(t1)
    sw a1,0(a5)
    lw a1, 0(a4)
    slli a5,t3,    2
    addi a5,a5,    4
    add a5,a1,a5
    sw t0,0(a5)
    slli a5,t3,    1
    addi t0,a5,    1
    slli a5,t3,    1
    addi a5,a5,    2
    lw a1, 0(a2)
    lw a1, 4(a1)
    blt	t0,a1,	_copy_ifTrue3
    j	paracopy9
paracopy9:
    mv	t0,t3 
    j	_copy_if_end4
_copy_if_end4:
    lw a1, 0(a2)
    lw a1, 4(a1)
    blt	a5,a1,	_copy_ifTrue4
    j	paracopy10
paracopy10:
    j	_copy_if_end5
_copy_if_end5:
    beq	t0,t3,	Heap_Node.maxHeapify.exitBB1
    j	_copy_if_end6
_copy_if_end6:
    lw a5, 0(a3)
    lw t1, 0(a5)
    slli a1,t3,    2
    addi a1,a1,    4
    add a1,t1,a1
    lw a1, 0(a1)
    lw a4, 0(a5)
    slli t1,t0,    2
    addi t1,t1,    4
    add a4,a4,t1
    lw t1, 0(a5)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,t1,t3
    lw t1, 0(a4)
    sw t1,0(t3)
    lw a5, 0(a5)
    slli t3,t0,    2
    addi t3,t3,    4
    add t3,a5,t3
    sw a1,0(t3)
    slli t3,t0,    1
    addi t3,t3,    1
    slli a5,t0,    1
    addi a5,a5,    2
    lw a1, 0(a2)
    lw a1, 4(a1)
    blt	t3,a1,	_copy_ifTrue5
    j	paracopy11
_copy_ifTrue5:
    lw a1, 0(a0)
    lw t1, 0(a1)
    slli a1,t0,    2
    addi a1,a1,    4
    add a1,t1,a1
    lw a1, 0(a1)
    addi t1,a1,    4
    lw a1, 0(t1)
    sub t5,zero,a1
    sw a1,0(t1)
    lw a1, 0(a0)
    lw a1, 0(a1)
    slli t1,t3,    2
    addi t1,t1,    4
    add a1,a1,t1
    lw a1, 0(a1)
    addi a4,a1,    4
    lw a1, 0(a4)
    sub t1,zero,a1
    sw a1,0(a4)
    bgt	t1,t5,	_copy_if_thenBB3
    j	paracopy12
paracopy12:
    mv	t3,t0 
    j	_copy_if_end7
_copy_if_end7:
    lw a1, 0(a2)
    lw a1, 4(a1)
    blt	a5,a1,	_copy_ifTrue6
    j	paracopy13
paracopy13:
    mv	a5,t3 
    j	_copy_if_end8
_copy_if_end8:
    beq	a5,t0,	Heap_Node.maxHeapify.exitBB1
    j	_copy_if_end9
_copy_if_end9:
    lw a1, 0(a3)
    lw t3, 0(a1)
    slli t1,t0,    2
    addi t1,t1,    4
    add t3,t3,t1
    lw t1, 0(t3)
    lw a4, 0(a1)
    slli t3,a5,    2
    addi t3,t3,    4
    add a4,a4,t3
    lw t3, 0(a1)
    slli t0,t0,    2
    addi t0,t0,    4
    add t3,t3,t0
    lw t0, 0(a4)
    sw t0,0(t3)
    lw t3, 0(a1)
    slli t0,a5,    2
    addi t0,t0,    4
    add t3,t3,t0
    sw t1,0(t3)
    slli t3,a5,    1
    addi t3,t3,    1
    slli t0,a5,    1
    addi a1,t0,    2
    lw t0, 0(a2)
    lw t0, 4(t0)
    blt	t3,t0,	_copy_ifTrue7
    j	paracopy14
_copy_ifTrue7:
    lw t0, 0(a0)
    lw t1, 0(t0)
    slli t0,a5,    2
    addi t0,t0,    4
    add t0,t1,t0
    lw t0, 0(t0)
    addi t0,t0,    4
    lw a4, 0(t0)
    sub t1,zero,a4
    sw a4,0(t0)
    lw t0, 0(a0)
    lw a4, 0(t0)
    slli t0,t3,    2
    addi t0,t0,    4
    add t0,a4,t0
    lw t0, 0(t0)
    addi a4,t0,    4
    lw t0, 0(a4)
    sub t5,zero,t0
    sw t0,0(a4)
    bgt	t5,t1,	_copy_if_thenBB4
    j	paracopy15
paracopy15:
    mv	t3,a5 
    j	_copy_if_end10
_copy_if_end10:
    lw t0, 0(a2)
    lw t0, 4(t0)
    blt	a1,t0,	_copy_ifTrue8
    j	paracopy16
_copy_ifTrue8:
    lw t0, 0(a0)
    lw a2, 0(t0)
    slli t0,t3,    2
    addi t0,t0,    4
    add t0,a2,t0
    lw t0, 0(t0)
    addi t1,t0,    4
    lw a2, 0(t1)
    sub t0,zero,a2
    sw a2,0(t1)
    lw a2, 0(a0)
    lw t1, 0(a2)
    slli a2,a1,    2
    addi a2,a2,    4
    add a2,t1,a2
    lw a2, 0(a2)
    addi a4,a2,    4
    lw t1, 0(a4)
    sub a2,zero,t1
    sw t1,0(a4)
    bgt	a2,t0,	_copy_if_thenBB5
    j	paracopy17
paracopy17:
    mv	a1,t3 
    j	_copy_if_end11
_copy_if_end11:
    beq	a1,a5,	Heap_Node.maxHeapify.exitBB1
    j	_copy_if_end12
_copy_if_end12:
    lw a3, 0(a3)
    lw t3, 0(a3)
    slli t0,a5,    2
    addi t0,t0,    4
    add t3,t3,t0
    lw t0, 0(t3)
    lw t3, 0(a3)
    slli a2,a1,    2
    addi a2,a2,    4
    add a2,t3,a2
    lw t3, 0(a3)
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,t3,a5
    lw t3, 0(a2)
    sw t3,0(a5)
    lw a5, 0(a3)
    slli t3,a1,    2
    addi t3,t3,    4
    add t3,a5,t3
    sw t0,0(t3)
    call	Heap_Node.maxHeapify
    j	Heap_Node.maxHeapify.exitBB1
_copy_if_thenBB5:
    j	_copy_if_end11
paracopy16:
    mv	a1,t3 
    j	_copy_if_end11
_copy_if_thenBB4:
    j	_copy_if_end10
paracopy14:
    mv	t3,a5 
    j	_copy_if_end10
_copy_ifTrue6:
    lw a1, 0(a0)
    lw a1, 0(a1)
    slli t1,t3,    2
    addi t1,t1,    4
    add a1,a1,t1
    lw a1, 0(a1)
    addi a1,a1,    4
    lw t1, 0(a1)
    sub a4,zero,t1
    sw t1,0(a1)
    lw a1, 0(a0)
    lw a1, 0(a1)
    slli t1,a5,    2
    addi t1,t1,    4
    add a1,a1,t1
    lw a1, 0(a1)
    addi t5,a1,    4
    lw a1, 0(t5)
    sub t1,zero,a1
    sw a1,0(t5)
    bgt	t1,a4,	_copy_if_thenBB6
    j	paracopy18
paracopy18:
    mv	a5,t3 
    j	_copy_if_end8
_copy_if_thenBB6:
    j	_copy_if_end8
_copy_if_thenBB3:
    j	_copy_if_end7
paracopy11:
    mv	t3,t0 
    j	_copy_if_end7
_copy_ifTrue4:
    lw a1, 0(a0)
    lw a1, 0(a1)
    slli t1,t0,    2
    addi t1,t1,    4
    add a1,a1,t1
    lw a1, 0(a1)
    addi a1,a1,    4
    lw a4, 0(a1)
    sub t1,zero,a4
    sw a4,0(a1)
    lw a1, 0(a0)
    lw a4, 0(a1)
    slli a1,a5,    2
    addi a1,a1,    4
    add a1,a4,a1
    lw a1, 0(a1)
    addi t5,a1,    4
    lw a4, 0(t5)
    sub a1,zero,a4
    sw a4,0(t5)
    bgt	a1,t1,	_copy_if_thenBB7
    j	paracopy19
paracopy19:
    j	_copy_if_end5
_copy_if_thenBB7:
    mv	t0,a5 
    j	_copy_if_end5
_copy_ifTrue3:
    lw a1, 0(a0)
    lw t1, 0(a1)
    slli a1,t3,    2
    addi a1,a1,    4
    add a1,t1,a1
    lw a1, 0(a1)
    addi t1,a1,    4
    lw a1, 0(t1)
    sub a4,zero,a1
    sw a1,0(t1)
    lw a1, 0(a0)
    lw a1, 0(a1)
    slli t1,t0,    2
    addi t1,t1,    4
    add a1,a1,t1
    lw a1, 0(a1)
    addi a1,a1,    4
    lw t5, 0(a1)
    sub t1,zero,t5
    sw t5,0(a1)
    bgt	t1,a4,	_copy_if_thenBB8
    j	paracopy20
_copy_if_thenBB8:
    j	_copy_if_end4
paracopy20:
    mv	t0,t3 
    j	_copy_if_end4
paracopy8:
    j	_copy_if_end2
paracopy7:
    j	_copy_if_end2
_copy_if_thenBB1:
    j	_copy_if_end1
paracopy5:
    mv	t3,a5 
    j	_copy_if_end1
if_thenBB2:
    mv	a5,t3 
    j	if_end2
paracopy3:
    j	if_end2
paracopy2:
    mv	a5,a1 
    j	if_end1
paracopy1:
    mv	a5,a1 
    j	if_end1
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -80
    sw ra, 8(sp) 
    sw s2, 4(sp) 
    sw s3, 48(sp) 
    sw s4, 40(sp) 
    sw s5, 24(sp) 
    sw s6, 12(sp) 
    sw s7, 0(sp) 
    sw s8, 20(sp) 
    sw s9, 60(sp) 
    sw s10, 32(sp) 
    sw s11, 16(sp) 
    sw s0, 44(sp) 
    sw s1, 56(sp) 
    call	getInt
    mv	s11,a0 
    call	getInt
    mv	s3,a0 
    li a0, 16
    call malloc
    mv	s1,a0 
    slli t3,s3,    2
    addi a0,t3,    4
    call malloc
    sw s3,0(a0)
    sw a0,0(s1)
    slli t3,s3,    2
    addi a0,t3,    4
    call malloc
    sw s3,0(a0)
    sw a0,4(s1)
    slli t3,s11,    2
    addi a0,t3,    4
    call malloc
    sw s11,0(a0)
    sw a0,8(s1)
    mv	t3,zero 
    j	_forcondBB1
_forcondBB1:
    blt	t3,s3,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	t3,zero 
    j	_forcondBB2
_forcondBB2:
    blt	t3,s11,	_forbodyBB2
    j	afterCallBB1
afterCallBB1:
    li t3, 0
    sw t3,12(s1)
    mv	s6,zero 
    j	__forcondBB1
__forcondBB1:
    blt	s6,s3,	__forbodyBB1
    j	_afterCallBB1
_afterCallBB1:
    mv	s8,zero 
    j	_forcondBB3
_forcondBB3:
    blt	s8,s11,	_forbodyBB3
    j	afterCallBB2
afterCallBB2:
    lw s1, 56(sp) 
    lw s0, 44(sp) 
    lw s11, 16(sp) 
    lw s10, 32(sp) 
    lw s9, 60(sp) 
    lw s8, 20(sp) 
    lw s7, 0(sp) 
    lw s6, 12(sp) 
    lw s5, 24(sp) 
    lw s4, 40(sp) 
    lw s3, 48(sp) 
    lw s2, 4(sp) 
    lw ra, 8(sp) 
    mv	a0,zero 
    addi sp,sp,    80
    ret
_forbodyBB3:
    slli t3,s11,    2
    addi a0,t3,    4
    call malloc
    mv	s9,a0 
    sw s11,0(s9)
    slli t3,s11,    2
    addi a0,t3,    4
    call malloc
    mv	s4,a0 
    sw s11,0(s4)
    mv	t3,zero 
    j	__forcondBB2
__forcondBB2:
    blt	t3,s11,	__forbodyBB2
    j	__afterForBB1
__afterForBB1:
    slli t3,s8,    2
    addi t3,t3,    4
    add t3,s4,t3
    li a5, 0
    sw a5,0(t3)
    li a0, 4
    call malloc
    mv	s6,a0 
    li a0, 8
    call malloc
    mv	s3,a0 
    li t3, 0
    sw t3,4(s3)
    li a0, 68
    call malloc
    li t3, 16
    sw t3,0(a0)
    sw a0,0(s3)
    sw s3,0(s6)
    li a0, 8
    call malloc
    mv	s0,a0 
    li t3, 0
    sw t3,4(s0)
    sw s8,0(s0)
    add t3,s6,zero
    sw t3, 28(sp) 
    lw t3, 28(sp) 
    lw s5, 0(t3)
    lw t3, 0(s5)
    lw t3, 0(t3)
    lw a5, 4(s5)
    beq	a5,t3,	____if_thenBB1
    j	___afterCallBB1
____if_thenBB1:
    lw s3, 0(s5)
    lw s2, 4(s5)
    lw t3, 0(s3)
    slli s10,t3,    1
    slli t3,s10,    2
    addi a0,t3,    4
    call malloc
    sw s10,0(a0)
    sw a0,0(s5)
    li t3, 0
    sw t3,4(s5)
    j	_forcondBB4
_forcondBB4:
    lw t3, 4(s5)
    bne	t3,s2,	_forbodyBB4
    j	___afterCallBB1
___afterCallBB1:
    lw a5, 0(s5)
    lw t3, 4(s5)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,a5,t3
    sw s0,0(t3)
    addi t3,s5,    4
    lw a5, 0(t3)
    addi a5,a5,    1
    sw a5,0(t3)
    add s0,s6,zero
    lw t3, 0(s0)
    lw a5, 4(t3)
    li t3, 1
    sub t3,a5,t3
    j	___whileCondBB1
___whileCondBB1:
    bgt	t3,zero,	___whileBodyBB1
    j	__whileCondBB1
__whileCondBB1:
    lw t3, 0(s0)
    lw t3, 4(t3)
    bne	t3,zero,	__whileBodyBB1
    j	_afterCallBB2
__whileBodyBB1:
    lw t3, 0(s6)
    lw t3, 0(t3)
    lw s3, 4(t3)
    lw a0, 0(s6)
    lw t3, 0(s0)
    lw a5, 4(t3)
    li t3, 1
    sub t0,a5,t3
    lw t3, 0(a0)
    lw a2, 4(t3)
    lw t3, 0(a0)
    slli a5,t0,    2
    addi a5,a5,    4
    add t3,t3,a5
    lw a5, 0(a0)
    lw t3, 0(t3)
    sw t3,4(a5)
    lw t3, 0(a0)
    slli a5,t0,    2
    addi a5,a5,    4
    add t3,t3,a5
    sw a2,0(t3)
    lw t3, 0(s6)
    addi a5,t3,    4
    lw t0, 0(a5)
    li a0, 1
    sub t0,t0,a0
    sw t0,0(a5)
    lw a5, 0(t3)
    lw t3, 4(t3)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,a5,t3
    lw t3, 0(t3)
    mv	a0,s6 
    mv	a1,zero 
    call	Heap_Node.maxHeapify
    lw s5, 0(s3)
    slli t3,s5,    2
    addi t3,t3,    4
    add t3,s9,t3
    lw t3, 0(t3)
    li a5, 1
    beq	t3,a5,	__whileCondBB1
    j	__if_end1
__if_end1:
    slli t3,s5,    2
    addi t3,t3,    4
    add t3,s9,t3
    li a5, 1
    sw a5,0(t3)
    lw t3, 8(s1)
    slli a5,s5,    2
    addi a5,a5,    4
    add t3,t3,a5
    lw t3, 0(t3)
    mv	s3,t3 
    j	__forcondBB3
__forcondBB3:
    li t3, -1
    bne	s3,t3,	__forbodyBB3
    j	__whileCondBB1
__forbodyBB3:
    lw t3, 0(s1)
    slli a5,s3,    2
    addi a5,a5,    4
    add t3,t3,a5
    lw t3, 0(t3)
    lw s2, 4(t3)
    lw t3, 0(s1)
    slli a5,s3,    2
    addi a5,a5,    4
    add t3,t3,a5
    lw t3, 0(t3)
    lw a5, 8(t3)
    slli t3,s5,    2
    addi t3,t3,    4
    add t3,s4,t3
    lw t3, 0(t3)
    add a5,t3,a5
    slli t3,s2,    2
    addi t3,t3,    4
    add t3,s4,t3
    lw t3, 0(t3)
    bge	a5,t3,	__forupdateBB1
    j	__if_end2
__forupdateBB1:
    lw a5, 4(s1)
    slli t3,s3,    2
    addi t3,t3,    4
    add t3,a5,t3
    lw t3, 0(t3)
    mv	s3,t3 
    j	__forcondBB3
__if_end2:
    slli t3,s2,    2
    addi t3,t3,    4
    add t3,s4,t3
    sw a5,0(t3)
    li a0, 8
    call malloc
    mv	s10,a0 
    sw s2,0(s10)
    slli t3,s2,    2
    addi t3,t3,    4
    add t3,s4,t3
    lw t3, 0(t3)
    sw t3,4(s10)
    lw t3, 28(sp) 
    lw s2, 0(t3)
    lw t3, 0(s2)
    lw a5, 0(t3)
    lw t3, 4(s2)
    beq	t3,a5,	____if_thenBB2
    j	___afterCallBB2
____if_thenBB2:
    lw s7, 0(s2)
    lw t3, 4(s2)
    sw t3, 36(sp) 
    lw t3, 0(s7)
    slli t3,t3,    1
    sw t3, 52(sp) 
    lw t3, 52(sp) 
    slli t3,t3,    2
    addi a0,t3,    4
    call malloc
    lw t3, 52(sp) 
    sw t3,0(a0)
    sw a0,0(s2)
    li t3, 0
    sw t3,4(s2)
    j	_forcondBB5
_forcondBB5:
    lw t3, 4(s2)
    lw a5, 36(sp) 
    bne	t3,a5,	_forbodyBB5
    j	___afterCallBB2
___afterCallBB2:
    lw a5, 0(s2)
    lw t3, 4(s2)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,a5,t3
    sw s10,0(t3)
    addi a5,s2,    4
    lw t3, 0(a5)
    addi t3,t3,    1
    sw t3,0(a5)
    lw t3, 0(s0)
    lw t3, 4(t3)
    li a5, 1
    sub a5,t3,a5
    j	___whileCondBB2
___whileCondBB2:
    bgt	a5,zero,	___whileBodyBB2
    j	__forupdateBB1
___whileBodyBB2:
    li t3, 1
    sub t3,a5,t3
    srai t3,t3,    1
    lw t0, 0(s6)
    lw a0, 0(t0)
    slli t0,a5,    2
    addi t0,t0,    4
    add t0,a0,t0
    lw t0, 0(t0)
    addi a0,t0,    4
    lw t0, 0(a0)
    sub a3,zero,t0
    sw t0,0(a0)
    lw t0, 0(s6)
    lw a0, 0(t0)
    slli t0,t3,    2
    addi t0,t0,    4
    add t0,a0,t0
    lw t0, 0(t0)
    addi a2,t0,    4
    lw t0, 0(a2)
    sub a0,zero,t0
    sw t0,0(a2)
    bge	a0,a3,	__forupdateBB1
    j	___if_end1
___if_end1:
    lw t0, 0(s6)
    lw a0, 0(t0)
    slli a2,t3,    2
    addi a2,a2,    4
    add a0,a0,a2
    lw a0, 0(a0)
    lw a3, 0(t0)
    slli a2,a5,    2
    addi a2,a2,    4
    add a3,a3,a2
    lw a2, 0(t0)
    slli a1,t3,    2
    addi a1,a1,    4
    add a2,a2,a1
    lw a3, 0(a3)
    sw a3,0(a2)
    lw t0, 0(t0)
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,t0,a5
    sw a0,0(a5)
    mv	a5,t3 
    j	___whileCondBB2
_forbodyBB5:
    lw t3, 4(s2)
    slli t3,t3,    2
    addi t3,t3,    4
    add a5,s7,t3
    lw t0, 0(s2)
    lw t3, 4(s2)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,t0,t3
    lw a5, 0(a5)
    sw a5,0(t3)
    addi a5,s2,    4
    lw t3, 0(a5)
    addi t3,t3,    1
    sw t3,0(a5)
    j	_forcondBB5
_afterCallBB2:
    mv	s6,zero 
    j	_forcondBB6
_forcondBB6:
    blt	s6,s11,	_forbodyBB6
    j	_afterForBB2
_forbodyBB6:
    slli t3,s6,    2
    addi t3,t3,    4
    add t3,s4,t3
    lw a5, 0(t3)
    li t3, 10000000
    beq	a5,t3,	_if_thenBB1
    j	_if_elseBB1
_if_elseBB1:
    slli t3,s6,    2
    addi t3,t3,    4
    add t3,s4,t3
    lw a0, 0(t3)
    call	printInt
    j	_if_end1
_if_end1:
    la a0,_globalStr1    
    call	print
    addi s6,s6,    1
    j	_forcondBB6
_if_thenBB1:
    la a0,_globalStr2    
    call	print
    j	_if_end1
_afterForBB2:
    la a0,_globalStr0    
    call	println
    addi t3,s8,    1
    mv	s8,t3 
    j	_forcondBB3
___whileBodyBB1:
    li a5, 1
    sub a5,t3,a5
    srai a5,a5,    1
    lw t0, 0(s6)
    lw a0, 0(t0)
    slli t0,t3,    2
    addi t0,t0,    4
    add t0,a0,t0
    lw t0, 0(t0)
    addi a2,t0,    4
    lw t0, 0(a2)
    sub a0,zero,t0
    sw t0,0(a2)
    lw t0, 0(s6)
    lw a2, 0(t0)
    slli t0,a5,    2
    addi t0,t0,    4
    add t0,a2,t0
    lw t0, 0(t0)
    addi t0,t0,    4
    lw a2, 0(t0)
    sub a3,zero,a2
    sw a2,0(t0)
    bge	a3,a0,	__whileCondBB1
    j	___if_end2
___if_end2:
    lw a2, 0(s6)
    lw a0, 0(a2)
    slli t0,a5,    2
    addi t0,t0,    4
    add t0,a0,t0
    lw a1, 0(t0)
    lw a0, 0(a2)
    slli t0,t3,    2
    addi t0,t0,    4
    add t0,a0,t0
    lw a0, 0(a2)
    slli a3,a5,    2
    addi a3,a3,    4
    add a0,a0,a3
    lw t0, 0(t0)
    sw t0,0(a0)
    lw t0, 0(a2)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,t0,t3
    sw a1,0(t3)
    mv	t3,a5 
    j	___whileCondBB1
_forbodyBB4:
    lw t3, 4(s5)
    slli t3,t3,    2
    addi t3,t3,    4
    add a5,s3,t3
    lw t0, 0(s5)
    lw t3, 4(s5)
    slli t3,t3,    2
    addi t3,t3,    4
    add t0,t0,t3
    lw t3, 0(a5)
    sw t3,0(t0)
    addi a5,s5,    4
    lw t3, 0(a5)
    addi t3,t3,    1
    sw t3,0(a5)
    j	_forcondBB4
__forbodyBB2:
    slli a5,t3,    2
    addi a5,a5,    4
    add a5,s4,a5
    li t0, 10000000
    sw t0,0(a5)
    slli a5,t3,    2
    addi a5,a5,    4
    add a5,s9,a5
    li t0, 0
    sw t0,0(a5)
    addi t3,t3,    1
    j	__forcondBB2
__forbodyBB1:
    call	getInt
    mv	s8,a0 
    call	getInt
    mv	s4,a0 
    call	getInt
    mv	s0,a0 
    li a0, 12
    call malloc
    sw s8,0(a0)
    sw s4,4(a0)
    sw s0,8(a0)
    lw a5, 0(s1)
    lw t3, 12(s1)
    slli t3,t3,    2
    addi t3,t3,    4
    add t3,a5,t3
    sw a0,0(t3)
    lw a5, 8(s1)
    slli t3,s8,    2
    addi t3,t3,    4
    add t3,a5,t3
    lw t0, 4(s1)
    lw a5, 12(s1)
    slli a5,a5,    2
    addi a5,a5,    4
    add a5,t0,a5
    lw t3, 0(t3)
    sw t3,0(a5)
    lw a5, 8(s1)
    slli t3,s8,    2
    addi t3,t3,    4
    add t3,a5,t3
    lw a5, 12(s1)
    sw a5,0(t3)
    addi a5,s1,    12
    lw t3, 0(a5)
    addi t3,t3,    1
    sw t3,0(a5)
    addi s6,s6,    1
    j	__forcondBB1
_forbodyBB2:
    lw a5, 8(s1)
    slli t0,t3,    2
    addi t0,t0,    4
    add a5,a5,t0
    li t0, -1
    sw t0,0(a5)
    addi t3,t3,    1
    j	_forcondBB2
_forbodyBB1:
    lw t0, 4(s1)
    slli a5,t3,    2
    addi a5,a5,    4
    add t0,t0,a5
    li a5, -1
    sw a5,0(t0)
    addi t3,t3,    1
    j	_forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	INF					#@INF
    .p2align	2
INF:
    .word	0
     
    .globl	g					#@g
    .p2align	2
g:
    .word	0
     
    .globl	m					#@m
    .p2align	2
m:
    .word	0
     
    .globl	n					#@n
    .p2align	2
n:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  ""    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  " "    
    .globl	_globalStr2					#@_globalStr2
_globalStr2:
    .asciz  "-1"    
