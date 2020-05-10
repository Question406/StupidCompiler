	.text
	.file	"built_in.c"
	.globl	print                   # -- Begin function print
	.p2align	2
	.type	print,@function
print:                                  # @print
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	mv	a1, a0
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	printf
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	print, .Lfunc_end0-print
	.cfi_endproc
                                        # -- End function
	.globl	println                 # -- Begin function println
	.p2align	2
	.type	println,@function
println:                                # @println
	.cfi_startproc
# %bb.0:
	.cfi_def_cfa_offset 0
	tail	puts
.Lfunc_end1:
	.size	println, .Lfunc_end1-println
	.cfi_endproc
                                        # -- End function
	.globl	printInt                # -- Begin function printInt
	.p2align	2
	.type	printInt,@function
printInt:                               # @printInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	mv	a1, a0
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end2:
	.size	printInt, .Lfunc_end2-printInt
	.cfi_endproc
                                        # -- End function
	.globl	printlnInt              # -- Begin function printlnInt
	.p2align	2
	.type	printlnInt,@function
printlnInt:                             # @printlnInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	mv	a1, a0
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	call	printf
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end3:
	.size	printlnInt, .Lfunc_end3-printlnInt
	.cfi_endproc
                                        # -- End function
	.globl	getString               # -- Begin function getString
	.p2align	2
	.type	getString,@function
getString:                              # @getString
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	a0, zero, 256
	mv	a1, zero
	call	malloc
	mv	s0, a0
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	mv	a1, s0
	call	__isoc99_scanf
	mv	a0, s0
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end4:
	.size	getString, .Lfunc_end4-getString
	.cfi_endproc
                                        # -- End function
	.globl	getInt                  # -- Begin function getInt
	.p2align	2
	.type	getInt,@function
getInt:                                 # @getInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	addi	a1, sp, 8
	call	__isoc99_scanf
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end5:
	.size	getInt, .Lfunc_end5-getInt
	.cfi_endproc
                                        # -- End function
	.globl	toString                # -- Begin function toString
	.p2align	2
	.type	toString,@function
toString:                               # @toString
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	beqz	a0, .LBB6_3
# %bb.1:
	mv	s0, a0
	addi	a0, zero, 12
	mv	a1, zero
	call	malloc
	addi	a1, zero, -1
	bge	a1, s0, .LBB6_4
# %bb.2:
	mv	a4, zero
	j	.LBB6_5
.LBB6_3:
	addi	a0, zero, 2
	mv	a1, zero
	call	malloc
	addi	a1, zero, 48
	sb	a1, 0(a0)
	addi	a1, a0, 1
	j	.LBB6_13
.LBB6_4:
	addi	a1, zero, 45
	sb	a1, 0(a0)
	neg	s0, s0
	addi	a4, zero, 1
.LBB6_5:
	lui	a1, 244141
	addi	a3, a1, -1536
	addi	a2, a1, -1537
	blt	a2, s0, .LBB6_9
# %bb.6:                                # %.preheader
	lui	a1, 419430
	addi	a1, a1, 1639
.LBB6_7:                                # =>This Inner Loop Header: Depth=1
	mv	a5, a3
	mulh	a2, a3, a1
	srli	a3, a2, 31
	srai	a2, a2, 2
	add	a3, a2, a3
	blt	s0, a3, .LBB6_7
# %bb.8:
	addi	a1, zero, 10
	blt	a5, a1, .LBB6_11
.LBB6_9:
	lui	a1, 838861
	addi	a7, a1, -819
	addi	a6, zero, 9
	mv	a5, zero
.LBB6_10:                               # =>This Inner Loop Header: Depth=1
	mv	a2, a3
	add	a1, a0, a4
	div	a3, s0, a3
	addi	a3, a3, 48
	sb	a3, 0(a1)
	addi	a1, a4, 1
	sltu	a3, a1, a4
	add	a5, a5, a3
	rem	s0, s0, a2
	mulhu	a3, a2, a7
	srli	a3, a3, 3
	mv	a4, a1
	bltu	a6, a2, .LBB6_10
	j	.LBB6_12
.LBB6_11:
	mv	a1, a4
.LBB6_12:
	add	a1, a0, a1
.LBB6_13:
	sb	zero, 0(a1)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end6:
	.size	toString, .Lfunc_end6-toString
	.cfi_endproc
                                        # -- End function
	.globl	stringLength            # -- Begin function stringLength
	.p2align	2
	.type	stringLength,@function
stringLength:                           # @stringLength
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	call	strlen
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end7:
	.size	stringLength, .Lfunc_end7-stringLength
	.cfi_endproc
                                        # -- End function
	.globl	_stringSubstring        # -- Begin function _stringSubstring
	.p2align	2
	.type	_stringSubstring,@function
_stringSubstring:                       # @_stringSubstring
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	mv	s3, a1
	mv	s2, a0
	sub	s1, a2, a1
	addi	a0, s1, 1
	srai	a1, a0, 31
	call	malloc
	mv	s0, a0
	add	a1, s2, s3
	mv	a2, s1
	call	memcpy
	add	a0, s0, s1
	sb	zero, 0(a0)
	mv	a0, s0
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end8:
	.size	_stringSubstring, .Lfunc_end8-_stringSubstring
	.cfi_endproc
                                        # -- End function
	.globl	_stringParseInt         # -- Begin function _stringParseInt
	.p2align	2
	.type	_stringParseInt,@function
_stringParseInt:                        # @_stringParseInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	lui	a1, %hi(.L.str.2)
	addi	a1, a1, %lo(.L.str.2)
	addi	a2, sp, 8
	call	__isoc99_sscanf
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end9:
	.size	_stringParseInt, .Lfunc_end9-_stringParseInt
	.cfi_endproc
                                        # -- End function
	.globl	_stringOrd              # -- Begin function _stringOrd
	.p2align	2
	.type	_stringOrd,@function
_stringOrd:                             # @_stringOrd
	.cfi_startproc
# %bb.0:
	add	a0, a0, a1
	lb	a0, 0(a0)
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end10:
	.size	_stringOrd, .Lfunc_end10-_stringOrd
	.cfi_endproc
                                        # -- End function
	.globl	_arraySize              # -- Begin function _arraySize
	.p2align	2
	.type	_arraySize,@function
_arraySize:                             # @_arraySize
	.cfi_startproc
# %bb.0:
	lw	a0, 0(a0)
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end11:
	.size	_arraySize, .Lfunc_end11-_arraySize
	.cfi_endproc
                                        # -- End function
	.globl	_stringAdd              # -- Begin function _stringAdd
	.p2align	2
	.type	_stringAdd,@function
_stringAdd:                             # @_stringAdd
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	sw	s2, 0(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	mv	s2, a1
	mv	s1, a0
	call	strlen
	mv	s0, a0
	mv	a0, s2
	call	strlen
	add	a0, a0, s0
	addi	a0, a0, 1
	srai	a1, a0, 31
	call	malloc
	mv	s0, a0
	mv	a1, s1
	call	strcpy
	mv	a0, s0
	mv	a1, s2
	lw	s2, 0(sp)
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	tail	strcat
.Lfunc_end12:
	.size	_stringAdd, .Lfunc_end12-_stringAdd
	.cfi_endproc
                                        # -- End function
	.globl	_stringEqual            # -- Begin function _stringEqual
	.p2align	2
	.type	_stringEqual,@function
_stringEqual:                           # @_stringEqual
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	call	strcmp
	seqz	a0, a0
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end13:
	.size	_stringEqual, .Lfunc_end13-_stringEqual
	.cfi_endproc
                                        # -- End function
	.globl	_stringNotEqual         # -- Begin function _stringNotEqual
	.p2align	2
	.type	_stringNotEqual,@function
_stringNotEqual:                        # @_stringNotEqual
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	call	strcmp
	snez	a0, a0
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end14:
	.size	_stringNotEqual, .Lfunc_end14-_stringNotEqual
	.cfi_endproc
                                        # -- End function
	.globl	_stringLess             # -- Begin function _stringLess
	.p2align	2
	.type	_stringLess,@function
_stringLess:                            # @_stringLess
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	call	strcmp
	srli	a0, a0, 31
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end15:
	.size	_stringLess, .Lfunc_end15-_stringLess
	.cfi_endproc
                                        # -- End function
	.globl	_stringLessEqual        # -- Begin function _stringLessEqual
	.p2align	2
	.type	_stringLessEqual,@function
_stringLessEqual:                       # @_stringLessEqual
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	call	strcmp
	slti	a0, a0, 1
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end16:
	.size	_stringLessEqual, .Lfunc_end16-_stringLessEqual
	.cfi_endproc
                                        # -- End function
	.globl	_stringGreater          # -- Begin function _stringGreater
	.p2align	2
	.type	_stringGreater,@function
_stringGreater:                         # @_stringGreater
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	call	strcmp
	sgtz	a0, a0
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end17:
	.size	_stringGreater, .Lfunc_end17-_stringGreater
	.cfi_endproc
                                        # -- End function
	.globl	_stringGreaterEqual     # -- Begin function _stringGreaterEqual
	.p2align	2
	.type	_stringGreaterEqual,@function
_stringGreaterEqual:                    # @_stringGreaterEqual
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	call	strcmp
	not	a0, a0
	srli	a0, a0, 31
	lw	ra, 12(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end18:
	.size	_stringGreaterEqual, .Lfunc_end18-_stringGreaterEqual
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s"
	.size	.L.str, 3

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%d"
	.size	.L.str.2, 3

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"%d\n"
	.size	.L.str.3, 4


	.ident	"clang version 9.0.0-2 (tags/RELEASE_900/final)"
	.section	".note.GNU-stack","",@progbits
