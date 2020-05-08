    .text
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
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
    la ptr,t    
    lw _gt.0, 0(ptr)
    la ptr,i    
    lw _gi.0, 0(ptr)
    la ptr,s    
    lw _gs.0, 0(ptr)
    la ptr,l    
    lw _gl.0, 0(ptr)
    call	getInt
    mv	_t.0,a0 
    mv	_gt.1,_t.0 
    mv	_gi.2,zero 
    j	%_forcondBB1
%_forcondBB1:
    blt	_gi.2,_gt.1,	%_forbodyBB1
    j	%afterCallBB1
%_forbodyBB1:
    call	getString
    mv	_t.0,a0 
    mv	_gs.2,_t.0 
    mv	a0,_gs.2 
    call	stringLength
    mv	_t.0,a0 
    mv	_gl.2,_t.0 
    li t, 10
    bgt	_gl.2,t,	%_if_thenBB1
    j	%_if_elseBB1
%_if_elseBB1:
    mv	a0,_gs.2 
    call	println
    j	%_forupdateBB1
%_if_thenBB1:
    mv	a0,_gs.2 
    mv	a1,zero 
    li para, 1
    mv	a2,para 
    call	_stringSubstring
    mv	_t.0,a0 
    li t, 2
    sub _t.0,_gl.2,t
    mv	a0,_t.0 
    call	toString
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    li t, 1
    sub _t.0,_gl.2,t
    mv	a0,_gs.2 
    mv	a1,_t.0 
    mv	a2,_gl.2 
    call	_stringSubstring
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    j	%_forupdateBB1
%_forupdateBB1:
    addi _gi.3,_gi.2,    1
    mv	_gi.2,_gi.3 
    mv	breaker,_gi.2 
    j	%_forcondBB1
%afterCallBB1:
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
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	s					#@s
    .p2align	2
s:
    .word	0
     
    .globl	t					#@t
    .p2align	2
t:
    .word	0
     
    .globl	i					#@i
    .p2align	2
i:
    .word	0
     
    .globl	l					#@l
    .p2align	2
l:
    .word	0
     
