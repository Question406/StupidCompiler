    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    mv	backup_ra,ra 
    mv	back_s0,s0 
    mv	back_s1,s1 
    mv	back_s2,s2 
    mv	back_s3,s3 
    mv	back_s4,s4 
    mv	back_s5,s5 
    mv	back_s6,s6 
    mv	back_s7,s7 
    mv	back_s8,s8 
    mv	back_s9,s9 
    mv	back_s10,s10 
    mv	back_s11,s11 
    la _gasciiTable.0,_globalStr2    
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
forcondBB1:
    ble	t.2,t.1,	forupdateBB1
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
_whileBodyBB1:
    call	getInt
    mv	_t.0,a0 
    mv	_op.1,_t.0 
    beq	_op.1,zero,	afterCallBB1
_if_end1:
    li t, 1
    beq	_op.1,t,	_if_thenBB1
_if_elseBB1:
    li t, 2
    beq	_op.1,t,	_if_thenBB2
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
__if_end1:
    mv	__i.2,zero 
__forcondBB1:
    li t, 5
    blt	__i.2,t,	__forbodyBB1
__afterForBB1:
    mv	__i.4,zero 
__forcondBB2:
    li t, 40
    blt	__i.4,t,	__forbodyBB2
__afterForBB2:
    li __digit.2, 1
__forcondBB3:
    li t, 4
    ble	__digit.2,t,	__forbodyBB3
__afterForBB3:
    la para,_globalStr3    
    mv	a0,para 
    call	println
    j	_whileBodyBB1
__forbodyBB3:
    mv	__i.7,zero 
__forcondBB4:
    blt	__i.7,__digit.2,	__forbodyBB4
__whileBodyBB1:
    mv	_input.3,_ginputBuffer.0 
    mv	_length.3,__digit.2 
    addi _t.0,_length.3,    64
    addi _t.0,_t.0,    -56
    srai _t.0,_t.0,    6
    addi _t.0,_t.0,    1
    mv	_nChunk.3,_t.0 
    li t, 100
    bgt	_nChunk.3,t,	_if_thenBB3
_if_end2:
    mv	_i.4,zero 
_forcondBB1:
    blt	_i.4,_nChunk.3,	_forbodyBB1
_afterForBB1:
    mv	_i.6,zero 
_forcondBB2:
    blt	_i.6,_length.3,	_forbodyBB2
_afterForBB2:
    li t, 3
    and _t.0,_i.6,t
    li t, 3
    sub _t.0,t,_t.0
    slli _t.0,_t.0,    3
    li t, 128
    sll _t.0,t,_t.0
    srai _t.0,_i.6,    6
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 63
    and _t.0,_i.6,t
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
    li t, 63
    and _t.0,_i.6,t
    srai _t.0,_t.0,    2
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_length.3,    3
    addi _t.0,_nChunk.3,    -1
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,64(_t.0)
    srai _t.0,_length.3,    29
    andi _t.0,_t.0,    7
    addi _t.0,_nChunk.3,    -1
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,60(_t.0)
    li t, -271733879
    mv	_h1.4,t 
    li t, -1009589776
    mv	_h4.4,t 
    li t, -1732584194
    mv	_h2.4,t 
    mv	_i.9,zero 
    li t, 271733878
    mv	_h3.4,t 
    li t, 1732584193
    mv	_h0.4,t 
_forcondBB3:
    blt	_i.9,_nChunk.3,	_forbodyBB3
_afterForBB3:
    sw _h0.4,4(_goutputBuffer.0)
    sw _h1.4,8(_goutputBuffer.0)
    sw _h2.4,12(_goutputBuffer.0)
    sw _h3.4,16(_goutputBuffer.0)
    sw _h4.4,20(_goutputBuffer.0)
    mv	_mergedretVal.3,_goutputBuffer.0 
    mv	_mergedretVal.5,_mergedretVal.3 
afterCallBB2:
    mv	__t.0,_mergedretVal.5 
    mv	__out.0,__t.0 
    mv	_a.3,__out.0 
    mv	_b.3,__target.1 
    lw _t.0, 0(_b.3)
    lw _t.0, 0(_a.3)
    bne	_t.0,_t.0,	_if_thenBB4
_if_end3:
    mv	_i.4,zero 
_forcondBB4:
    lw _t.0, 0(_a.3)
    blt	_i.4,_t.0,	_forbodyBB4
_afterForBB4:
    li _mergedretVal.5, 1
afterCallBB3:
    mv	__t.0,_mergedretVal.5 
    bne	__t.0, zero, __if_thenBB2
__if_end2:
    mv	_now.3,_ginputBuffer.0 
    mv	_length.0,__digit.2 
    addi _t.0,_length.0,    -1
    mv	_i.3,_t.0 
    mv	_i.4,_i.3 
_forcondBB5:
    bge	_i.4,zero,	_forbodyBB5
_afterForBB5:
    mv	_mergedretVal.3,zero 
afterCallBB4:
    mv	__t.0,_mergedretVal.3 
    bne	__t.0, zero, __whileBodyBB1
__forupdateBB1:
    addi __digit.3,__digit.2,    1
    mv	__digit.2,__digit.3 
    j	__forcondBB3
_forbodyBB5:
    slli _t.0,_i.4,    2
    addi _t.0,_t.0,    4
    add _t.0,_now.3,_t.0
    lw _t.0, 0(_t.0)
    mv	__now.5,_t.0 
    li t, 122
    beq	__now.5,t,	__if_thenBB3
__if_end3:
    li t, 90
    beq	__now.5,t,	__if_thenBB4
__if_end4:
    li t, 57
    beq	__now.5,t,	__if_thenBB5
__if_end5:
    addi __t.0,__now.5,    1
    mv	__mergedretVal.6,__t.0 
    mv	__mergedretVal.5,__mergedretVal.6 
_afterCallBB1:
    mv	_t.0,__mergedretVal.5 
    slli _t.0,_i.4,    2
    addi _t.0,_t.0,    4
    add _t.0,_now.3,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_i.4,    2
    addi _t.0,_t.0,    4
    add _t.0,_now.3,_t.0
    lw _t.0, 0(_t.0)
    li t, -1
    beq	_t.0,t,	_if_thenBB5
_if_elseBB2:
    li _mergedretVal.3, 1
    j	afterCallBB4
_if_thenBB5:
    slli _t.0,_i.4,    2
    addi _t.0,_t.0,    4
    add _t.0,_now.3,_t.0
    li _t, 48
    sw _t,0(_t.0)
    addi _i.5,_i.4,    -1
    mv	_i.4,_i.5 
    j	_forcondBB5
__if_thenBB5:
    li __mergedretVal.5, 65
    j	_afterCallBB1
__if_thenBB4:
    li __mergedretVal.5, 97
    j	_afterCallBB1
__if_thenBB3:
    li __mergedretVal.5, -1
    j	_afterCallBB1
__if_thenBB2:
    mv	__i.10,zero 
__forcondBB5:
    blt	__i.10,__digit.2,	__forbodyBB5
__afterForBB4:
    la para,_globalStr0    
    mv	a0,para 
    call	println
    j	_whileBodyBB1
__forbodyBB5:
    slli __t.0,__i.10,    2
    addi __t.0,__t.0,    4
    add __t.0,_ginputBuffer.0,__t.0
    lw __t.0, 0(__t.0)
    mv	_x.2,__t.0 
    li t, 32
    bge	_x.2,t,	_ifTrue1
_if_end4:
    la _mergedretVal.3,_globalStr0    
    mv	_mergedretVal.4,_mergedretVal.3 
afterCallBB5:
    mv	__t.0,_mergedretVal.4 
    mv	a0,__t.0 
    call	print
    addi __i.11,__i.10,    1
    mv	__i.10,__i.11 
    j	__forcondBB5
_ifTrue1:
    li t, 126
    ble	_x.2,t,	_if_thenBB6
    j	_if_end4
_if_thenBB6:
    addi _t.0,_x.2,    -32
    addi _t.0,_x.2,    -31
    mv	a0,_gasciiTable.0 
    mv	a1,_t.0 
    mv	a2,_t.0 
    call	_stringSubstring
    mv	_t.0,a0 
    mv	_mergedretVal.2,_t.0 
    mv	_mergedretVal.4,_mergedretVal.2 
    j	afterCallBB5
_forbodyBB4:
    slli _t.0,_i.4,    2
    addi _t.0,_t.0,    4
    add _t.0,_b.3,_t.0
    slli _t.0,_i.4,    2
    addi _t.0,_t.0,    4
    add _t.0,_a.3,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    bne	_t.0,_t.0,	_if_thenBB7
_forupdateBB1:
    addi _i.5,_i.4,    1
    mv	_i.4,_i.5 
    j	_forcondBB4
_if_thenBB7:
    mv	_mergedretVal.5,zero 
    j	afterCallBB3
_if_thenBB4:
    mv	_mergedretVal.5,zero 
    j	afterCallBB3
_forbodyBB3:
    li _j.6, 16
_forcondBB6:
    li t, 80
    blt	_j.6,t,	_forbodyBB6
_afterForBB6:
    mv	_a.4,_h0.4 
    mv	_b.4,_h1.4 
    mv	_c.4,_h2.4 
    mv	_d.4,_h3.4 
    mv	_e.4,_h4.4 
    mv	_b.5,_b.4 
    mv	_d.5,_d.4 
    mv	_e.5,_e.4 
    mv	_a.5,_a.4 
    mv	_c.5,_c.4 
    mv	_j.8,zero 
_forcondBB7:
    li t, 80
    blt	_j.8,t,	_forbodyBB7
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
    addi _i.10,_i.9,    1
    mv	_h1.4,_h1.5 
    mv	_h4.4,_h4.5 
    mv	_h2.4,_h2.5 
    mv	_i.9,_i.10 
    mv	_h3.4,_h3.5 
    mv	_h0.4,_h0.5 
    j	_forcondBB3
_forbodyBB7:
    li t, 20
    blt	_j.8,t,	_if_thenBB8
_if_elseBB3:
    li t, 40
    blt	_j.8,t,	_if_thenBB9
_if_elseBB4:
    li t, 60
    blt	_j.8,t,	_if_thenBB10
_if_elseBB5:
    xor _t.0,_b.5,_c.5
    xor _t.0,_t.0,_d.5
    mv	_f.7,_t.0 
    mv	_f.8,_f.7 
    li t, -899497514
    mv	_k.8,t 
_if_end5:
    mv	__x.5,_a.5 
    srai __t.0,__x.5,    27
    andi __t.0,__t.0,    31
    li t, 134217727
    and __t.0,__x.5,t
    slli __t.0,__t.0,    5
    or __t.0,__t.0,__t.0
    mv	__mergedretVal.7,__t.0 
    mv	__mergedretVal.5,__mergedretVal.7 
    mv	_t.0,__mergedretVal.5 
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
    mv	__x.0,_f.8 
    mv	__y.0,_k.8 
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
    slli _t.0,_j.8,    2
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
    mv	__mergedretVal.8,__t.0 
    mv	__mergedretVal.6,__mergedretVal.8 
    mv	_t.0,__mergedretVal.6 
    mv	_c.6,_t.0 
    mv	_b.6,_a.5 
    mv	_a.6,_temp.5 
    addi _j.9,_j.8,    1
    mv	_j.8,_j.9 
    mv	_b.5,_b.6 
    mv	_d.5,_d.6 
    mv	_e.5,_e.6 
    mv	_a.5,_a.6 
    mv	_c.5,_c.6 
    j	_forcondBB7
_if_thenBB10:
    and _t.0,_c.5,_d.5
    and _t.0,_b.5,_d.5
    and _t.0,_b.5,_c.5
    or _t.0,_t.0,_t.0
    or _t.0,_t.0,_t.0
    mv	_f.6,_t.0 
    mv	_f.8,_f.6 
    li t, -1894007588
    mv	_k.8,t 
    j	_if_end5
_if_thenBB9:
    xor _t.0,_b.5,_c.5
    xor _t.0,_t.0,_d.5
    mv	_f.5,_t.0 
    mv	_f.8,_f.5 
    li t, 1859775393
    mv	_k.8,t 
    j	_if_end5
_if_thenBB8:
    xori _t.0,_b.5,    -1
    and _t.0,_t.0,_d.5
    and _t.0,_b.5,_c.5
    or _t.0,_t.0,_t.0
    mv	_f.9,_t.0 
    mv	_f.8,_f.9 
    li t, 1518500249
    mv	_k.8,t 
    j	_if_end5
_forbodyBB6:
    slli _t.0,_i.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    addi _t.0,_j.6,    -16
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_i.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    addi _t.0,_j.6,    -14
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_i.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    addi _t.0,_j.6,    -8
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_i.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    addi _t.0,_j.6,    -3
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
    mv	__mergedretVal.7,__t.0 
    mv	__mergedretVal.8,__mergedretVal.7 
    mv	_t.0,__mergedretVal.8 
    slli _t.0,_i.9,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_j.6,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    addi _j.10,_j.6,    1
    mv	_j.6,_j.10 
    j	_forcondBB6
_forbodyBB2:
    li t, 3
    and _t.0,_i.6,t
    li t, 3
    sub _t.0,t,_t.0
    slli _t.0,_t.0,    3
    slli _t.0,_i.6,    2
    addi _t.0,_t.0,    4
    add _t.0,_input.3,_t.0
    lw _t.0, 0(_t.0)
    sll _t.0,_t.0,_t.0
    srai _t.0,_i.6,    6
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 63
    and _t.0,_i.6,t
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
    li t, 63
    and _t.0,_i.6,t
    srai _t.0,_t.0,    2
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    addi _i.7,_i.6,    1
    mv	_i.6,_i.7 
    j	_forcondBB2
_forbodyBB1:
    mv	_j.12,zero 
_forcondBB8:
    li t, 80
    blt	_j.12,t,	_forbodyBB8
_forupdateBB2:
    addi _i.11,_i.4,    1
    mv	_i.4,_i.11 
    j	_forcondBB1
_forbodyBB8:
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
    j	_forcondBB8
_if_thenBB3:
    la para,_globalStr4    
    mv	a0,para 
    call	println
    mv	_mergedretVal.5,zero 
    j	afterCallBB2
__forbodyBB4:
    slli __t.0,__i.7,    2
    addi __t.0,__t.0,    4
    add __t.0,_ginputBuffer.0,__t.0
    li _t, 48
    sw _t,0(__t.0)
    addi __i.8,__i.7,    1
    mv	__i.7,__i.8 
    j	__forcondBB4
__forbodyBB2:
    srai __t.0,__i.4,    2
    li t, 1
    and __t.0,__t.0,t
    li t, 1
    sub __t.0,t,__t.0
    slli __t.2,__t.0,    4
    addi __t.0,__i.4,    4
    mv	a0,__input.1 
    mv	a1,__i.4 
    mv	a2,__t.0 
    call	_stringSubstring
    mv	__t.0,a0 
    mv	_x.2,__t.0 
    mv	_i.3,zero 
    mv	_result.3,zero 
_forcondBB9:
    mv	a0,_x.2 
    call	stringLength
    mv	_t.0,a0 
    blt	_i.3,_t.0,	_forbodyBB9
_afterForBB8:
    mv	_mergedretVal.4,_result.3 
    mv	_mergedretVal.3,_mergedretVal.4 
afterCallBB6:
    mv	__t.0,_mergedretVal.3 
    sll __t.0,__t.0,__t.2
    srai __t.0,__i.4,    3
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__target.1,__t.0
    lw __t.0, 0(__t.0)
    or __t.0,__t.0,__t.0
    srai __t.0,__i.4,    3
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__target.1,__t.0
    sw __t.0,0(__t.0)
    addi __t.0,__i.4,    4
    mv	__i.12,__t.0 
    mv	__i.4,__i.12 
    j	__forcondBB2
_forbodyBB9:
    mv	a0,_x.2 
    mv	a1,_i.3 
    call	_stringOrd
    mv	_t.0,a0 
    mv	_digit.3,_t.0 
    li t, 48
    bge	_digit.3,t,	_ifTrue2
_if_elseBB6:
    li t, 65
    bge	_digit.3,t,	_ifTrue3
_if_elseBB7:
    li t, 97
    bge	_digit.3,t,	_ifTrue4
_if_elseBB8:
    mv	_mergedretVal.3,zero 
    j	afterCallBB6
_ifTrue4:
    li t, 102
    ble	_digit.3,t,	_if_thenBB11
    j	_if_elseBB8
_if_thenBB11:
    slli _t.0,_result.3,    4
    add _t.0,_t.0,_digit.3
    addi _t.0,_t.0,    -97
    addi _t.0,_t.0,    10
    mv	_result.7,_t.0 
    mv	_result.5,_result.7 
_forupdateBB3:
    addi _i.4,_i.3,    1
    mv	_i.3,_i.4 
    mv	_result.3,_result.5 
    j	_forcondBB9
_ifTrue3:
    li t, 70
    ble	_digit.3,t,	_if_thenBB12
    j	_if_elseBB7
_if_thenBB12:
    slli _t.0,_result.3,    4
    add _t.0,_t.0,_digit.3
    addi _t.0,_t.0,    -65
    addi _t.0,_t.0,    10
    mv	_result.6,_t.0 
    mv	_result.5,_result.6 
    j	_forupdateBB3
_ifTrue2:
    li t, 57
    ble	_digit.3,t,	_if_thenBB13
    j	_if_elseBB6
_if_thenBB13:
    slli _t.0,_result.3,    4
    add _t.0,_t.0,_digit.3
    addi _t.0,_t.0,    -48
    mv	_result.4,_t.0 
    mv	_result.5,_result.4 
    j	_forupdateBB3
__forbodyBB1:
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,__target.1,__t.0
    li _t, 0
    sw _t,0(__t.0)
    addi __i.13,__i.2,    1
    mv	__i.2,__i.13 
    j	__forcondBB1
__if_thenBB1:
    la para,_globalStr1    
    mv	a0,para 
    call	println
    j	_whileBodyBB1
_if_thenBB1:
    call	getString
    mv	_t.0,a0 
    mv	_input.0,_t.0 
    mv	__input.1,_input.0 
    mv	__i.2,zero 
__forcondBB6:
    mv	a0,__input.1 
    call	stringLength
    mv	__t.0,a0 
    blt	__i.2,__t.0,	__forbodyBB6
__afterForBB5:
    mv	a0,__input.1 
    call	stringLength
    mv	__t.0,a0 
    mv	_input.1,_ginputBuffer.0 
    mv	_length.1,__t.0 
    addi _t.0,_length.1,    64
    addi _t.0,_t.0,    -56
    srai _t.0,_t.0,    6
    addi _t.0,_t.0,    1
    mv	_nChunk.1,_t.0 
    li t, 100
    bgt	_nChunk.1,t,	_if_thenBB14
_if_end6:
    mv	_i.3,zero 
_forcondBB10:
    blt	_i.3,_nChunk.1,	_forbodyBB10
_afterForBB9:
    mv	_i.6,zero 
_forcondBB11:
    blt	_i.6,_length.1,	_forbodyBB11
_afterForBB10:
    li t, 3
    and _t.0,_i.6,t
    li t, 3
    sub _t.0,t,_t.0
    slli _t.0,_t.0,    3
    li t, 128
    sll _t.0,t,_t.0
    srai _t.0,_i.6,    6
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    li t, 63
    and _t.0,_i.6,t
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
    li t, 63
    and _t.0,_i.6,t
    srai _t.0,_t.0,    2
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_length.1,    3
    addi _t.0,_nChunk.1,    -1
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,64(_t.0)
    srai _t.0,_length.1,    29
    andi _t.0,_t.0,    7
    addi _t.0,_nChunk.1,    -1
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,60(_t.0)
    li t, 271733878
    mv	_h3.3,t 
    li t, -1009589776
    mv	_h4.3,t 
    li t, 1732584193
    mv	_h0.3,t 
    li t, -271733879
    mv	_h1.3,t 
    li t, -1732584194
    mv	_h2.3,t 
    mv	_i.8,zero 
_forcondBB12:
    blt	_i.8,_nChunk.1,	_forbodyBB12
_afterForBB11:
    sw _h0.3,4(_goutputBuffer.0)
    sw _h1.3,8(_goutputBuffer.0)
    sw _h2.3,12(_goutputBuffer.0)
    sw _h3.3,16(_goutputBuffer.0)
    sw _h4.3,20(_goutputBuffer.0)
    mv	_mergedretVal.3,_goutputBuffer.0 
    mv	_mergedretVal.2,_mergedretVal.3 
afterCallBB7:
    mv	__t.0,_mergedretVal.2 
    mv	__result.1,__t.0 
    mv	__i.4,zero 
__forcondBB7:
    lw __t.0, 0(__result.1)
    blt	__i.4,__t.0,	__forbodyBB7
_afterCallBB2:
    la para,_globalStr0    
    mv	a0,para 
    call	println
    j	_whileBodyBB1
__forbodyBB7:
    slli __t.0,__i.4,    2
    addi __t.0,__t.0,    4
    add __t.0,__result.1,__t.0
    lw __t.0, 0(__t.0)
    mv	_x.2,__t.0 
    la _ret.2,_globalStr0    
    mv	_ret.3,_ret.2 
    li _i.3, 28
_forcondBB13:
    bge	_i.3,zero,	_forbodyBB13
afterCallBB8:
    mv	__t.0,_ret.3 
    mv	a0,__t.0 
    call	print
    addi __i.5,__i.4,    1
    mv	__i.4,__i.5 
    j	__forcondBB7
_forbodyBB13:
    sra _t.0,_x.2,_i.3
    andi _t.0,_t.0,    15
    mv	_digit.3,_t.0 
    li t, 10
    blt	_digit.3,t,	_if_thenBB15
_if_elseBB9:
    addi _t.0,_digit.3,    65
    addi _t.0,_t.0,    -10
    mv	__x.3,_t.0 
    li t, 32
    bge	__x.3,t,	__ifTrue1
__if_end6:
    la __mergedretVal.4,_globalStr0    
    mv	__mergedretVal.5,__mergedretVal.4 
_afterCallBB3:
    mv	_t.0,__mergedretVal.5 
    mv	a0,_ret.3 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	_ret.5,_t.0 
    mv	_ret.6,_ret.5 
_forupdateBB4:
    addi _t.0,_i.3,    -4
    mv	_i.4,_t.0 
    mv	_i.3,_i.4 
    mv	_ret.3,_ret.6 
    j	_forcondBB13
__ifTrue1:
    li t, 126
    ble	__x.3,t,	__if_thenBB6
    j	__if_end6
__if_thenBB6:
    addi __t.0,__x.3,    -32
    addi __t.0,__x.3,    -31
    mv	a0,_gasciiTable.0 
    mv	a1,__t.0 
    mv	a2,__t.0 
    call	_stringSubstring
    mv	__t.0,a0 
    mv	__mergedretVal.3,__t.0 
    mv	__mergedretVal.5,__mergedretVal.3 
    j	_afterCallBB3
_if_thenBB15:
    addi _t.0,_digit.3,    48
    mv	__x.3,_t.0 
    li t, 32
    bge	__x.3,t,	__ifTrue2
__if_end7:
    la __mergedretVal.5,_globalStr0    
    mv	__mergedretVal.4,__mergedretVal.5 
_afterCallBB4:
    mv	_t.0,__mergedretVal.4 
    mv	a0,_ret.3 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	_ret.4,_t.0 
    mv	_ret.6,_ret.4 
    j	_forupdateBB4
__ifTrue2:
    li t, 126
    ble	__x.3,t,	__if_thenBB7
    j	__if_end7
__if_thenBB7:
    addi __t.0,__x.3,    -32
    addi __t.0,__x.3,    -31
    mv	a0,_gasciiTable.0 
    mv	a1,__t.0 
    mv	a2,__t.0 
    call	_stringSubstring
    mv	__t.0,a0 
    mv	__mergedretVal.3,__t.0 
    mv	__mergedretVal.4,__mergedretVal.3 
    j	_afterCallBB4
_forbodyBB12:
    li _j.8, 16
_forcondBB14:
    li t, 80
    blt	_j.8,t,	_forbodyBB14
_afterForBB12:
    mv	_a.3,_h0.3 
    mv	_b.3,_h1.3 
    mv	_c.3,_h2.3 
    mv	_d.3,_h3.3 
    mv	_e.3,_h4.3 
    mv	_e.4,_e.3 
    mv	_b.4,_b.3 
    mv	_a.4,_a.3 
    mv	_d.4,_d.3 
    mv	_c.4,_c.3 
    mv	_j.11,zero 
_forcondBB15:
    li t, 80
    blt	_j.11,t,	_forbodyBB15
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
    addi _i.9,_i.8,    1
    mv	_h3.3,_h3.4 
    mv	_h4.3,_h4.4 
    mv	_h0.3,_h0.4 
    mv	_h1.3,_h1.4 
    mv	_h2.3,_h2.4 
    mv	_i.8,_i.9 
    j	_forcondBB12
_forbodyBB15:
    li t, 20
    blt	_j.11,t,	_if_thenBB16
_if_elseBB10:
    li t, 40
    blt	_j.11,t,	_if_thenBB17
_if_elseBB11:
    li t, 60
    blt	_j.11,t,	_if_thenBB18
_if_elseBB12:
    xor _t.0,_b.4,_c.4
    xor _t.0,_t.0,_d.4
    mv	_f.6,_t.0 
    mv	_f.8,_f.6 
    li t, -899497514
    mv	_k.8,t 
_if_end7:
    mv	__x.4,_a.4 
    srai __t.0,__x.4,    27
    andi __t.0,__t.0,    31
    li t, 134217727
    and __t.0,__x.4,t
    slli __t.0,__t.0,    5
    or __t.0,__t.0,__t.0
    mv	__mergedretVal.5,__t.0 
    mv	__mergedretVal.7,__mergedretVal.5 
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
    mv	__x.0,_f.8 
    mv	__y.0,_k.8 
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
    slli _t.0,_i.8,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_j.11,    2
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
    mv	__mergedretVal.6,__t.0 
    mv	__mergedretVal.4,__mergedretVal.6 
    mv	_t.0,__mergedretVal.4 
    mv	_c.5,_t.0 
    mv	_b.5,_a.4 
    mv	_a.5,_temp.4 
    addi _j.12,_j.11,    1
    mv	_e.4,_e.5 
    mv	_b.4,_b.5 
    mv	_a.4,_a.5 
    mv	_d.4,_d.5 
    mv	_j.11,_j.12 
    mv	_c.4,_c.5 
    j	_forcondBB15
_if_thenBB18:
    and _t.0,_c.4,_d.4
    and _t.0,_b.4,_d.4
    and _t.0,_b.4,_c.4
    or _t.0,_t.0,_t.0
    or _t.0,_t.0,_t.0
    mv	_f.5,_t.0 
    mv	_f.8,_f.5 
    li t, -1894007588
    mv	_k.8,t 
    j	_if_end7
_if_thenBB17:
    xor _t.0,_b.4,_c.4
    xor _t.0,_t.0,_d.4
    mv	_f.4,_t.0 
    mv	_f.8,_f.4 
    li t, 1859775393
    mv	_k.8,t 
    j	_if_end7
_if_thenBB16:
    xori _t.0,_b.4,    -1
    and _t.0,_t.0,_d.4
    and _t.0,_b.4,_c.4
    or _t.0,_t.0,_t.0
    mv	_f.7,_t.0 
    mv	_f.8,_f.7 
    li t, 1518500249
    mv	_k.8,t 
    j	_if_end7
_forbodyBB14:
    slli _t.0,_i.8,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    addi _t.0,_j.8,    -16
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_i.8,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    addi _t.0,_j.8,    -14
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_i.8,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    addi _t.0,_j.8,    -8
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_i.8,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    addi _t.0,_j.8,    -3
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
    slli _t.0,_i.8,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_j.8,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    addi _j.9,_j.8,    1
    mv	_j.8,_j.9 
    j	_forcondBB14
_forbodyBB11:
    li t, 3
    and _t.0,_i.6,t
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
    li t, 63
    and _t.0,_i.6,t
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
    li t, 63
    and _t.0,_i.6,t
    srai _t.0,_t.0,    2
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    addi _i.10,_i.6,    1
    mv	_i.6,_i.10 
    j	_forcondBB11
_forbodyBB10:
    mv	_j.4,zero 
_forcondBB16:
    li t, 80
    blt	_j.4,t,	_forbodyBB16
_forupdateBB5:
    addi _i.4,_i.3,    1
    mv	_i.3,_i.4 
    j	_forcondBB10
_forbodyBB16:
    slli _t.0,_i.3,    2
    addi _t.0,_t.0,    4
    add _t.0,_gchunks.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_j.4,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    li _t, 0
    sw _t,0(_t.0)
    addi _j.5,_j.4,    1
    mv	_j.4,_j.5 
    j	_forcondBB16
_if_thenBB14:
    la para,_globalStr4    
    mv	a0,para 
    call	println
    mv	_mergedretVal.2,zero 
    j	afterCallBB7
__forbodyBB6:
    mv	a0,__input.1 
    mv	a1,__i.2 
    call	_stringOrd
    mv	__t.0,a0 
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_ginputBuffer.0,__t.0
    sw __t.0,0(__t.0)
    addi __i.6,__i.2,    1
    mv	__i.2,__i.6 
    j	__forcondBB6
afterCallBB1:
    mv	s11,back_s11 
    mv	s10,back_s10 
    mv	s9,back_s9 
    mv	s8,back_s8 
    mv	s7,back_s7 
    mv	s6,back_s6 
    mv	s5,back_s5 
    mv	s4,back_s4 
    mv	s3,back_s3 
    mv	s2,back_s2 
    mv	s1,back_s1 
    mv	s0,back_s0 
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
