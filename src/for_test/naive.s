    .text
    .globl	A.A						 # func begin 
    .p2align	2
    .type	A.A,@function
A.A:
%A.A.entryBB1:
    mv	backup_ra,ra 
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
    mv	back_s11,s11 
    mv	this.0,a0 
    add t.0,this.0,zero
    li a0, 4
    call malloc
    mv	t.0,a0 
    mv	a0,t.0 
    call	B.B
    sw t.0,0(t.0)
    mv	s11,back_s11 
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
    mv	ra,backup_ra 
    ret
								 # func end
    .globl	B.B						 # func begin 
    .p2align	2
    .type	B.B,@function
B.B:
%B.B.entryBB1:
    mv	backup_ra,ra 
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
    mv	back_s11,s11 
    mv	this.0,a0 
    add t.0,this.0,zero
    li a0, 4
    call malloc
    mv	t.0,a0 
    mv	a0,t.0 
    call	A.A
    sw t.0,0(t.0)
    mv	s11,back_s11 
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
    mv	ra,backup_ra 
    ret
								 # func end
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
    mv	backup_ra,ra 
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
    mv	back_s11,s11 
    li a0, 4
    call malloc
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	A.A
    mv	_a.0,_t.0 
    li a0, 4
    call malloc
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	B.B
    mv	_b.0,_t.0 
    add _t.0,_a.0,zero
    sw _b.0,0(_t.0)
    add _t.0,_b.0,zero
    sw _a.0,0(_t.0)
    mv	s11,back_s11 
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
    mv	ra,backup_ra 
    mv	a0,zero 
    ret
								 # func end
    .section	.sdata,"aw",@progbits
