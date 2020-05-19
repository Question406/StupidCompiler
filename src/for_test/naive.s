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
    li a0, 424
    call malloc
    mv	_t.0,a0 
    li _t, 105
    sw _t,0(_t.0)
    mv	_primes.0,_t.0 
    li a0, 424
    call malloc
    mv	_t.0,a0 
    li _t, 105
    sw _t,0(_t.0)
    mv	_pindex.0,_t.0 
    li t, 400024
    mv	a0,t 
    call malloc
    mv	_t.0,a0 
    li _t, 100005
    sw _t,0(_t.0)
    mv	_ans.0,_t.0 
    call	getInt
    mv	_t.0,a0 
    mv	_K.1,_t.0 
    call	getInt
    mv	_t.0,a0 
    mv	_N.1,_t.0 
    mv	_i.2,zero 
    j	_forcondBB1
_forcondBB1:
    blt	_i.2,_K.1,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    li _t, 1
    sw _t,4(_ans.0)
    mv	_point.1,zero 
    j	_whileCondBB1
_whileCondBB1:
    ble	_point.1,_N.1,	_whileBodyBB1
    j	afterCallBB1
_whileBodyBB1:
    mv	_i.5,zero 
    li t, 2139062143
    mv	_MIN.3,t 
    j	_forcondBB2
_forcondBB2:
    blt	_i.5,_K.1,	_whileCondBB2
    j	_afterForBB2
_whileCondBB2:
    slli _t.0,_point.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_ans.0,_t.0
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_primes.0,_t.0
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_pindex.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_ans.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    mul _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    bge	_t.0,_t.0,	_whileBodyBB2
    j	_afterWhileBB1
_whileBodyBB2:
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_pindex.0,_t.0
    lw _t.0, 0(_t.0)
    addi _t.0,_t.0,    1
    sw _t.0,0(_t.0)
    j	_whileCondBB2
_afterWhileBB1:
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_primes.0,_t.0
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_pindex.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_ans.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    mul _t.0,_t.0,_t.0
    blt	_t.0,_MIN.3,	_if_thenBB1
    j	paracopy1
_if_thenBB1:
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_primes.0,_t.0
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_pindex.0,_t.0
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_ans.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    mul _t.0,_t.0,_t.0
    mv	_MIN.5,_t.0 
    mv	_MIN.4,_MIN.5 
    mv	breaker,_MIN.4 
    j	_forupdateBB1
_forupdateBB1:
    addi _i.6,_i.5,    1
    mv	_i.5,_i.6 
    mv	_MIN.3,_MIN.4 
    mv	breaker,_i.5 
    mv	_i.5,_i.5 
    mv	breaker,_MIN.3 
    j	_forcondBB2
paracopy1:
    mv	_MIN.4,_MIN.3 
    mv	breaker,_MIN.4 
    j	_forupdateBB1
_afterForBB2:
    addi _point.2,_point.1,    1
    slli _t.0,_point.2,    2
    addi _t.0,_t.0,    4
    add _t.0,_ans.0,_t.0
    sw _MIN.3,0(_t.0)
    mv	_point.1,_point.2 
    mv	breaker,_point.1 
    j	_whileCondBB1
afterCallBB1:
    slli _t.0,_N.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_ans.0,_t.0
    lw _t.0, 0(_t.0)
    mv	a0,_t.0 
    call	toString
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	print
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
_forbodyBB1:
    call	getInt
    mv	_t.0,a0 
    slli _t.0,_i.2,    2
    addi _t.0,_t.0,    4
    add _t.0,_primes.0,_t.0
    sw _t.0,0(_t.0)
    addi _i.7,_i.2,    1
    mv	_i.2,_i.7 
    mv	breaker,_i.2 
    j	_forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	MAXK					#@MAXK
    .p2align	2
MAXK:
    .word	0
     
    .globl	MAXN					#@MAXN
    .p2align	2
MAXN:
    .word	0
     
