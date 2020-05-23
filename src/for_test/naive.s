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
    li _f1.1, 1
    mv	_f2.0,zero 
    li _i.1, 1
    mv	_f0.1,zero 
    j	_forcondBB1
_forcondBB1:
    li t, 10
    blt	_i.1,t,	_forbodyBB1
    j	afterCallBB1
_forbodyBB1:
    add _t.0,_f0.1,_f1.1
    mv	_f2.1,_t.0 
    mv	_f0.2,_f1.1 
    mv	_f1.2,_f2.1 
    addi _i.2,_i.1,    1
    mv	_f1.1,_f1.2 
    mv	_f2.0,_f2.1 
    mv	_i.1,_i.2 
    mv	_f0.1,_f0.2 
    j	_forcondBB1
afterCallBB1:
    mv	t.0,_f2.0 
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
    mv	a0,t.0 
    ret
								 # func end
    .section	.sdata,"aw",@progbits
