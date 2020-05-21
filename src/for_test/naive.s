    .text
    .globl	Array_Node.front				#begin
    .p2align	2
    .type	Array_Node.front,@function
Array_Node.front:
Array_Node.front.entryBB1:
    mv	backup_ra,ra 
    mv	back_s11,s11 
    mv	back_s10,s10 
    mv	back_s9,s9 
    mv	back_s8,s8 
    mv	back_s7,s7 
    mv	back_s6,s6 
    mv	back_s5,s5 
    mv	back_s4,s4 
    mv	back_s3,s3 
    mv	back_s2,s2 
    mv	back_s1,s1 
    mv	back_s0,s0 
    mv	this.0,a0 
    lw t.0, 0(this.0)
    lw t.0, 4(t.0)
    mv	s0,back_s0 
    mv	s1,back_s1 
    mv	s2,back_s2 
    mv	s3,back_s3 
    mv	s4,back_s4 
    mv	s5,back_s5 
    mv	s6,back_s6 
    mv	s7,back_s7 
    mv	s8,back_s8 
    mv	s9,back_s9 
    mv	s10,back_s10 
    mv	s11,back_s11 
    mv	ra,backup_ra 
    mv	a0,t.0 
    ret
								 # func end
    .globl	Array_Node.doubleStorage				#begin
    .p2align	2
    .type	Array_Node.doubleStorage,@function
Array_Node.doubleStorage:
Array_Node.doubleStorage.entryBB1:
    mv	backup_ra,ra 
    mv	back_s11,s11 
    mv	back_s10,s10 
    mv	back_s9,s9 
    mv	back_s8,s8 
    mv	back_s7,s7 
    mv	back_s6,s6 
    mv	back_s5,s5 
    mv	back_s4,s4 
    mv	back_s3,s3 
    mv	back_s2,s2 
    mv	back_s1,s1 
    mv	back_s0,s0 
    mv	this.0,a0 
    lw t.0, 0(this.0)
    lw t.0, 4(this.0)
    mv	a0,t.0 
    call	_arraySize
    mv	t.0,a0 
    slli t.0,t.0,    1
    slli t.0,t.0,    2
    addi t.1,t.0,    4
    mv	a0,t.1 
    call malloc
    mv	t.0,a0 
    sw t.0,0(t.0)
    sw t.0,0(this.0)
    li _t, 0
    sw _t,4(this.0)
    j	forcondBB1
forcondBB1:
    lw t.0, 4(this.0)
    bne	t.0,t.0,	forbodyBB1
    j	afterForBB1
forbodyBB1:
    lw t.0, 4(this.0)
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(this.0)
    lw t.0, 4(this.0)
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    sw t.0,0(t.0)
    addi t.0,this.0,    4
    lw t.0, 0(t.0)
    addi t.1,t.0,    1
    sw t.1,0(t.0)
    j	forcondBB1
afterForBB1:
    mv	s0,back_s0 
    mv	s1,back_s1 
    mv	s2,back_s2 
    mv	s3,back_s3 
    mv	s4,back_s4 
    mv	s5,back_s5 
    mv	s6,back_s6 
    mv	s7,back_s7 
    mv	s8,back_s8 
    mv	s9,back_s9 
    mv	s10,back_s10 
    mv	s11,back_s11 
    mv	ra,backup_ra 
    ret
								 # func end
    .globl	Heap_Node.maxHeapify				#begin
    .p2align	2
    .type	Heap_Node.maxHeapify,@function
Heap_Node.maxHeapify:
Heap_Node.maxHeapify.entryBB1:
    mv	backup_ra,ra 
    mv	back_s11,s11 
    mv	back_s10,s10 
    mv	back_s9,s9 
    mv	back_s8,s8 
    mv	back_s7,s7 
    mv	back_s6,s6 
    mv	back_s5,s5 
    mv	back_s4,s4 
    mv	back_s3,s3 
    mv	back_s2,s2 
    mv	back_s1,s1 
    mv	back_s0,s0 
    mv	x.0,a1 
    mv	this.0,a0 
    slli _t.0,x.0,    1
    addi _t.0,_t.0,    1
    slli _t.0,x.0,    1
    addi _t.0,_t.0,    2
    add _t.0,this.0,zero
    lw _t.0, 0(_t.0)
    lw _t.0, 4(_t.0)
    blt	_t.0,_t.0,	ifTrue1
    j	paracopy1
paracopy1:
    mv	largest.1,x.0 
    j	if_end1
if_end1:
    lw _t.0, 0(_t.0)
    lw _t.0, 4(_t.0)
    blt	_t.0,_t.0,	ifTrue2
    j	paracopy2
ifTrue2:
    lw t.0, 0(this.0)
    lw _t.0, 0(t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    addi _t.0,_t.0,    4
    lw _t.0, 0(_t.0)
    sub _t.0,zero,_t.0
    sw _t.0,0(_t.0)
    lw t.0, 0(this.0)
    lw _t.0, 0(t.0)
    slli _t.0,largest.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    addi _t.0,_t.0,    4
    lw _t.0, 0(_t.0)
    sub _t.0,zero,_t.0
    sw _t.0,0(_t.0)
    bgt	_t.0,_t.0,	if_thenBB1
    j	paracopy3
if_thenBB1:
    mv	largest.3,_t.0 
    j	if_end2
if_end2:
    beq	largest.3,x.0,	Heap_Node.maxHeapify.exitBB1
    j	if_end3
if_end3:
    lw t.0, 0(this.0)
    lw _t.0, 0(t.0)
    slli _t.0,x.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(t.0)
    slli _t.0,largest.3,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(t.0)
    slli _t.0,x.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,0(_t.0)
    lw _t.0, 0(t.0)
    slli _t.0,largest.3,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    mv	a0,this.0 
    mv	a1,largest.3 
    call	Heap_Node.maxHeapify
    j	Heap_Node.maxHeapify.exitBB1
Heap_Node.maxHeapify.exitBB1:
    mv	s0,back_s0 
    mv	s1,back_s1 
    mv	s2,back_s2 
    mv	s3,back_s3 
    mv	s4,back_s4 
    mv	s5,back_s5 
    mv	s6,back_s6 
    mv	s7,back_s7 
    mv	s8,back_s8 
    mv	s9,back_s9 
    mv	s10,back_s10 
    mv	s11,back_s11 
    mv	ra,backup_ra 
    ret
paracopy3:
    mv	largest.3,largest.1 
    j	if_end2
paracopy2:
    mv	largest.3,largest.1 
    j	if_end2
ifTrue1:
    lw t.0, 0(this.0)
    lw _t.0, 0(t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    addi _t.0,_t.0,    4
    lw _t.0, 0(_t.0)
    sub _t.0,zero,_t.0
    sw _t.0,0(_t.0)
    lw t.0, 0(this.0)
    lw _t.0, 0(t.0)
    slli _t.0,x.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    addi _t.0,_t.0,    4
    lw _t.0, 0(_t.0)
    sub _t.0,zero,_t.0
    sw _t.0,0(_t.0)
    bgt	_t.0,_t.0,	if_thenBB2
    j	paracopy4
paracopy4:
    mv	largest.1,x.0 
    j	if_end1
if_thenBB2:
    mv	largest.1,_t.0 
    j	if_end1
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    mv	backup_ra,ra 
    mv	back_s11,s11 
    mv	back_s10,s10 
    mv	back_s9,s9 
    mv	back_s8,s8 
    mv	back_s7,s7 
    mv	back_s6,s6 
    mv	back_s5,s5 
    mv	back_s4,s4 
    mv	back_s3,s3 
    mv	back_s2,s2 
    mv	back_s1,s1 
    mv	back_s0,s0 
    call	getInt
    mv	__t.0,a0 
    call	getInt
    mv	__t.0,a0 
    li a0, 16
    call malloc
    mv	__t.0,a0 
    slli _t.0,__t.0,    2
    addi _t.1,_t.0,    4
    mv	a0,_t.1 
    call malloc
    mv	_t.0,a0 
    sw __t.0,0(_t.0)
    sw _t.0,0(__t.0)
    slli _t.0,__t.0,    2
    addi _t.1,_t.0,    4
    mv	a0,_t.1 
    call malloc
    mv	_t.0,a0 
    sw __t.0,0(_t.0)
    sw _t.0,4(__t.0)
    slli _t.0,__t.0,    2
    addi _t.1,_t.0,    4
    mv	a0,_t.1 
    call malloc
    mv	_t.0,a0 
    sw __t.0,0(_t.0)
    sw _t.0,8(__t.0)
    mv	_i.2,zero 
    j	_forcondBB1
_forcondBB1:
    blt	_i.2,__t.0,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	_i.4,zero 
    j	_forcondBB2
_forcondBB2:
    blt	_i.4,__t.0,	_forbodyBB2
    j	afterCallBB1
afterCallBB1:
    li _t, 0
    sw _t,12(__t.0)
    mv	__i.2,zero 
    j	__forcondBB1
__forcondBB1:
    blt	__i.2,__t.0,	__forbodyBB1
    j	_afterCallBB1
__forbodyBB1:
    call	getInt
    mv	__t.0,a0 
    call	getInt
    mv	__t.0,a0 
    call	getInt
    mv	__t.0,a0 
    li a0, 12
    call malloc
    mv	_t.0,a0 
    sw __t.0,0(_t.0)
    sw __t.0,4(_t.0)
    sw __t.0,8(_t.0)
    lw _t.0, 0(__t.0)
    lw _t.0, 12(__t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    lw _t.0, 8(__t.0)
    slli _t.0,__t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 4(__t.0)
    lw _t.0, 12(__t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,0(_t.0)
    lw _t.0, 8(__t.0)
    slli _t.0,__t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 12(__t.0)
    sw _t.0,0(_t.0)
    addi _t.0,__t.0,    12
    lw _t.0, 0(_t.0)
    addi _t.1,_t.0,    1
    sw _t.1,0(_t.0)
    addi __i.3,__i.2,    1
    mv	__i.2,__i.3 
    j	__forcondBB1
_afterCallBB1:
    mv	_i.2,zero 
    j	_forcondBB3
_forcondBB3:
    blt	_i.2,__t.0,	_forbodyBB3
    j	afterCallBB2
afterCallBB2:
    mv	s0,back_s0 
    mv	s1,back_s1 
    mv	s2,back_s2 
    mv	s3,back_s3 
    mv	s4,back_s4 
    mv	s5,back_s5 
    mv	s6,back_s6 
    mv	s7,back_s7 
    mv	s8,back_s8 
    mv	s9,back_s9 
    mv	s10,back_s10 
    mv	s11,back_s11 
    mv	ra,backup_ra 
    mv	a0,zero 
    ret
_forbodyBB3:
    slli __t.0,__t.0,    2
    addi __t.1,__t.0,    4
    mv	a0,__t.1 
    call malloc
    mv	__t.0,a0 
    sw __t.0,0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.1,__t.0,    4
    mv	a0,__t.1 
    call malloc
    mv	__t.0,a0 
    sw __t.0,0(__t.0)
    mv	__i.3,zero 
    j	__forcondBB2
__forcondBB2:
    blt	__i.3,__t.0,	__forbodyBB2
    j	__afterForBB1
__afterForBB1:
    slli __t.0,_i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    li _t, 0
    sw _t,0(__t.0)
    li a0, 4
    call malloc
    mv	__t.0,a0 
    li a0, 8
    call malloc
    mv	___t.0,a0 
    li _t, 0
    sw _t,4(___t.0)
    li a0, 68
    call malloc
    mv	_t.0,a0 
    li _t, 16
    sw _t,0(_t.0)
    sw _t.0,0(___t.0)
    sw ___t.0,0(__t.0)
    li a0, 8
    call malloc
    mv	__t.0,a0 
    li _t, 0
    sw _t,4(__t.0)
    sw _i.2,0(__t.0)
    add ___t.0,__t.0,zero
    lw ___t.0, 0(___t.0)
    lw _t.0, 4(___t.0)
    lw ____t.0, 0(___t.0)
    mv	a0,____t.0 
    call	_arraySize
    mv	____t.0,a0 
    beq	_t.0,____t.0,	____if_thenBB1
    j	___afterCallBB1
____if_thenBB1:
    lw _t.0, 0(___t.0)
    lw _t.0, 4(___t.0)
    mv	a0,_t.0 
    call	_arraySize
    mv	_t.0,a0 
    slli _t.0,_t.0,    1
    slli _t.0,_t.0,    2
    addi _t.1,_t.0,    4
    mv	a0,_t.1 
    call malloc
    mv	_t.0,a0 
    sw _t.0,0(_t.0)
    sw _t.0,0(___t.0)
    li _t, 0
    sw _t,4(___t.0)
    j	_forcondBB4
_forcondBB4:
    lw _t.0, 4(___t.0)
    bne	_t.0,_t.0,	_forbodyBB4
    j	___afterCallBB1
___afterCallBB1:
    lw ____t.0, 0(___t.0)
    lw ____t.0, 4(___t.0)
    slli ____t.0,____t.0,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    sw __t.0,0(____t.0)
    addi ____t.0,___t.0,    4
    lw ____t.0, 0(____t.0)
    addi ____t.1,____t.0,    1
    sw ____t.1,0(____t.0)
    add ____t.0,__t.0,zero
    lw ____t.0, 0(____t.0)
    lw _t.0, 4(____t.0)
    li t, 1
    sub ___t.0,_t.0,t
    mv	___x.2,___t.0 
    j	___whileCondBB1
___whileCondBB1:
    bgt	___x.2,zero,	___whileBodyBB1
    j	__whileCondBB1
__whileCondBB1:
    lw ___t.0, 0(____t.0)
    lw _t.0, 4(___t.0)
    bne	_t.0,zero,	__whileBodyBB1
    j	_afterCallBB2
__whileBodyBB1:
    lw ___t.0, 0(__t.0)
    lw ____t.0, 0(___t.0)
    lw ____t.0, 4(____t.0)
    lw ___t.0, 0(__t.0)
    lw ____t.0, 0(____t.0)
    lw _t.0, 4(____t.0)
    li t, 1
    sub ___t.0,_t.0,t
    lw ____t.0, 0(___t.0)
    lw ____t.0, 4(____t.0)
    lw ____t.0, 0(___t.0)
    slli ____t.0,___t.0,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    lw ____t.0, 0(___t.0)
    lw ____t.0, 0(____t.0)
    sw ____t.0,4(____t.0)
    lw ____t.0, 0(___t.0)
    slli ____t.0,___t.0,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    sw ____t.0,0(____t.0)
    lw ___t.0, 0(__t.0)
    addi ____t.0,___t.0,    4
    lw ____t.0, 0(____t.0)
    li t, 1
    sub ____t.1,____t.0,t
    sw ____t.1,0(____t.0)
    lw ____t.0, 0(___t.0)
    lw ____t.0, 4(___t.0)
    slli ____t.0,____t.0,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    lw ____t.0, 0(____t.0)
    mv	a0,__t.0 
    mv	a1,zero 
    call	Heap_Node.maxHeapify
    lw __t.0, 0(____t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    li t, 1
    beq	__t.0,t,	__whileCondBB1
    j	__if_end1
__if_end1:
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    li _t, 1
    sw _t,0(__t.0)
    lw __t.0, 8(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    mv	__k.4,__t.0 
    j	__forcondBB3
__forcondBB3:
    li t, -1
    bne	__k.4,t,	__forbodyBB3
    j	__whileCondBB1
__forbodyBB3:
    lw __t.0, 0(__t.0)
    slli __t.0,__k.4,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 4(__t.0)
    lw __t.0, 0(__t.0)
    slli __t.0,__k.4,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 8(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    bge	__t.0,__t.0,	__forupdateBB1
    j	__if_end2
__if_end2:
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    li a0, 8
    call malloc
    mv	__t.0,a0 
    sw __t.0,0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,4(__t.0)
    lw ___t.0, 0(___t.0)
    lw _t.0, 4(___t.0)
    lw ____t.0, 0(___t.0)
    mv	a0,____t.0 
    call	_arraySize
    mv	____t.0,a0 
    beq	_t.0,____t.0,	____if_thenBB2
    j	___afterCallBB2
___afterCallBB2:
    lw ____t.0, 0(___t.0)
    lw ____t.0, 4(___t.0)
    slli ____t.0,____t.0,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    sw __t.0,0(____t.0)
    addi ____t.0,___t.0,    4
    lw ____t.0, 0(____t.0)
    addi ____t.1,____t.0,    1
    sw ____t.1,0(____t.0)
    lw ____t.0, 0(____t.0)
    lw _t.0, 4(____t.0)
    li t, 1
    sub ___t.0,_t.0,t
    mv	___x.4,___t.0 
    j	___whileCondBB2
___whileCondBB2:
    bgt	___x.4,zero,	___whileBodyBB2
    j	__forupdateBB1
___whileBodyBB2:
    li t, 1
    sub ____t.0,___x.4,t
    srai ____t.0,____t.0,    1
    lw ___t.0, 0(__t.0)
    lw ____t.0, 0(___t.0)
    slli ____t.0,____t.0,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    lw ____t.0, 0(____t.0)
    addi ____t.0,____t.0,    4
    lw ____t.0, 0(____t.0)
    sub ____t.0,zero,____t.0
    sw ____t.0,0(____t.0)
    lw ___t.0, 0(__t.0)
    lw ____t.0, 0(___t.0)
    slli ____t.0,___x.4,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    lw ____t.0, 0(____t.0)
    addi ____t.0,____t.0,    4
    lw ____t.0, 0(____t.0)
    sub ____t.0,zero,____t.0
    sw ____t.0,0(____t.0)
    bge	____t.0,____t.0,	__forupdateBB1
    j	___if_end1
__forupdateBB1:
    lw __t.0, 4(__t.0)
    slli __t.0,__k.4,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    mv	__k.4,__t.0 
    j	__forcondBB3
___if_end1:
    lw ___t.0, 0(__t.0)
    lw ____t.0, 0(___t.0)
    slli ____t.0,____t.0,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    lw ____t.0, 0(____t.0)
    lw ____t.0, 0(___t.0)
    slli ____t.0,___x.4,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    lw ____t.0, 0(___t.0)
    slli ____t.0,____t.0,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    lw ____t.0, 0(____t.0)
    sw ____t.0,0(____t.0)
    lw ____t.0, 0(___t.0)
    slli ____t.0,___x.4,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    sw ____t.0,0(____t.0)
    mv	___x.4,____t.0 
    j	___whileCondBB2
____if_thenBB2:
    lw _t.0, 0(___t.0)
    lw _t.0, 4(___t.0)
    mv	a0,_t.0 
    call	_arraySize
    mv	_t.0,a0 
    slli _t.0,_t.0,    1
    slli _t.0,_t.0,    2
    addi _t.1,_t.0,    4
    mv	a0,_t.1 
    call malloc
    mv	_t.0,a0 
    sw _t.0,0(_t.0)
    sw _t.0,0(___t.0)
    li _t, 0
    sw _t,4(___t.0)
    j	_forcondBB5
_forcondBB5:
    lw _t.0, 4(___t.0)
    bne	_t.0,_t.0,	_forbodyBB5
    j	___afterCallBB2
_forbodyBB5:
    lw _t.0, 4(___t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(___t.0)
    lw _t.0, 4(___t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,0(_t.0)
    addi _t.0,___t.0,    4
    lw _t.0, 0(_t.0)
    addi _t.1,_t.0,    1
    sw _t.1,0(_t.0)
    j	_forcondBB5
_afterCallBB2:
    mv	_j.3,zero 
    j	_forcondBB6
_forcondBB6:
    blt	_j.3,__t.0,	_forbodyBB6
    j	_afterForBB2
_forbodyBB6:
    slli _t.0,_j.3,    2
    addi _t.0,_t.0,    4
    add _t.0,__t.0,_t.0
    lw _t.0, 0(_t.0)
    li t, 10000000
    beq	_t.0,t,	_if_thenBB1
    j	_if_elseBB1
_if_thenBB1:
    la para,_globalStr2    
    mv	a0,para 
    call	print
    j	_if_end1
_if_end1:
    la para,_globalStr1    
    mv	a0,para 
    call	print
    addi _j.4,_j.3,    1
    mv	_j.3,_j.4 
    j	_forcondBB6
_if_elseBB1:
    slli _t.0,_j.3,    2
    addi _t.0,_t.0,    4
    add _t.0,__t.0,_t.0
    lw _t.0, 0(_t.0)
    mv	a0,_t.0 
    call	printInt
    j	_if_end1
_afterForBB2:
    la para,_globalStr0    
    mv	a0,para 
    call	println
    addi _i.3,_i.2,    1
    mv	_i.2,_i.3 
    j	_forcondBB3
___whileBodyBB1:
    li t, 1
    sub ____t.0,___x.2,t
    srai ____t.0,____t.0,    1
    lw ___t.0, 0(__t.0)
    lw ____t.0, 0(___t.0)
    slli ____t.0,____t.0,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    lw ____t.0, 0(____t.0)
    addi ____t.0,____t.0,    4
    lw ____t.0, 0(____t.0)
    sub ____t.0,zero,____t.0
    sw ____t.0,0(____t.0)
    lw ___t.0, 0(__t.0)
    lw ____t.0, 0(___t.0)
    slli ____t.0,___x.2,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    lw ____t.0, 0(____t.0)
    addi ____t.0,____t.0,    4
    lw ____t.0, 0(____t.0)
    sub ____t.0,zero,____t.0
    sw ____t.0,0(____t.0)
    bge	____t.0,____t.0,	__whileCondBB1
    j	___if_end2
___if_end2:
    lw ___t.0, 0(__t.0)
    lw ____t.0, 0(___t.0)
    slli ____t.0,____t.0,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    lw ____t.0, 0(____t.0)
    lw ____t.0, 0(___t.0)
    slli ____t.0,___x.2,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    lw ____t.0, 0(___t.0)
    slli ____t.0,____t.0,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    lw ____t.0, 0(____t.0)
    sw ____t.0,0(____t.0)
    lw ____t.0, 0(___t.0)
    slli ____t.0,___x.2,    2
    addi ____t.0,____t.0,    4
    add ____t.0,____t.0,____t.0
    sw ____t.0,0(____t.0)
    mv	___x.2,____t.0 
    j	___whileCondBB1
_forbodyBB4:
    lw _t.0, 4(___t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(___t.0)
    lw _t.0, 4(___t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,0(_t.0)
    addi _t.0,___t.0,    4
    lw _t.0, 0(_t.0)
    addi _t.1,_t.0,    1
    sw _t.1,0(_t.0)
    j	_forcondBB4
__forbodyBB2:
    slli __t.0,__i.3,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    li _t, 10000000
    sw _t,0(__t.0)
    slli __t.0,__i.3,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    li _t, 0
    sw _t,0(__t.0)
    addi __i.4,__i.3,    1
    mv	__i.3,__i.4 
    j	__forcondBB2
_forbodyBB2:
    lw _t.0, 8(__t.0)
    slli _t.0,_i.4,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    li _t, -1
    sw _t,0(_t.0)
    addi _i.5,_i.4,    1
    mv	_i.4,_i.5 
    j	_forcondBB2
_forbodyBB1:
    lw _t.0, 4(__t.0)
    slli _t.0,_i.2,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    li _t, -1
    sw _t,0(_t.0)
    addi _i.6,_i.2,    1
    mv	_i.2,_i.6 
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
