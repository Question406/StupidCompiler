    .text
    .globl	Array_Node.front				#begin
    .p2align	2
    .type	Array_Node.front,@function
Array_Node.front:
Array_Node.front.entryBB1:
    lw t0, 0(a0)
    lw a0, 4(t0)
    ret
								 # func end
    .globl	Array_Node.doubleStorage				#begin
    .p2align	2
    .type	Array_Node.doubleStorage,@function
Array_Node.doubleStorage:
Array_Node.doubleStorage.entryBB1:
    addi sp,sp,    -32
    sw ra, 8(sp) 
    sw s2, 4(sp) 
    sw s3, 12(sp) 
    sw s4, 0(sp) 
    sw s5, 16(sp) 
    mv	s2,s6 
    mv	s4,a0 
    lw s6, 0(s4)
    lw s5, 4(s4)
    lw t0, 0(s6)
    slli s3,t0,    1
    slli t0,s3,    2
    addi a0,t0,    4
    call malloc
    sw s3,0(a0)
    sw a0,0(s4)
    li t0, 0
    sw t0,4(s4)
    j	forcondBB1
forcondBB1:
    lw t0, 4(s4)
    bne	t0,s5,	forbodyBB1
    j	afterForBB1
forbodyBB1:
    lw t0, 4(s4)
    slli t0,t0,    2
    addi t0,t0,    4
    add a4,s6,t0
    lw t0, 0(s4)
    lw a1, 4(s4)
    slli a1,a1,    2
    addi a1,a1,    4
    add t0,t0,a1
    lw a4, 0(a4)
    sw a4,0(t0)
    addi a4,s4,    4
    lw t0, 0(a4)
    addi t0,t0,    1
    sw t0,0(a4)
    j	forcondBB1
afterForBB1:
    mv	s6,s2 
    lw s5, 16(sp) 
    lw s4, 0(sp) 
    lw s3, 12(sp) 
    lw s2, 4(sp) 
    lw ra, 8(sp) 
    addi sp,sp,    32
    ret
								 # func end
    .globl	Heap_Node.maxHeapify				#begin
    .p2align	2
    .type	Heap_Node.maxHeapify,@function
Heap_Node.maxHeapify:
Heap_Node.maxHeapify.entryBB1:
    addi sp,sp,    -16
    sw ra, 0(sp) 
    slli t0,a1,    1
    addi t0,t0,    1
    slli a4,a1,    1
    addi a4,a4,    2
    add t1,a0,zero
    lw a5, 0(t1)
    lw a5, 4(a5)
    blt	t0,a5,	ifTrue1
    j	paracopy1
ifTrue1:
    lw a5, 0(a0)
    lw a6, 0(a5)
    slli a5,a1,    2
    addi a5,a5,    4
    add a5,a6,a5
    lw a5, 0(a5)
    addi a5,a5,    4
    lw a6, 0(a5)
    sub a3,zero,a6
    sw a6,0(a5)
    lw a5, 0(a0)
    lw a5, 0(a5)
    slli a6,t0,    2
    addi a6,a6,    4
    add a5,a5,a6
    lw a5, 0(a5)
    addi a5,a5,    4
    lw t4, 0(a5)
    sub a6,zero,t4
    sw t4,0(a5)
    bgt	a6,a3,	if_thenBB1
    j	paracopy2
if_thenBB1:
    j	if_end1
if_end1:
    lw a5, 0(t1)
    lw a5, 4(a5)
    blt	a4,a5,	ifTrue2
    j	paracopy3
ifTrue2:
    lw a5, 0(a0)
    lw a6, 0(a5)
    slli a5,t0,    2
    addi a5,a5,    4
    add a5,a6,a5
    lw a5, 0(a5)
    addi a5,a5,    4
    lw a6, 0(a5)
    sub t4,zero,a6
    sw a6,0(a5)
    lw a5, 0(a0)
    lw a6, 0(a5)
    slli a5,a4,    2
    addi a5,a5,    4
    add a5,a6,a5
    lw a5, 0(a5)
    addi a3,a5,    4
    lw a6, 0(a3)
    sub a5,zero,a6
    sw a6,0(a3)
    bgt	a5,t4,	if_thenBB2
    j	paracopy4
paracopy4:
    j	if_end2
if_end2:
    beq	t0,a1,	Heap_Node.maxHeapify.exitBB1
    j	if_end3
if_end3:
    add a5,a0,zero
    lw a4, 0(a5)
    lw a3, 0(a4)
    slli a6,a1,    2
    addi a6,a6,    4
    add a6,a3,a6
    lw t4, 0(a6)
    lw a3, 0(a4)
    slli a6,t0,    2
    addi a6,a6,    4
    add a3,a3,a6
    lw a6, 0(a4)
    slli a1,a1,    2
    addi a1,a1,    4
    add a6,a6,a1
    lw a1, 0(a3)
    sw a1,0(a6)
    lw a4, 0(a4)
    slli a1,t0,    2
    addi a1,a1,    4
    add a4,a4,a1
    sw t4,0(a4)
    slli a4,t0,    1
    addi a4,a4,    1
    slli a1,t0,    1
    addi a1,a1,    2
    lw a6, 0(t1)
    lw a6, 4(a6)
    blt	a4,a6,	_copy_ifTrue1
    j	paracopy5
_copy_ifTrue1:
    lw a6, 0(a0)
    lw a3, 0(a6)
    slli a6,t0,    2
    addi a6,a6,    4
    add a6,a3,a6
    lw a6, 0(a6)
    addi t4,a6,    4
    lw a6, 0(t4)
    sub a3,zero,a6
    sw a6,0(t4)
    lw a6, 0(a0)
    lw t4, 0(a6)
    slli a6,a4,    2
    addi a6,a6,    4
    add a6,t4,a6
    lw a6, 0(a6)
    addi a6,a6,    4
    lw ra, 0(a6)
    sub t4,zero,ra
    sw ra,0(a6)
    bgt	t4,a3,	_copy_if_thenBB1
    j	paracopy6
_copy_if_thenBB1:
    j	_copy_if_end1
_copy_if_end1:
    lw a6, 0(t1)
    lw a6, 4(a6)
    blt	a1,a6,	_copy_ifTrue2
    j	paracopy7
_copy_ifTrue2:
    lw a6, 0(a0)
    lw a6, 0(a6)
    slli a3,a4,    2
    addi a3,a3,    4
    add a6,a6,a3
    lw a6, 0(a6)
    addi a3,a6,    4
    lw a6, 0(a3)
    sub t4,zero,a6
    sw a6,0(a3)
    lw a6, 0(a0)
    lw a3, 0(a6)
    slli a6,a1,    2
    addi a6,a6,    4
    add a6,a3,a6
    lw a6, 0(a6)
    addi a6,a6,    4
    lw a3, 0(a6)
    sub ra,zero,a3
    sw a3,0(a6)
    bgt	ra,t4,	_copy_if_thenBB2
    j	paracopy8
paracopy8:
    j	_copy_if_end2
_copy_if_end2:
    beq	a4,t0,	Heap_Node.maxHeapify.exitBB1
    j	_copy_if_end3
_copy_if_end3:
    lw a3, 0(a5)
    lw a6, 0(a3)
    slli a1,t0,    2
    addi a1,a1,    4
    add a1,a6,a1
    lw a1, 0(a1)
    lw t4, 0(a3)
    slli a6,a4,    2
    addi a6,a6,    4
    add a6,t4,a6
    lw t4, 0(a3)
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,t4,t0
    lw a6, 0(a6)
    sw a6,0(t0)
    lw a6, 0(a3)
    slli t0,a4,    2
    addi t0,t0,    4
    add t0,a6,t0
    sw a1,0(t0)
    slli t0,a4,    1
    addi t0,t0,    1
    slli a1,a4,    1
    addi a1,a1,    2
    lw a6, 0(t1)
    lw a6, 4(a6)
    blt	t0,a6,	_copy_ifTrue3
    j	paracopy9
paracopy9:
    mv	t0,a4 
    j	_copy_if_end4
_copy_if_end4:
    lw a6, 0(t1)
    lw a6, 4(a6)
    blt	a1,a6,	_copy_ifTrue4
    j	paracopy10
_copy_ifTrue4:
    lw a6, 0(a0)
    lw a3, 0(a6)
    slli a6,t0,    2
    addi a6,a6,    4
    add a6,a3,a6
    lw a6, 0(a6)
    addi a6,a6,    4
    lw t4, 0(a6)
    sub a3,zero,t4
    sw t4,0(a6)
    lw a6, 0(a0)
    lw a6, 0(a6)
    slli t4,a1,    2
    addi t4,t4,    4
    add a6,a6,t4
    lw a6, 0(a6)
    addi a6,a6,    4
    lw ra, 0(a6)
    sub t4,zero,ra
    sw ra,0(a6)
    bgt	t4,a3,	_copy_if_thenBB3
    j	paracopy11
_copy_if_thenBB3:
    j	_copy_if_end5
_copy_if_end5:
    beq	a1,a4,	Heap_Node.maxHeapify.exitBB1
    j	_copy_if_end6
_copy_if_end6:
    lw a6, 0(a5)
    lw a3, 0(a6)
    slli t0,a4,    2
    addi t0,t0,    4
    add t0,a3,t0
    lw t4, 0(t0)
    lw t0, 0(a6)
    slli a3,a1,    2
    addi a3,a3,    4
    add a3,t0,a3
    lw t0, 0(a6)
    slli a4,a4,    2
    addi a4,a4,    4
    add a4,t0,a4
    lw t0, 0(a3)
    sw t0,0(a4)
    lw a4, 0(a6)
    slli t0,a1,    2
    addi t0,t0,    4
    add t0,a4,t0
    sw t4,0(t0)
    slli t0,a1,    1
    addi a4,t0,    1
    slli t0,a1,    1
    addi t0,t0,    2
    lw a6, 0(t1)
    lw a6, 4(a6)
    blt	a4,a6,	_copy_ifTrue5
    j	paracopy12
_copy_ifTrue5:
    lw a6, 0(a0)
    lw a3, 0(a6)
    slli a6,a1,    2
    addi a6,a6,    4
    add a6,a3,a6
    lw a6, 0(a6)
    addi a3,a6,    4
    lw a6, 0(a3)
    sub t4,zero,a6
    sw a6,0(a3)
    lw a6, 0(a0)
    lw a3, 0(a6)
    slli a6,a4,    2
    addi a6,a6,    4
    add a6,a3,a6
    lw a6, 0(a6)
    addi a3,a6,    4
    lw ra, 0(a3)
    sub a6,zero,ra
    sw ra,0(a3)
    bgt	a6,t4,	_copy_if_thenBB4
    j	paracopy13
_copy_if_thenBB4:
    j	_copy_if_end7
_copy_if_end7:
    lw a6, 0(t1)
    lw a6, 4(a6)
    blt	t0,a6,	_copy_ifTrue6
    j	paracopy14
paracopy14:
    j	_copy_if_end8
_copy_if_end8:
    beq	a4,a1,	Heap_Node.maxHeapify.exitBB1
    j	_copy_if_end9
_copy_if_end9:
    lw a3, 0(a5)
    lw a6, 0(a3)
    slli t0,a1,    2
    addi t0,t0,    4
    add t0,a6,t0
    lw a6, 0(t0)
    lw t0, 0(a3)
    slli t4,a4,    2
    addi t4,t4,    4
    add ra,t0,t4
    lw t4, 0(a3)
    slli t0,a1,    2
    addi t0,t0,    4
    add t0,t4,t0
    lw a1, 0(ra)
    sw a1,0(t0)
    lw t0, 0(a3)
    slli a1,a4,    2
    addi a1,a1,    4
    add t0,t0,a1
    sw a6,0(t0)
    slli t0,a4,    1
    addi t0,t0,    1
    slli a1,a4,    1
    addi a1,a1,    2
    lw a6, 0(t1)
    lw a6, 4(a6)
    blt	t0,a6,	_copy_ifTrue7
    j	paracopy15
paracopy15:
    mv	t0,a4 
    j	_copy_if_end10
_copy_if_end10:
    lw t1, 0(t1)
    lw t1, 4(t1)
    blt	a1,t1,	_copy_ifTrue8
    j	paracopy16
_copy_ifTrue8:
    lw t1, 0(a0)
    lw t1, 0(t1)
    slli a6,t0,    2
    addi a6,a6,    4
    add t1,t1,a6
    lw t1, 0(t1)
    addi a6,t1,    4
    lw t1, 0(a6)
    sub t4,zero,t1
    sw t1,0(a6)
    lw t1, 0(a0)
    lw t1, 0(t1)
    slli a6,a1,    2
    addi a6,a6,    4
    add t1,t1,a6
    lw t1, 0(t1)
    addi a3,t1,    4
    lw a6, 0(a3)
    sub t1,zero,a6
    sw a6,0(a3)
    bgt	t1,t4,	_copy_if_thenBB5
    j	paracopy17
_copy_if_thenBB5:
    j	_copy_if_end11
_copy_if_end11:
    beq	a1,a4,	Heap_Node.maxHeapify.exitBB1
    j	_copy_if_end12
Heap_Node.maxHeapify.exitBB1:
    lw ra, 0(sp) 
    addi sp,sp,    16
    ret
_copy_if_end12:
    lw t1, 0(a5)
    lw a5, 0(t1)
    slli t0,a4,    2
    addi t0,t0,    4
    add t0,a5,t0
    lw a6, 0(t0)
    lw t0, 0(t1)
    slli a5,a1,    2
    addi a5,a5,    4
    add t0,t0,a5
    lw a5, 0(t1)
    slli a4,a4,    2
    addi a4,a4,    4
    add a4,a5,a4
    lw t0, 0(t0)
    sw t0,0(a4)
    lw a4, 0(t1)
    slli t0,a1,    2
    addi t0,t0,    4
    add t0,a4,t0
    sw a6,0(t0)
    call	Heap_Node.maxHeapify
    j	Heap_Node.maxHeapify.exitBB1
paracopy17:
    mv	a1,t0 
    j	_copy_if_end11
paracopy16:
    mv	a1,t0 
    j	_copy_if_end11
_copy_ifTrue7:
    lw a6, 0(a0)
    lw a3, 0(a6)
    slli a6,a4,    2
    addi a6,a6,    4
    add a6,a3,a6
    lw a6, 0(a6)
    addi a3,a6,    4
    lw a6, 0(a3)
    sub ra,zero,a6
    sw a6,0(a3)
    lw a6, 0(a0)
    lw a3, 0(a6)
    slli a6,t0,    2
    addi a6,a6,    4
    add a6,a3,a6
    lw a6, 0(a6)
    addi t4,a6,    4
    lw a6, 0(t4)
    sub a3,zero,a6
    sw a6,0(t4)
    bgt	a3,ra,	_copy_if_thenBB6
    j	paracopy18
_copy_if_thenBB6:
    j	_copy_if_end10
paracopy18:
    mv	t0,a4 
    j	_copy_if_end10
_copy_ifTrue6:
    lw a6, 0(a0)
    lw a3, 0(a6)
    slli a6,a4,    2
    addi a6,a6,    4
    add a6,a3,a6
    lw a6, 0(a6)
    addi a6,a6,    4
    lw t4, 0(a6)
    sub a3,zero,t4
    sw t4,0(a6)
    lw a6, 0(a0)
    lw a6, 0(a6)
    slli t4,t0,    2
    addi t4,t4,    4
    add a6,a6,t4
    lw a6, 0(a6)
    addi ra,a6,    4
    lw t4, 0(ra)
    sub a6,zero,t4
    sw t4,0(ra)
    bgt	a6,a3,	_copy_if_thenBB7
    j	paracopy19
paracopy19:
    j	_copy_if_end8
_copy_if_thenBB7:
    mv	a4,t0 
    j	_copy_if_end8
paracopy13:
    mv	a4,a1 
    j	_copy_if_end7
paracopy12:
    mv	a4,a1 
    j	_copy_if_end7
paracopy11:
    mv	a1,t0 
    j	_copy_if_end5
paracopy10:
    mv	a1,t0 
    j	_copy_if_end5
_copy_ifTrue3:
    lw a6, 0(a0)
    lw a3, 0(a6)
    slli a6,a4,    2
    addi a6,a6,    4
    add a6,a3,a6
    lw a6, 0(a6)
    addi a3,a6,    4
    lw a6, 0(a3)
    sub t4,zero,a6
    sw a6,0(a3)
    lw a6, 0(a0)
    lw a6, 0(a6)
    slli a3,t0,    2
    addi a3,a3,    4
    add a6,a6,a3
    lw a6, 0(a6)
    addi a3,a6,    4
    lw a6, 0(a3)
    sub ra,zero,a6
    sw a6,0(a3)
    bgt	ra,t4,	_copy_if_thenBB8
    j	paracopy20
_copy_if_thenBB8:
    j	_copy_if_end4
paracopy20:
    mv	t0,a4 
    j	_copy_if_end4
_copy_if_thenBB2:
    mv	a4,a1 
    j	_copy_if_end2
paracopy7:
    j	_copy_if_end2
paracopy6:
    mv	a4,t0 
    j	_copy_if_end1
paracopy5:
    mv	a4,t0 
    j	_copy_if_end1
if_thenBB2:
    mv	t0,a4 
    j	if_end2
paracopy3:
    j	if_end2
paracopy2:
    mv	t0,a1 
    j	if_end1
paracopy1:
    mv	t0,a1 
    j	if_end1
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -80
    sw ra, 44(sp) 
    sw s2, 0(sp) 
    sw s3, 52(sp) 
    sw s4, 24(sp) 
    sw s5, 60(sp) 
    sw s6, 32(sp) 
    sw s7, 28(sp) 
    sw s8, 12(sp) 
    sw s9, 20(sp) 
    sw s10, 16(sp) 
    sw s11, 56(sp) 
    sw s0, 40(sp) 
    sw s1, 4(sp) 
    call	getInt
    mv	s9,a0 
    call	getInt
    mv	s10,a0 
    li a0, 16
    call malloc
    mv	s7,a0 
    slli t0,s10,    2
    addi a0,t0,    4
    call malloc
    sw s10,0(a0)
    sw a0,0(s7)
    slli t0,s10,    2
    addi a0,t0,    4
    call malloc
    sw s10,0(a0)
    sw a0,4(s7)
    slli t0,s9,    2
    addi a0,t0,    4
    call malloc
    sw s9,0(a0)
    sw a0,8(s7)
    mv	t0,zero 
    j	_forcondBB1
_forcondBB1:
    blt	t0,s10,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	t0,zero 
    j	_forcondBB2
_forcondBB2:
    blt	t0,s9,	_forbodyBB2
    j	afterCallBB1
afterCallBB1:
    li t0, 0
    sw t0,12(s7)
    mv	s0,zero 
    j	__forcondBB1
__forcondBB1:
    blt	s0,s10,	__forbodyBB1
    j	_afterCallBB1
__forbodyBB1:
    call	getInt
    mv	s6,a0 
    call	getInt
    mv	s3,a0 
    call	getInt
    mv	s5,a0 
    li a0, 12
    call malloc
    sw s6,0(a0)
    sw s3,4(a0)
    sw s5,8(a0)
    lw a4, 0(s7)
    lw t0, 12(s7)
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,a4,t0
    sw a0,0(t0)
    lw t0, 8(s7)
    slli a4,s6,    2
    addi a4,a4,    4
    add a1,t0,a4
    lw a4, 4(s7)
    lw t0, 12(s7)
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,a4,t0
    lw a4, 0(a1)
    sw a4,0(t0)
    lw a4, 8(s7)
    slli t0,s6,    2
    addi t0,t0,    4
    add t0,a4,t0
    lw a4, 12(s7)
    sw a4,0(t0)
    addi t0,s7,    12
    lw a4, 0(t0)
    addi a4,a4,    1
    sw a4,0(t0)
    addi s0,s0,    1
    j	__forcondBB1
_afterCallBB1:
    mv	s3,zero 
    j	_forcondBB3
_forcondBB3:
    blt	s3,s9,	_forbodyBB3
    j	afterCallBB2
afterCallBB2:
    lw s1, 4(sp) 
    lw s0, 40(sp) 
    lw s11, 56(sp) 
    lw s10, 16(sp) 
    lw s9, 20(sp) 
    lw s8, 12(sp) 
    lw s7, 28(sp) 
    lw s6, 32(sp) 
    lw s5, 60(sp) 
    lw s4, 24(sp) 
    lw s3, 52(sp) 
    lw s2, 0(sp) 
    lw ra, 44(sp) 
    mv	a0,zero 
    addi sp,sp,    80
    ret
_forbodyBB3:
    slli t0,s9,    2
    addi a0,t0,    4
    call malloc
    mv	s10,a0 
    sw s9,0(s10)
    slli t0,s9,    2
    addi a0,t0,    4
    call malloc
    mv	s5,a0 
    sw s9,0(s5)
    mv	t0,zero 
    j	__forcondBB2
__forcondBB2:
    blt	t0,s9,	__forbodyBB2
    j	__afterForBB1
__forbodyBB2:
    slli a4,t0,    2
    addi a4,a4,    4
    add a4,s5,a4
    li a1, 10000000
    sw a1,0(a4)
    slli a4,t0,    2
    addi a4,a4,    4
    add a4,s10,a4
    li a1, 0
    sw a1,0(a4)
    addi t0,t0,    1
    j	__forcondBB2
__afterForBB1:
    slli t0,s3,    2
    addi t0,t0,    4
    add t0,s5,t0
    li a4, 0
    sw a4,0(t0)
    li a0, 4
    call malloc
    mv	s6,a0 
    li a0, 8
    call malloc
    mv	s0,a0 
    li t0, 0
    sw t0,4(s0)
    li a0, 68
    call malloc
    li t0, 16
    sw t0,0(a0)
    sw a0,0(s0)
    sw s0,0(s6)
    li a0, 8
    call malloc
    mv	s0,a0 
    li t0, 0
    sw t0,4(s0)
    sw s3,0(s0)
    add t0,s6,zero
    sw t0, 48(sp) 
    lw t0, 48(sp) 
    lw s4, 0(t0)
    lw t0, 0(s4)
    lw t0, 0(t0)
    lw a4, 4(s4)
    beq	a4,t0,	____if_thenBB1
    j	___afterCallBB1
___afterCallBB1:
    lw t0, 0(s4)
    lw a4, 4(s4)
    slli a4,a4,    2
    addi a4,a4,    4
    add t0,t0,a4
    sw s0,0(t0)
    addi t0,s4,    4
    lw a4, 0(t0)
    addi a4,a4,    1
    sw a4,0(t0)
    add s11,s6,zero
    lw t0, 0(s11)
    lw a4, 4(t0)
    li t0, 1
    sub a4,a4,t0
    j	___whileCondBB1
___whileCondBB1:
    bgt	a4,zero,	___whileBodyBB1
    j	__whileCondBB1
___whileBodyBB1:
    li t0, 1
    sub t0,a4,t0
    srai t0,t0,    1
    lw a1, 0(s6)
    lw t1, 0(a1)
    slli a1,a4,    2
    addi a1,a1,    4
    add a1,t1,a1
    lw a1, 0(a1)
    addi a1,a1,    4
    lw t1, 0(a1)
    sub a6,zero,t1
    sw t1,0(a1)
    lw a1, 0(s6)
    lw a1, 0(a1)
    slli t1,t0,    2
    addi t1,t1,    4
    add a1,a1,t1
    lw a1, 0(a1)
    addi a1,a1,    4
    lw a5, 0(a1)
    sub t1,zero,a5
    sw a5,0(a1)
    bge	t1,a6,	__whileCondBB1
    j	___if_end1
__whileCondBB1:
    lw t0, 0(s11)
    lw t0, 4(t0)
    bne	t0,zero,	__whileBodyBB1
    j	_afterCallBB2
_afterCallBB2:
    mv	s6,zero 
    j	_forcondBB4
_forcondBB4:
    blt	s6,s9,	_forbodyBB4
    j	_afterForBB2
_forbodyBB4:
    slli t0,s6,    2
    addi t0,t0,    4
    add t0,s5,t0
    lw a4, 0(t0)
    li t0, 10000000
    beq	a4,t0,	_if_thenBB1
    j	_if_elseBB1
_if_elseBB1:
    slli t0,s6,    2
    addi t0,t0,    4
    add t0,s5,t0
    lw a0, 0(t0)
    call	printInt
    j	_if_end1
_if_end1:
    la a0,_globalStr1    
    call	print
    addi s6,s6,    1
    j	_forcondBB4
_if_thenBB1:
    la a0,_globalStr2    
    call	print
    j	_if_end1
_afterForBB2:
    la a0,_globalStr0    
    call	println
    addi t0,s3,    1
    mv	s3,t0 
    j	_forcondBB3
__whileBodyBB1:
    lw t0, 0(s6)
    lw t0, 0(t0)
    lw s0, 4(t0)
    lw a5, 0(s6)
    lw t0, 0(s11)
    lw a4, 4(t0)
    li t0, 1
    sub a1,a4,t0
    lw t0, 0(a5)
    lw t1, 4(t0)
    lw t0, 0(a5)
    slli a4,a1,    2
    addi a4,a4,    4
    add a4,t0,a4
    lw t0, 0(a5)
    lw a4, 0(a4)
    sw a4,4(t0)
    lw a4, 0(a5)
    slli t0,a1,    2
    addi t0,t0,    4
    add t0,a4,t0
    sw t1,0(t0)
    lw t0, 0(s6)
    addi a4,t0,    4
    lw t0, 0(a4)
    li a1, 1
    sub t0,t0,a1
    sw t0,0(a4)
    lw t0, 0(s11)
    lw t0, 4(t0)
    li a4, 1
    blt	a4,t0,	_copy_ifTrue9
    j	paracopy21
_copy_ifTrue9:
    lw t0, 0(s6)
    lw t0, 0(t0)
    lw t0, 4(t0)
    addi a4,t0,    4
    lw t0, 0(a4)
    sub a1,zero,t0
    sw t0,0(a4)
    lw t0, 0(s6)
    lw t0, 0(t0)
    lw t0, 8(t0)
    addi a4,t0,    4
    lw t1, 0(a4)
    sub t0,zero,t1
    sw t1,0(a4)
    bgt	t0,a1,	_copy_if_thenBB9
    j	paracopy22
paracopy22:
    mv	t0,zero 
    j	_copy_if_end13
_copy_if_end13:
    lw a4, 0(s11)
    lw a4, 4(a4)
    li a1, 2
    blt	a1,a4,	_copy_ifTrue10
    j	paracopy23
paracopy23:
    j	_copy_if_end14
_copy_if_end14:
    beq	t0,zero,	afterCallBB3
    j	_copy_if_end15
_copy_if_end15:
    add a5,s6,zero
    lw a6, 0(a5)
    lw a4, 0(a6)
    lw a1, 4(a4)
    lw a4, 0(a6)
    slli t1,t0,    2
    addi t1,t1,    4
    add a4,a4,t1
    lw t1, 0(a6)
    lw a4, 0(a4)
    sw a4,4(t1)
    lw t1, 0(a6)
    slli a4,t0,    2
    addi a4,a4,    4
    add a4,t1,a4
    sw a1,0(a4)
    slli a4,t0,    1
    addi a4,a4,    1
    slli a1,t0,    1
    addi a1,a1,    2
    lw t1, 0(s11)
    lw t1, 4(t1)
    blt	a4,t1,	_copy_ifTrue11
    j	paracopy24
paracopy24:
    mv	a4,t0 
    j	_copy_if_end16
_copy_if_end16:
    lw t1, 0(s11)
    lw t1, 4(t1)
    blt	a1,t1,	_copy_ifTrue12
    j	paracopy25
paracopy25:
    j	_copy_if_end17
_copy_if_end17:
    beq	a4,t0,	afterCallBB3
    j	_copy_if_end18
afterCallBB3:
    lw s1, 0(s0)
    slli t0,s1,    2
    addi t0,t0,    4
    add t0,s10,t0
    lw a4, 0(t0)
    li t0, 1
    beq	a4,t0,	__whileCondBB1
    j	__if_end1
__if_end1:
    slli t0,s1,    2
    addi t0,t0,    4
    add t0,s10,t0
    li a4, 1
    sw a4,0(t0)
    lw a4, 8(s7)
    slli t0,s1,    2
    addi t0,t0,    4
    add t0,a4,t0
    lw t0, 0(t0)
    mv	s4,t0 
    j	__forcondBB3
__forcondBB3:
    li t0, -1
    bne	s4,t0,	__forbodyBB3
    j	__whileCondBB1
__forbodyBB3:
    lw a4, 0(s7)
    slli t0,s4,    2
    addi t0,t0,    4
    add t0,a4,t0
    lw t0, 0(t0)
    lw s0, 4(t0)
    lw a4, 0(s7)
    slli t0,s4,    2
    addi t0,t0,    4
    add t0,a4,t0
    lw t0, 0(t0)
    lw a4, 8(t0)
    slli t0,s1,    2
    addi t0,t0,    4
    add t0,s5,t0
    lw t0, 0(t0)
    add t0,t0,a4
    slli a4,s0,    2
    addi a4,a4,    4
    add a4,s5,a4
    lw a4, 0(a4)
    bge	t0,a4,	__forupdateBB1
    j	__if_end2
__forupdateBB1:
    lw a4, 4(s7)
    slli t0,s4,    2
    addi t0,t0,    4
    add t0,a4,t0
    lw t0, 0(t0)
    mv	s4,t0 
    j	__forcondBB3
__if_end2:
    slli a4,s0,    2
    addi a4,a4,    4
    add a4,s5,a4
    sw t0,0(a4)
    li a0, 8
    call malloc
    mv	s2,a0 
    sw s0,0(s2)
    slli t0,s0,    2
    addi t0,t0,    4
    add t0,s5,t0
    lw t0, 0(t0)
    sw t0,4(s2)
    lw t0, 48(sp) 
    lw s0, 0(t0)
    lw t0, 0(s0)
    lw t0, 0(t0)
    lw a4, 4(s0)
    beq	a4,t0,	____if_thenBB2
    j	___afterCallBB2
____if_thenBB2:
    lw t0, 0(s0)
    sw t0, 36(sp) 
    lw t0, 4(s0)
    sw t0, 8(sp) 
    lw t0, 36(sp) 
    lw t0, 0(t0)
    slli s8,t0,    1
    slli t0,s8,    2
    addi a0,t0,    4
    call malloc
    sw s8,0(a0)
    sw a0,0(s0)
    li t0, 0
    sw t0,4(s0)
    j	_forcondBB5
_forcondBB5:
    lw a4, 4(s0)
    lw t0, 8(sp) 
    bne	a4,t0,	_forbodyBB5
    j	___afterCallBB2
___afterCallBB2:
    lw a4, 0(s0)
    lw t0, 4(s0)
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,a4,t0
    sw s2,0(t0)
    addi a4,s0,    4
    lw t0, 0(a4)
    addi t0,t0,    1
    sw t0,0(a4)
    lw t0, 0(s11)
    lw a4, 4(t0)
    li t0, 1
    sub a4,a4,t0
    j	___whileCondBB2
___whileCondBB2:
    bgt	a4,zero,	___whileBodyBB2
    j	__forupdateBB1
___whileBodyBB2:
    li t0, 1
    sub t0,a4,t0
    srai t0,t0,    1
    lw a1, 0(s6)
    lw a1, 0(a1)
    slli t1,a4,    2
    addi t1,t1,    4
    add a1,a1,t1
    lw a1, 0(a1)
    addi a5,a1,    4
    lw a1, 0(a5)
    sub t1,zero,a1
    sw a1,0(a5)
    lw a1, 0(s6)
    lw a5, 0(a1)
    slli a1,t0,    2
    addi a1,a1,    4
    add a1,a5,a1
    lw a1, 0(a1)
    addi a5,a1,    4
    lw a1, 0(a5)
    sub a6,zero,a1
    sw a1,0(a5)
    bge	a6,t1,	__forupdateBB1
    j	___if_end2
___if_end2:
    lw a3, 0(s6)
    lw t1, 0(a3)
    slli a1,t0,    2
    addi a1,a1,    4
    add a1,t1,a1
    lw a6, 0(a1)
    lw t1, 0(a3)
    slli a1,a4,    2
    addi a1,a1,    4
    add a5,t1,a1
    lw t1, 0(a3)
    slli a1,t0,    2
    addi a1,a1,    4
    add a1,t1,a1
    lw t1, 0(a5)
    sw t1,0(a1)
    lw a1, 0(a3)
    slli a4,a4,    2
    addi a4,a4,    4
    add a4,a1,a4
    sw a6,0(a4)
    mv	a4,t0 
    j	___whileCondBB2
_forbodyBB5:
    lw t0, 4(s0)
    slli t0,t0,    2
    addi t0,t0,    4
    lw a4, 36(sp) 
    add t0,a4,t0
    lw a1, 0(s0)
    lw a4, 4(s0)
    slli a4,a4,    2
    addi a4,a4,    4
    add a4,a1,a4
    lw t0, 0(t0)
    sw t0,0(a4)
    addi a4,s0,    4
    lw t0, 0(a4)
    addi t0,t0,    1
    sw t0,0(a4)
    j	_forcondBB5
_copy_if_end18:
    lw a1, 0(a5)
    lw a6, 0(a1)
    slli t1,t0,    2
    addi t1,t1,    4
    add t1,a6,t1
    lw a6, 0(t1)
    lw a3, 0(a1)
    slli t1,a4,    2
    addi t1,t1,    4
    add t1,a3,t1
    lw a3, 0(a1)
    slli t0,t0,    2
    addi t0,t0,    4
    add t0,a3,t0
    lw t1, 0(t1)
    sw t1,0(t0)
    lw a1, 0(a1)
    slli t0,a4,    2
    addi t0,t0,    4
    add t0,a1,t0
    sw a6,0(t0)
    slli t0,a4,    1
    addi a1,t0,    1
    slli t0,a4,    1
    addi t0,t0,    2
    lw t1, 0(s11)
    lw t1, 4(t1)
    blt	a1,t1,	_copy_ifTrue13
    j	paracopy26
paracopy26:
    mv	a1,a4 
    j	_copy_if_end19
_copy_if_end19:
    lw t1, 0(s11)
    lw t1, 4(t1)
    blt	t0,t1,	_copy_ifTrue14
    j	paracopy27
paracopy27:
    j	_copy_if_end20
_copy_if_end20:
    beq	a1,a4,	afterCallBB3
    j	_copy_if_end21
_copy_if_end21:
    lw t0, 0(a5)
    lw t1, 0(t0)
    slli a5,a4,    2
    addi a5,a5,    4
    add t1,t1,a5
    lw a6, 0(t1)
    lw a5, 0(t0)
    slli t1,a1,    2
    addi t1,t1,    4
    add t1,a5,t1
    lw a5, 0(t0)
    slli a4,a4,    2
    addi a4,a4,    4
    add a5,a5,a4
    lw a4, 0(t1)
    sw a4,0(a5)
    lw a4, 0(t0)
    slli t0,a1,    2
    addi t0,t0,    4
    add t0,a4,t0
    sw a6,0(t0)
    mv	a0,s6 
    call	Heap_Node.maxHeapify
    j	afterCallBB3
_copy_ifTrue14:
    lw t1, 0(s6)
    lw a6, 0(t1)
    slli t1,a1,    2
    addi t1,t1,    4
    add t1,a6,t1
    lw t1, 0(t1)
    addi t1,t1,    4
    lw a6, 0(t1)
    sub a3,zero,a6
    sw a6,0(t1)
    lw t1, 0(s6)
    lw t1, 0(t1)
    slli a6,t0,    2
    addi a6,a6,    4
    add t1,t1,a6
    lw t1, 0(t1)
    addi a6,t1,    4
    lw t4, 0(a6)
    sub t1,zero,t4
    sw t4,0(a6)
    bgt	t1,a3,	_copy_if_thenBB10
    j	paracopy28
_copy_if_thenBB10:
    mv	a1,t0 
    j	_copy_if_end20
paracopy28:
    j	_copy_if_end20
_copy_ifTrue13:
    lw t1, 0(s6)
    lw t1, 0(t1)
    slli a6,a4,    2
    addi a6,a6,    4
    add t1,t1,a6
    lw t1, 0(t1)
    addi a6,t1,    4
    lw t1, 0(a6)
    sub t4,zero,t1
    sw t1,0(a6)
    lw t1, 0(s6)
    lw a6, 0(t1)
    slli t1,a1,    2
    addi t1,t1,    4
    add t1,a6,t1
    lw t1, 0(t1)
    addi a3,t1,    4
    lw a6, 0(a3)
    sub t1,zero,a6
    sw a6,0(a3)
    bgt	t1,t4,	_copy_if_thenBB11
    j	paracopy29
paracopy29:
    mv	a1,a4 
    j	_copy_if_end19
_copy_if_thenBB11:
    j	_copy_if_end19
_copy_ifTrue12:
    lw t1, 0(s6)
    lw a6, 0(t1)
    slli t1,a4,    2
    addi t1,t1,    4
    add t1,a6,t1
    lw t1, 0(t1)
    addi a6,t1,    4
    lw t1, 0(a6)
    sub t4,zero,t1
    sw t1,0(a6)
    lw t1, 0(s6)
    lw a6, 0(t1)
    slli t1,a1,    2
    addi t1,t1,    4
    add t1,a6,t1
    lw t1, 0(t1)
    addi a6,t1,    4
    lw t1, 0(a6)
    sub a3,zero,t1
    sw t1,0(a6)
    bgt	a3,t4,	_copy_if_thenBB12
    j	paracopy30
paracopy30:
    j	_copy_if_end17
_copy_if_thenBB12:
    mv	a4,a1 
    j	_copy_if_end17
_copy_ifTrue11:
    lw t1, 0(s6)
    lw a6, 0(t1)
    slli t1,t0,    2
    addi t1,t1,    4
    add t1,a6,t1
    lw t1, 0(t1)
    addi a6,t1,    4
    lw t1, 0(a6)
    sub a3,zero,t1
    sw t1,0(a6)
    lw t1, 0(s6)
    lw t1, 0(t1)
    slli a6,a4,    2
    addi a6,a6,    4
    add t1,t1,a6
    lw t1, 0(t1)
    addi a6,t1,    4
    lw t1, 0(a6)
    sub t4,zero,t1
    sw t1,0(a6)
    bgt	t4,a3,	_copy_if_thenBB13
    j	paracopy31
paracopy31:
    mv	a4,t0 
    j	_copy_if_end16
_copy_if_thenBB13:
    j	_copy_if_end16
_copy_ifTrue10:
    lw a4, 0(s6)
    lw a1, 0(a4)
    slli a4,t0,    2
    addi a4,a4,    4
    add a4,a1,a4
    lw a4, 0(a4)
    addi a4,a4,    4
    lw a1, 0(a4)
    sub a5,zero,a1
    sw a1,0(a4)
    lw a4, 0(s6)
    lw a4, 0(a4)
    lw a4, 12(a4)
    addi a4,a4,    4
    lw t1, 0(a4)
    sub a1,zero,t1
    sw t1,0(a4)
    bgt	a1,a5,	_copy_if_thenBB14
    j	paracopy32
_copy_if_thenBB14:
    li t0, 2
    j	_copy_if_end14
paracopy32:
    j	_copy_if_end14
_copy_if_thenBB9:
    li t0, 1
    j	_copy_if_end13
paracopy21:
    mv	t0,zero 
    j	_copy_if_end13
___if_end1:
    lw t1, 0(s6)
    lw a5, 0(t1)
    slli a1,t0,    2
    addi a1,a1,    4
    add a1,a5,a1
    lw a3, 0(a1)
    lw a5, 0(t1)
    slli a1,a4,    2
    addi a1,a1,    4
    add a5,a5,a1
    lw a6, 0(t1)
    slli a1,t0,    2
    addi a1,a1,    4
    add a1,a6,a1
    lw a5, 0(a5)
    sw a5,0(a1)
    lw a1, 0(t1)
    slli a4,a4,    2
    addi a4,a4,    4
    add a4,a1,a4
    sw a3,0(a4)
    mv	a4,t0 
    j	___whileCondBB1
____if_thenBB1:
    lw s1, 0(s4)
    lw s11, 4(s4)
    lw t0, 0(s1)
    slli s2,t0,    1
    slli t0,s2,    2
    addi a0,t0,    4
    call malloc
    sw s2,0(a0)
    sw a0,0(s4)
    li t0, 0
    sw t0,4(s4)
    j	_forcondBB6
_forcondBB6:
    lw t0, 4(s4)
    bne	t0,s11,	_forbodyBB6
    j	___afterCallBB1
_forbodyBB6:
    lw t0, 4(s4)
    slli t0,t0,    2
    addi t0,t0,    4
    add a1,s1,t0
    lw a4, 0(s4)
    lw t0, 4(s4)
    slli t0,t0,    2
    addi t0,t0,    4
    add a4,a4,t0
    lw t0, 0(a1)
    sw t0,0(a4)
    addi a4,s4,    4
    lw t0, 0(a4)
    addi t0,t0,    1
    sw t0,0(a4)
    j	_forcondBB6
_forbodyBB2:
    lw a1, 8(s7)
    slli a4,t0,    2
    addi a4,a4,    4
    add a1,a1,a4
    li a4, -1
    sw a4,0(a1)
    addi t0,t0,    1
    j	_forcondBB2
_forbodyBB1:
    lw a1, 4(s7)
    slli a4,t0,    2
    addi a4,a4,    4
    add a4,a1,a4
    li a1, -1
    sw a1,0(a4)
    addi t0,t0,    1
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
