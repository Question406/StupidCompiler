    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    mv	backup_ra,ra 
    mv	back_s7,s7 
    mv	back_s8,s8 
    mv	back_s9,s9 
    mv	back_s10,s10 
    mv	back_s11,s11 
    mv	back_s0,s0 
    mv	back_s1,s1 
    mv	back_s2,s2 
    mv	back_s3,s3 
    mv	back_s4,s4 
    mv	back_s5,s5 
    mv	back_s6,s6 
    li a0, 404
    call malloc
    mv	t.0,a0 
    li _t, 100
    sw _t,0(t.0)
    mv	t.0,t.0 
    addi t.1,t.0,    4
    mv	t.0,t.0 
    addi t.1,t.0,    400
    mv	t.2,t.1 
    j	forcondBB1
forcondBB1:
    ble	t.2,t.1,	forupdateBB1
    j	afterForBB1
afterForBB1:
    mv	_gchunks.0,t.0 
    li t, 25284
    mv	a0,t 
    call malloc
    mv	t.0,a0 
    li _t, 6320
    sw _t,0(t.0)
    mv	_ginputBuffer.0,t.0 
    li a0, 24
    call malloc
    mv	t.0,a0 
    li _t, 5
    sw _t,0(t.0)
    mv	_goutputBuffer.0,t.0 
    j	_whileBodyBB1
_whileBodyBB1:
    call	getInt
    mv	_t.0,a0 
    mv	_op.2,_t.0 
    beq	_op.2,zero,	afterCallBB1
    j	_if_end1
_if_end1:
    li t, 1
    beq	_op.2,t,	_if_thenBB1
    j	_if_elseBB1
_if_elseBB1:
    li t, 2
    beq	_op.2,t,	_if_thenBB2
    j	_whileBodyBB1
_if_thenBB2:
    call	getString
    mv	_t.0,a0 
    mv	_input.1,_t.0 
    mv	__input.1,_input.1 
    li a0, 24
    call malloc
    mv	__t.0,a0 
    li _t, 5
    sw _t,0(__t.0)
    mv	__target.1,__t.0 
    mv	a0,__input.1 
    call	stringLength
    mv	__t.0,a0 
    li t, 40
    bne	__t.0,t,	__if_thenBB1
    j	__if_end1
__if_thenBB1:
    la para,_globalStr1    
    mv	a0,para 
    call	println
    j	_whileBodyBB1
__if_end1:
    mv	__i.3,zero 
    j	__forcondBB1
__forcondBB1:
    li t, 5
    blt	__i.3,t,	__forbodyBB1
    j	__afterForBB1
__afterForBB1:
    mv	__i.5,zero 
    j	__forcondBB2
__forcondBB2:
    li t, 40
    blt	__i.5,t,	__forbodyBB2
    j	__afterForBB2
__afterForBB2:
    li __digit.3, 1
    j	__forcondBB3
__forcondBB3:
    li t, 4
    ble	__digit.3,t,	__forbodyBB3
    j	__afterForBB3
__afterForBB3:
    la para,_globalStr3    
    mv	a0,para 
    call	println
    j	_whileBodyBB1
__forbodyBB3:
    mv	__i.8,zero 
    j	__forcondBB4
__forcondBB4:
    blt	__i.8,__digit.3,	__forbodyBB4
    j	__whileBodyBB1
__whileBodyBB1:
    mv	_input.3,_ginputBuffer.0 
    mv	_length.3,__digit.3 
    addi _t.0,_length.3,    64
    li t, 56
    sub _t.0,_t.0,t
    srai _t.0,_t.0,    6
    addi _t.0,_t.0,    1
    mv	_nChunk.3,_t.0 
    li t, 100
    bgt	_nChunk.3,t,	_if_thenBB3
    j	_if_end2
_if_end2:
    mv	_i.5,zero 
    j	_forcondBB1
_forcondBB1:
    blt	_i.5,_nChunk.3,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	_i.7,zero 
    j	_forcondBB2
_forcondBB2:
    blt	_i.7,_length.3,	_forbodyBB2
    j	_afterForBB2
_forbodyBB2:
    li t, 4
    rem _t.0,_i.7,t
    li t, 3
    sub _t.0,t,_t.0
    slli _t.0,_t.0,    3
    slli _t.0,_i.7,    2
    addi _t.0,_t.0,    4
    add _t.0,_input.3,_t.0
    lw _t.0, 0(_t.0)
    sll _t.0,_t.0,_t.0
    srai _t.0,_i.7,    6
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 64
    rem _t.0,_i.7,t
    srai _t.0,_t.0,    2
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    or _t.0,_t.0,_t.0
    srai _t.0,_i.7,    6
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 64
    rem _t.0,_i.7,t
    srai _t.0,_t.0,    2
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    addi _i.8,_i.7,    1
    mv	_i.7,_i.8 
    j	_forcondBB2
_afterForBB2:
    li t, 4
    rem _t.0,_i.7,t
    li t, 3
    sub _t.0,t,_t.0
    slli _t.0,_t.0,    3
    li t, 128
    sll _t.0,t,_t.0
    srai _t.0,_i.7,    6
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 64
    rem _t.0,_i.7,t
    srai _t.0,_t.0,    2
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    or _t.0,_t.0,_t.0
    srai _t.0,_i.7,    6
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 64
    rem _t.0,_i.7,t
    srai _t.0,_t.0,    2
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_length.3,    3
    li t, 1
    sub _t.0,_nChunk.3,t
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,64(_t.0)
    srai _t.0,_length.3,    29
    andi _t.0,_t.0,    7
    li t, 1
    sub _t.0,_nChunk.3,t
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,60(_t.0)
    mv	_i.10,zero 
    li t, -1009589776
    mv	_h4.4,t 
    li t, -1732584194
    mv	_h2.4,t 
    li t, -271733879
    mv	_h1.4,t 
    li t, 1732584193
    mv	_h0.4,t 
    li t, 271733878
    mv	_h3.4,t 
    j	_forcondBB3
_forcondBB3:
    blt	_i.10,_nChunk.3,	_forbodyBB3
    j	_afterForBB3
_afterForBB3:
    sw _h0.4,4(_goutputBuffer.0)
    sw _h1.4,8(_goutputBuffer.0)
    sw _h2.4,12(_goutputBuffer.0)
    sw _h3.4,16(_goutputBuffer.0)
    sw _h4.4,20(_goutputBuffer.0)
    mv	_mergedretVal.3,_goutputBuffer.0 
    mv	_mergedretVal.5,_mergedretVal.3 
    j	afterCallBB2
afterCallBB2:
    mv	__t.0,_mergedretVal.5 
    mv	__out.0,__t.0 
    mv	_a.3,__out.0 
    mv	_b.3,__target.1 
    lw _t.0, 0(_b.3)
    lw _t.0, 0(_a.3)
    bne	_t.0,_t.0,	_if_thenBB4
    j	_if_end3
_if_thenBB4:
    mv	_mergedretVal.4,zero 
    j	afterCallBB3
afterCallBB3:
    mv	__t.0,_mergedretVal.4 
    bne	__t.0, zero, __if_thenBB2
    j	__if_end2
__if_thenBB2:
    mv	__i.10,zero 
    j	__forcondBB5
__forcondBB5:
    blt	__i.10,__digit.3,	__forbodyBB5
    j	__afterForBB4
__forbodyBB5:
    slli __t.0,__i.10,    2
    addi __t.0,__t.0,    4
    add __t.0,_ginputBuffer.0,__t.0
    lw __t.0, 0(__t.0)
    mv	_x.2,__t.0 
    li t, 32
    bge	_x.2,t,	_ifTrue1
    j	_if_end4
_ifTrue1:
    li t, 126
    ble	_x.2,t,	_if_thenBB5
    j	_if_end4
_if_end4:
    la _mergedretVal.3,_globalStr0    
    mv	_mergedretVal.4,_mergedretVal.3 
    j	afterCallBB4
afterCallBB4:
    mv	__t.0,_mergedretVal.4 
    mv	a0,__t.0 
    call	print
    addi __i.11,__i.10,    1
    mv	__i.10,__i.11 
    j	__forcondBB5
_if_thenBB5:
    li t, 32
    sub _t.0,_x.2,t
    li t, 31
    sub _t.0,_x.2,t
    la para,_globalStr2    
    mv	a0,para 
    mv	a1,_t.0 
    mv	a2,_t.0 
    call	_stringSubstring
    mv	_t.0,a0 
    mv	_mergedretVal.2,_t.0 
    mv	_mergedretVal.4,_mergedretVal.2 
    j	afterCallBB4
__afterForBB4:
    la para,_globalStr0    
    mv	a0,para 
    call	println
    j	_whileBodyBB1
__if_end2:
    mv	_now.3,_ginputBuffer.0 
    mv	_length.0,__digit.3 
    li t, 1
    sub _t.0,_length.0,t
    mv	_i.4,_t.0 
    mv	_i.5,_i.4 
    j	_forcondBB4
_forcondBB4:
    bge	_i.5,zero,	_forbodyBB4
    j	_afterForBB4
_forbodyBB4:
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_now.3,_t.0
    lw _t.0, 0(_t.0)
    mv	__now.4,_t.0 
    li t, 122
    beq	__now.4,t,	__if_thenBB3
    j	__if_end3
__if_end3:
    li t, 90
    beq	__now.4,t,	__if_thenBB4
    j	__if_end4
__if_thenBB4:
    li __mergedretVal.7, 97
    j	_afterCallBB1
_afterCallBB1:
    mv	_t.0,__mergedretVal.7 
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_now.3,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_now.3,_t.0
    lw _t.0, 0(_t.0)
    li t, -1
    beq	_t.0,t,	_if_thenBB6
    j	_if_elseBB2
_if_thenBB6:
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_now.3,_t.0
    li _t, 48
    sw _t,0(_t.0)
    li t, 1
    sub _i.6,_i.5,t
    mv	_i.5,_i.6 
    j	_forcondBB4
_if_elseBB2:
    li _mergedretVal.4, 1
    j	afterCallBB5
afterCallBB5:
    mv	__t.0,_mergedretVal.4 
    bne	__t.0, zero, __whileBodyBB1
    j	__forupdateBB1
__forupdateBB1:
    addi __digit.4,__digit.3,    1
    mv	__digit.3,__digit.4 
    j	__forcondBB3
__if_end4:
    li t, 57
    beq	__now.4,t,	__if_thenBB5
    j	__if_end5
__if_thenBB5:
    li __mergedretVal.7, 65
    j	_afterCallBB1
__if_end5:
    addi __t.0,__now.4,    1
    mv	__mergedretVal.6,__t.0 
    mv	__mergedretVal.7,__mergedretVal.6 
    j	_afterCallBB1
__if_thenBB3:
    li __mergedretVal.7, -1
    j	_afterCallBB1
_afterForBB4:
    mv	_mergedretVal.4,zero 
    j	afterCallBB5
_if_end3:
    mv	_i.6,zero 
    j	_forcondBB5
_forcondBB5:
    lw _t.0, 0(_a.3)
    blt	_i.6,_t.0,	_forbodyBB5
    j	_afterForBB5
_afterForBB5:
    li _mergedretVal.4, 1
    j	afterCallBB3
_forbodyBB5:
    slli _t.0,_i.6,    2
    addi _t.0,_t.0,    4
    add _t.0,_b.3,_t.0
    slli _t.0,_i.6,    2
    addi _t.0,_t.0,    4
    add _t.0,_a.3,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    bne	_t.0,_t.0,	_if_thenBB7
    j	_forupdateBB1
_if_thenBB7:
    mv	_mergedretVal.4,zero 
    j	afterCallBB3
_forupdateBB1:
    addi _i.7,_i.6,    1
    mv	_i.6,_i.7 
    j	_forcondBB5
_forbodyBB3:
    li _j.7, 16
    j	_forcondBB6
_forcondBB6:
    li t, 80
    blt	_j.7,t,	_forbodyBB6
    j	_afterForBB6
_afterForBB6:
    mv	_a.4,_h0.4 
    mv	_b.4,_h1.4 
    mv	_c.4,_h2.4 
    mv	_d.4,_h3.4 
    mv	_e.4,_h4.4 
    mv	_a.5,_a.4 
    mv	_b.5,_b.4 
    mv	_d.5,_d.4 
    mv	_e.5,_e.4 
    mv	_c.5,_c.4 
    mv	_j.9,zero 
    j	_forcondBB7
_forcondBB7:
    li t, 80
    blt	_j.9,t,	_forbodyBB7
    j	_afterForBB7
_afterForBB7:
    mv	__x.0,_h0.4 
    mv	__y.0,_a.5 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	_h0.5,_t.0 
    mv	__x.0,_h1.4 
    mv	__y.0,_b.5 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	_h1.5,_t.0 
    mv	__x.0,_h2.4 
    mv	__y.0,_c.5 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	_h2.5,_t.0 
    mv	__x.0,_h3.4 
    mv	__y.0,_d.5 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	_h3.5,_t.0 
    mv	__x.0,_h4.4 
    mv	__y.0,_e.5 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	_h4.5,_t.0 
    addi _i.11,_i.10,    1
    mv	_i.10,_i.11 
    mv	_h4.4,_h4.5 
    mv	_h2.4,_h2.5 
    mv	_h1.4,_h1.5 
    mv	_h0.4,_h0.5 
    mv	_h3.4,_h3.5 
    j	_forcondBB3
_forbodyBB7:
    li t, 20
    blt	_j.9,t,	_if_thenBB8
    j	_if_elseBB3
_if_elseBB3:
    li t, 40
    blt	_j.9,t,	_if_thenBB9
    j	_if_elseBB4
_if_elseBB4:
    li t, 60
    blt	_j.9,t,	_if_thenBB10
    j	_if_elseBB5
_if_thenBB10:
    and _t.0,_c.5,_d.5
    and _t.0,_b.5,_d.5
    and _t.0,_b.5,_c.5
    or _t.0,_t.0,_t.0
    or _t.0,_t.0,_t.0
    mv	_f.7,_t.0 
    mv	_f.6,_f.7 
    li t, -1894007588
    mv	_k.6,t 
    j	_if_end5
_if_end5:
    mv	__x.5,_a.5 
    srai __t.0,__x.5,    27
    andi __t.0,__t.0,    31
    li t, 134217727
    and __t.0,__x.5,t
    slli __t.0,__t.0,    5
    or __t.0,__t.0,__t.0
    mv	__mergedretVal.5,__t.0 
    mv	__mergedretVal.8,__mergedretVal.5 
    mv	_t.0,__mergedretVal.8 
    mv	__x.0,_t.0 
    mv	__y.0,_e.5 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	__x.0,_f.6 
    mv	__y.0,_k.6 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	__x.0,_t.0 
    mv	__y.0,_t.0 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    slli _t.0,_i.10,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_j.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    mv	__x.0,_t.0 
    mv	__y.0,_t.0 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	_temp.5,_t.0 
    mv	_e.6,_d.5 
    mv	_d.6,_c.5 
    mv	__x.5,_b.5 
    srai __t.0,__x.5,    2
    li t, 1073741823
    and __t.0,__t.0,t
    andi __t.0,__x.5,    3
    slli __t.0,__t.0,    30
    or __t.0,__t.0,__t.0
    mv	__mergedretVal.7,__t.0 
    mv	__mergedretVal.6,__mergedretVal.7 
    mv	_t.0,__mergedretVal.6 
    mv	_c.6,_t.0 
    mv	_b.6,_a.5 
    mv	_a.6,_temp.5 
    addi _j.10,_j.9,    1
    mv	_a.5,_a.6 
    mv	_b.5,_b.6 
    mv	_d.5,_d.6 
    mv	_j.9,_j.10 
    mv	_e.5,_e.6 
    mv	_c.5,_c.6 
    j	_forcondBB7
_if_elseBB5:
    xor _t.0,_b.5,_c.5
    xor _t.0,_t.0,_d.5
    mv	_f.8,_t.0 
    mv	_f.6,_f.8 
    li t, -899497514
    mv	_k.6,t 
    j	_if_end5
_if_thenBB9:
    xor _t.0,_b.5,_c.5
    xor _t.0,_t.0,_d.5
    mv	_f.9,_t.0 
    mv	_f.6,_f.9 
    li t, 1859775393
    mv	_k.6,t 
    j	_if_end5
_if_thenBB8:
    xori _t.0,_b.5,    -1
    and _t.0,_t.0,_d.5
    and _t.0,_b.5,_c.5
    or _t.0,_t.0,_t.0
    mv	_f.10,_t.0 
    mv	_f.6,_f.10 
    li t, 1518500249
    mv	_k.6,t 
    j	_if_end5
_forbodyBB6:
    slli _t.0,_i.10,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 16
    sub _t.0,_j.7,t
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_i.10,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 14
    sub _t.0,_j.7,t
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_i.10,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 8
    sub _t.0,_j.7,t
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_i.10,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 3
    sub _t.0,_j.7,t
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    xor _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    xor _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    xor _t.0,_t.0,_t.0
    mv	__x.5,_t.0 
    srai __t.0,__x.5,    31
    andi __t.0,__t.0,    1
    li t, 2147483647
    and __t.0,__x.5,t
    slli __t.0,__t.0,    1
    or __t.0,__t.0,__t.0
    mv	__mergedretVal.8,__t.0 
    mv	__mergedretVal.7,__mergedretVal.8 
    mv	_t.0,__mergedretVal.7 
    slli _t.0,_i.10,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_j.7,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    addi _j.11,_j.7,    1
    mv	_j.7,_j.11 
    j	_forcondBB6
_forbodyBB1:
    mv	_j.13,zero 
    j	_forcondBB8
_forcondBB8:
    li t, 80
    blt	_j.13,t,	_forbodyBB8
    j	_forupdateBB2
_forbodyBB8:
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_j.13,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    li _t, 0
    sw _t,0(_t.0)
    addi _j.14,_j.13,    1
    mv	_j.13,_j.14 
    j	_forcondBB8
_forupdateBB2:
    addi _i.12,_i.5,    1
    mv	_i.5,_i.12 
    j	_forcondBB1
_if_thenBB3:
    la para,_globalStr4    
    mv	a0,para 
    call	println
    mv	_mergedretVal.5,zero 
    j	afterCallBB2
__forbodyBB4:
    slli __t.0,__i.8,    2
    addi __t.0,__t.0,    4
    add __t.0,_ginputBuffer.0,__t.0
    li _t, 48
    sw _t,0(__t.0)
    addi __i.12,__i.8,    1
    mv	__i.8,__i.12 
    j	__forcondBB4
__forbodyBB2:
    srai __t.0,__i.5,    2
    li t, 2
    rem __t.0,__t.0,t
    li t, 1
    sub __t.0,t,__t.0
    slli __t.2,__t.0,    4
    addi __t.0,__i.5,    4
    mv	a0,__input.1 
    mv	a1,__i.5 
    mv	a2,__t.0 
    call	_stringSubstring
    mv	__t.0,a0 
    mv	_x.2,__t.0 
    mv	_result.3,zero 
    mv	_i.4,zero 
    j	_forcondBB9
_forcondBB9:
    mv	a0,_x.2 
    call	stringLength
    mv	_t.0,a0 
    blt	_i.4,_t.0,	_forbodyBB9
    j	_afterForBB8
_afterForBB8:
    mv	_mergedretVal.2,_result.3 
    mv	_mergedretVal.3,_mergedretVal.2 
    j	afterCallBB6
afterCallBB6:
    mv	__t.0,_mergedretVal.3 
    sll __t.0,__t.0,__t.2
    srai __t.0,__i.5,    3
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__target.1,__t.0
    lw __t.0, 0(__t.0)
    or __t.0,__t.0,__t.0
    srai __t.0,__i.5,    3
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__target.1,__t.0
    sw __t.0,0(__t.0)
    addi __t.0,__i.5,    4
    mv	__i.13,__t.0 
    mv	__i.5,__i.13 
    j	__forcondBB2
_forbodyBB9:
    mv	a0,_x.2 
    mv	a1,_i.4 
    call	_stringOrd
    mv	_t.0,a0 
    mv	_digit.4,_t.0 
    li t, 48
    bge	_digit.4,t,	_ifTrue2
    j	_if_elseBB6
_if_elseBB6:
    li t, 65
    bge	_digit.4,t,	_ifTrue3
    j	_if_elseBB7
_ifTrue3:
    li t, 70
    ble	_digit.4,t,	_if_thenBB11
    j	_if_elseBB7
_if_thenBB11:
    slli _t.0,_result.3,    4
    add _t.0,_t.0,_digit.4
    li t, 65
    sub _t.0,_t.0,t
    addi _t.0,_t.0,    10
    mv	_result.5,_t.0 
    mv	_result.7,_result.5 
    j	_forupdateBB3
_forupdateBB3:
    addi _i.5,_i.4,    1
    mv	_result.3,_result.7 
    mv	_i.4,_i.5 
    j	_forcondBB9
_if_elseBB7:
    li t, 97
    bge	_digit.4,t,	_ifTrue4
    j	_if_elseBB8
_ifTrue4:
    li t, 102
    ble	_digit.4,t,	_if_thenBB12
    j	_if_elseBB8
_if_thenBB12:
    slli _t.0,_result.3,    4
    add _t.0,_t.0,_digit.4
    li t, 97
    sub _t.0,_t.0,t
    addi _t.0,_t.0,    10
    mv	_result.6,_t.0 
    mv	_result.7,_result.6 
    j	_forupdateBB3
_if_elseBB8:
    mv	_mergedretVal.3,zero 
    j	afterCallBB6
_ifTrue2:
    li t, 57
    ble	_digit.4,t,	_if_thenBB13
    j	_if_elseBB6
_if_thenBB13:
    slli _t.0,_result.3,    4
    add _t.0,_t.0,_digit.4
    li t, 48
    sub _t.0,_t.0,t
    mv	_result.4,_t.0 
    mv	_result.7,_result.4 
    j	_forupdateBB3
__forbodyBB1:
    slli __t.0,__i.3,    2
    addi __t.0,__t.0,    4
    add __t.0,__target.1,__t.0
    li _t, 0
    sw _t,0(__t.0)
    addi __i.14,__i.3,    1
    mv	__i.3,__i.14 
    j	__forcondBB1
_if_thenBB1:
    call	getString
    mv	_t.0,a0 
    mv	_input.2,_t.0 
    mv	__input.1,_input.2 
    mv	__i.3,zero 
    j	__forcondBB6
__forcondBB6:
    mv	a0,__input.1 
    call	stringLength
    mv	__t.0,a0 
    blt	__i.3,__t.0,	__forbodyBB6
    j	__afterForBB5
__afterForBB5:
    mv	a0,__input.1 
    call	stringLength
    mv	__t.0,a0 
    mv	_input.1,_ginputBuffer.0 
    mv	_length.1,__t.0 
    addi _t.0,_length.1,    64
    li t, 56
    sub _t.0,_t.0,t
    srai _t.0,_t.0,    6
    addi _t.0,_t.0,    1
    mv	_nChunk.1,_t.0 
    li t, 100
    bgt	_nChunk.1,t,	_if_thenBB14
    j	_if_end6
_if_thenBB14:
    la para,_globalStr4    
    mv	a0,para 
    call	println
    mv	_mergedretVal.1,zero 
    j	afterCallBB7
afterCallBB7:
    mv	__t.0,_mergedretVal.1 
    mv	__result.1,__t.0 
    mv	__i.5,zero 
    j	__forcondBB7
__forcondBB7:
    lw __t.0, 0(__result.1)
    blt	__i.5,__t.0,	__forbodyBB7
    j	_afterCallBB2
__forbodyBB7:
    slli __t.0,__i.5,    2
    addi __t.0,__t.0,    4
    add __t.0,__result.1,__t.0
    lw __t.0, 0(__t.0)
    mv	_x.2,__t.0 
    la _ret.2,_globalStr0    
    mv	_ret.3,_ret.2 
    li _i.4, 28
    j	_forcondBB10
_forcondBB10:
    bge	_i.4,zero,	_forbodyBB10
    j	afterCallBB8
afterCallBB8:
    mv	__t.0,_ret.3 
    mv	a0,__t.0 
    call	print
    addi __i.6,__i.5,    1
    mv	__i.5,__i.6 
    j	__forcondBB7
_forbodyBB10:
    sra _t.0,_x.2,_i.4
    andi _t.0,_t.0,    15
    mv	_digit.3,_t.0 
    li t, 10
    blt	_digit.3,t,	_if_thenBB15
    j	_if_elseBB9
_if_elseBB9:
    addi _t.0,_digit.3,    65
    li t, 10
    sub _t.0,_t.0,t
    mv	__x.4,_t.0 
    li t, 32
    bge	__x.4,t,	__ifTrue1
    j	__if_end6
__ifTrue1:
    li t, 126
    ble	__x.4,t,	__if_thenBB6
    j	__if_end6
__if_end6:
    la __mergedretVal.5,_globalStr0    
    mv	__mergedretVal.6,__mergedretVal.5 
    j	_afterCallBB3
_afterCallBB3:
    mv	_t.0,__mergedretVal.6 
    mv	a0,_ret.3 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	_ret.5,_t.0 
    mv	_ret.4,_ret.5 
    j	_forupdateBB4
_forupdateBB4:
    li t, 4
    sub _t.0,_i.4,t
    mv	_i.5,_t.0 
    mv	_ret.3,_ret.4 
    mv	_i.4,_i.5 
    j	_forcondBB10
__if_thenBB6:
    li t, 32
    sub __t.0,__x.4,t
    li t, 31
    sub __t.0,__x.4,t
    la para,_globalStr2    
    mv	a0,para 
    mv	a1,__t.0 
    mv	a2,__t.0 
    call	_stringSubstring
    mv	__t.0,a0 
    mv	__mergedretVal.4,__t.0 
    mv	__mergedretVal.6,__mergedretVal.4 
    j	_afterCallBB3
_if_thenBB15:
    addi _t.0,_digit.3,    48
    mv	__x.4,_t.0 
    li t, 32
    bge	__x.4,t,	__ifTrue2
    j	__if_end7
__ifTrue2:
    li t, 126
    ble	__x.4,t,	__if_thenBB7
    j	__if_end7
__if_thenBB7:
    li t, 32
    sub __t.0,__x.4,t
    li t, 31
    sub __t.0,__x.4,t
    la para,_globalStr2    
    mv	a0,para 
    mv	a1,__t.0 
    mv	a2,__t.0 
    call	_stringSubstring
    mv	__t.0,a0 
    mv	__mergedretVal.4,__t.0 
    mv	__mergedretVal.5,__mergedretVal.4 
    j	_afterCallBB4
_afterCallBB4:
    mv	_t.0,__mergedretVal.5 
    mv	a0,_ret.3 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	_ret.6,_t.0 
    mv	_ret.4,_ret.6 
    j	_forupdateBB4
__if_end7:
    la __mergedretVal.6,_globalStr0    
    mv	__mergedretVal.5,__mergedretVal.6 
    j	_afterCallBB4
_afterCallBB2:
    la para,_globalStr0    
    mv	a0,para 
    call	println
    j	_whileBodyBB1
_if_end6:
    mv	_i.4,zero 
    j	_forcondBB11
_forcondBB11:
    blt	_i.4,_nChunk.1,	_forbodyBB11
    j	_afterForBB9
_afterForBB9:
    mv	_i.6,zero 
    j	_forcondBB12
_forcondBB12:
    blt	_i.6,_length.1,	_forbodyBB12
    j	_afterForBB10
_forbodyBB12:
    li t, 4
    rem _t.0,_i.6,t
    li t, 3
    sub _t.0,t,_t.0
    slli _t.0,_t.0,    3
    slli _t.0,_i.6,    2
    addi _t.0,_t.0,    4
    add _t.0,_input.1,_t.0
    lw _t.0, 0(_t.0)
    sll _t.0,_t.0,_t.0
    srai _t.0,_i.6,    6
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 64
    rem _t.0,_i.6,t
    srai _t.0,_t.0,    2
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    or _t.0,_t.0,_t.0
    srai _t.0,_i.6,    6
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 64
    rem _t.0,_i.6,t
    srai _t.0,_t.0,    2
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    addi _i.7,_i.6,    1
    mv	_i.6,_i.7 
    j	_forcondBB12
_afterForBB10:
    li t, 4
    rem _t.0,_i.6,t
    li t, 3
    sub _t.0,t,_t.0
    slli _t.0,_t.0,    3
    li t, 128
    sll _t.0,t,_t.0
    srai _t.0,_i.6,    6
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 64
    rem _t.0,_i.6,t
    srai _t.0,_t.0,    2
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    or _t.0,_t.0,_t.0
    srai _t.0,_i.6,    6
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 64
    rem _t.0,_i.6,t
    srai _t.0,_t.0,    2
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_length.1,    3
    li t, 1
    sub _t.0,_nChunk.1,t
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,64(_t.0)
    srai _t.0,_length.1,    29
    andi _t.0,_t.0,    7
    li t, 1
    sub _t.0,_nChunk.1,t
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,60(_t.0)
    mv	_i.9,zero 
    li t, -271733879
    mv	_h1.3,t 
    li t, 271733878
    mv	_h3.3,t 
    li t, -1009589776
    mv	_h4.3,t 
    li t, 1732584193
    mv	_h0.3,t 
    li t, -1732584194
    mv	_h2.3,t 
    j	_forcondBB13
_forcondBB13:
    blt	_i.9,_nChunk.1,	_forbodyBB13
    j	_afterForBB11
_forbodyBB13:
    li _j.6, 16
    j	_forcondBB14
_forcondBB14:
    li t, 80
    blt	_j.6,t,	_forbodyBB14
    j	_afterForBB12
_forbodyBB14:
    slli _t.0,_i.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 16
    sub _t.0,_j.6,t
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_i.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 14
    sub _t.0,_j.6,t
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_i.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 8
    sub _t.0,_j.6,t
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_i.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 3
    sub _t.0,_j.6,t
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    xor _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    xor _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    xor _t.0,_t.0,_t.0
    mv	__x.4,_t.0 
    srai __t.0,__x.4,    31
    andi __t.0,__t.0,    1
    li t, 2147483647
    and __t.0,__x.4,t
    slli __t.0,__t.0,    1
    or __t.0,__t.0,__t.0
    mv	__mergedretVal.7,__t.0 
    mv	__mergedretVal.6,__mergedretVal.7 
    mv	_t.0,__mergedretVal.6 
    slli _t.0,_i.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_j.6,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    addi _j.7,_j.6,    1
    mv	_j.6,_j.7 
    j	_forcondBB14
_afterForBB12:
    mv	_a.3,_h0.3 
    mv	_b.3,_h1.3 
    mv	_c.3,_h2.3 
    mv	_d.3,_h3.3 
    mv	_e.3,_h4.3 
    mv	_e.4,_e.3 
    mv	_c.4,_c.3 
    mv	_a.4,_a.3 
    mv	_d.4,_d.3 
    mv	_b.4,_b.3 
    mv	_j.9,zero 
    j	_forcondBB15
_forcondBB15:
    li t, 80
    blt	_j.9,t,	_forbodyBB15
    j	_afterForBB13
_forbodyBB15:
    li t, 20
    blt	_j.9,t,	_if_thenBB16
    j	_if_elseBB10
_if_elseBB10:
    li t, 40
    blt	_j.9,t,	_if_thenBB17
    j	_if_elseBB11
_if_elseBB11:
    li t, 60
    blt	_j.9,t,	_if_thenBB18
    j	_if_elseBB12
_if_thenBB18:
    and _t.0,_c.4,_d.4
    and _t.0,_b.4,_d.4
    and _t.0,_b.4,_c.4
    or _t.0,_t.0,_t.0
    or _t.0,_t.0,_t.0
    mv	_f.6,_t.0 
    mv	_f.5,_f.6 
    li t, -1894007588
    mv	_k.5,t 
    j	_if_end7
_if_end7:
    mv	__x.4,_a.4 
    srai __t.0,__x.4,    27
    andi __t.0,__t.0,    31
    li t, 134217727
    and __t.0,__x.4,t
    slli __t.0,__t.0,    5
    or __t.0,__t.0,__t.0
    mv	__mergedretVal.4,__t.0 
    mv	__mergedretVal.7,__mergedretVal.4 
    mv	_t.0,__mergedretVal.7 
    mv	__x.0,_t.0 
    mv	__y.0,_e.4 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	__x.0,_f.5 
    mv	__y.0,_k.5 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	__x.0,_t.0 
    mv	__y.0,_t.0 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    slli _t.0,_i.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_j.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    mv	__x.0,_t.0 
    mv	__y.0,_t.0 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	_temp.4,_t.0 
    mv	_e.5,_d.4 
    mv	_d.5,_c.4 
    mv	__x.4,_b.4 
    srai __t.0,__x.4,    2
    li t, 1073741823
    and __t.0,__t.0,t
    andi __t.0,__x.4,    3
    slli __t.0,__t.0,    30
    or __t.0,__t.0,__t.0
    mv	__mergedretVal.5,__t.0 
    mv	__mergedretVal.6,__mergedretVal.5 
    mv	_t.0,__mergedretVal.6 
    mv	_c.5,_t.0 
    mv	_b.5,_a.4 
    mv	_a.5,_temp.4 
    addi _j.10,_j.9,    1
    mv	_e.4,_e.5 
    mv	_c.4,_c.5 
    mv	_a.4,_a.5 
    mv	_j.9,_j.10 
    mv	_d.4,_d.5 
    mv	_b.4,_b.5 
    j	_forcondBB15
_if_elseBB12:
    xor _t.0,_b.4,_c.4
    xor _t.0,_t.0,_d.4
    mv	_f.7,_t.0 
    mv	_f.5,_f.7 
    li t, -899497514
    mv	_k.5,t 
    j	_if_end7
_if_thenBB17:
    xor _t.0,_b.4,_c.4
    xor _t.0,_t.0,_d.4
    mv	_f.8,_t.0 
    mv	_f.5,_f.8 
    li t, 1859775393
    mv	_k.5,t 
    j	_if_end7
_if_thenBB16:
    xori _t.0,_b.4,    -1
    and _t.0,_t.0,_d.4
    and _t.0,_b.4,_c.4
    or _t.0,_t.0,_t.0
    mv	_f.9,_t.0 
    mv	_f.5,_f.9 
    li t, 1518500249
    mv	_k.5,t 
    j	_if_end7
_afterForBB13:
    mv	__x.0,_h0.3 
    mv	__y.0,_a.4 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	_h0.4,_t.0 
    mv	__x.0,_h1.3 
    mv	__y.0,_b.4 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	_h1.4,_t.0 
    mv	__x.0,_h2.3 
    mv	__y.0,_c.4 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	_h2.4,_t.0 
    mv	__x.0,_h3.3 
    mv	__y.0,_d.4 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	_h3.4,_t.0 
    mv	__x.0,_h4.3 
    mv	__y.0,_e.4 
    li t, 65535
    and __t.0,__y.0,t
    li t, 65535
    and __t.0,__x.0,t
    add __t.0,__t.0,__t.0
    mv	__low.0,__t.0 
    srai __t.0,__low.0,    16
    srai __t.0,__y.0,    16
    li t, 65535
    and __t.0,__t.0,t
    srai __t.0,__x.0,    16
    li t, 65535
    and __t.0,__t.0,t
    add __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    li t, 65535
    and __t.0,__t.0,t
    mv	__high.0,__t.0 
    li t, 65535
    and __t.0,__low.0,t
    slli __t.0,__high.0,    16
    or __t.0,__t.0,__t.0
    mv	_t.0,__t.0 
    mv	_h4.4,_t.0 
    addi _i.10,_i.9,    1
    mv	_i.9,_i.10 
    mv	_h1.3,_h1.4 
    mv	_h3.3,_h3.4 
    mv	_h4.3,_h4.4 
    mv	_h0.3,_h0.4 
    mv	_h2.3,_h2.4 
    j	_forcondBB13
_afterForBB11:
    sw _h0.3,4(_goutputBuffer.0)
    sw _h1.3,8(_goutputBuffer.0)
    sw _h2.3,12(_goutputBuffer.0)
    sw _h3.3,16(_goutputBuffer.0)
    sw _h4.3,20(_goutputBuffer.0)
    mv	_mergedretVal.3,_goutputBuffer.0 
    mv	_mergedretVal.1,_mergedretVal.3 
    j	afterCallBB7
_forbodyBB11:
    mv	_j.12,zero 
    j	_forcondBB16
_forcondBB16:
    li t, 80
    blt	_j.12,t,	_forbodyBB16
    j	_forupdateBB5
_forupdateBB5:
    addi _i.11,_i.4,    1
    mv	_i.4,_i.11 
    j	_forcondBB11
_forbodyBB16:
    slli _t.0,_i.4,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_j.12,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    li _t, 0
    sw _t,0(_t.0)
    addi _j.13,_j.12,    1
    mv	_j.12,_j.13 
    j	_forcondBB16
__forbodyBB6:
    mv	a0,__input.1 
    mv	a1,__i.3 
    call	_stringOrd
    mv	__t.0,a0 
    slli __t.0,__i.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_ginputBuffer.0,__t.0
    sw __t.0,0(__t.0)
    addi __i.7,__i.3,    1
    mv	__i.3,__i.7 
    j	__forcondBB6
afterCallBB1:
    mv	s6,back_s6 
    mv	s5,back_s5 
    mv	s4,back_s4 
    mv	s3,back_s3 
    mv	s2,back_s2 
    mv	s1,back_s1 
    mv	s0,back_s0 
    mv	s11,back_s11 
    mv	s10,back_s10 
    mv	s9,back_s9 
    mv	s8,back_s8 
    mv	s7,back_s7 
    mv	ra,backup_ra 
    mv	a0,zero 
    ret
forupdateBB1:
    li a0, 324
    call malloc
    mv	t.0,a0 
    li _t, 80
    sw _t,0(t.0)
    sw t.0,0(t.2)
    addi t.3,t.2,    4
    mv	t.2,t.3 
    j	forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	outputBuffer					#@outputBuffer
    .p2align	2
outputBuffer:
    .word	0
     
    .globl	asciiTable					#@asciiTable
    .p2align	2
asciiTable:
    .word	0
     
    .globl	inputBuffer					#@inputBuffer
    .p2align	2
inputBuffer:
    .word	0
     
    .globl	MAXCHUNK					#@MAXCHUNK
    .p2align	2
MAXCHUNK:
    .word	0
     
    .globl	chunks					#@chunks
    .p2align	2
chunks:
    .word	0
     
    .globl	MAXLENGTH					#@MAXLENGTH
    .p2align	2
MAXLENGTH:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  ""    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  "Invalid input"    
    .globl	_globalStr2					#@_globalStr2
_globalStr2:
    .asciz  " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"    
    .globl	_globalStr3					#@_globalStr3
_globalStr3:
    .asciz  "Not Found!"    
    .globl	_globalStr4					#@_globalStr4
_globalStr4:
    .asciz  "nChunk > MAXCHUNK!"    
