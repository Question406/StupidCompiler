    .text
    .globl	printTree				#begin
    .p2align	2
    .type	printTree,@function
printTree:
printTree.entryBB1:
    addi sp,sp,    -32
    sw ra, 0(sp) 
    sw s11, 12(sp) 
    sw s10, 16(sp) 
    sw s9, 8(sp) 
    sw s8, 4(sp) 
    mv	s10,s7 
    mv	s9,a0 
    beq	s9,zero,	printTree.exitBB1
    j	if_end1
if_end1:
    lw t2, 4(s9)
    lw t2, 4(t2)
    mv	s7,t2 
    beq	s7,zero,	afterCallBB1
    j	_copy_if_end1
_copy_if_end1:
    lw t2, 4(s7)
    lw t2, 4(t2)
    mv	s11,t2 
    beq	s11,zero,	afterCallBB2
    j	_copy_if_end2
afterCallBB2:
    lw a0, 12(s7)
    call	toString
    mv	s8,a0 
    lw a0, 8(s7)
    call	toString
    la a1,_globalStr0    
    call	_stringAdd
    mv	a1,s8 
    call	_stringAdd
    call	println
    lw t2, 4(s7)
    lw s8, 8(t2)
    beq	s8,zero,	afterCallBB1
    j	_copy_if_end3
afterCallBB1:
    lw a0, 12(s9)
    call	toString
    mv	s8,a0 
    lw a0, 8(s9)
    call	toString
    la a1,_globalStr0    
    call	_stringAdd
    mv	a1,s8 
    call	_stringAdd
    call	println
    lw t2, 4(s9)
    lw s7, 8(t2)
    beq	s7,zero,	printTree.exitBB1
    j	_copy_if_end4
_copy_if_end4:
    lw t2, 4(s7)
    lw s9, 4(t2)
    beq	s9,zero,	afterCallBB3
    j	_copy_if_end5
_copy_if_end5:
    lw t2, 4(s9)
    lw a0, 4(t2)
    call	printTree
    lw a0, 12(s9)
    call	toString
    mv	s8,a0 
    lw a0, 8(s9)
    call	toString
    la a1,_globalStr0    
    call	_stringAdd
    mv	a1,s8 
    call	_stringAdd
    call	println
    lw t2, 4(s9)
    lw a0, 8(t2)
    call	printTree
    j	afterCallBB3
afterCallBB3:
    lw a0, 12(s7)
    call	toString
    mv	s8,a0 
    lw a0, 8(s7)
    call	toString
    la a1,_globalStr0    
    call	_stringAdd
    mv	a1,s8 
    call	_stringAdd
    call	println
    lw t2, 4(s7)
    lw a0, 8(t2)
    call	printTree
    j	printTree.exitBB1
printTree.exitBB1:
    mv	s7,s10 
    lw s8, 4(sp) 
    lw s9, 8(sp) 
    lw s10, 16(sp) 
    lw s11, 12(sp) 
    lw ra, 0(sp) 
    addi sp,sp,    32
    ret
_copy_if_end3:
    lw t2, 4(s8)
    lw a0, 4(t2)
    call	printTree
    lw a0, 12(s8)
    call	toString
    mv	s7,a0 
    lw a0, 8(s8)
    call	toString
    la a1,_globalStr0    
    call	_stringAdd
    mv	a1,s7 
    call	_stringAdd
    call	println
    lw t2, 4(s8)
    lw a0, 8(t2)
    call	printTree
    j	afterCallBB1
_copy_if_end2:
    lw t2, 4(s11)
    lw a0, 4(t2)
    call	printTree
    lw a0, 12(s11)
    call	toString
    mv	s8,a0 
    lw a0, 8(s11)
    call	toString
    la a1,_globalStr0    
    call	_stringAdd
    mv	a1,s8 
    call	_stringAdd
    call	println
    lw t2, 4(s11)
    lw a0, 8(t2)
    call	printTree
    j	afterCallBB2
								 # func end
    .globl	findLargest				#begin
    .p2align	2
    .type	findLargest,@function
findLargest:
findLargest.entryBB1:
    addi sp,sp,    -16
    sw ra, 0(sp) 
    lw t2, 4(a0)
    lw t2, 8(t2)
    beq	t2,zero,	if_thenBB1
    j	if_end2
if_thenBB1:
    j	findLargest.exitBB1
findLargest.exitBB1:
    lw ra, 0(sp) 
    addi sp,sp,    16
    ret
if_end2:
    lw t2, 4(a0)
    lw a0, 8(t2)
    lw t2, 4(a0)
    lw t2, 8(t2)
    beq	t2,zero,	_copy_if_thenBB1
    j	_copy_if_end6
_copy_if_thenBB1:
    j	afterCallBB4
afterCallBB4:
    j	findLargest.exitBB1
_copy_if_end6:
    lw t2, 4(a0)
    lw a0, 8(t2)
    call	findLargest
    j	afterCallBB4
								 # func end
    .globl	eraseImpl				#begin
    .p2align	2
    .type	eraseImpl,@function
eraseImpl:
eraseImpl.entryBB1:
    addi sp,sp,    -32
    sw ra, 20(sp) 
    sw s11, 4(sp) 
    sw s10, 0(sp) 
    sw s9, 8(sp) 
    sw s8, 16(sp) 
    sw s7, 12(sp) 
    mv	s10,s6 
    mv	s6,a3 
    mv	s8,a2 
    mv	s11,a1 
    mv	s9,a0 
    la t2,root    
    lw s7, 0(t2)
    beq	s9,zero,	if_thenBB2
    j	if_end3
if_thenBB2:
    mv	t2,s7 
    mv	a0,zero 
    j	eraseImpl.exitBB1
eraseImpl.exitBB1:
    lui ra,%hi(root)
    sw t2, %lo(root)(ra)
    mv	s6,s10 
    lw s7, 12(sp) 
    lw s8, 16(sp) 
    lw s9, 8(sp) 
    lw s10, 0(sp) 
    lw s11, 4(sp) 
    lw ra, 20(sp) 
    addi sp,sp,    32
    ret
if_end3:
    lw t2, 8(s9)
    bgt	t2,s6,	if_thenBB3
    j	if_end4
if_thenBB3:
    lw t2, 4(s9)
    lw t2, 4(t2)
    mv	s8,t2 
    beq	s8,zero,	_copy_if_thenBB2
    j	_copy_if_end7
_copy_if_thenBB2:
    mv	t2,s7 
    mv	a0,zero 
    j	afterCallBB5
afterCallBB5:
    j	eraseImpl.exitBB1
_copy_if_end7:
    lw t2, 8(s8)
    bgt	t2,s6,	_copy_if_thenBB3
    j	_copy_if_end8
_copy_if_thenBB3:
    lw t2, 4(s8)
    lw a0, 4(t2)
    lui t2,%hi(root)
    sw s7, %lo(root)(t2)
    mv	a1,s8 
    mv	a2,zero 
    mv	a3,s6 
    call	eraseImpl
    la t2,root    
    lw t2, 0(t2)
    j	afterCallBB5
_copy_if_end8:
    lw t2, 8(s8)
    blt	t2,s6,	_copy_if_thenBB4
    j	_copy_if_end9
_copy_if_thenBB4:
    lw t2, 4(s8)
    lw a0, 8(t2)
    lui t2,%hi(root)
    sw s7, %lo(root)(t2)
    mv	a1,s8 
    li a2, 1
    mv	a3,s6 
    call	eraseImpl
    la t2,root    
    lw t2, 0(t2)
    j	afterCallBB5
_copy_if_end9:
    addi t3,s8,    12
    lw t2, 0(t3)
    li ra, 1
    sub t2,t2,ra
    sw t2,0(t3)
    lw t2, 12(s8)
    bgt	t2,zero,	_copy_if_thenBB5
    j	_copy_if_end10
_copy_if_thenBB5:
    mv	t2,s7 
    li a0, 1
    j	afterCallBB5
_copy_if_end10:
    lw t2, 4(s8)
    lw t2, 4(t2)
    beq	t2,zero,	_copy_if_thenBB6
    j	_copy_if_end11
_copy_if_end11:
    lw t2, 4(s8)
    lw a0, 4(t2)
    call	findLargest
    lw t2, 8(s7)
    beq	s6,t2,	_copy_if_thenBB7
    j	paracopy1
_copy_if_thenBB7:
    mv	t2,a0 
    j	_copy_if_end12
_copy_if_end12:
    lw ra, 4(s8)
    lw ra, 4(ra)
    lw t3, 8(a0)
    lw ra, 8(ra)
    bne	t3,ra,	_copy_if_thenBB8
    j	_copy_if_end13
_copy_if_thenBB8:
    lw t3, 4(a0)
    lw ra, 0(a0)
    lw ra, 4(ra)
    lw t3, 4(t3)
    sw t3,8(ra)
    lw ra, 4(a0)
    lw ra, 4(ra)
    bne	ra,zero,	_copy_if_thenBB9
    j	_copy_if_end13
_copy_if_thenBB9:
    lw ra, 4(a0)
    lw t3, 4(ra)
    lw ra, 0(a0)
    sw ra,0(t3)
    j	_copy_if_end13
_copy_if_end13:
    bne	s9,zero,	_copy_if_thenBB10
    j	_copy_if_end14
_copy_if_thenBB10:
    lw ra, 4(s9)
    sw a0,4(ra)
    j	_copy_if_end14
_copy_if_end14:
    sw s9,0(a0)
    lw ra, 4(s8)
    lw t3, 4(a0)
    lw ra, 8(ra)
    sw ra,8(t3)
    lw ra, 4(s8)
    lw ra, 8(ra)
    bne	ra,zero,	_copy_if_thenBB11
    j	_copy_if_end15
_copy_if_end15:
    lw ra, 4(s8)
    lw ra, 4(ra)
    lw t3, 8(a0)
    lw ra, 8(ra)
    bne	t3,ra,	_copy_if_thenBB12
    j	_copy_if_end16
_copy_if_end16:
    li a0, 1
    j	afterCallBB5
_copy_if_thenBB12:
    lw ra, 4(s8)
    lw t3, 4(a0)
    lw ra, 4(ra)
    sw ra,4(t3)
    lw ra, 4(s8)
    lw ra, 4(ra)
    sw a0,0(ra)
    j	_copy_if_end16
_copy_if_thenBB11:
    lw ra, 4(s8)
    lw ra, 8(ra)
    sw a0,0(ra)
    j	_copy_if_end15
paracopy1:
    mv	t2,s7 
    j	_copy_if_end12
_copy_if_thenBB6:
    bne	s9,zero,	_copy_if_thenBB13
    j	_copy_if_end17
_copy_if_thenBB13:
    lw t2, 4(s8)
    lw ra, 4(s9)
    lw t2, 8(t2)
    sw t2,4(ra)
    j	_copy_if_end17
_copy_if_end17:
    lw t2, 4(s8)
    lw t2, 8(t2)
    bne	t2,zero,	_copy_if_thenBB14
    j	_copy_if_end18
_copy_if_end18:
    lw t2, 8(s7)
    beq	s6,t2,	_copy_if_thenBB15
    j	paracopy2
_copy_if_thenBB15:
    lw t2, 4(s8)
    lw t2, 8(t2)
    j	_copy_if_end19
_copy_if_end19:
    li a0, 1
    j	afterCallBB5
paracopy2:
    mv	t2,s7 
    j	_copy_if_end19
_copy_if_thenBB14:
    lw t2, 4(s8)
    lw t2, 8(t2)
    sw s9,0(t2)
    j	_copy_if_end18
if_end4:
    lw t2, 8(s9)
    blt	t2,s6,	if_thenBB4
    j	if_end5
if_thenBB4:
    lw t2, 4(s9)
    lw t2, 8(t2)
    mv	s8,t2 
    beq	s8,zero,	_copy_if_thenBB16
    j	_copy_if_end20
_copy_if_end20:
    lw t2, 8(s8)
    bgt	t2,s6,	_copy_if_thenBB17
    j	_copy_if_end21
_copy_if_thenBB17:
    lw t2, 4(s8)
    lw a0, 4(t2)
    lui t2,%hi(root)
    sw s7, %lo(root)(t2)
    mv	a1,s8 
    mv	a2,zero 
    mv	a3,s6 
    call	eraseImpl
    la t2,root    
    lw t2, 0(t2)
    j	afterCallBB6
afterCallBB6:
    j	eraseImpl.exitBB1
_copy_if_end21:
    lw t2, 8(s8)
    blt	t2,s6,	_copy_if_thenBB18
    j	_copy_if_end22
_copy_if_end22:
    addi t3,s8,    12
    lw t2, 0(t3)
    li ra, 1
    sub t2,t2,ra
    sw t2,0(t3)
    lw t2, 12(s8)
    bgt	t2,zero,	_copy_if_thenBB19
    j	_copy_if_end23
_copy_if_thenBB19:
    mv	t2,s7 
    li a0, 1
    j	afterCallBB6
_copy_if_end23:
    lw t2, 4(s8)
    lw t2, 4(t2)
    beq	t2,zero,	_copy_if_thenBB20
    j	_copy_if_end24
_copy_if_thenBB20:
    bne	s9,zero,	_copy_if_thenBB21
    j	_copy_if_end25
_copy_if_end25:
    lw t2, 4(s8)
    lw t2, 8(t2)
    bne	t2,zero,	_copy_if_thenBB22
    j	_copy_if_end26
_copy_if_thenBB22:
    lw t2, 4(s8)
    lw t2, 8(t2)
    sw s9,0(t2)
    j	_copy_if_end26
_copy_if_end26:
    lw t2, 8(s7)
    beq	s6,t2,	_copy_if_thenBB23
    j	paracopy3
paracopy3:
    mv	t2,s7 
    j	_copy_if_end27
_copy_if_end27:
    li a0, 1
    j	afterCallBB6
_copy_if_thenBB23:
    lw t2, 4(s8)
    lw t2, 8(t2)
    j	_copy_if_end27
_copy_if_thenBB21:
    lw t2, 4(s8)
    lw ra, 4(s9)
    lw t2, 8(t2)
    sw t2,8(ra)
    j	_copy_if_end25
_copy_if_end24:
    lw t2, 4(s8)
    lw a0, 4(t2)
    call	findLargest
    lw t2, 8(s7)
    beq	s6,t2,	_copy_if_thenBB24
    j	paracopy4
_copy_if_thenBB24:
    mv	t2,a0 
    j	_copy_if_end28
_copy_if_end28:
    lw ra, 4(s8)
    lw ra, 4(ra)
    lw t3, 8(a0)
    lw ra, 8(ra)
    bne	t3,ra,	_copy_if_thenBB25
    j	_copy_if_end29
_copy_if_end29:
    bne	s9,zero,	_copy_if_thenBB26
    j	_copy_if_end30
_copy_if_thenBB26:
    lw ra, 4(s9)
    sw a0,8(ra)
    j	_copy_if_end30
_copy_if_end30:
    sw s9,0(a0)
    lw ra, 4(s8)
    lw t3, 4(a0)
    lw ra, 8(ra)
    sw ra,8(t3)
    lw ra, 4(s8)
    lw ra, 8(ra)
    bne	ra,zero,	_copy_if_thenBB27
    j	_copy_if_end31
_copy_if_end31:
    lw ra, 4(s8)
    lw t3, 4(ra)
    lw ra, 8(a0)
    lw t3, 8(t3)
    bne	ra,t3,	_copy_if_thenBB28
    j	_copy_if_end32
_copy_if_end32:
    li a0, 1
    j	afterCallBB6
_copy_if_thenBB28:
    lw ra, 4(s8)
    lw t3, 4(a0)
    lw ra, 4(ra)
    sw ra,4(t3)
    lw ra, 4(s8)
    lw ra, 4(ra)
    sw a0,0(ra)
    j	_copy_if_end32
_copy_if_thenBB27:
    lw ra, 4(s8)
    lw ra, 8(ra)
    sw a0,0(ra)
    j	_copy_if_end31
_copy_if_thenBB25:
    lw t0, 4(a0)
    lw ra, 0(a0)
    lw t3, 4(ra)
    lw ra, 4(t0)
    sw ra,8(t3)
    lw ra, 4(a0)
    lw ra, 4(ra)
    bne	ra,zero,	_copy_if_thenBB29
    j	_copy_if_end29
_copy_if_thenBB29:
    lw ra, 4(a0)
    lw ra, 4(ra)
    lw t3, 0(a0)
    sw t3,0(ra)
    j	_copy_if_end29
paracopy4:
    mv	t2,s7 
    j	_copy_if_end28
_copy_if_thenBB18:
    lw t2, 4(s8)
    lw a0, 8(t2)
    lui t2,%hi(root)
    sw s7, %lo(root)(t2)
    mv	a1,s8 
    li a2, 1
    mv	a3,s6 
    call	eraseImpl
    la t2,root    
    lw t2, 0(t2)
    j	afterCallBB6
_copy_if_thenBB16:
    mv	t2,s7 
    mv	a0,zero 
    j	afterCallBB6
if_end5:
    addi t3,s9,    12
    lw t2, 0(t3)
    li ra, 1
    sub t2,t2,ra
    sw t2,0(t3)
    lw t2, 12(s9)
    bgt	t2,zero,	if_thenBB5
    j	if_end6
if_thenBB5:
    mv	t2,s7 
    li a0, 1
    j	eraseImpl.exitBB1
if_end6:
    lw t2, 4(s9)
    lw t2, 4(t2)
    beq	t2,zero,	if_thenBB6
    j	if_end7
if_end7:
    lw t2, 4(s9)
    lw a0, 4(t2)
    lw t2, 4(a0)
    lw t2, 8(t2)
    beq	t2,zero,	_copy_if_thenBB30
    j	_copy_if_end33
_copy_if_thenBB30:
    j	afterCallBB7
afterCallBB7:
    lw t2, 8(s7)
    beq	s6,t2,	if_thenBB7
    j	paracopy5
if_thenBB7:
    mv	t2,a0 
    j	if_end8
if_end8:
    lw ra, 4(s9)
    lw ra, 4(ra)
    lw t3, 8(a0)
    lw ra, 8(ra)
    bne	t3,ra,	if_thenBB8
    j	if_end9
if_thenBB8:
    lw t3, 4(a0)
    lw ra, 0(a0)
    lw t0, 4(ra)
    lw ra, 4(t3)
    sw ra,8(t0)
    lw ra, 4(a0)
    lw ra, 4(ra)
    bne	ra,zero,	if_thenBB9
    j	if_end9
if_thenBB9:
    lw ra, 4(a0)
    lw t3, 4(ra)
    lw ra, 0(a0)
    sw ra,0(t3)
    j	if_end9
if_end9:
    bne	s11,zero,	if_thenBB10
    j	if_end10
if_thenBB10:
    lw t3, 4(s11)
    slli ra,s8,    2
    addi ra,ra,    4
    add ra,t3,ra
    sw a0,0(ra)
    j	if_end10
if_end10:
    sw s11,0(a0)
    lw ra, 4(s9)
    lw t3, 4(a0)
    lw ra, 8(ra)
    sw ra,8(t3)
    lw ra, 4(s9)
    lw ra, 8(ra)
    bne	ra,zero,	if_thenBB11
    j	if_end11
if_thenBB11:
    lw ra, 4(s9)
    lw ra, 8(ra)
    sw a0,0(ra)
    j	if_end11
if_end11:
    lw ra, 4(s9)
    lw ra, 4(ra)
    lw t3, 8(a0)
    lw ra, 8(ra)
    bne	t3,ra,	if_thenBB12
    j	if_end12
if_thenBB12:
    lw ra, 4(s9)
    lw t3, 4(a0)
    lw ra, 4(ra)
    sw ra,4(t3)
    lw ra, 4(s9)
    lw ra, 4(ra)
    sw a0,0(ra)
    j	if_end12
if_end12:
    li a0, 1
    j	eraseImpl.exitBB1
paracopy5:
    mv	t2,s7 
    j	if_end8
_copy_if_end33:
    lw t2, 4(a0)
    lw a0, 8(t2)
    call	findLargest
    j	afterCallBB7
if_thenBB6:
    bne	s11,zero,	if_thenBB13
    j	if_end13
if_end13:
    lw t2, 4(s9)
    lw t2, 8(t2)
    bne	t2,zero,	if_thenBB14
    j	if_end14
if_end14:
    lw t2, 8(s7)
    beq	s6,t2,	if_thenBB15
    j	paracopy6
paracopy6:
    mv	t2,s7 
    j	if_end15
if_end15:
    li a0, 1
    j	eraseImpl.exitBB1
if_thenBB15:
    lw t2, 4(s9)
    lw t2, 8(t2)
    j	if_end15
if_thenBB14:
    lw t2, 4(s9)
    lw t2, 8(t2)
    sw s11,0(t2)
    j	if_end14
if_thenBB13:
    lw t3, 4(s9)
    lw ra, 4(s11)
    slli t2,s8,    2
    addi t2,t2,    4
    add t2,ra,t2
    lw ra, 8(t3)
    sw ra,0(t2)
    j	if_end13
								 # func end
    .globl	insertImpl				#begin
    .p2align	2
    .type	insertImpl,@function
insertImpl:
insertImpl.entryBB1:
    addi sp,sp,    -32
    sw ra, 12(sp) 
    sw s11, 8(sp) 
    sw s10, 0(sp) 
    sw s9, 16(sp) 
    sw s8, 4(sp) 
    mv	s10,s7 
    mv	s7,a2 
    mv	s9,a1 
    beq	a0,zero,	if_thenBB16
    j	if_end16
if_end16:
    lw t2, 8(a0)
    beq	t2,a3,	if_thenBB17
    j	if_end17
if_end17:
    lw t2, 8(a0)
    blt	t2,a3,	if_thenBB18
    j	paracopy7
if_thenBB18:
    li t2, 1
    j	if_end18
if_end18:
    lw t3, 4(a0)
    slli ra,t2,    2
    addi ra,ra,    4
    add ra,t3,ra
    lw a1, 0(ra)
    mv	s9,a0 
    mv	s8,t2 
    beq	a1,zero,	_copy_if_thenBB31
    j	_copy_if_end34
_copy_if_thenBB31:
    mv	s11,a3 
    li a0, 16
    call malloc
    mv	s7,a0 
    li a0, 12
    call malloc
    li t2, 2
    sw t2,0(a0)
    sw a0,4(s7)
    sw s11,8(s7)
    li t2, 1
    sw t2,12(s7)
    sw s9,0(s7)
    lw ra, 4(s7)
    li t2, 0
    sw t2,4(ra)
    lw t2, 4(s7)
    li ra, 0
    sw ra,8(t2)
    mv	t2,s7 
    lw t3, 4(s9)
    slli ra,s8,    2
    addi ra,ra,    4
    add ra,t3,ra
    sw t2,0(ra)
    mv	a0,zero 
    j	afterCallBB8
afterCallBB8:
    j	insertImpl.exitBB1
insertImpl.exitBB1:
    mv	s7,s10 
    lw s8, 4(sp) 
    lw s9, 16(sp) 
    lw s10, 0(sp) 
    lw s11, 8(sp) 
    lw ra, 12(sp) 
    addi sp,sp,    32
    ret
_copy_if_end34:
    lw t2, 8(a1)
    beq	t2,a3,	_copy_if_thenBB32
    j	_copy_if_end35
_copy_if_thenBB32:
    addi ra,a1,    12
    lw t2, 0(ra)
    addi t2,t2,    1
    sw t2,0(ra)
    li a0, 1
    j	afterCallBB8
_copy_if_end35:
    lw t2, 8(a1)
    blt	t2,a3,	_copy_if_thenBB33
    j	paracopy8
paracopy8:
    mv	a2,zero 
    j	_copy_if_end36
_copy_if_end36:
    lw t2, 4(a1)
    slli ra,a2,    2
    addi ra,ra,    4
    add t2,t2,ra
    lw a0, 0(t2)
    call	insertImpl
    j	afterCallBB8
_copy_if_thenBB33:
    li a2, 1
    j	_copy_if_end36
paracopy7:
    mv	t2,zero 
    j	if_end18
if_thenBB17:
    addi t2,a0,    12
    lw ra, 0(t2)
    addi ra,ra,    1
    sw ra,0(t2)
    li a0, 1
    j	insertImpl.exitBB1
if_thenBB16:
    mv	s8,a3 
    li a0, 16
    call malloc
    mv	s11,a0 
    li a0, 12
    call malloc
    li t2, 2
    sw t2,0(a0)
    sw a0,4(s11)
    sw s8,8(s11)
    li t2, 1
    sw t2,12(s11)
    sw s9,0(s11)
    lw t2, 4(s11)
    li ra, 0
    sw ra,4(t2)
    lw ra, 4(s11)
    li t2, 0
    sw t2,8(ra)
    mv	t2,s11 
    lw t3, 4(s9)
    slli ra,s7,    2
    addi ra,ra,    4
    add ra,t3,ra
    sw t2,0(ra)
    mv	a0,zero 
    j	insertImpl.exitBB1
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -32
    sw ra, 12(sp) 
    sw s11, 4(sp) 
    sw s10, 20(sp) 
    sw s9, 16(sp) 
    sw s8, 8(sp) 
    sw s7, 0(sp) 
    mv	s10,s6 
    call	getInt
    mv	s8,zero 
    mv	s7,zero 
    j	__forcondBB1
__forcondBB1:
    li t2, 50000
    blt	s7,t2,	afterCallBB9
    j	_afterCallBB1
afterCallBB9:
    slli t2,a0,    13
    xor t2,a0,t2
    li ra, 2147483647
    and t2,t2,ra
    srai ra,t2,    17
    xor t2,t2,ra
    slli ra,t2,    5
    xor t2,t2,ra
    li ra, 2147483647
    and t2,t2,ra
    mv	ra,t2 
    li t3, 128
    rem a3,ra,t3
    slli ra,t2,    13
    xor t2,t2,ra
    li ra, 2147483647
    and t2,t2,ra
    srai ra,t2,    17
    xor t2,t2,ra
    slli ra,t2,    5
    xor t2,t2,ra
    li ra, 2147483647
    and t2,t2,ra
    mv	s6,t2 
    li ra, 1717986912
    blt	t2,ra,	_if_thenBB1
    j	_if_end1
_if_end1:
    li t2, 2
    j	afterCallBB10
afterCallBB10:
    li ra, 1
    beq	t2,ra,	__if_thenBB1
    j	__if_elseBB1
__if_thenBB1:
    bne	s8,zero,	_if_thenBB2
    j	_if_end2
_if_thenBB2:
    mv	a1,s8 
    beq	a1,zero,	_copy_if_thenBB34
    j	_copy_if_end37
_copy_if_thenBB34:
    mv	s9,a3 
    li a0, 16
    call malloc
    mv	s11,a0 
    li a0, 12
    call malloc
    li t2, 2
    sw t2,0(a0)
    sw a0,4(s11)
    sw s9,8(s11)
    li t2, 1
    sw t2,12(s11)
    li t2, 0
    sw t2,0(s11)
    lw ra, 4(s11)
    li t2, 0
    sw t2,4(ra)
    lw t2, 4(s11)
    li ra, 0
    sw ra,8(t2)
    mv	t2,s11 
    lw ra, 0(s10)
    sw t2,0(ra)
    j	afterCallBB11
afterCallBB11:
    mv	s9,s8 
    j	afterCallBB12
afterCallBB12:
    j	__forupdateBB1
__forupdateBB1:
    addi t2,s7,    1
    mv	s8,s9 
    mv	s7,t2 
    mv	a0,s6 
    j	__forcondBB1
_copy_if_end37:
    lw t2, 8(a1)
    beq	t2,a3,	_copy_if_thenBB35
    j	_copy_if_end38
_copy_if_thenBB35:
    addi ra,a1,    12
    lw t2, 0(ra)
    addi t2,t2,    1
    sw t2,0(ra)
    j	afterCallBB11
_copy_if_end38:
    lw t2, 8(a1)
    blt	t2,a3,	_copy_if_thenBB36
    j	paracopy9
_copy_if_thenBB36:
    li a2, 1
    j	_copy_if_end39
_copy_if_end39:
    lw ra, 4(a1)
    slli t2,a2,    2
    addi t2,t2,    4
    add t2,ra,t2
    lw a0, 0(t2)
    call	insertImpl
    j	afterCallBB11
paracopy9:
    mv	a2,zero 
    j	_copy_if_end39
_if_end2:
    mv	s8,a3 
    li a0, 16
    call malloc
    mv	s9,a0 
    li a0, 12
    call malloc
    li t2, 2
    sw t2,0(a0)
    sw a0,4(s9)
    sw s8,8(s9)
    li t2, 1
    sw t2,12(s9)
    li t2, 0
    sw t2,0(s9)
    lw t2, 4(s9)
    li ra, 0
    sw ra,4(t2)
    lw ra, 4(s9)
    li t2, 0
    sw t2,8(ra)
    j	afterCallBB12
__if_elseBB1:
    beq	s8,zero,	_if_thenBB3
    j	_if_end3
_if_end3:
    mv	s9,a3 
    beq	s8,zero,	_copy_if_thenBB37
    j	_copy_if_end40
_copy_if_end40:
    lw t2, 8(s8)
    bgt	t2,s9,	_copy_if_thenBB38
    j	_copy_if_end41
_copy_if_thenBB38:
    lw t2, 4(s8)
    lw a0, 4(t2)
    lui t2,%hi(root)
    sw s8, %lo(root)(t2)
    mv	a1,s8 
    mv	a2,zero 
    mv	a3,s9 
    call	eraseImpl
    la t2,root    
    lw s9, 0(t2)
    j	afterCallBB13
afterCallBB13:
    j	afterCallBB14
afterCallBB14:
    j	__forupdateBB1
_copy_if_end41:
    lw t2, 8(s8)
    blt	t2,s9,	_copy_if_thenBB39
    j	_copy_if_end42
_copy_if_end42:
    addi ra,s8,    12
    lw t3, 0(ra)
    li t2, 1
    sub t2,t3,t2
    sw t2,0(ra)
    lw t2, 12(s8)
    bgt	t2,zero,	_copy_if_thenBB40
    j	_copy_if_end43
_copy_if_end43:
    lw t2, 4(s8)
    lw t2, 4(t2)
    beq	t2,zero,	_copy_if_end44
    j	_copy_if_end45
_copy_if_end45:
    lw t2, 4(s8)
    lw a0, 4(t2)
    call	findLargest
    lw t2, 8(s8)
    beq	s9,t2,	_copy_if_thenBB41
    j	paracopy10
paracopy10:
    mv	s9,s8 
    j	_copy_if_end46
_copy_if_end46:
    lw t2, 4(s8)
    lw t2, 4(t2)
    lw ra, 8(a0)
    lw t2, 8(t2)
    bne	ra,t2,	_copy_if_thenBB42
    j	_copy_if_end47
_copy_if_thenBB42:
    lw ra, 4(a0)
    lw t2, 0(a0)
    lw t2, 4(t2)
    lw ra, 4(ra)
    sw ra,8(t2)
    lw t2, 4(a0)
    lw t2, 4(t2)
    bne	t2,zero,	_copy_if_thenBB43
    j	_copy_if_end47
_copy_if_end47:
    li t2, 0
    sw t2,0(a0)
    lw ra, 4(s8)
    lw t2, 4(a0)
    lw ra, 8(ra)
    sw ra,8(t2)
    lw t2, 4(s8)
    lw t2, 8(t2)
    bne	t2,zero,	_copy_if_thenBB44
    j	_copy_if_end48
_copy_if_thenBB44:
    lw t2, 4(s8)
    lw t2, 8(t2)
    sw a0,0(t2)
    j	_copy_if_end48
_copy_if_end48:
    lw t2, 4(s8)
    lw t2, 4(t2)
    lw ra, 8(a0)
    lw t2, 8(t2)
    bne	ra,t2,	_copy_if_thenBB45
    j	_copy_if_end49
_copy_if_end49:
    j	afterCallBB13
_copy_if_thenBB45:
    lw t2, 4(s8)
    lw ra, 4(a0)
    lw t2, 4(t2)
    sw t2,4(ra)
    lw t2, 4(s8)
    lw t2, 4(t2)
    sw a0,0(t2)
    j	_copy_if_end49
_copy_if_thenBB43:
    lw t2, 4(a0)
    lw t2, 4(t2)
    lw ra, 0(a0)
    sw ra,0(t2)
    j	_copy_if_end47
_copy_if_thenBB41:
    mv	s9,a0 
    j	_copy_if_end46
_copy_if_end44:
    lw t2, 4(s8)
    lw t2, 8(t2)
    bne	t2,zero,	_copy_if_thenBB46
    j	_copy_if_end50
_copy_if_thenBB46:
    lw t2, 4(s8)
    lw ra, 8(t2)
    li t2, 0
    sw t2,0(ra)
    j	_copy_if_end50
_copy_if_end50:
    lw t2, 8(s8)
    beq	s9,t2,	_copy_if_thenBB47
    j	paracopy11
_copy_if_thenBB47:
    lw t2, 4(s8)
    lw s9, 8(t2)
    j	_copy_if_end51
_copy_if_end51:
    j	afterCallBB13
paracopy11:
    mv	s9,s8 
    j	_copy_if_end51
_copy_if_thenBB40:
    mv	s9,s8 
    j	afterCallBB13
_copy_if_thenBB39:
    lw t2, 4(s8)
    lw a0, 8(t2)
    lui t2,%hi(root)
    sw s8, %lo(root)(t2)
    mv	a1,s8 
    li a2, 1
    mv	a3,s9 
    call	eraseImpl
    la t2,root    
    lw s9, 0(t2)
    j	afterCallBB13
_copy_if_thenBB37:
    mv	s9,s8 
    j	afterCallBB13
_if_thenBB3:
    mv	s9,s8 
    j	afterCallBB14
_if_thenBB1:
    li t2, 1
    j	afterCallBB10
_afterCallBB1:
    mv	s6,zero 
    j	__forcondBB2
__forcondBB2:
    li t2, 100000
    blt	s6,t2,	afterCallBB15
    j	_afterCallBB2
afterCallBB15:
    slli t2,a0,    13
    xor t2,a0,t2
    li ra, 2147483647
    and t2,t2,ra
    srai ra,t2,    17
    xor t2,t2,ra
    slli ra,t2,    5
    xor t2,t2,ra
    li ra, 2147483647
    and t2,t2,ra
    mv	ra,t2 
    li t3, 128
    rem s7,ra,t3
    slli ra,t2,    13
    xor t2,t2,ra
    li ra, 2147483647
    and t2,t2,ra
    srai ra,t2,    17
    xor t2,t2,ra
    slli ra,t2,    5
    xor t2,t2,ra
    li ra, 2147483647
    and t2,t2,ra
    mv	s11,t2 
    li ra, 429496728
    blt	t2,ra,	_if_thenBB4
    j	_if_end4
_if_thenBB4:
    li t2, 1
    j	afterCallBB16
afterCallBB16:
    li ra, 1
    beq	t2,ra,	__if_thenBB2
    j	__if_elseBB2
__if_elseBB2:
    beq	s8,zero,	_if_thenBB5
    j	_if_end5
_if_end5:
    lui t2,%hi(root)
    sw s8, %lo(root)(t2)
    mv	a0,s8 
    mv	a1,zero 
    li a2, -1
    mv	a3,s7 
    call	eraseImpl
    la t2,root    
    lw s8, 0(t2)
    j	afterCallBB17
afterCallBB17:
    j	__forupdateBB2
__forupdateBB2:
    addi t2,s6,    1
    mv	s6,t2 
    mv	a0,s11 
    j	__forcondBB2
_if_thenBB5:
    j	afterCallBB17
__if_thenBB2:
    bne	s8,zero,	_if_thenBB6
    j	_if_end6
_if_end6:
    li a0, 16
    call malloc
    mv	s8,a0 
    li a0, 12
    call malloc
    li t2, 2
    sw t2,0(a0)
    sw a0,4(s8)
    sw s7,8(s8)
    li t2, 1
    sw t2,12(s8)
    li t2, 0
    sw t2,0(s8)
    lw ra, 4(s8)
    li t2, 0
    sw t2,4(ra)
    lw t2, 4(s8)
    li ra, 0
    sw ra,8(t2)
    j	afterCallBB18
afterCallBB18:
    j	__forupdateBB2
_if_thenBB6:
    mv	a1,s8 
    mv	a3,s7 
    beq	a1,zero,	_copy_if_thenBB48
    j	_copy_if_end52
_copy_if_end52:
    lw t2, 8(a1)
    beq	t2,a3,	_copy_if_thenBB49
    j	_copy_if_end53
_copy_if_thenBB49:
    addi t2,a1,    12
    lw ra, 0(t2)
    addi ra,ra,    1
    sw ra,0(t2)
    j	afterCallBB19
afterCallBB19:
    j	afterCallBB18
_copy_if_end53:
    lw t2, 8(a1)
    blt	t2,a3,	_copy_if_thenBB50
    j	paracopy12
_copy_if_thenBB50:
    li a2, 1
    j	_copy_if_end54
_copy_if_end54:
    lw t2, 4(a1)
    slli ra,a2,    2
    addi ra,ra,    4
    add t2,t2,ra
    lw a0, 0(t2)
    call	insertImpl
    j	afterCallBB19
paracopy12:
    mv	a2,zero 
    j	_copy_if_end54
_copy_if_thenBB48:
    mv	s7,a3 
    li a0, 16
    call malloc
    mv	s9,a0 
    li a0, 12
    call malloc
    li t2, 2
    sw t2,0(a0)
    sw a0,4(s9)
    sw s7,8(s9)
    li t2, 1
    sw t2,12(s9)
    li t2, 0
    sw t2,0(s9)
    lw ra, 4(s9)
    li t2, 0
    sw t2,4(ra)
    lw ra, 4(s9)
    li t2, 0
    sw t2,8(ra)
    mv	t2,s9 
    lw ra, 0(s10)
    sw t2,0(ra)
    j	afterCallBB19
_if_end4:
    li t2, 2
    j	afterCallBB16
_afterCallBB2:
    mv	s9,zero 
    j	__forcondBB3
__forcondBB3:
    li t2, 50000
    blt	s9,t2,	afterCallBB20
    j	afterCallBB21
afterCallBB21:
    beq	s8,zero,	afterCallBB22
    j	_copy_if_end55
_copy_if_end55:
    lw t2, 4(s8)
    lw a0, 4(t2)
    call	printTree
    lw a0, 12(s8)
    call	toString
    mv	s7,a0 
    lw a0, 8(s8)
    call	toString
    la a1,_globalStr0    
    call	_stringAdd
    mv	a1,s7 
    call	_stringAdd
    call	println
    lw t2, 4(s8)
    lw a0, 8(t2)
    call	printTree
    j	afterCallBB22
afterCallBB22:
    lui t2,%hi(root)
    sw s8, %lo(root)(t2)
    mv	s6,s10 
    lw s7, 0(sp) 
    lw s8, 8(sp) 
    lw s9, 16(sp) 
    lw s10, 20(sp) 
    lw s11, 4(sp) 
    lw ra, 12(sp) 
    mv	a0,zero 
    addi sp,sp,    32
    ret
afterCallBB20:
    slli t2,a0,    13
    xor t2,a0,t2
    li ra, 2147483647
    and t2,t2,ra
    srai ra,t2,    17
    xor t2,t2,ra
    slli ra,t2,    5
    xor t2,t2,ra
    li ra, 2147483647
    and t2,t2,ra
    mv	ra,t2 
    li t3, 128
    rem a3,ra,t3
    slli ra,t2,    13
    xor t2,t2,ra
    li ra, 2147483647
    and t2,t2,ra
    srai ra,t2,    17
    xor t2,t2,ra
    slli ra,t2,    5
    xor t2,t2,ra
    li ra, 2147483647
    and t2,t2,ra
    mv	s7,t2 
    li ra, 858993456
    blt	t2,ra,	_if_thenBB7
    j	_if_end7
_if_thenBB7:
    li t2, 1
    j	afterCallBB23
afterCallBB23:
    li ra, 1
    beq	t2,ra,	__if_thenBB3
    j	__if_elseBB3
__if_elseBB3:
    beq	s8,zero,	_if_thenBB8
    j	_if_end8
_if_end8:
    mv	s6,a3 
    beq	s8,zero,	_copy_if_thenBB51
    j	_copy_if_end56
_copy_if_end56:
    lw t2, 8(s8)
    bgt	t2,s6,	_copy_if_thenBB52
    j	_copy_if_end57
_copy_if_end57:
    lw t2, 8(s8)
    blt	t2,s6,	_copy_if_thenBB53
    j	_copy_if_end58
_copy_if_thenBB53:
    lw t2, 4(s8)
    lw a0, 8(t2)
    lui t2,%hi(root)
    sw s8, %lo(root)(t2)
    mv	a1,s8 
    li a2, 1
    mv	a3,s6 
    call	eraseImpl
    la t2,root    
    lw s6, 0(t2)
    j	afterCallBB24
afterCallBB24:
    j	afterCallBB25
afterCallBB25:
    j	__forupdateBB3
__forupdateBB3:
    addi t2,s9,    1
    mv	s9,t2 
    mv	s8,s6 
    mv	a0,s7 
    j	__forcondBB3
_copy_if_end58:
    addi t2,s8,    12
    lw t3, 0(t2)
    li ra, 1
    sub ra,t3,ra
    sw ra,0(t2)
    lw t2, 12(s8)
    bgt	t2,zero,	_copy_if_thenBB54
    j	_copy_if_end59
_copy_if_end59:
    lw t2, 4(s8)
    lw t2, 4(t2)
    beq	t2,zero,	_copy_if_end60
    j	_copy_if_end61
_copy_if_end60:
    lw t2, 4(s8)
    lw t2, 8(t2)
    bne	t2,zero,	_copy_if_thenBB55
    j	_copy_if_end62
_copy_if_thenBB55:
    lw t2, 4(s8)
    lw ra, 8(t2)
    li t2, 0
    sw t2,0(ra)
    j	_copy_if_end62
_copy_if_end62:
    lw t2, 8(s8)
    beq	s6,t2,	_copy_if_thenBB56
    j	paracopy13
_copy_if_thenBB56:
    lw t2, 4(s8)
    lw s6, 8(t2)
    j	_copy_if_end63
_copy_if_end63:
    j	afterCallBB24
paracopy13:
    mv	s6,s8 
    j	_copy_if_end63
_copy_if_end61:
    lw t2, 4(s8)
    lw a0, 4(t2)
    call	findLargest
    lw t2, 8(s8)
    beq	s6,t2,	_copy_if_thenBB57
    j	paracopy14
paracopy14:
    mv	s6,s8 
    j	_copy_if_end64
_copy_if_end64:
    lw t2, 4(s8)
    lw t2, 4(t2)
    lw ra, 8(a0)
    lw t2, 8(t2)
    bne	ra,t2,	_copy_if_thenBB58
    j	_copy_if_end65
_copy_if_end65:
    li t2, 0
    sw t2,0(a0)
    lw t2, 4(s8)
    lw ra, 4(a0)
    lw t2, 8(t2)
    sw t2,8(ra)
    lw t2, 4(s8)
    lw t2, 8(t2)
    bne	t2,zero,	_copy_if_thenBB59
    j	_copy_if_end66
_copy_if_end66:
    lw t2, 4(s8)
    lw t2, 4(t2)
    lw ra, 8(a0)
    lw t2, 8(t2)
    bne	ra,t2,	_copy_if_thenBB60
    j	_copy_if_end67
_copy_if_end67:
    j	afterCallBB24
_copy_if_thenBB60:
    lw t2, 4(s8)
    lw ra, 4(a0)
    lw t2, 4(t2)
    sw t2,4(ra)
    lw t2, 4(s8)
    lw t2, 4(t2)
    sw a0,0(t2)
    j	_copy_if_end67
_copy_if_thenBB59:
    lw t2, 4(s8)
    lw t2, 8(t2)
    sw a0,0(t2)
    j	_copy_if_end66
_copy_if_thenBB58:
    lw ra, 4(a0)
    lw t2, 0(a0)
    lw t2, 4(t2)
    lw ra, 4(ra)
    sw ra,8(t2)
    lw t2, 4(a0)
    lw t2, 4(t2)
    bne	t2,zero,	_copy_if_thenBB61
    j	_copy_if_end65
_copy_if_thenBB61:
    lw t2, 4(a0)
    lw t2, 4(t2)
    lw ra, 0(a0)
    sw ra,0(t2)
    j	_copy_if_end65
_copy_if_thenBB57:
    mv	s6,a0 
    j	_copy_if_end64
_copy_if_thenBB54:
    mv	s6,s8 
    j	afterCallBB24
_copy_if_thenBB52:
    lw t2, 4(s8)
    lw a0, 4(t2)
    lui t2,%hi(root)
    sw s8, %lo(root)(t2)
    mv	a1,s8 
    mv	a2,zero 
    mv	a3,s6 
    call	eraseImpl
    la t2,root    
    lw s6, 0(t2)
    j	afterCallBB24
_copy_if_thenBB51:
    mv	s6,s8 
    j	afterCallBB24
_if_thenBB8:
    mv	s6,s8 
    j	afterCallBB25
__if_thenBB3:
    bne	s8,zero,	_if_thenBB9
    j	_if_end9
_if_thenBB9:
    mv	a1,s8 
    beq	a1,zero,	_copy_if_thenBB62
    j	_copy_if_end68
_copy_if_end68:
    lw t2, 8(a1)
    beq	t2,a3,	_copy_if_thenBB63
    j	_copy_if_end69
_copy_if_thenBB63:
    addi t2,a1,    12
    lw ra, 0(t2)
    addi ra,ra,    1
    sw ra,0(t2)
    j	afterCallBB26
afterCallBB26:
    mv	s6,s8 
    j	afterCallBB27
afterCallBB27:
    j	__forupdateBB3
_copy_if_end69:
    lw t2, 8(a1)
    blt	t2,a3,	_copy_if_thenBB64
    j	paracopy15
_copy_if_thenBB64:
    li a2, 1
    j	_copy_if_end70
_copy_if_end70:
    lw t2, 4(a1)
    slli ra,a2,    2
    addi ra,ra,    4
    add t2,t2,ra
    lw a0, 0(t2)
    call	insertImpl
    j	afterCallBB26
paracopy15:
    mv	a2,zero 
    j	_copy_if_end70
_copy_if_thenBB62:
    mv	s6,a3 
    li a0, 16
    call malloc
    mv	s11,a0 
    li a0, 12
    call malloc
    li t2, 2
    sw t2,0(a0)
    sw a0,4(s11)
    sw s6,8(s11)
    li t2, 1
    sw t2,12(s11)
    li t2, 0
    sw t2,0(s11)
    lw t2, 4(s11)
    li ra, 0
    sw ra,4(t2)
    lw t2, 4(s11)
    li ra, 0
    sw ra,8(t2)
    mv	t2,s11 
    lw ra, 0(s10)
    sw t2,0(ra)
    j	afterCallBB26
_if_end9:
    mv	s8,a3 
    li a0, 16
    call malloc
    mv	s6,a0 
    li a0, 12
    call malloc
    li t2, 2
    sw t2,0(a0)
    sw a0,4(s6)
    sw s8,8(s6)
    li t2, 1
    sw t2,12(s6)
    li t2, 0
    sw t2,0(s6)
    lw t2, 4(s6)
    li ra, 0
    sw ra,4(t2)
    lw ra, 4(s6)
    li t2, 0
    sw t2,8(ra)
    j	afterCallBB27
_if_end7:
    li t2, 2
    j	afterCallBB23
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	seed					#@seed
    .p2align	2
seed:
    .word	0
     
    .globl	MAX					#@MAX
    .p2align	2
MAX:
    .word	0
     
    .globl	MaxRandInt					#@MaxRandInt
    .p2align	2
MaxRandInt:
    .word	0
     
    .globl	root					#@root
    .p2align	2
root:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  ": "    
