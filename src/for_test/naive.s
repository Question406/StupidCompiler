    .text
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
    mv	_M.1,_t.0 
    call	getInt
    mv	_t.0,a0 
    mv	_N.1,_t.0 
    li t, 40024
    mv	a0,t 
    call malloc
    mv	_t.0,a0 
    li _t, 10005
    sw _t,0(_t.0)
    mv	_w.0,_t.0 
    li t, 40024
    mv	a0,t 
    call malloc
    mv	_t.0,a0 
    li _t, 10005
    sw _t,0(_t.0)
    mv	_t.0,_t.0 
    li t, 40024
    mv	a0,t 
    call malloc
    mv	_t.0,a0 
    li _t, 10005
    sw _t,0(_t.0)
    mv	_DP.0,_t.0 
    mv	_i.2,zero 
    j	_forcondBB1
_forcondBB1:
    blt	_i.2,_N.1,	_forbodyBB1
    j	_afterForBB1
_forbodyBB1:
    call	getInt
    mv	_t.0,a0 
    slli _t.0,_i.2,    2
    addi _t.0,_t.0,    4
    add _t.0,_w.0,_t.0
    sw _t.0,0(_t.0)
    call	getInt
    mv	_t.0,a0 
    slli _t.0,_i.2,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    sw _t.0,0(_t.0)
    addi _i.3,_i.2,    1
    mv	_i.2,_i.3 
    j	_forcondBB1
_afterForBB1:
    mv	_i.5,zero 
    j	_forcondBB2
_forcondBB2:
    blt	_i.5,_N.1,	_forbodyBB2
    j	afterCallBB1
_forbodyBB2:
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    mv	_j.2,_t.0 
    mv	_j.3,_j.2 
    j	_forcondBB3
_forcondBB3:
    ble	_j.3,_M.1,	_forbodyBB3
    j	_forupdateBB1
_forupdateBB1:
    addi _i.6,_i.5,    1
    mv	_i.5,_i.6 
    j	_forcondBB2
_forbodyBB3:
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_w.0,_t.0
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    sub _t.0,_j.3,_t.0
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_DP.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    add _t.0,_t.0,_t.0
    slli _t.0,_j.3,    2
    addi _t.0,_t.0,    4
    add _t.0,_DP.0,_t.0
    lw _t.0, 0(_t.0)
    ble	_t.0,_t.0,	_if_thenBB1
    j	_forupdateBB2
_forupdateBB2:
    addi _j.4,_j.3,    1
    mv	_j.3,_j.4 
    j	_forcondBB3
_if_thenBB1:
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_w.0,_t.0
    slli _t.0,_i.5,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    lw _t.0, 0(_t.0)
    sub _t.0,_j.3,_t.0
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_DP.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    add _t.0,_t.0,_t.0
    slli _t.0,_j.3,    2
    addi _t.0,_t.0,    4
    add _t.0,_DP.0,_t.0
    sw _t.0,0(_t.0)
    j	_forupdateBB2
afterCallBB1:
    slli _t.0,_M.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_DP.0,_t.0
    lw _t.0, 0(_t.0)
    mv	a0,_t.0 
    call	printInt
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
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	MAXN					#@MAXN
    .p2align	2
MAXN:
    .word	0
     
    .globl	MAXM					#@MAXM
    .p2align	2
MAXM:
    .word	0
     
