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
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	lw	a1, -16(s0)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	printf
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
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
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	lw	a1, -16(s0)
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	call	printf
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
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
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
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
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	call	printf
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
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
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	addi	a0, zero, 256
	mv	a1, zero
	call	malloc
	sw	a0, -16(s0)
	lw	a1, -16(s0)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	__isoc99_scanf
	lw	a0, -16(s0)
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
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
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	addi	a1, s0, -12
	call	__isoc99_scanf
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
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
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	zero, -16(s0)
	sw	zero, -20(s0)
	lw	a0, -12(s0)
	addi	a1, zero, -1
	blt	a1, a0, .LBB6_2
	j	.LBB6_1
.LBB6_1:
	addi	a0, zero, 1
	sw	a0, -16(s0)
	lw	a0, -12(s0)
	neg	a0, a0
	sw	a0, -12(s0)
	j	.LBB6_2
.LBB6_2:
	lw	a0, -16(s0)
	addi	a0, a0, 10
	srai	a1, a0, 31
	call	malloc
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	sw	a0, -32(s0)
	j	.LBB6_3
.LBB6_3:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -12(s0)
	lui	a1, 419430
	addi	a1, a1, 1639
	mulh	a2, a0, a1
	srli	a3, a2, 31
	srli	a2, a2, 2
	add	a2, a2, a3
	addi	a3, zero, 10
	mul	a2, a2, a3
	sub	a0, a0, a2
	addi	a0, a0, 48
	lw	a2, -32(s0)
	sb	a0, 0(a2)
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a0, -12(s0)
	mulh	a0, a0, a1
	srli	a1, a0, 31
	srai	a0, a0, 2
	add	a0, a0, a1
	sw	a0, -12(s0)
	j	.LBB6_4
.LBB6_4:                                #   in Loop: Header=BB6_3 Depth=1
	lw	a0, -12(s0)
	bgtz	a0, .LBB6_3
	j	.LBB6_5
.LBB6_5:
	lw	a0, -16(s0)
	addi	a1, zero, 1
	bne	a0, a1, .LBB6_7
	j	.LBB6_6
.LBB6_6:
	lw	a0, -32(s0)
	addi	a1, zero, 45
	sb	a1, 0(a0)
	j	.LBB6_8
.LBB6_7:
	lw	a0, -32(s0)
	addi	a0, a0, -1
	sw	a0, -32(s0)
	j	.LBB6_8
.LBB6_8:
	lw	a0, -24(s0)
	sw	a0, -40(s0)
	j	.LBB6_9
.LBB6_9:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -32(s0)
	lw	a1, -40(s0)
	beq	a0, a1, .LBB6_14
	j	.LBB6_10
.LBB6_10:                               #   in Loop: Header=BB6_9 Depth=1
	lw	a0, -32(s0)
	lb	a0, 0(a0)
	sb	a0, -41(s0)
	lw	a0, -40(s0)
	lb	a0, 0(a0)
	lw	a1, -32(s0)
	sb	a0, 0(a1)
	lb	a0, -41(s0)
	lw	a1, -40(s0)
	sb	a0, 0(a1)
	lw	a0, -32(s0)
	addi	a0, a0, -1
	sw	a0, -32(s0)
	lw	a0, -32(s0)
	lw	a1, -40(s0)
	bne	a0, a1, .LBB6_12
	j	.LBB6_11
.LBB6_11:
	j	.LBB6_15
.LBB6_12:                               #   in Loop: Header=BB6_9 Depth=1
	lw	a0, -40(s0)
	addi	a0, a0, 1
	sw	a0, -40(s0)
	j	.LBB6_13
.LBB6_13:                               #   in Loop: Header=BB6_9 Depth=1
	j	.LBB6_9
.LBB6_14:                               # %.loopexit
	j	.LBB6_15
.LBB6_15:
	lw	a0, -24(s0)
	lw	a1, -20(s0)
	add	a0, a1, a0
	sb	zero, 1(a0)
	lw	a0, -24(s0)
	lw	s0, 40(sp)
	.cfi_def_cfa sp, 48
	lw	ra, 44(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 48
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
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	lw	a0, -16(s0)
	call	strlen
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
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
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -20(s0)
	sw	a2, -24(s0)
	lw	a0, -24(s0)
	lw	a1, -20(s0)
	sub	a0, a0, a1
	sw	a0, -28(s0)
	lw	a0, -28(s0)
	addi	a0, a0, 1
	srai	a1, a0, 31
	call	malloc
	sw	a0, -32(s0)
	lw	a0, -32(s0)
	lw	a1, -16(s0)
	lw	a2, -20(s0)
	add	a1, a1, a2
	lw	a2, -28(s0)
	call	memcpy
	lw	a0, -32(s0)
	lw	a1, -28(s0)
	add	a0, a0, a1
	sb	zero, 0(a0)
	lw	a0, -32(s0)
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
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
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	lw	a0, -16(s0)
	lui	a1, %hi(.L.str.2)
	addi	a1, a1, %lo(.L.str.2)
	addi	a2, s0, -20
	call	__isoc99_sscanf
	lw	a0, -20(s0)
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
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
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -20(s0)
	lw	a0, -16(s0)
	lw	a1, -20(s0)
	add	a0, a0, a1
	lb	a0, 0(a0)
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
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
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	lw	a0, -16(s0)
	lw	a0, 0(a0)
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
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
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	call	strlen
	sw	a0, -28(s0)
	lw	a0, -24(s0)
	call	strlen
	sw	a0, -32(s0)
	lw	a0, -28(s0)
	lw	a1, -32(s0)
	add	a0, a0, a1
	addi	a0, a0, 1
	srai	a1, a0, 31
	call	malloc
	sw	a0, -40(s0)
	lw	a0, -40(s0)
	lw	a1, -16(s0)
	call	strcpy
	lw	a0, -40(s0)
	lw	a1, -24(s0)
	call	strcat
	lw	a0, -40(s0)
	lw	s0, 40(sp)
	.cfi_def_cfa sp, 48
	lw	ra, 44(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
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
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	call	strcmp
	seqz	a0, a0
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
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
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	call	strcmp
	snez	a0, a0
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
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
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	call	strcmp
	srli	a0, a0, 31
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
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
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	call	strcmp
	slti	a0, a0, 1
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
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
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	call	strcmp
	sgtz	a0, a0
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
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
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	call	strcmp
	not	a0, a0
	srli	a0, a0, 31
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
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

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%s\n"
	.size	.L.str.1, 4

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
