    .text
    .globl	qsrt				#begin
    .p2align	2
    .type	qsrt,@function
qsrt:
qsrt.entryBB1:
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
    mv	r.0,a1 
    mv	l.0,a0 
    la ptr,a    
    lw _ga.0, 0(ptr)
    mv	i.0,l.0 
    mv	j.0,r.0 
    add t.0,l.0,r.0
    srai t.0,t.0,    1
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_ga.0,t.0
    lw t.0, 0(t.0)
    mv	x.0,t.0 
    mv	j.1,j.0 
    mv	i.1,i.0 
    mv	breaker,j.1 
    mv	j.1,j.1 
    mv	breaker,i.1 
    j	whileCondBB1
whileCondBB1:
    ble	i.1,j.1,	paracopy1
    j	afterWhileBB1
afterWhileBB1:
    blt	l.0,j.1,	if_thenBB1
    j	paracopy2
paracopy2:
    mv	_ga.2,_ga.0 
    mv	breaker,_ga.2 
    j	if_end1
if_end1:
    blt	i.1,r.0,	if_thenBB2
    j	paracopy3
paracopy3:
    mv	_ga.4,_ga.2 
    mv	breaker,_ga.4 
    j	if_end2
if_end2:
    lui _lobits,%hi(a)
    sw _ga.4, %lo(a)(_lobits)
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
if_thenBB2:
    lui _lobits,%hi(a)
    sw _ga.2, %lo(a)(_lobits)
    mv	a0,i.1 
    mv	a1,r.0 
    call	qsrt
    mv	t.0,a0 
    la ptr,a    
    lw _ga.3, 0(ptr)
    mv	_ga.4,_ga.3 
    mv	breaker,_ga.4 
    j	if_end2
if_thenBB1:
    lui _lobits,%hi(a)
    sw _ga.0, %lo(a)(_lobits)
    mv	a0,l.0 
    mv	a1,j.1 
    call	qsrt
    mv	t.0,a0 
    la ptr,a    
    lw _ga.1, 0(ptr)
    mv	_ga.2,_ga.1 
    mv	breaker,_ga.2 
    j	if_end1
paracopy1:
    mv	i.2,i.1 
    mv	breaker,i.2 
    j	whileCondBB2
whileCondBB2:
    slli t.0,i.2,    2
    addi t.0,t.0,    4
    add t.0,_ga.0,t.0
    lw t.0, 0(t.0)
    blt	t.0,x.0,	whileBodyBB1
    j	paracopy4
whileBodyBB1:
    addi i.3,i.2,    1
    mv	i.2,i.3 
    mv	breaker,i.2 
    j	whileCondBB2
paracopy4:
    mv	j.2,j.1 
    mv	breaker,j.2 
    j	whileCondBB3
whileCondBB3:
    slli t.0,j.2,    2
    addi t.0,t.0,    4
    add t.0,_ga.0,t.0
    lw t.0, 0(t.0)
    bgt	t.0,x.0,	whileBodyBB2
    j	afterWhileBB2
afterWhileBB2:
    ble	i.2,j.2,	if_thenBB3
    j	paracopy5
paracopy5:
    mv	j.1,j.2 
    mv	i.1,i.2 
    mv	breaker,j.1 
    mv	j.1,j.1 
    mv	breaker,i.1 
    j	whileCondBB1
if_thenBB3:
    slli t.0,i.2,    2
    addi t.0,t.0,    4
    add t.0,_ga.0,t.0
    lw t.0, 0(t.0)
    mv	temp.0,t.0 
    slli t.0,j.2,    2
    addi t.0,t.0,    4
    add t.0,_ga.0,t.0
    slli t.0,i.2,    2
    addi t.0,t.0,    4
    add t.0,_ga.0,t.0
    lw t.0, 0(t.0)
    sw t.0,0(t.0)
    slli t.0,j.2,    2
    addi t.0,t.0,    4
    add t.0,_ga.0,t.0
    sw temp.0,0(t.0)
    addi i.4,i.2,    1
    li t, 1
    sub j.3,j.2,t
    mv	j.1,j.3 
    mv	i.1,i.4 
    mv	breaker,j.1 
    mv	j.1,j.1 
    mv	breaker,i.1 
    j	whileCondBB1
whileBodyBB2:
    li t, 1
    sub j.4,j.2,t
    mv	j.2,j.4 
    mv	breaker,j.2 
    j	whileCondBB3
								 # func end
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
    li t, 40404
    mv	a0,t 
    call malloc
    mv	t.0,a0 
    li _t, 10100
    sw _t,0(t.0)
    mv	_ga.0,t.0 
    li _i.2, 1
    j	_forcondBB1
_forcondBB1:
    li t, 10000
    ble	_i.2,t,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    lui _lobits,%hi(a)
    sw _ga.0, %lo(a)(_lobits)
    li para, 1
    mv	a0,para 
    li para, 10000
    mv	a1,para 
    call	qsrt
    mv	_t.0,a0 
    la ptr,a    
    lw _ga.1, 0(ptr)
    li _i.4, 1
    j	_forcondBB2
_forcondBB2:
    li t, 10000
    ble	_i.4,t,	_forbodyBB2
    j	afterCallBB1
afterCallBB1:
    la para,_globalStr1    
    mv	a0,para 
    call	print
    lui _lobits,%hi(a)
    sw _ga.1, %lo(a)(_lobits)
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
_forbodyBB2:
    slli _t.0,_i.4,    2
    addi _t.0,_t.0,    4
    add _t.0,_ga.1,_t.0
    lw _t.0, 0(_t.0)
    mv	a0,_t.0 
    call	toString
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	print
    la para,_globalStr0    
    mv	a0,para 
    call	print
    addi _i.5,_i.4,    1
    mv	_i.4,_i.5 
    mv	breaker,_i.4 
    j	_forcondBB2
_forbodyBB1:
    li t, 10001
    sub _t.0,t,_i.2
    slli _t.0,_i.2,    2
    addi _t.0,_t.0,    4
    add _t.0,_ga.0,_t.0
    sw _t.0,0(_t.0)
    addi _i.6,_i.2,    1
    mv	_i.2,_i.6 
    mv	breaker,_i.2 
    j	_forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	a					#@a
    .p2align	2
a:
    .word	0
     
    .globl	n					#@n
    .p2align	2
n:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  " "    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  "\n"    
