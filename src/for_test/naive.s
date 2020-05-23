    .text
    .globl	printTree				#begin
    .p2align	2
    .type	printTree,@function
printTree:
printTree.entryBB1:
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
    mv	cur.0,a0 
    beq	cur.0,zero,	printTree.exitBB1
    j	if_end1
if_end1:
    lw t.0, 4(cur.0)
    lw t.0, 4(t.0)
    mv	_copy_cur.0,t.0 
    beq	_copy_cur.0,zero,	afterCallBB1
    j	_copy_if_end1
_copy_if_end1:
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 4(__t.0)
    mv	_copy_cur.0,__t.0 
    beq	_copy_cur.0,zero,	afterCallBB2
    j	_copy_if_end2
afterCallBB2:
    lw __t.0, 12(_copy_cur.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    lw __t.0, 8(_copy_cur.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 8(__t.0)
    mv	_copy_cur.0,__t.0 
    beq	_copy_cur.0,zero,	afterCallBB1
    j	_copy_if_end3
afterCallBB1:
    lw t.0, 12(cur.0)
    mv	a0,t.0 
    call	toString
    mv	t.0,a0 
    lw t.0, 8(cur.0)
    mv	a0,t.0 
    call	toString
    mv	t.0,a0 
    mv	a0,t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	t.0,a0 
    mv	a0,t.0 
    mv	a1,t.0 
    call	_stringAdd
    mv	t.0,a0 
    mv	a0,t.0 
    call	println
    lw t.0, 4(cur.0)
    lw t.0, 8(t.0)
    mv	_copy_cur.0,t.0 
    beq	_copy_cur.0,zero,	printTree.exitBB1
    j	_copy_if_end4
_copy_if_end4:
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 4(__t.0)
    mv	_copy_cur.0,__t.0 
    beq	_copy_cur.0,zero,	afterCallBB3
    j	_copy_if_end5
_copy_if_end5:
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 4(__t.0)
    mv	a0,__t.0 
    call	printTree
    lw __t.0, 12(_copy_cur.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    lw __t.0, 8(_copy_cur.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 8(__t.0)
    mv	a0,__t.0 
    call	printTree
    j	afterCallBB3
afterCallBB3:
    lw __t.0, 12(_copy_cur.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    lw __t.0, 8(_copy_cur.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 8(__t.0)
    mv	a0,__t.0 
    call	printTree
    j	printTree.exitBB1
printTree.exitBB1:
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
_copy_if_end3:
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 4(__t.0)
    mv	a0,__t.0 
    call	printTree
    lw __t.0, 12(_copy_cur.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    lw __t.0, 8(_copy_cur.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 8(__t.0)
    mv	a0,__t.0 
    call	printTree
    j	afterCallBB1
_copy_if_end2:
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 4(__t.0)
    mv	a0,__t.0 
    call	printTree
    lw __t.0, 12(_copy_cur.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    lw __t.0, 8(_copy_cur.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 8(__t.0)
    mv	a0,__t.0 
    call	printTree
    j	afterCallBB2
								 # func end
    .globl	findLargest				#begin
    .p2align	2
    .type	findLargest,@function
findLargest:
findLargest.entryBB1:
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
    mv	cur.0,a0 
    lw t.0, 4(cur.0)
    lw t.0, 8(t.0)
    beq	t.0,zero,	if_thenBB1
    j	if_end2
if_thenBB1:
    mv	mergedretVal.0,cur.0 
    mv	mergedretVal.2,mergedretVal.0 
    j	findLargest.exitBB1
findLargest.exitBB1:
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
    mv	a0,mergedretVal.2 
    ret
if_end2:
    lw t.0, 4(cur.0)
    lw t.0, 8(t.0)
    mv	_copy_cur.0,t.0 
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 8(__t.0)
    beq	__t.0,zero,	_copy_if_thenBB1
    j	_copy_if_end6
_copy_if_thenBB1:
    mv	__mergedretVal.1,_copy_cur.0 
    mv	__mergedretVal.0,__mergedretVal.1 
    j	afterCallBB4
afterCallBB4:
    mv	t.0,__mergedretVal.0 
    mv	mergedretVal.1,t.0 
    mv	mergedretVal.2,mergedretVal.1 
    j	findLargest.exitBB1
_copy_if_end6:
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 8(__t.0)
    mv	a0,__t.0 
    call	findLargest
    mv	__t.0,a0 
    mv	__mergedretVal.2,__t.0 
    mv	__mergedretVal.0,__mergedretVal.2 
    j	afterCallBB4
								 # func end
    .globl	eraseImpl				#begin
    .p2align	2
    .type	eraseImpl,@function
eraseImpl:
eraseImpl.entryBB1:
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
    mv	key.0,a3 
    mv	childId.0,a2 
    mv	pnt.0,a1 
    mv	cur.0,a0 
    la ptr,root    
    lw _groot.0, 0(ptr)
    beq	cur.0,zero,	if_thenBB2
    j	if_end3
if_thenBB2:
    mv	_groot.1,_groot.0 
    mv	mergedretVal.0,zero 
    j	eraseImpl.exitBB1
eraseImpl.exitBB1:
    lui _lobits,%hi(root)
    sw _groot.1, %lo(root)(_lobits)
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
    mv	a0,mergedretVal.0 
    ret
if_end3:
    lw t.0, 8(cur.0)
    bgt	t.0,key.0,	if_thenBB3
    j	if_end4
if_thenBB3:
    lw t.0, 4(cur.0)
    lw t.0, 4(t.0)
    mv	_copy_cur.1,t.0 
    mv	_copy_pnt.1,cur.0 
    mv	_copy_key.1,key.0 
    beq	_copy_cur.1,zero,	_copy_if_thenBB2
    j	_copy_if_end7
_copy_if_thenBB2:
    mv	_groot.2,_groot.0 
    mv	__mergedretVal.2,zero 
    j	afterCallBB5
afterCallBB5:
    mv	t.0,__mergedretVal.2 
    mv	mergedretVal.2,t.0 
    mv	mergedretVal.0,mergedretVal.2 
    mv	_groot.1,_groot.2 
    j	eraseImpl.exitBB1
_copy_if_end7:
    lw __t.0, 8(_copy_cur.1)
    bgt	__t.0,_copy_key.1,	_copy_if_thenBB3
    j	_copy_if_end8
_copy_if_thenBB3:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__t.0)
    lui _lobits,%hi(root)
    sw _groot.0, %lo(root)(_lobits)
    mv	a0,__t.0 
    mv	a1,_copy_cur.1 
    mv	a2,zero 
    mv	a3,_copy_key.1 
    call	eraseImpl
    mv	__t.0,a0 
    la ptr,root    
    lw _groot.8, 0(ptr)
    mv	__mergedretVal.7,__t.0 
    mv	_groot.2,_groot.8 
    mv	__mergedretVal.2,__mergedretVal.7 
    j	afterCallBB5
_copy_if_end8:
    lw __t.0, 8(_copy_cur.1)
    blt	__t.0,_copy_key.1,	_copy_if_thenBB4
    j	_copy_if_end9
_copy_if_thenBB4:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    lui _lobits,%hi(root)
    sw _groot.0, %lo(root)(_lobits)
    mv	a0,__t.0 
    mv	a1,_copy_cur.1 
    li para, 1
    mv	a2,para 
    mv	a3,_copy_key.1 
    call	eraseImpl
    mv	__t.0,a0 
    la ptr,root    
    lw _groot.3, 0(ptr)
    mv	__mergedretVal.3,__t.0 
    mv	_groot.2,_groot.3 
    mv	__mergedretVal.2,__mergedretVal.3 
    j	afterCallBB5
_copy_if_end9:
    addi __t.0,_copy_cur.1,    12
    lw __t.0, 0(__t.0)
    li t, 1
    sub __t.1,__t.0,t
    sw __t.1,0(__t.0)
    lw __t.0, 12(_copy_cur.1)
    bgt	__t.0,zero,	_copy_if_thenBB5
    j	_copy_if_end10
_copy_if_thenBB5:
    mv	_groot.2,_groot.0 
    li __mergedretVal.2, 1
    j	afterCallBB5
_copy_if_end10:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__t.0)
    beq	__t.0,zero,	_copy_if_thenBB6
    j	_copy_if_end11
_copy_if_end11:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__t.0)
    mv	a0,__t.0 
    call	findLargest
    mv	__t.0,a0 
    mv	__replacement.2,__t.0 
    lw __t.0, 8(_groot.0)
    beq	_copy_key.1,__t.0,	_copy_if_thenBB7
    j	paracopy1
_copy_if_thenBB7:
    mv	_groot.4,__replacement.2 
    mv	_groot.5,_groot.4 
    j	_copy_if_end12
_copy_if_end12:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__t.0)
    lw __t.0, 8(__replacement.2)
    lw __t.0, 8(__t.0)
    bne	__t.0,__t.0,	_copy_if_thenBB8
    j	_copy_if_end13
_copy_if_thenBB8:
    lw __t.0, 4(__replacement.2)
    lw __t.0, 0(__replacement.2)
    lw __t.0, 4(__t.0)
    lw __t.0, 4(__t.0)
    sw __t.0,8(__t.0)
    lw __t.0, 4(__replacement.2)
    lw __t.0, 4(__t.0)
    bne	__t.0,zero,	_copy_if_thenBB9
    j	_copy_if_end13
_copy_if_thenBB9:
    lw __t.0, 4(__replacement.2)
    lw __t.0, 4(__t.0)
    lw __t.0, 0(__replacement.2)
    sw __t.0,0(__t.0)
    j	_copy_if_end13
_copy_if_end13:
    bne	_copy_pnt.1,zero,	_copy_if_thenBB10
    j	_copy_if_end14
_copy_if_thenBB10:
    lw __t.0, 4(_copy_pnt.1)
    sw __replacement.2,4(__t.0)
    j	_copy_if_end14
_copy_if_end14:
    sw _copy_pnt.1,0(__replacement.2)
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__replacement.2)
    lw __t.0, 8(__t.0)
    sw __t.0,8(__t.0)
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    bne	__t.0,zero,	_copy_if_thenBB11
    j	_copy_if_end15
_copy_if_end15:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__t.0)
    lw __t.0, 8(__replacement.2)
    lw __t.0, 8(__t.0)
    bne	__t.0,__t.0,	_copy_if_thenBB12
    j	_copy_if_end16
_copy_if_end16:
    mv	_groot.2,_groot.5 
    li __mergedretVal.2, 1
    j	afterCallBB5
_copy_if_thenBB12:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__replacement.2)
    lw __t.0, 4(__t.0)
    sw __t.0,4(__t.0)
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__t.0)
    sw __replacement.2,0(__t.0)
    j	_copy_if_end16
_copy_if_thenBB11:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    sw __replacement.2,0(__t.0)
    j	_copy_if_end15
paracopy1:
    mv	_groot.5,_groot.0 
    j	_copy_if_end12
_copy_if_thenBB6:
    bne	_copy_pnt.1,zero,	_copy_if_thenBB13
    j	_copy_if_end17
_copy_if_thenBB13:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(_copy_pnt.1)
    lw __t.0, 8(__t.0)
    sw __t.0,4(__t.0)
    j	_copy_if_end17
_copy_if_end17:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    bne	__t.0,zero,	_copy_if_thenBB14
    j	_copy_if_end18
_copy_if_end18:
    lw __t.0, 8(_groot.0)
    beq	_copy_key.1,__t.0,	_copy_if_thenBB15
    j	paracopy2
_copy_if_thenBB15:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    mv	_groot.6,__t.0 
    mv	_groot.7,_groot.6 
    j	_copy_if_end19
_copy_if_end19:
    mv	_groot.2,_groot.7 
    li __mergedretVal.2, 1
    j	afterCallBB5
paracopy2:
    mv	_groot.7,_groot.0 
    j	_copy_if_end19
_copy_if_thenBB14:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    sw _copy_pnt.1,0(__t.0)
    j	_copy_if_end18
if_end4:
    lw t.0, 8(cur.0)
    blt	t.0,key.0,	if_thenBB4
    j	if_end5
if_thenBB4:
    lw t.0, 4(cur.0)
    lw t.0, 8(t.0)
    mv	_copy_cur.1,t.0 
    mv	_copy_pnt.1,cur.0 
    mv	_copy_key.1,key.0 
    beq	_copy_cur.1,zero,	_copy_if_thenBB16
    j	_copy_if_end20
_copy_if_end20:
    lw __t.0, 8(_copy_cur.1)
    bgt	__t.0,_copy_key.1,	_copy_if_thenBB17
    j	_copy_if_end21
_copy_if_thenBB17:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__t.0)
    lui _lobits,%hi(root)
    sw _groot.0, %lo(root)(_lobits)
    mv	a0,__t.0 
    mv	a1,_copy_cur.1 
    mv	a2,zero 
    mv	a3,_copy_key.1 
    call	eraseImpl
    mv	__t.0,a0 
    la ptr,root    
    lw _groot.9, 0(ptr)
    mv	__mergedretVal.1,__t.0 
    mv	__mergedretVal.7,__mergedretVal.1 
    mv	_groot.15,_groot.9 
    j	afterCallBB6
afterCallBB6:
    mv	t.0,__mergedretVal.7 
    mv	mergedretVal.3,t.0 
    mv	mergedretVal.0,mergedretVal.3 
    mv	_groot.1,_groot.15 
    j	eraseImpl.exitBB1
_copy_if_end21:
    lw __t.0, 8(_copy_cur.1)
    blt	__t.0,_copy_key.1,	_copy_if_thenBB18
    j	_copy_if_end22
_copy_if_end22:
    addi __t.0,_copy_cur.1,    12
    lw __t.0, 0(__t.0)
    li t, 1
    sub __t.1,__t.0,t
    sw __t.1,0(__t.0)
    lw __t.0, 12(_copy_cur.1)
    bgt	__t.0,zero,	_copy_if_thenBB19
    j	_copy_if_end23
_copy_if_thenBB19:
    mv	_groot.15,_groot.0 
    li __mergedretVal.7, 1
    j	afterCallBB6
_copy_if_end23:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__t.0)
    beq	__t.0,zero,	_copy_if_thenBB20
    j	_copy_if_end24
_copy_if_thenBB20:
    bne	_copy_pnt.1,zero,	_copy_if_thenBB21
    j	_copy_if_end25
_copy_if_end25:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    bne	__t.0,zero,	_copy_if_thenBB22
    j	_copy_if_end26
_copy_if_thenBB22:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    sw _copy_pnt.1,0(__t.0)
    j	_copy_if_end26
_copy_if_end26:
    lw __t.0, 8(_groot.0)
    beq	_copy_key.1,__t.0,	_copy_if_thenBB23
    j	paracopy3
paracopy3:
    mv	_groot.10,_groot.0 
    j	_copy_if_end27
_copy_if_end27:
    mv	_groot.15,_groot.10 
    li __mergedretVal.7, 1
    j	afterCallBB6
_copy_if_thenBB23:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    mv	_groot.11,__t.0 
    mv	_groot.10,_groot.11 
    j	_copy_if_end27
_copy_if_thenBB21:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(_copy_pnt.1)
    lw __t.0, 8(__t.0)
    sw __t.0,8(__t.0)
    j	_copy_if_end25
_copy_if_end24:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__t.0)
    mv	a0,__t.0 
    call	findLargest
    mv	__t.0,a0 
    mv	__replacement.1,__t.0 
    lw __t.0, 8(_groot.0)
    beq	_copy_key.1,__t.0,	_copy_if_thenBB24
    j	paracopy4
_copy_if_thenBB24:
    mv	_groot.12,__replacement.1 
    mv	_groot.13,_groot.12 
    j	_copy_if_end28
_copy_if_end28:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__t.0)
    lw __t.0, 8(__replacement.1)
    lw __t.0, 8(__t.0)
    bne	__t.0,__t.0,	_copy_if_thenBB25
    j	_copy_if_end29
_copy_if_end29:
    bne	_copy_pnt.1,zero,	_copy_if_thenBB26
    j	_copy_if_end30
_copy_if_thenBB26:
    lw __t.0, 4(_copy_pnt.1)
    sw __replacement.1,8(__t.0)
    j	_copy_if_end30
_copy_if_end30:
    sw _copy_pnt.1,0(__replacement.1)
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__replacement.1)
    lw __t.0, 8(__t.0)
    sw __t.0,8(__t.0)
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    bne	__t.0,zero,	_copy_if_thenBB27
    j	_copy_if_end31
_copy_if_end31:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__t.0)
    lw __t.0, 8(__replacement.1)
    lw __t.0, 8(__t.0)
    bne	__t.0,__t.0,	_copy_if_thenBB28
    j	_copy_if_end32
_copy_if_end32:
    mv	_groot.15,_groot.13 
    li __mergedretVal.7, 1
    j	afterCallBB6
_copy_if_thenBB28:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__replacement.1)
    lw __t.0, 4(__t.0)
    sw __t.0,4(__t.0)
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 4(__t.0)
    sw __replacement.1,0(__t.0)
    j	_copy_if_end32
_copy_if_thenBB27:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    sw __replacement.1,0(__t.0)
    j	_copy_if_end31
_copy_if_thenBB25:
    lw __t.0, 4(__replacement.1)
    lw __t.0, 0(__replacement.1)
    lw __t.0, 4(__t.0)
    lw __t.0, 4(__t.0)
    sw __t.0,8(__t.0)
    lw __t.0, 4(__replacement.1)
    lw __t.0, 4(__t.0)
    bne	__t.0,zero,	_copy_if_thenBB29
    j	_copy_if_end29
_copy_if_thenBB29:
    lw __t.0, 4(__replacement.1)
    lw __t.0, 4(__t.0)
    lw __t.0, 0(__replacement.1)
    sw __t.0,0(__t.0)
    j	_copy_if_end29
paracopy4:
    mv	_groot.13,_groot.0 
    j	_copy_if_end28
_copy_if_thenBB18:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    lui _lobits,%hi(root)
    sw _groot.0, %lo(root)(_lobits)
    mv	a0,__t.0 
    mv	a1,_copy_cur.1 
    li para, 1
    mv	a2,para 
    mv	a3,_copy_key.1 
    call	eraseImpl
    mv	__t.0,a0 
    la ptr,root    
    lw _groot.14, 0(ptr)
    mv	__mergedretVal.5,__t.0 
    mv	__mergedretVal.7,__mergedretVal.5 
    mv	_groot.15,_groot.14 
    j	afterCallBB6
_copy_if_thenBB16:
    mv	_groot.15,_groot.0 
    mv	__mergedretVal.7,zero 
    j	afterCallBB6
if_end5:
    addi t.0,cur.0,    12
    lw t.0, 0(t.0)
    li t, 1
    sub t.1,t.0,t
    sw t.1,0(t.0)
    lw t.0, 12(cur.0)
    bgt	t.0,zero,	if_thenBB5
    j	if_end6
if_thenBB5:
    mv	_groot.1,_groot.0 
    li mergedretVal.0, 1
    j	eraseImpl.exitBB1
if_end6:
    lw t.0, 4(cur.0)
    lw t.0, 4(t.0)
    beq	t.0,zero,	if_thenBB6
    j	if_end7
if_end7:
    lw t.0, 4(cur.0)
    lw t.0, 4(t.0)
    mv	_copy_cur.1,t.0 
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    beq	__t.0,zero,	_copy_if_thenBB30
    j	_copy_if_end33
_copy_if_thenBB30:
    mv	__mergedretVal.1,_copy_cur.1 
    mv	__mergedretVal.2,__mergedretVal.1 
    j	afterCallBB7
afterCallBB7:
    mv	t.0,__mergedretVal.2 
    mv	replacement.1,t.0 
    lw t.0, 8(_groot.0)
    beq	key.0,t.0,	if_thenBB7
    j	paracopy5
if_thenBB7:
    mv	_groot.17,replacement.1 
    mv	_groot.16,_groot.17 
    j	if_end8
if_end8:
    lw t.0, 4(cur.0)
    lw t.0, 4(t.0)
    lw t.0, 8(replacement.1)
    lw t.0, 8(t.0)
    bne	t.0,t.0,	if_thenBB8
    j	if_end9
if_thenBB8:
    lw t.0, 4(replacement.1)
    lw t.0, 0(replacement.1)
    lw t.0, 4(t.0)
    lw t.0, 4(t.0)
    sw t.0,8(t.0)
    lw t.0, 4(replacement.1)
    lw t.0, 4(t.0)
    bne	t.0,zero,	if_thenBB9
    j	if_end9
if_thenBB9:
    lw t.0, 4(replacement.1)
    lw t.0, 4(t.0)
    lw t.0, 0(replacement.1)
    sw t.0,0(t.0)
    j	if_end9
if_end9:
    bne	pnt.0,zero,	if_thenBB10
    j	if_end10
if_thenBB10:
    lw t.0, 4(pnt.0)
    slli t.0,childId.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    sw replacement.1,0(t.0)
    j	if_end10
if_end10:
    sw pnt.0,0(replacement.1)
    lw t.0, 4(cur.0)
    lw t.0, 4(replacement.1)
    lw t.0, 8(t.0)
    sw t.0,8(t.0)
    lw t.0, 4(cur.0)
    lw t.0, 8(t.0)
    bne	t.0,zero,	if_thenBB11
    j	if_end11
if_thenBB11:
    lw t.0, 4(cur.0)
    lw t.0, 8(t.0)
    sw replacement.1,0(t.0)
    j	if_end11
if_end11:
    lw t.0, 4(cur.0)
    lw t.0, 4(t.0)
    lw t.0, 8(replacement.1)
    lw t.0, 8(t.0)
    bne	t.0,t.0,	if_thenBB12
    j	if_end12
if_thenBB12:
    lw t.0, 4(cur.0)
    lw t.0, 4(replacement.1)
    lw t.0, 4(t.0)
    sw t.0,4(t.0)
    lw t.0, 4(cur.0)
    lw t.0, 4(t.0)
    sw replacement.1,0(t.0)
    j	if_end12
if_end12:
    mv	_groot.1,_groot.16 
    li mergedretVal.0, 1
    j	eraseImpl.exitBB1
paracopy5:
    mv	_groot.16,_groot.0 
    j	if_end8
_copy_if_end33:
    lw __t.0, 4(_copy_cur.1)
    lw __t.0, 8(__t.0)
    mv	a0,__t.0 
    call	findLargest
    mv	__t.0,a0 
    mv	__mergedretVal.3,__t.0 
    mv	__mergedretVal.2,__mergedretVal.3 
    j	afterCallBB7
if_thenBB6:
    bne	pnt.0,zero,	if_thenBB13
    j	if_end13
if_end13:
    lw t.0, 4(cur.0)
    lw t.0, 8(t.0)
    bne	t.0,zero,	if_thenBB14
    j	if_end14
if_end14:
    lw t.0, 8(_groot.0)
    beq	key.0,t.0,	if_thenBB15
    j	paracopy6
paracopy6:
    mv	_groot.18,_groot.0 
    j	if_end15
if_end15:
    mv	_groot.1,_groot.18 
    li mergedretVal.0, 1
    j	eraseImpl.exitBB1
if_thenBB15:
    lw t.0, 4(cur.0)
    lw t.0, 8(t.0)
    mv	_groot.19,t.0 
    mv	_groot.18,_groot.19 
    j	if_end15
if_thenBB14:
    lw t.0, 4(cur.0)
    lw t.0, 8(t.0)
    sw pnt.0,0(t.0)
    j	if_end14
if_thenBB13:
    lw t.0, 4(cur.0)
    lw t.0, 4(pnt.0)
    slli t.0,childId.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 8(t.0)
    sw t.0,0(t.0)
    j	if_end13
								 # func end
    .globl	insertImpl				#begin
    .p2align	2
    .type	insertImpl,@function
insertImpl:
insertImpl.entryBB1:
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
    mv	key.0,a3 
    mv	childId.0,a2 
    mv	pnt.0,a1 
    mv	cur.0,a0 
    beq	cur.0,zero,	if_thenBB16
    j	if_end16
if_end16:
    lw t.0, 8(cur.0)
    beq	t.0,key.0,	if_thenBB17
    j	if_end17
if_end17:
    lw t.0, 8(cur.0)
    blt	t.0,key.0,	if_thenBB18
    j	paracopy7
if_thenBB18:
    li id.2, 1
    j	if_end18
if_end18:
    lw t.0, 4(cur.0)
    slli t.0,id.2,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    mv	_copy_cur.0,t.0 
    mv	_copy_pnt.0,cur.0 
    mv	_copy_childId.0,id.2 
    mv	_copy_key.0,key.0 
    beq	_copy_cur.0,zero,	_copy_if_thenBB31
    j	_copy_if_end34
_copy_if_thenBB31:
    mv	___key.0,_copy_key.0 
    mv	___pnt.0,_copy_pnt.0 
    li a0, 16
    call malloc
    mv	___t.0,a0 
    mv	___node.0,___t.0 
    li a0, 12
    call malloc
    mv	___t.0,a0 
    li _t, 2
    sw _t,0(___t.0)
    sw ___t.0,4(___node.0)
    sw ___key.0,8(___node.0)
    li _t, 1
    sw _t,12(___node.0)
    sw ___pnt.0,0(___node.0)
    lw ___t.0, 4(___node.0)
    li _t, 0
    sw _t,4(___t.0)
    lw ___t.0, 4(___node.0)
    li _t, 0
    sw _t,8(___t.0)
    mv	__t.0,___node.0 
    mv	_copy_cur.1,__t.0 
    lw __t.0, 4(_copy_pnt.0)
    slli __t.0,_copy_childId.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    sw _copy_cur.1,0(__t.0)
    mv	__mergedretVal.1,zero 
    j	afterCallBB8
afterCallBB8:
    mv	t.0,__mergedretVal.1 
    mv	mergedretVal.0,t.0 
    mv	mergedretVal.2,mergedretVal.0 
    j	insertImpl.exitBB1
insertImpl.exitBB1:
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
    mv	a0,mergedretVal.2 
    ret
_copy_if_end34:
    lw __t.0, 8(_copy_cur.0)
    beq	__t.0,_copy_key.0,	_copy_if_thenBB32
    j	_copy_if_end35
_copy_if_thenBB32:
    addi __t.0,_copy_cur.0,    12
    lw __t.0, 0(__t.0)
    addi __t.1,__t.0,    1
    sw __t.1,0(__t.0)
    li __mergedretVal.1, 1
    j	afterCallBB8
_copy_if_end35:
    lw __t.0, 8(_copy_cur.0)
    blt	__t.0,_copy_key.0,	_copy_if_thenBB33
    j	paracopy8
paracopy8:
    mv	__id.3,zero 
    j	_copy_if_end36
_copy_if_end36:
    lw __t.0, 4(_copy_cur.0)
    slli __t.0,__id.3,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    mv	a1,_copy_cur.0 
    mv	a2,__id.3 
    mv	a3,_copy_key.0 
    call	insertImpl
    mv	__t.0,a0 
    mv	__mergedretVal.3,__t.0 
    mv	__mergedretVal.1,__mergedretVal.3 
    j	afterCallBB8
_copy_if_thenBB33:
    li __id.3, 1
    j	_copy_if_end36
paracopy7:
    mv	id.2,zero 
    j	if_end18
if_thenBB17:
    addi t.0,cur.0,    12
    lw t.0, 0(t.0)
    addi t.1,t.0,    1
    sw t.1,0(t.0)
    li mergedretVal.2, 1
    j	insertImpl.exitBB1
if_thenBB16:
    mv	_key.0,key.0 
    mv	_pnt.0,pnt.0 
    li a0, 16
    call malloc
    mv	_t.0,a0 
    mv	_node.0,_t.0 
    li a0, 12
    call malloc
    mv	_t.0,a0 
    li _t, 2
    sw _t,0(_t.0)
    sw _t.0,4(_node.0)
    sw _key.0,8(_node.0)
    li _t, 1
    sw _t,12(_node.0)
    sw _pnt.0,0(_node.0)
    lw _t.0, 4(_node.0)
    li _t, 0
    sw _t,4(_t.0)
    lw _t.0, 4(_node.0)
    li _t, 0
    sw _t,8(_t.0)
    mv	t.0,_node.0 
    mv	cur.2,t.0 
    lw t.0, 4(pnt.0)
    slli t.0,childId.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    sw cur.2,0(t.0)
    mv	mergedretVal.2,zero 
    j	insertImpl.exitBB1
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
    mv	_t.0,a0 
    mv	_gseed.0,_t.0 
    mv	_gseed.1,_gseed.0 
    mv	_groot.1,zero 
    mv	__i.1,zero 
    j	__forcondBB1
__forcondBB1:
    li t, 50000
    blt	__i.1,t,	afterCallBB9
    j	_afterCallBB1
afterCallBB9:
    mv	_x.0,_gseed.1 
    slli _t.0,_x.0,    13
    xor _t.0,_x.0,_t.0
    mv	_x.1,_t.0 
    li t, 2147483647
    and _t.0,_x.1,t
    mv	_x.2,_t.0 
    srai _t.0,_x.2,    17
    xor _t.0,_x.2,_t.0
    mv	_x.3,_t.0 
    slli _t.0,_x.3,    5
    xor _t.0,_x.3,_t.0
    mv	_x.4,_t.0 
    li t, 2147483647
    and _t.0,_x.4,t
    mv	_x.5,_t.0 
    mv	_gseed.2,_x.5 
    mv	__t.0,_x.5 
    li t, 128
    rem __t.0,__t.0,t
    mv	__value.1,__t.0 
    mv	__x.0,_gseed.2 
    slli __t.0,__x.0,    13
    xor __t.0,__x.0,__t.0
    mv	__x.1,__t.0 
    li t, 2147483647
    and __t.0,__x.1,t
    mv	__x.2,__t.0 
    srai __t.0,__x.2,    17
    xor __t.0,__x.2,__t.0
    mv	__x.3,__t.0 
    slli __t.0,__x.3,    5
    xor __t.0,__x.3,__t.0
    mv	__x.4,__t.0 
    li t, 2147483647
    and __t.0,__x.4,t
    mv	__x.5,__t.0 
    mv	_gseed.3,__x.5 
    mv	_t.0,__x.5 
    li t, 1717986912
    blt	_t.0,t,	_if_thenBB1
    j	_if_end1
_if_end1:
    li _mergedretVal.2, 2
    j	afterCallBB10
afterCallBB10:
    mv	__t.0,_mergedretVal.2 
    li t, 1
    beq	__t.0,t,	__if_thenBB1
    j	__if_elseBB1
__if_thenBB1:
    mv	_key.1,__value.1 
    bne	_groot.1,zero,	_if_thenBB2
    j	_if_end2
_if_thenBB2:
    mv	_copy_cur.2,_groot.1 
    mv	_copy_key.2,_key.1 
    beq	_copy_cur.2,zero,	_copy_if_thenBB34
    j	_copy_if_end37
_copy_if_thenBB34:
    mv	___key.0,_copy_key.2 
    li a0, 16
    call malloc
    mv	___t.0,a0 
    mv	___node.0,___t.0 
    li a0, 12
    call malloc
    mv	___t.0,a0 
    li _t, 2
    sw _t,0(___t.0)
    sw ___t.0,4(___node.0)
    sw ___key.0,8(___node.0)
    li _t, 1
    sw _t,12(___node.0)
    li _t, 0
    sw _t,0(___node.0)
    lw ___t.0, 4(___node.0)
    li _t, 0
    sw _t,4(___t.0)
    lw ___t.0, 4(___node.0)
    li _t, 0
    sw _t,8(___t.0)
    mv	__t.0,___node.0 
    mv	_copy_cur.3,__t.0 
    lw __t.0, 0(s10)
    sw _copy_cur.3,0(__t.0)
    j	afterCallBB11
afterCallBB11:
    mv	_groot.2,_groot.1 
    j	afterCallBB12
afterCallBB12:
    mv	_groot.4,_groot.2 
    j	__forupdateBB1
__forupdateBB1:
    addi __i.2,__i.1,    1
    mv	_groot.1,_groot.4 
    mv	__i.1,__i.2 
    mv	_gseed.1,_gseed.3 
    j	__forcondBB1
_copy_if_end37:
    lw __t.0, 8(_copy_cur.2)
    beq	__t.0,_copy_key.2,	_copy_if_thenBB35
    j	_copy_if_end38
_copy_if_thenBB35:
    addi __t.0,_copy_cur.2,    12
    lw __t.0, 0(__t.0)
    addi __t.1,__t.0,    1
    sw __t.1,0(__t.0)
    j	afterCallBB11
_copy_if_end38:
    lw __t.0, 8(_copy_cur.2)
    blt	__t.0,_copy_key.2,	_copy_if_thenBB36
    j	paracopy9
_copy_if_thenBB36:
    li __id.5, 1
    j	_copy_if_end39
_copy_if_end39:
    lw __t.0, 4(_copy_cur.2)
    slli __t.0,__id.5,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    mv	a1,_copy_cur.2 
    mv	a2,__id.5 
    mv	a3,_copy_key.2 
    call	insertImpl
    mv	__t.0,a0 
    j	afterCallBB11
paracopy9:
    mv	__id.5,zero 
    j	_copy_if_end39
_if_end2:
    mv	__key.0,_key.1 
    li a0, 16
    call malloc
    mv	__t.0,a0 
    mv	__node.0,__t.0 
    li a0, 12
    call malloc
    mv	__t.0,a0 
    li _t, 2
    sw _t,0(__t.0)
    sw __t.0,4(__node.0)
    sw __key.0,8(__node.0)
    li _t, 1
    sw _t,12(__node.0)
    li _t, 0
    sw _t,0(__node.0)
    lw __t.0, 4(__node.0)
    li _t, 0
    sw _t,4(__t.0)
    lw __t.0, 4(__node.0)
    li _t, 0
    sw _t,8(__t.0)
    mv	_t.0,__node.0 
    mv	_groot.3,_t.0 
    mv	_groot.2,_groot.3 
    j	afterCallBB12
__if_elseBB1:
    mv	_key.2,__value.1 
    beq	_groot.1,zero,	_if_thenBB3
    j	_if_end3
_if_end3:
    mv	_copy_cur.2,_groot.1 
    mv	_copy_key.2,_key.2 
    beq	_copy_cur.2,zero,	_copy_if_thenBB37
    j	_copy_if_end40
_copy_if_end40:
    lw __t.0, 8(_copy_cur.2)
    bgt	__t.0,_copy_key.2,	_copy_if_thenBB38
    j	_copy_if_end41
_copy_if_thenBB38:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__t.0)
    lui _lobits,%hi(root)
    sw _groot.1, %lo(root)(_lobits)
    mv	a0,__t.0 
    mv	a1,_copy_cur.2 
    mv	a2,zero 
    mv	a3,_copy_key.2 
    call	eraseImpl
    mv	__t.0,a0 
    la ptr,root    
    lw _groot.5, 0(ptr)
    mv	_groot.11,_groot.5 
    j	afterCallBB13
afterCallBB13:
    mv	_groot.12,_groot.11 
    j	afterCallBB14
afterCallBB14:
    mv	_groot.4,_groot.12 
    j	__forupdateBB1
_copy_if_end41:
    lw __t.0, 8(_copy_cur.2)
    blt	__t.0,_copy_key.2,	_copy_if_thenBB39
    j	_copy_if_end42
_copy_if_end42:
    addi __t.0,_copy_cur.2,    12
    lw __t.0, 0(__t.0)
    li t, 1
    sub __t.1,__t.0,t
    sw __t.1,0(__t.0)
    lw __t.0, 12(_copy_cur.2)
    bgt	__t.0,zero,	_copy_if_thenBB40
    j	_copy_if_end43
_copy_if_end43:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__t.0)
    beq	__t.0,zero,	_copy_if_end44
    j	_copy_if_end45
_copy_if_end45:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__t.0)
    mv	a0,__t.0 
    call	findLargest
    mv	__t.0,a0 
    mv	__replacement.2,__t.0 
    lw __t.0, 8(_groot.1)
    beq	_copy_key.2,__t.0,	_copy_if_thenBB41
    j	paracopy10
paracopy10:
    mv	_groot.7,_groot.1 
    j	_copy_if_end46
_copy_if_end46:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__t.0)
    lw __t.0, 8(__replacement.2)
    lw __t.0, 8(__t.0)
    bne	__t.0,__t.0,	_copy_if_thenBB42
    j	_copy_if_end47
_copy_if_thenBB42:
    lw __t.0, 4(__replacement.2)
    lw __t.0, 0(__replacement.2)
    lw __t.0, 4(__t.0)
    lw __t.0, 4(__t.0)
    sw __t.0,8(__t.0)
    lw __t.0, 4(__replacement.2)
    lw __t.0, 4(__t.0)
    bne	__t.0,zero,	_copy_if_thenBB43
    j	_copy_if_end47
_copy_if_end47:
    li _t, 0
    sw _t,0(__replacement.2)
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__replacement.2)
    lw __t.0, 8(__t.0)
    sw __t.0,8(__t.0)
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 8(__t.0)
    bne	__t.0,zero,	_copy_if_thenBB44
    j	_copy_if_end48
_copy_if_thenBB44:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 8(__t.0)
    sw __replacement.2,0(__t.0)
    j	_copy_if_end48
_copy_if_end48:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__t.0)
    lw __t.0, 8(__replacement.2)
    lw __t.0, 8(__t.0)
    bne	__t.0,__t.0,	_copy_if_thenBB45
    j	_copy_if_end49
_copy_if_end49:
    mv	_groot.11,_groot.7 
    j	afterCallBB13
_copy_if_thenBB45:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__replacement.2)
    lw __t.0, 4(__t.0)
    sw __t.0,4(__t.0)
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__t.0)
    sw __replacement.2,0(__t.0)
    j	_copy_if_end49
_copy_if_thenBB43:
    lw __t.0, 4(__replacement.2)
    lw __t.0, 4(__t.0)
    lw __t.0, 0(__replacement.2)
    sw __t.0,0(__t.0)
    j	_copy_if_end47
_copy_if_thenBB41:
    mv	_groot.6,__replacement.2 
    mv	_groot.7,_groot.6 
    j	_copy_if_end46
_copy_if_end44:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 8(__t.0)
    bne	__t.0,zero,	_copy_if_thenBB46
    j	_copy_if_end50
_copy_if_thenBB46:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 8(__t.0)
    li _t, 0
    sw _t,0(__t.0)
    j	_copy_if_end50
_copy_if_end50:
    lw __t.0, 8(_groot.1)
    beq	_copy_key.2,__t.0,	_copy_if_thenBB47
    j	paracopy11
_copy_if_thenBB47:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 8(__t.0)
    mv	_groot.8,__t.0 
    mv	_groot.9,_groot.8 
    j	_copy_if_end51
_copy_if_end51:
    mv	_groot.11,_groot.9 
    j	afterCallBB13
paracopy11:
    mv	_groot.9,_groot.1 
    j	_copy_if_end51
_copy_if_thenBB40:
    mv	_groot.11,_groot.1 
    j	afterCallBB13
_copy_if_thenBB39:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 8(__t.0)
    lui _lobits,%hi(root)
    sw _groot.1, %lo(root)(_lobits)
    mv	a0,__t.0 
    mv	a1,_copy_cur.2 
    li para, 1
    mv	a2,para 
    mv	a3,_copy_key.2 
    call	eraseImpl
    mv	__t.0,a0 
    la ptr,root    
    lw _groot.10, 0(ptr)
    mv	_groot.11,_groot.10 
    j	afterCallBB13
_copy_if_thenBB37:
    mv	_groot.11,_groot.1 
    j	afterCallBB13
_if_thenBB3:
    mv	_groot.12,_groot.1 
    j	afterCallBB14
_if_thenBB1:
    li _mergedretVal.2, 1
    j	afterCallBB10
_afterCallBB1:
    mv	_groot.13,_groot.1 
    mv	_gseed.4,_gseed.1 
    mv	__i.1,zero 
    j	__forcondBB2
__forcondBB2:
    li t, 100000
    blt	__i.1,t,	afterCallBB15
    j	_afterCallBB2
afterCallBB15:
    mv	_x.0,_gseed.4 
    slli _t.0,_x.0,    13
    xor _t.0,_x.0,_t.0
    mv	_x.1,_t.0 
    li t, 2147483647
    and _t.0,_x.1,t
    mv	_x.2,_t.0 
    srai _t.0,_x.2,    17
    xor _t.0,_x.2,_t.0
    mv	_x.3,_t.0 
    slli _t.0,_x.3,    5
    xor _t.0,_x.3,_t.0
    mv	_x.4,_t.0 
    li t, 2147483647
    and _t.0,_x.4,t
    mv	_x.5,_t.0 
    mv	_gseed.5,_x.5 
    mv	__t.0,_x.5 
    li t, 128
    rem __t.0,__t.0,t
    mv	__value.1,__t.0 
    mv	__x.0,_gseed.5 
    slli __t.0,__x.0,    13
    xor __t.0,__x.0,__t.0
    mv	__x.1,__t.0 
    li t, 2147483647
    and __t.0,__x.1,t
    mv	__x.2,__t.0 
    srai __t.0,__x.2,    17
    xor __t.0,__x.2,__t.0
    mv	__x.3,__t.0 
    slli __t.0,__x.3,    5
    xor __t.0,__x.3,__t.0
    mv	__x.4,__t.0 
    li t, 2147483647
    and __t.0,__x.4,t
    mv	__x.5,__t.0 
    mv	_gseed.6,__x.5 
    mv	_t.0,__x.5 
    li t, 429496728
    blt	_t.0,t,	_if_thenBB4
    j	_if_end4
_if_thenBB4:
    li _mergedretVal.3, 1
    j	afterCallBB16
afterCallBB16:
    mv	__t.0,_mergedretVal.3 
    li t, 1
    beq	__t.0,t,	__if_thenBB2
    j	__if_elseBB2
__if_elseBB2:
    mv	_key.1,__value.1 
    beq	_groot.13,zero,	_if_thenBB5
    j	_if_end5
_if_end5:
    lui _lobits,%hi(root)
    sw _groot.13, %lo(root)(_lobits)
    mv	a0,_groot.13 
    mv	a1,zero 
    li para, -1
    mv	a2,para 
    mv	a3,_key.1 
    call	eraseImpl
    mv	_t.0,a0 
    la ptr,root    
    lw _groot.14, 0(ptr)
    mv	_groot.15,_groot.14 
    j	afterCallBB17
afterCallBB17:
    mv	_groot.16,_groot.15 
    j	__forupdateBB2
__forupdateBB2:
    addi __i.2,__i.1,    1
    mv	__i.1,__i.2 
    mv	_groot.13,_groot.16 
    mv	_gseed.4,_gseed.6 
    j	__forcondBB2
_if_thenBB5:
    mv	_groot.15,_groot.13 
    j	afterCallBB17
__if_thenBB2:
    mv	_key.2,__value.1 
    bne	_groot.13,zero,	_if_thenBB6
    j	_if_end6
_if_end6:
    mv	__key.0,_key.2 
    li a0, 16
    call malloc
    mv	__t.0,a0 
    mv	__node.0,__t.0 
    li a0, 12
    call malloc
    mv	__t.0,a0 
    li _t, 2
    sw _t,0(__t.0)
    sw __t.0,4(__node.0)
    sw __key.0,8(__node.0)
    li _t, 1
    sw _t,12(__node.0)
    li _t, 0
    sw _t,0(__node.0)
    lw __t.0, 4(__node.0)
    li _t, 0
    sw _t,4(__t.0)
    lw __t.0, 4(__node.0)
    li _t, 0
    sw _t,8(__t.0)
    mv	_t.0,__node.0 
    mv	_groot.17,_t.0 
    mv	_groot.18,_groot.17 
    j	afterCallBB18
afterCallBB18:
    mv	_groot.16,_groot.18 
    j	__forupdateBB2
_if_thenBB6:
    mv	_copy_cur.3,_groot.13 
    mv	_copy_key.3,_key.2 
    beq	_copy_cur.3,zero,	_copy_if_thenBB48
    j	_copy_if_end52
_copy_if_end52:
    lw __t.0, 8(_copy_cur.3)
    beq	__t.0,_copy_key.3,	_copy_if_thenBB49
    j	_copy_if_end53
_copy_if_thenBB49:
    addi __t.0,_copy_cur.3,    12
    lw __t.0, 0(__t.0)
    addi __t.1,__t.0,    1
    sw __t.1,0(__t.0)
    j	afterCallBB19
afterCallBB19:
    mv	_groot.18,_groot.13 
    j	afterCallBB18
_copy_if_end53:
    lw __t.0, 8(_copy_cur.3)
    blt	__t.0,_copy_key.3,	_copy_if_thenBB50
    j	paracopy12
_copy_if_thenBB50:
    li __id.5, 1
    j	_copy_if_end54
_copy_if_end54:
    lw __t.0, 4(_copy_cur.3)
    slli __t.0,__id.5,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    mv	a1,_copy_cur.3 
    mv	a2,__id.5 
    mv	a3,_copy_key.3 
    call	insertImpl
    mv	__t.0,a0 
    j	afterCallBB19
paracopy12:
    mv	__id.5,zero 
    j	_copy_if_end54
_copy_if_thenBB48:
    mv	___key.0,_copy_key.3 
    li a0, 16
    call malloc
    mv	___t.0,a0 
    mv	___node.0,___t.0 
    li a0, 12
    call malloc
    mv	___t.0,a0 
    li _t, 2
    sw _t,0(___t.0)
    sw ___t.0,4(___node.0)
    sw ___key.0,8(___node.0)
    li _t, 1
    sw _t,12(___node.0)
    li _t, 0
    sw _t,0(___node.0)
    lw ___t.0, 4(___node.0)
    li _t, 0
    sw _t,4(___t.0)
    lw ___t.0, 4(___node.0)
    li _t, 0
    sw _t,8(___t.0)
    mv	__t.0,___node.0 
    mv	_copy_cur.4,__t.0 
    lw __t.0, 0(s10)
    sw _copy_cur.4,0(__t.0)
    j	afterCallBB19
_if_end4:
    li _mergedretVal.3, 2
    j	afterCallBB16
_afterCallBB2:
    mv	_groot.19,_groot.13 
    mv	_gseed.7,_gseed.4 
    mv	__i.1,zero 
    j	__forcondBB3
__forcondBB3:
    li t, 50000
    blt	__i.1,t,	afterCallBB20
    j	afterCallBB21
afterCallBB21:
    mv	_copy_cur.0,_groot.19 
    beq	_copy_cur.0,zero,	afterCallBB22
    j	_copy_if_end55
_copy_if_end55:
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 4(__t.0)
    mv	a0,__t.0 
    call	printTree
    lw __t.0, 12(_copy_cur.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    lw __t.0, 8(_copy_cur.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    lw __t.0, 4(_copy_cur.0)
    lw __t.0, 8(__t.0)
    mv	a0,__t.0 
    call	printTree
    j	afterCallBB22
afterCallBB22:
    lui _lobits,%hi(root)
    sw _groot.19, %lo(root)(_lobits)
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
afterCallBB20:
    mv	_x.0,_gseed.7 
    slli _t.0,_x.0,    13
    xor _t.0,_x.0,_t.0
    mv	_x.1,_t.0 
    li t, 2147483647
    and _t.0,_x.1,t
    mv	_x.2,_t.0 
    srai _t.0,_x.2,    17
    xor _t.0,_x.2,_t.0
    mv	_x.3,_t.0 
    slli _t.0,_x.3,    5
    xor _t.0,_x.3,_t.0
    mv	_x.4,_t.0 
    li t, 2147483647
    and _t.0,_x.4,t
    mv	_x.5,_t.0 
    mv	_gseed.8,_x.5 
    mv	__t.0,_x.5 
    li t, 128
    rem __t.0,__t.0,t
    mv	__value.1,__t.0 
    mv	__x.0,_gseed.8 
    slli __t.0,__x.0,    13
    xor __t.0,__x.0,__t.0
    mv	__x.1,__t.0 
    li t, 2147483647
    and __t.0,__x.1,t
    mv	__x.2,__t.0 
    srai __t.0,__x.2,    17
    xor __t.0,__x.2,__t.0
    mv	__x.3,__t.0 
    slli __t.0,__x.3,    5
    xor __t.0,__x.3,__t.0
    mv	__x.4,__t.0 
    li t, 2147483647
    and __t.0,__x.4,t
    mv	__x.5,__t.0 
    mv	_gseed.9,__x.5 
    mv	_t.0,__x.5 
    li t, 858993456
    blt	_t.0,t,	_if_thenBB7
    j	_if_end7
_if_thenBB7:
    li _mergedretVal.1, 1
    j	afterCallBB23
afterCallBB23:
    mv	__t.0,_mergedretVal.1 
    li t, 1
    beq	__t.0,t,	__if_thenBB3
    j	__if_elseBB3
__if_elseBB3:
    mv	_key.2,__value.1 
    beq	_groot.19,zero,	_if_thenBB8
    j	_if_end8
_if_end8:
    mv	_copy_cur.2,_groot.19 
    mv	_copy_key.2,_key.2 
    beq	_copy_cur.2,zero,	_copy_if_thenBB51
    j	_copy_if_end56
_copy_if_end56:
    lw __t.0, 8(_copy_cur.2)
    bgt	__t.0,_copy_key.2,	_copy_if_thenBB52
    j	_copy_if_end57
_copy_if_end57:
    lw __t.0, 8(_copy_cur.2)
    blt	__t.0,_copy_key.2,	_copy_if_thenBB53
    j	_copy_if_end58
_copy_if_thenBB53:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 8(__t.0)
    lui _lobits,%hi(root)
    sw _groot.19, %lo(root)(_lobits)
    mv	a0,__t.0 
    mv	a1,_copy_cur.2 
    li para, 1
    mv	a2,para 
    mv	a3,_copy_key.2 
    call	eraseImpl
    mv	__t.0,a0 
    la ptr,root    
    lw _groot.22, 0(ptr)
    mv	_groot.21,_groot.22 
    j	afterCallBB24
afterCallBB24:
    mv	_groot.28,_groot.21 
    j	afterCallBB25
afterCallBB25:
    mv	_groot.20,_groot.28 
    j	__forupdateBB3
__forupdateBB3:
    addi __i.2,__i.1,    1
    mv	__i.1,__i.2 
    mv	_groot.19,_groot.20 
    mv	_gseed.7,_gseed.9 
    j	__forcondBB3
_copy_if_end58:
    addi __t.0,_copy_cur.2,    12
    lw __t.0, 0(__t.0)
    li t, 1
    sub __t.1,__t.0,t
    sw __t.1,0(__t.0)
    lw __t.0, 12(_copy_cur.2)
    bgt	__t.0,zero,	_copy_if_thenBB54
    j	_copy_if_end59
_copy_if_end59:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__t.0)
    beq	__t.0,zero,	_copy_if_end60
    j	_copy_if_end61
_copy_if_end60:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 8(__t.0)
    bne	__t.0,zero,	_copy_if_thenBB55
    j	_copy_if_end62
_copy_if_thenBB55:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 8(__t.0)
    li _t, 0
    sw _t,0(__t.0)
    j	_copy_if_end62
_copy_if_end62:
    lw __t.0, 8(_groot.19)
    beq	_copy_key.2,__t.0,	_copy_if_thenBB56
    j	paracopy13
_copy_if_thenBB56:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 8(__t.0)
    mv	_groot.25,__t.0 
    mv	_groot.26,_groot.25 
    j	_copy_if_end63
_copy_if_end63:
    mv	_groot.21,_groot.26 
    j	afterCallBB24
paracopy13:
    mv	_groot.26,_groot.19 
    j	_copy_if_end63
_copy_if_end61:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__t.0)
    mv	a0,__t.0 
    call	findLargest
    mv	__t.0,a0 
    mv	__replacement.3,__t.0 
    lw __t.0, 8(_groot.19)
    beq	_copy_key.2,__t.0,	_copy_if_thenBB57
    j	paracopy14
paracopy14:
    mv	_groot.24,_groot.19 
    j	_copy_if_end64
_copy_if_end64:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__t.0)
    lw __t.0, 8(__replacement.3)
    lw __t.0, 8(__t.0)
    bne	__t.0,__t.0,	_copy_if_thenBB58
    j	_copy_if_end65
_copy_if_end65:
    li _t, 0
    sw _t,0(__replacement.3)
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__replacement.3)
    lw __t.0, 8(__t.0)
    sw __t.0,8(__t.0)
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 8(__t.0)
    bne	__t.0,zero,	_copy_if_thenBB59
    j	_copy_if_end66
_copy_if_end66:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__t.0)
    lw __t.0, 8(__replacement.3)
    lw __t.0, 8(__t.0)
    bne	__t.0,__t.0,	_copy_if_thenBB60
    j	_copy_if_end67
_copy_if_end67:
    mv	_groot.21,_groot.24 
    j	afterCallBB24
_copy_if_thenBB60:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__replacement.3)
    lw __t.0, 4(__t.0)
    sw __t.0,4(__t.0)
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__t.0)
    sw __replacement.3,0(__t.0)
    j	_copy_if_end67
_copy_if_thenBB59:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 8(__t.0)
    sw __replacement.3,0(__t.0)
    j	_copy_if_end66
_copy_if_thenBB58:
    lw __t.0, 4(__replacement.3)
    lw __t.0, 0(__replacement.3)
    lw __t.0, 4(__t.0)
    lw __t.0, 4(__t.0)
    sw __t.0,8(__t.0)
    lw __t.0, 4(__replacement.3)
    lw __t.0, 4(__t.0)
    bne	__t.0,zero,	_copy_if_thenBB61
    j	_copy_if_end65
_copy_if_thenBB61:
    lw __t.0, 4(__replacement.3)
    lw __t.0, 4(__t.0)
    lw __t.0, 0(__replacement.3)
    sw __t.0,0(__t.0)
    j	_copy_if_end65
_copy_if_thenBB57:
    mv	_groot.23,__replacement.3 
    mv	_groot.24,_groot.23 
    j	_copy_if_end64
_copy_if_thenBB54:
    mv	_groot.21,_groot.19 
    j	afterCallBB24
_copy_if_thenBB52:
    lw __t.0, 4(_copy_cur.2)
    lw __t.0, 4(__t.0)
    lui _lobits,%hi(root)
    sw _groot.19, %lo(root)(_lobits)
    mv	a0,__t.0 
    mv	a1,_copy_cur.2 
    mv	a2,zero 
    mv	a3,_copy_key.2 
    call	eraseImpl
    mv	__t.0,a0 
    la ptr,root    
    lw _groot.27, 0(ptr)
    mv	_groot.21,_groot.27 
    j	afterCallBB24
_copy_if_thenBB51:
    mv	_groot.21,_groot.19 
    j	afterCallBB24
_if_thenBB8:
    mv	_groot.28,_groot.19 
    j	afterCallBB25
__if_thenBB3:
    mv	_key.2,__value.1 
    bne	_groot.19,zero,	_if_thenBB9
    j	_if_end9
_if_thenBB9:
    mv	_copy_cur.2,_groot.19 
    mv	_copy_key.2,_key.2 
    beq	_copy_cur.2,zero,	_copy_if_thenBB62
    j	_copy_if_end68
_copy_if_end68:
    lw __t.0, 8(_copy_cur.2)
    beq	__t.0,_copy_key.2,	_copy_if_thenBB63
    j	_copy_if_end69
_copy_if_thenBB63:
    addi __t.0,_copy_cur.2,    12
    lw __t.0, 0(__t.0)
    addi __t.1,__t.0,    1
    sw __t.1,0(__t.0)
    j	afterCallBB26
afterCallBB26:
    mv	_groot.30,_groot.19 
    j	afterCallBB27
afterCallBB27:
    mv	_groot.20,_groot.30 
    j	__forupdateBB3
_copy_if_end69:
    lw __t.0, 8(_copy_cur.2)
    blt	__t.0,_copy_key.2,	_copy_if_thenBB64
    j	paracopy15
_copy_if_thenBB64:
    li __id.4, 1
    j	_copy_if_end70
_copy_if_end70:
    lw __t.0, 4(_copy_cur.2)
    slli __t.0,__id.4,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    mv	a1,_copy_cur.2 
    mv	a2,__id.4 
    mv	a3,_copy_key.2 
    call	insertImpl
    mv	__t.0,a0 
    j	afterCallBB26
paracopy15:
    mv	__id.4,zero 
    j	_copy_if_end70
_copy_if_thenBB62:
    mv	___key.0,_copy_key.2 
    li a0, 16
    call malloc
    mv	___t.0,a0 
    mv	___node.0,___t.0 
    li a0, 12
    call malloc
    mv	___t.0,a0 
    li _t, 2
    sw _t,0(___t.0)
    sw ___t.0,4(___node.0)
    sw ___key.0,8(___node.0)
    li _t, 1
    sw _t,12(___node.0)
    li _t, 0
    sw _t,0(___node.0)
    lw ___t.0, 4(___node.0)
    li _t, 0
    sw _t,4(___t.0)
    lw ___t.0, 4(___node.0)
    li _t, 0
    sw _t,8(___t.0)
    mv	__t.0,___node.0 
    mv	_copy_cur.4,__t.0 
    lw __t.0, 0(s10)
    sw _copy_cur.4,0(__t.0)
    j	afterCallBB26
_if_end9:
    mv	__key.0,_key.2 
    li a0, 16
    call malloc
    mv	__t.0,a0 
    mv	__node.0,__t.0 
    li a0, 12
    call malloc
    mv	__t.0,a0 
    li _t, 2
    sw _t,0(__t.0)
    sw __t.0,4(__node.0)
    sw __key.0,8(__node.0)
    li _t, 1
    sw _t,12(__node.0)
    li _t, 0
    sw _t,0(__node.0)
    lw __t.0, 4(__node.0)
    li _t, 0
    sw _t,4(__t.0)
    lw __t.0, 4(__node.0)
    li _t, 0
    sw _t,8(__t.0)
    mv	_t.0,__node.0 
    mv	_groot.29,_t.0 
    mv	_groot.30,_groot.29 
    j	afterCallBB27
_if_end7:
    li _mergedretVal.1, 2
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
