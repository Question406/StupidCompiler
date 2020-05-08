    .text
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
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
    la ptr,map    
    lw _gmap.0, 0(ptr)
    la ptr,str    
    lw _gstr.0, 0(ptr)
    la ptr,a    
    lw _ga.0, 0(ptr)
    la ptr,b    
    lw _gb.0, 0(ptr)
    li t, 2896
    mv	a0,t 
    call malloc
    mv	t.0,a0 
    li _t, 723
    sw _t,0(t.0)
    mv	_ga.1,t.0 
    li a0, 616
    call malloc
    mv	t.0,a0 
    li _t, 153
    sw _t,0(t.0)
    mv	t.0,t.0 
    addi t.1,t.0,    4
    mv	t.0,t.0 
    addi t.1,t.0,    612
    mv	t.2,t.1 
    mv	breaker,t.2 
    j	%forcondBB1
%forcondBB1:
    ble	t.2,t.1,	%forupdateBB1
    j	%afterForBB1
%forupdateBB1:
    li a0, 580
    call malloc
    mv	t.0,a0 
    li _t, 144
    sw _t,0(t.0)
    sw t.0,0(t.2)
    addi t.3,t.2,    4
    mv	t.2,t.3 
    mv	breaker,t.2 
    j	%forcondBB1
%afterForBB1:
    mv	_i.2,zero 
    j	%_forcondBB1
%_forcondBB1:
    li t, 10213
    blt	_i.2,t,	%_forbodyBB1
    j	%afterCallBB1
%afterCallBB1:
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
%_forbodyBB1:
    li t, 10213
    mul _t.0,_i.2,t
    li t, 13
    sub _t.0,_t.0,t
    mv	_flag.1,_t.0 
    li t, 4
    mul _t.0,_i.2,t
    addi _t.0,_t.0,    4
    add _t.0,_ga.1,_t.0
    lw _t.0, 0(_t.0)
    add _t.0,_t.0,zero
    lw _t.0, 0(_t.0)
    blt	_flag.1,_t.0,	%_forupdateBB1
    j	%_if_thenBB1
%_if_thenBB1:
    li t, 4
    mul _t.0,_i.2,t
    addi _t.0,_t.0,    4
    add _t.2,_ga.1,_t.0
    addi _t.0,_i.2,    1
    li t, 4
    mul _t.0,_t.0,t
    addi _t.0,_t.0,    4
    add _t.0,_ga.1,_t.0
    lw _t.0, 0(_t.0)
    mv	__this.2,_t.0 
    add __t.0,__this.2,zero
    lw __t.0, 0(__t.0)
    li t, 10
    ble	t,__t.0,	%__forbodyBB1
    j	%__afterForBB1
%__forbodyBB1:
    mv	__mergedretVal.4,__this.2 
    mv	__mergedretVal.3,__mergedretVal.4 
    mv	breaker,__mergedretVal.3 
    j	%_afterCallBB1
%__afterForBB1:
    mv	__mergedretVal.2,__this.2 
    mv	__mergedretVal.3,__mergedretVal.2 
    mv	breaker,__mergedretVal.3 
    j	%_afterCallBB1
%_afterCallBB1:
    mv	_t.0,__mergedretVal.3 
    sw _t.0,0(_t.2)
    addi __t.0,_ga.1,    48
    lw __t.0, 0(__t.0)
    mv	___this.2,__t.0 
    add ___t.0,___this.2,zero
    lw ___t.0, 0(___t.0)
    j	%_forupdateBB1
%_forupdateBB1:
    addi _i.3,_i.2,    1
    mv	_i.2,_i.3 
    mv	breaker,_i.2 
    j	%_forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	str					#@str
    .p2align	2
str:
    .word	0
     
    .globl	a					#@a
    .p2align	2
a:
    .word	0
     
    .globl	b					#@b
    .p2align	2
b:
    .word	0
     
    .globl	map					#@map
    .p2align	2
map:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  "19asdojkhkj1"    
