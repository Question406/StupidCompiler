    .text
    .globl	sort				#begin
    .p2align	2
    .type	sort,@function
sort:
sort.entryBB1:
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
    mv	r.0,a1 
    mv	l.0,a0 
    la ptr,edges    
    lw _gedges.0, 0(ptr)
    la ptr,buffer    
    lw _gbuffer.0, 0(ptr)
    addi t.0,l.0,    1
    beq	t.0,r.0,	paracopy1
if_end1:
    add t.0,l.0,r.0
    srai t.0,t.0,    1
    mv	mid.0,t.0 
    mv	_copy_l.0,l.0 
    mv	_copy_r.0,mid.0 
    addi __t.0,_copy_l.0,    1
    beq	__t.0,_copy_r.0,	paracopy2
_copy_if_end1:
    add __t.0,_copy_l.0,_copy_r.0
    srai __t.0,__t.0,    1
    mv	__mid.0,__t.0 
    mv	_copy_l.0,_copy_l.0 
    mv	_copy_r.0,__mid.0 
    addi __t.0,_copy_l.0,    1
    beq	__t.0,_copy_r.0,	paracopy3
_copy_if_end2:
    add __t.0,_copy_l.0,_copy_r.0
    srai __t.0,__t.0,    1
    mv	__mid.0,__t.0 
    lui _lobits,%hi(buffer)
    sw _gbuffer.0, %lo(buffer)(_lobits)
    lui _lobits,%hi(edges)
    sw _gedges.0, %lo(edges)(_lobits)
    mv	a0,_copy_l.0 
    mv	a1,__mid.0 
    call	sort
    la ptr,edges    
    lw _gedges.1, 0(ptr)
    la ptr,buffer    
    lw _gbuffer.1, 0(ptr)
    lui _lobits,%hi(buffer)
    sw _gbuffer.1, %lo(buffer)(_lobits)
    lui _lobits,%hi(edges)
    sw _gedges.1, %lo(edges)(_lobits)
    mv	a0,__mid.0 
    mv	a1,_copy_r.0 
    call	sort
    la ptr,edges    
    lw _gedges.2, 0(ptr)
    la ptr,buffer    
    lw _gbuffer.2, 0(ptr)
    mv	__lpos.0,_copy_l.0 
    mv	__rpos.0,__mid.0 
    mv	__lpos.1,__lpos.0 
    mv	__rpos.1,__rpos.0 
    mv	__i.1,zero 
_copy_forcondBB1:
    sub __t.0,_copy_r.0,_copy_l.0
    blt	__i.1,__t.0,	_copy_forbodyBB1
    j	_copy_afterForBB1
_copy_forbodyBB1:
    beq	__lpos.1,__mid.0,	_copy_if_thenBB1
_copy_if_end3:
    beq	__rpos.1,_copy_r.0,	_copy_if_thenBB2
_copy_if_end4:
    slli __t.0,__rpos.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.2,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__lpos.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.2,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 8(__t.0)
    lw __t.0, 8(__t.0)
    blt	__t.0,__t.0,	_copy_if_thenBB3
    j	_copy_if_end5
_copy_if_thenBB3:
    mv	__t.0,__lpos.1 
    addi __lpos.2,__lpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.2,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.2,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__lpos.4,__lpos.2 
    mv	__rpos.3,__rpos.1 
_copy_forupdateBB1:
    addi __i.2,__i.1,    1
    mv	__lpos.1,__lpos.4 
    mv	__i.1,__i.2 
    mv	__rpos.1,__rpos.3 
    j	_copy_forcondBB1
_copy_if_end5:
    mv	__t.0,__rpos.1 
    addi __rpos.2,__rpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.2,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.2,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__lpos.4,__lpos.1 
    mv	__rpos.3,__rpos.2 
    j	_copy_forupdateBB1
_copy_if_thenBB2:
    mv	__t.0,__lpos.1 
    addi __lpos.3,__lpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.2,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.2,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__lpos.4,__lpos.3 
    mv	__rpos.3,__rpos.1 
    j	_copy_forupdateBB1
_copy_if_thenBB1:
    mv	__t.0,__rpos.1 
    addi __rpos.4,__rpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.2,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.2,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__lpos.4,__lpos.1 
    mv	__rpos.3,__rpos.4 
    j	_copy_forupdateBB1
_copy_afterForBB1:
    mv	__i.4,zero 
_copy_forcondBB2:
    blt	__i.4,__t.0,	_copy_forbodyBB2
    j	paracopy4
_copy_forbodyBB2:
    slli __t.0,__i.4,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.2,__t.0
    add __t.0,_copy_l.0,__i.4
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.2,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    addi __i.5,__i.4,    1
    mv	__i.4,__i.5 
    j	_copy_forcondBB2
paracopy4:
    mv	_gbuffer.3,_gbuffer.2 
    mv	_gedges.3,_gedges.2 
afterCallBB1:
    mv	_copy_l.0,__mid.0 
    mv	_copy_r.0,_copy_r.0 
    addi __t.0,_copy_l.0,    1
    beq	__t.0,_copy_r.0,	paracopy5
_copy_if_end6:
    add __t.0,_copy_l.0,_copy_r.0
    srai __t.0,__t.0,    1
    mv	__mid.0,__t.0 
    lui _lobits,%hi(buffer)
    sw _gbuffer.3, %lo(buffer)(_lobits)
    lui _lobits,%hi(edges)
    sw _gedges.3, %lo(edges)(_lobits)
    mv	a0,_copy_l.0 
    mv	a1,__mid.0 
    call	sort
    la ptr,edges    
    lw _gedges.4, 0(ptr)
    la ptr,buffer    
    lw _gbuffer.4, 0(ptr)
    lui _lobits,%hi(buffer)
    sw _gbuffer.4, %lo(buffer)(_lobits)
    lui _lobits,%hi(edges)
    sw _gedges.4, %lo(edges)(_lobits)
    mv	a0,__mid.0 
    mv	a1,_copy_r.0 
    call	sort
    la ptr,edges    
    lw _gedges.5, 0(ptr)
    la ptr,buffer    
    lw _gbuffer.5, 0(ptr)
    mv	__lpos.0,_copy_l.0 
    mv	__rpos.0,__mid.0 
    mv	__rpos.1,__rpos.0 
    mv	__lpos.1,__lpos.0 
    mv	__i.1,zero 
_copy_forcondBB3:
    sub __t.0,_copy_r.0,_copy_l.0
    blt	__i.1,__t.0,	_copy_forbodyBB3
_copy_afterForBB2:
    mv	__i.3,zero 
_copy_forcondBB4:
    blt	__i.3,__t.0,	_copy_forbodyBB4
paracopy6:
    mv	_gbuffer.6,_gbuffer.5 
    mv	_gedges.6,_gedges.5 
afterCallBB2:
    mv	__lpos.0,_copy_l.0 
    mv	__rpos.0,__mid.0 
    mv	__rpos.1,__rpos.0 
    mv	__lpos.1,__lpos.0 
    mv	__i.1,zero 
_copy_forcondBB5:
    sub __t.0,_copy_r.0,_copy_l.0
    blt	__i.1,__t.0,	_copy_forbodyBB5
    j	_copy_afterForBB3
_copy_forbodyBB5:
    beq	__lpos.1,__mid.0,	_copy_if_thenBB4
_copy_if_end7:
    beq	__rpos.1,_copy_r.0,	_copy_if_thenBB5
_copy_if_end8:
    slli __t.0,__rpos.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.6,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__lpos.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.6,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 8(__t.0)
    lw __t.0, 8(__t.0)
    blt	__t.0,__t.0,	_copy_if_thenBB6
    j	_copy_if_end9
_copy_if_thenBB6:
    mv	__t.0,__lpos.1 
    addi __lpos.2,__lpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.6,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.6,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__rpos.4,__rpos.1 
    mv	__lpos.4,__lpos.2 
_copy_forupdateBB2:
    addi __i.2,__i.1,    1
    mv	__i.1,__i.2 
    mv	__rpos.1,__rpos.4 
    mv	__lpos.1,__lpos.4 
    j	_copy_forcondBB5
_copy_if_end9:
    mv	__t.0,__rpos.1 
    addi __rpos.2,__rpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.6,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.6,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__rpos.4,__rpos.2 
    mv	__lpos.4,__lpos.1 
    j	_copy_forupdateBB2
_copy_if_thenBB5:
    mv	__t.0,__lpos.1 
    addi __lpos.3,__lpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.6,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.6,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__rpos.4,__rpos.1 
    mv	__lpos.4,__lpos.3 
    j	_copy_forupdateBB2
_copy_if_thenBB4:
    mv	__t.0,__rpos.1 
    addi __rpos.3,__rpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.6,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.6,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__rpos.4,__rpos.3 
    mv	__lpos.4,__lpos.1 
    j	_copy_forupdateBB2
_copy_afterForBB3:
    mv	__i.4,zero 
_copy_forcondBB6:
    blt	__i.4,__t.0,	_copy_forbodyBB6
paracopy7:
    mv	_gbuffer.7,_gbuffer.6 
    mv	_gedges.7,_gedges.6 
afterCallBB3:
    mv	_copy_l.0,mid.0 
    mv	_copy_r.0,r.0 
    addi __t.0,_copy_l.0,    1
    beq	__t.0,_copy_r.0,	paracopy8
_copy_if_end10:
    add __t.0,_copy_l.0,_copy_r.0
    srai __t.0,__t.0,    1
    mv	__mid.0,__t.0 
    mv	_copy_l.0,_copy_l.0 
    mv	_copy_r.0,__mid.0 
    addi __t.0,_copy_l.0,    1
    beq	__t.0,_copy_r.0,	paracopy9
_copy_if_end11:
    add __t.0,_copy_l.0,_copy_r.0
    srai __t.0,__t.0,    1
    mv	__mid.1,__t.0 
    lui _lobits,%hi(buffer)
    sw _gbuffer.7, %lo(buffer)(_lobits)
    lui _lobits,%hi(edges)
    sw _gedges.7, %lo(edges)(_lobits)
    mv	a0,_copy_l.0 
    mv	a1,__mid.1 
    call	sort
    la ptr,edges    
    lw _gedges.10, 0(ptr)
    la ptr,buffer    
    lw _gbuffer.10, 0(ptr)
    lui _lobits,%hi(buffer)
    sw _gbuffer.10, %lo(buffer)(_lobits)
    lui _lobits,%hi(edges)
    sw _gedges.10, %lo(edges)(_lobits)
    mv	a0,__mid.1 
    mv	a1,_copy_r.0 
    call	sort
    la ptr,edges    
    lw _gedges.11, 0(ptr)
    la ptr,buffer    
    lw _gbuffer.11, 0(ptr)
    mv	__lpos.1,_copy_l.0 
    mv	__rpos.1,__mid.1 
    mv	__lpos.2,__lpos.1 
    mv	__rpos.2,__rpos.1 
    mv	__i.2,zero 
_copy_forcondBB7:
    sub __t.0,_copy_r.0,_copy_l.0
    blt	__i.2,__t.0,	_copy_forbodyBB7
_copy_afterForBB4:
    mv	__i.4,zero 
_copy_forcondBB8:
    blt	__i.4,__t.0,	_copy_forbodyBB8
    j	paracopy10
_copy_forbodyBB8:
    slli __t.0,__i.4,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.11,__t.0
    add __t.0,_copy_l.0,__i.4
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.11,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    addi __i.5,__i.4,    1
    mv	__i.4,__i.5 
    j	_copy_forcondBB8
paracopy10:
    mv	_gbuffer.8,_gbuffer.11 
    mv	_gedges.8,_gedges.11 
afterCallBB4:
    lui _lobits,%hi(buffer)
    sw _gbuffer.8, %lo(buffer)(_lobits)
    lui _lobits,%hi(edges)
    sw _gedges.8, %lo(edges)(_lobits)
    mv	a0,__mid.0 
    mv	a1,_copy_r.0 
    call	sort
    la ptr,edges    
    lw _gedges.9, 0(ptr)
    la ptr,buffer    
    lw _gbuffer.9, 0(ptr)
    mv	__lpos.0,_copy_l.0 
    mv	__rpos.0,__mid.0 
    mv	__rpos.1,__rpos.0 
    mv	__lpos.1,__lpos.0 
    mv	__i.1,zero 
_copy_forcondBB9:
    sub __t.0,_copy_r.0,_copy_l.0
    blt	__i.1,__t.0,	_copy_forbodyBB9
    j	_copy_afterForBB5
_copy_forbodyBB9:
    beq	__lpos.1,__mid.0,	_copy_if_thenBB7
_copy_if_end12:
    beq	__rpos.1,_copy_r.0,	_copy_if_thenBB8
    j	_copy_if_end13
_copy_if_thenBB8:
    mv	__t.0,__lpos.1 
    addi __lpos.2,__lpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.9,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.9,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__rpos.3,__rpos.1 
    mv	__lpos.4,__lpos.2 
_copy_forupdateBB3:
    addi __i.2,__i.1,    1
    mv	__rpos.1,__rpos.3 
    mv	__i.1,__i.2 
    mv	__lpos.1,__lpos.4 
    j	_copy_forcondBB9
_copy_if_end13:
    slli __t.0,__rpos.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.9,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__lpos.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.9,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 8(__t.0)
    lw __t.0, 8(__t.0)
    blt	__t.0,__t.0,	_copy_if_thenBB9
    j	_copy_if_end14
_copy_if_thenBB9:
    mv	__t.0,__lpos.1 
    addi __lpos.3,__lpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.9,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.9,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__rpos.3,__rpos.1 
    mv	__lpos.4,__lpos.3 
    j	_copy_forupdateBB3
_copy_if_end14:
    mv	__t.0,__rpos.1 
    addi __rpos.2,__rpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.9,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.9,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__rpos.3,__rpos.2 
    mv	__lpos.4,__lpos.1 
    j	_copy_forupdateBB3
_copy_if_thenBB7:
    mv	__t.0,__rpos.1 
    addi __rpos.4,__rpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.9,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.9,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__rpos.3,__rpos.4 
    mv	__lpos.4,__lpos.1 
    j	_copy_forupdateBB3
_copy_afterForBB5:
    mv	__i.4,zero 
_copy_forcondBB10:
    blt	__i.4,__t.0,	_copy_forbodyBB10
paracopy11:
    mv	_gbuffer.12,_gbuffer.9 
    mv	_gedges.12,_gedges.9 
afterCallBB5:
    mv	lpos.0,l.0 
    mv	rpos.0,mid.0 
    mv	rpos.1,rpos.0 
    mv	lpos.1,lpos.0 
    mv	i.1,zero 
forcondBB1:
    sub t.0,r.0,l.0
    blt	i.1,t.0,	forbodyBB1
    j	afterForBB1
forbodyBB1:
    beq	lpos.1,mid.0,	if_thenBB1
    j	if_end2
if_thenBB1:
    mv	t.0,rpos.1 
    addi rpos.2,rpos.1,    1
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gedges.12,t.0
    slli t.0,i.1,    2
    addi t.0,t.0,    4
    add t.0,_gbuffer.12,t.0
    lw t.0, 0(t.0)
    sw t.0,0(t.0)
    mv	rpos.4,rpos.2 
    mv	lpos.4,lpos.1 
forupdateBB1:
    addi i.2,i.1,    1
    mv	rpos.1,rpos.4 
    mv	i.1,i.2 
    mv	lpos.1,lpos.4 
    j	forcondBB1
if_end2:
    beq	rpos.1,r.0,	if_thenBB2
if_end3:
    slli t.0,rpos.1,    2
    addi t.0,t.0,    4
    add t.0,_gedges.12,t.0
    lw t.0, 0(t.0)
    slli t.0,lpos.1,    2
    addi t.0,t.0,    4
    add t.0,_gedges.12,t.0
    lw t.0, 0(t.0)
    lw t.0, 8(t.0)
    lw t.0, 8(t.0)
    blt	t.0,t.0,	if_thenBB3
    j	if_end4
if_thenBB3:
    mv	t.0,lpos.1 
    addi lpos.2,lpos.1,    1
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gedges.12,t.0
    slli t.0,i.1,    2
    addi t.0,t.0,    4
    add t.0,_gbuffer.12,t.0
    lw t.0, 0(t.0)
    sw t.0,0(t.0)
    mv	rpos.4,rpos.1 
    mv	lpos.4,lpos.2 
    j	forupdateBB1
if_end4:
    mv	t.0,rpos.1 
    addi rpos.3,rpos.1,    1
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gedges.12,t.0
    slli t.0,i.1,    2
    addi t.0,t.0,    4
    add t.0,_gbuffer.12,t.0
    lw t.0, 0(t.0)
    sw t.0,0(t.0)
    mv	rpos.4,rpos.3 
    mv	lpos.4,lpos.1 
    j	forupdateBB1
if_thenBB2:
    mv	t.0,lpos.1 
    addi lpos.3,lpos.1,    1
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gedges.12,t.0
    slli t.0,i.1,    2
    addi t.0,t.0,    4
    add t.0,_gbuffer.12,t.0
    lw t.0, 0(t.0)
    sw t.0,0(t.0)
    mv	rpos.4,rpos.1 
    mv	lpos.4,lpos.3 
    j	forupdateBB1
afterForBB1:
    mv	i.4,zero 
forcondBB2:
    blt	i.4,t.0,	forbodyBB2
paracopy12:
    mv	_gbuffer.13,_gbuffer.12 
    mv	_gedges.13,_gedges.12 
sort.exitBB1:
    lui _lobits,%hi(buffer)
    sw _gbuffer.13, %lo(buffer)(_lobits)
    lui _lobits,%hi(edges)
    sw _gedges.13, %lo(edges)(_lobits)
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
    ret
forbodyBB2:
    slli t.0,i.4,    2
    addi t.0,t.0,    4
    add t.0,_gbuffer.12,t.0
    add t.0,l.0,i.4
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gedges.12,t.0
    lw t.0, 0(t.0)
    sw t.0,0(t.0)
    addi i.5,i.4,    1
    mv	i.4,i.5 
    j	forcondBB2
_copy_forbodyBB10:
    slli __t.0,__i.4,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.9,__t.0
    add __t.0,_copy_l.0,__i.4
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.9,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    addi __i.5,__i.4,    1
    mv	__i.4,__i.5 
    j	_copy_forcondBB10
_copy_forbodyBB7:
    beq	__lpos.2,__mid.1,	_copy_if_thenBB10
    j	_copy_if_end15
_copy_if_thenBB10:
    mv	__t.0,__rpos.2 
    addi __rpos.3,__rpos.2,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.11,__t.0
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.11,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__lpos.3,__lpos.2 
    mv	__rpos.4,__rpos.3 
_copy_forupdateBB4:
    addi __i.6,__i.2,    1
    mv	__lpos.2,__lpos.3 
    mv	__i.2,__i.6 
    mv	__rpos.2,__rpos.4 
    j	_copy_forcondBB7
_copy_if_end15:
    beq	__rpos.2,_copy_r.0,	_copy_if_thenBB11
_copy_if_end16:
    slli __t.0,__rpos.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.11,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__lpos.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.11,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 8(__t.0)
    lw __t.0, 8(__t.0)
    blt	__t.0,__t.0,	_copy_if_thenBB12
    j	_copy_if_end17
_copy_if_thenBB12:
    mv	__t.0,__lpos.2 
    addi __lpos.4,__lpos.2,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.11,__t.0
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.11,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__lpos.3,__lpos.4 
    mv	__rpos.4,__rpos.2 
    j	_copy_forupdateBB4
_copy_if_end17:
    mv	__t.0,__rpos.2 
    addi __rpos.5,__rpos.2,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.11,__t.0
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.11,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__lpos.3,__lpos.2 
    mv	__rpos.4,__rpos.5 
    j	_copy_forupdateBB4
_copy_if_thenBB11:
    mv	__t.0,__lpos.2 
    addi __lpos.5,__lpos.2,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.11,__t.0
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.11,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__lpos.3,__lpos.5 
    mv	__rpos.4,__rpos.2 
    j	_copy_forupdateBB4
paracopy9:
    mv	_gbuffer.8,_gbuffer.7 
    mv	_gedges.8,_gedges.7 
    j	afterCallBB4
paracopy8:
    mv	_gbuffer.12,_gbuffer.7 
    mv	_gedges.12,_gedges.7 
    j	afterCallBB5
_copy_forbodyBB6:
    slli __t.0,__i.4,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.6,__t.0
    add __t.0,_copy_l.0,__i.4
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.6,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    addi __i.5,__i.4,    1
    mv	__i.4,__i.5 
    j	_copy_forcondBB6
_copy_forbodyBB4:
    slli __t.0,__i.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.5,__t.0
    add __t.0,_copy_l.0,__i.3
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.5,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    addi __i.4,__i.3,    1
    mv	__i.3,__i.4 
    j	_copy_forcondBB4
_copy_forbodyBB3:
    beq	__lpos.1,__mid.0,	_copy_if_thenBB13
_copy_if_end18:
    beq	__rpos.1,_copy_r.0,	_copy_if_thenBB14
_copy_if_end19:
    slli __t.0,__rpos.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.5,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__lpos.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.5,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 8(__t.0)
    lw __t.0, 8(__t.0)
    blt	__t.0,__t.0,	_copy_if_thenBB15
    j	_copy_if_end20
_copy_if_thenBB15:
    mv	__t.0,__lpos.1 
    addi __lpos.2,__lpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.5,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.5,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__rpos.3,__rpos.1 
    mv	__lpos.4,__lpos.2 
_copy_forupdateBB5:
    addi __i.5,__i.1,    1
    mv	__i.1,__i.5 
    mv	__rpos.1,__rpos.3 
    mv	__lpos.1,__lpos.4 
    j	_copy_forcondBB3
_copy_if_end20:
    mv	__t.0,__rpos.1 
    addi __rpos.2,__rpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.5,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.5,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__rpos.3,__rpos.2 
    mv	__lpos.4,__lpos.1 
    j	_copy_forupdateBB5
_copy_if_thenBB14:
    mv	__t.0,__lpos.1 
    addi __lpos.3,__lpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.5,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.5,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__rpos.3,__rpos.1 
    mv	__lpos.4,__lpos.3 
    j	_copy_forupdateBB5
_copy_if_thenBB13:
    mv	__t.0,__rpos.1 
    addi __rpos.4,__rpos.1,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.5,__t.0
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.5,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__rpos.3,__rpos.4 
    mv	__lpos.4,__lpos.1 
    j	_copy_forupdateBB5
paracopy5:
    mv	_gbuffer.6,_gbuffer.3 
    mv	_gedges.6,_gedges.3 
    j	afterCallBB2
paracopy3:
    mv	_gbuffer.3,_gbuffer.0 
    mv	_gedges.3,_gedges.0 
    j	afterCallBB1
paracopy2:
    mv	_gbuffer.7,_gbuffer.0 
    mv	_gedges.7,_gedges.0 
    j	afterCallBB3
paracopy1:
    mv	_gbuffer.13,_gbuffer.0 
    mv	_gedges.13,_gedges.0 
    j	sort.exitBB1
								 # func end
    .globl	findRoot				#begin
    .p2align	2
    .type	findRoot,@function
findRoot:
findRoot.entryBB1:
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
    mv	x.0,a0 
    la ptr,pnt    
    lw _gpnt.0, 0(ptr)
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gpnt.0,t.0
    lw t.0, 0(t.0)
    li t, -1
    beq	t.0,t,	if_thenBB4
if_end5:
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gpnt.0,t.0
    lw t.0, 0(t.0)
    mv	_copy_x.0,t.0 
    slli __t.0,_copy_x.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.0,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB16
    j	_copy_if_end21
_copy_if_thenBB16:
    mv	__mergedretVal.0,_copy_x.0 
    mv	_gpnt.1,_gpnt.0 
    mv	__mergedretVal.1,__mergedretVal.0 
afterCallBB6:
    mv	t.0,__mergedretVal.1 
    mv	y.0,t.0 
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gpnt.1,t.0
    sw y.0,0(t.0)
    mv	mergedretVal.0,y.0 
    mv	_gpnt.5,_gpnt.1 
    mv	mergedretVal.2,mergedretVal.0 
findRoot.exitBB1:
    lui _lobits,%hi(pnt)
    sw _gpnt.5, %lo(pnt)(_lobits)
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
    mv	a0,mergedretVal.2 
    ret
_copy_if_end21:
    slli __t.0,_copy_x.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.0,__t.0
    lw __t.0, 0(__t.0)
    mv	_copy_x.1,__t.0 
    slli __t.0,_copy_x.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.0,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB17
    j	_copy_if_end22
_copy_if_thenBB17:
    mv	__mergedretVal.2,_copy_x.1 
    mv	__mergedretVal.1,__mergedretVal.2 
    mv	_gpnt.2,_gpnt.0 
afterCallBB7:
    mv	__t.0,__mergedretVal.1 
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.2,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.2,__y.0 
    mv	_gpnt.1,_gpnt.2 
    mv	__mergedretVal.1,__mergedretVal.2 
    j	afterCallBB6
_copy_if_end22:
    slli __t.0,_copy_x.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.0,__t.0
    lw __t.0, 0(__t.0)
    mv	_copy_x.2,__t.0 
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.0,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB18
    j	_copy_if_end23
_copy_if_thenBB18:
    mv	__mergedretVal.2,_copy_x.2 
    mv	_gpnt.3,_gpnt.0 
    mv	__mergedretVal.3,__mergedretVal.2 
afterCallBB8:
    mv	__t.0,__mergedretVal.3 
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.3,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.3,__y.0 
    mv	__mergedretVal.1,__mergedretVal.3 
    mv	_gpnt.2,_gpnt.3 
    j	afterCallBB7
_copy_if_end23:
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.0,__t.0
    lw __t.0, 0(__t.0)
    lui _lobits,%hi(pnt)
    sw _gpnt.0, %lo(pnt)(_lobits)
    mv	a0,__t.0 
    call	findRoot
    mv	__t.0,a0 
    la ptr,pnt    
    lw _gpnt.4, 0(ptr)
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.4,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.4,__y.0 
    mv	_gpnt.3,_gpnt.4 
    mv	__mergedretVal.3,__mergedretVal.4 
    j	afterCallBB8
if_thenBB4:
    mv	mergedretVal.1,x.0 
    mv	_gpnt.5,_gpnt.0 
    mv	mergedretVal.2,mergedretVal.1 
    j	findRoot.exitBB1
								 # func end
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
    call	getInt
    mv	__t.0,a0 
    mv	_gn.0,__t.0 
    call	getInt
    mv	__t.0,a0 
    mv	_gm.0,__t.0 
    slli __t.0,_gm.0,    2
    addi __t.1,__t.0,    4
    mv	a0,__t.1 
    call malloc
    mv	__t.0,a0 
    sw _gm.0,0(__t.0)
    mv	_gedges.0,__t.0 
    slli __t.0,_gm.0,    2
    addi __t.1,__t.0,    4
    mv	a0,__t.1 
    call malloc
    mv	__t.0,a0 
    sw _gm.0,0(__t.0)
    mv	_gbuffer.0,__t.0 
    mv	__i.1,zero 
__forcondBB1:
    blt	__i.1,_gm.0,	__forbodyBB1
__afterForBB1:
    slli __t.0,_gn.0,    2
    addi __t.1,__t.0,    4
    mv	a0,__t.1 
    call malloc
    mv	__t.0,a0 
    sw _gn.0,0(__t.0)
    mv	_gpnt.0,__t.0 
    mv	__i.3,zero 
__forcondBB2:
    blt	__i.3,_gn.0,	__forbodyBB2
    j	_afterCallBB1
__forbodyBB2:
    slli __t.0,__i.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.0,__t.0
    li _t, -1
    sw _t,0(__t.0)
    addi __i.4,__i.3,    1
    mv	__i.3,__i.4 
    j	__forcondBB2
_afterCallBB1:
    mv	_copy_r.0,_gm.0 
    li t, 1
    beq	t,_copy_r.0,	paracopy13
    j	_copy_if_end24
paracopy13:
    mv	_gedges.1,_gedges.0 
    mv	_gbuffer.1,_gbuffer.0 
afterCallBB9:
    mv	_gpnt.1,_gpnt.0 
    mv	_i.1,zero 
    mv	_ans.1,zero 
_forcondBB1:
    blt	_i.1,_gm.0,	_forbodyBB1
afterCallBB10:
    mv	a0,_ans.1 
    call	printlnInt
    lui _lobits,%hi(pnt)
    sw _gpnt.1, %lo(pnt)(_lobits)
    lui _lobits,%hi(buffer)
    sw _gbuffer.1, %lo(buffer)(_lobits)
    lui _lobits,%hi(edges)
    sw _gedges.1, %lo(edges)(_lobits)
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
_forbodyBB1:
    slli _t.0,_i.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_gedges.1,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 4(_t.0)
    mv	_copy_x.1,_t.0 
    slli __t.0,_copy_x.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.1,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB19
_copy_if_end25:
    slli __t.0,_copy_x.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.1,__t.0
    lw __t.0, 0(__t.0)
    mv	_copy_x.2,__t.0 
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.1,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB20
_copy_if_end26:
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.1,__t.0
    lw __t.0, 0(__t.0)
    mv	_copy_x.3,__t.0 
    slli __t.0,_copy_x.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.1,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB21
_copy_if_end27:
    slli __t.0,_copy_x.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.1,__t.0
    lw __t.0, 0(__t.0)
    lui _lobits,%hi(pnt)
    sw _gpnt.1, %lo(pnt)(_lobits)
    mv	a0,__t.0 
    call	findRoot
    mv	__t.0,a0 
    la ptr,pnt    
    lw _gpnt.15, 0(ptr)
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.15,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.3,__y.0 
    mv	__mergedretVal.5,__mergedretVal.3 
    mv	_gpnt.16,_gpnt.15 
afterCallBB11:
    mv	__t.0,__mergedretVal.5 
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.16,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.3,__y.0 
    mv	__mergedretVal.2,__mergedretVal.3 
    mv	_gpnt.14,_gpnt.16 
afterCallBB12:
    mv	__t.0,__mergedretVal.2 
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.14,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.2,__y.0 
    mv	__mergedretVal.1,__mergedretVal.2 
    mv	_gpnt.2,_gpnt.14 
afterCallBB13:
    mv	_t.1,__mergedretVal.1 
    slli _t.0,_i.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_gedges.1,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    mv	_copy_x.1,_t.0 
    slli __t.0,_copy_x.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.2,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB22
    j	_copy_if_end28
_copy_if_thenBB22:
    mv	__mergedretVal.2,_copy_x.1 
    mv	__mergedretVal.1,__mergedretVal.2 
    mv	_gpnt.3,_gpnt.2 
afterCallBB14:
    mv	_t.0,__mergedretVal.1 
    beq	_t.0,_t.1,	paracopy14
_if_end1:
    slli _t.0,_i.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_gedges.1,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    slli _t.0,_i.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_gedges.1,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 4(_t.0)
    mv	__x.0,_t.0 
    mv	__y.2,_t.0 
    mv	_copy_x.2,__x.0 
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.3,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB23
    j	_copy_if_end29
_copy_if_thenBB23:
    mv	__mergedretVal.3,_copy_x.2 
    mv	_gpnt.7,_gpnt.3 
    mv	__mergedretVal.4,__mergedretVal.3 
afterCallBB15:
    mv	__t.0,__mergedretVal.4 
    mv	__px.2,__t.0 
    mv	_copy_x.2,__y.2 
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.7,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB24
    j	_copy_if_end30
_copy_if_thenBB24:
    mv	__mergedretVal.3,_copy_x.2 
    mv	__mergedretVal.2,__mergedretVal.3 
    mv	_gpnt.8,_gpnt.7 
afterCallBB16:
    mv	__t.0,__mergedretVal.2 
    mv	__py.2,__t.0 
    beq	__px.2,__py.2,	_afterCallBB2
    j	__if_end1
_afterCallBB2:
    slli _t.0,_i.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_gedges.1,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 8(_t.0)
    add _t.0,_ans.1,_t.0
    mv	_ans.3,_t.0 
    mv	_gpnt.4,_gpnt.8 
    mv	_ans.2,_ans.3 
_forupdateBB1:
    addi _i.2,_i.1,    1
    mv	_i.1,_i.2 
    mv	_gpnt.1,_gpnt.4 
    mv	_ans.1,_ans.2 
    j	_forcondBB1
__if_end1:
    slli __t.0,__px.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.8,__t.0
    sw __py.2,0(__t.0)
    j	_afterCallBB2
_copy_if_end30:
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.7,__t.0
    lw __t.0, 0(__t.0)
    mv	_copy_x.3,__t.0 
    slli __t.0,_copy_x.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.7,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB25
_copy_if_end31:
    slli __t.0,_copy_x.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.7,__t.0
    lw __t.0, 0(__t.0)
    lui _lobits,%hi(pnt)
    sw _gpnt.7, %lo(pnt)(_lobits)
    mv	a0,__t.0 
    call	findRoot
    mv	__t.0,a0 
    la ptr,pnt    
    lw _gpnt.9, 0(ptr)
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.9,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.3,__y.0 
    mv	__mergedretVal.4,__mergedretVal.3 
    mv	_gpnt.10,_gpnt.9 
afterCallBB17:
    mv	__t.0,__mergedretVal.4 
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.10,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.4,__y.0 
    mv	__mergedretVal.2,__mergedretVal.4 
    mv	_gpnt.8,_gpnt.10 
    j	afterCallBB16
_copy_if_thenBB25:
    mv	__mergedretVal.5,_copy_x.3 
    mv	__mergedretVal.4,__mergedretVal.5 
    mv	_gpnt.10,_gpnt.7 
    j	afterCallBB17
_copy_if_end29:
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.3,__t.0
    lw __t.0, 0(__t.0)
    mv	_copy_x.2,__t.0 
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.3,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB26
_copy_if_end32:
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.3,__t.0
    lw __t.0, 0(__t.0)
    lui _lobits,%hi(pnt)
    sw _gpnt.3, %lo(pnt)(_lobits)
    mv	a0,__t.0 
    call	findRoot
    mv	__t.0,a0 
    la ptr,pnt    
    lw _gpnt.5, 0(ptr)
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.5,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.2,__y.0 
    mv	_gpnt.6,_gpnt.5 
    mv	__mergedretVal.3,__mergedretVal.2 
afterCallBB18:
    mv	__t.0,__mergedretVal.3 
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.6,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.2,__y.0 
    mv	_gpnt.7,_gpnt.6 
    mv	__mergedretVal.4,__mergedretVal.2 
    j	afterCallBB15
_copy_if_thenBB26:
    mv	__mergedretVal.4,_copy_x.2 
    mv	_gpnt.6,_gpnt.3 
    mv	__mergedretVal.3,__mergedretVal.4 
    j	afterCallBB18
paracopy14:
    mv	_gpnt.4,_gpnt.3 
    mv	_ans.2,_ans.1 
    j	_forupdateBB1
_copy_if_end28:
    slli __t.0,_copy_x.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.2,__t.0
    lw __t.0, 0(__t.0)
    mv	_copy_x.2,__t.0 
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.2,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB27
    j	_copy_if_end33
_copy_if_thenBB27:
    mv	__mergedretVal.3,_copy_x.2 
    mv	__mergedretVal.2,__mergedretVal.3 
    mv	_gpnt.11,_gpnt.2 
afterCallBB19:
    mv	__t.0,__mergedretVal.2 
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.11,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.3,__y.0 
    mv	__mergedretVal.1,__mergedretVal.3 
    mv	_gpnt.3,_gpnt.11 
    j	afterCallBB14
_copy_if_end33:
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.2,__t.0
    lw __t.0, 0(__t.0)
    mv	_copy_x.3,__t.0 
    slli __t.0,_copy_x.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.2,__t.0
    lw __t.0, 0(__t.0)
    li t, -1
    beq	__t.0,t,	_copy_if_thenBB28
_copy_if_end34:
    slli __t.0,_copy_x.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.2,__t.0
    lw __t.0, 0(__t.0)
    lui _lobits,%hi(pnt)
    sw _gpnt.2, %lo(pnt)(_lobits)
    mv	a0,__t.0 
    call	findRoot
    mv	__t.0,a0 
    la ptr,pnt    
    lw _gpnt.12, 0(ptr)
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.12,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.3,__y.0 
    mv	__mergedretVal.4,__mergedretVal.3 
    mv	_gpnt.13,_gpnt.12 
afterCallBB20:
    mv	__t.0,__mergedretVal.4 
    mv	__y.0,__t.0 
    slli __t.0,_copy_x.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gpnt.13,__t.0
    sw __y.0,0(__t.0)
    mv	__mergedretVal.4,__y.0 
    mv	__mergedretVal.2,__mergedretVal.4 
    mv	_gpnt.11,_gpnt.13 
    j	afterCallBB19
_copy_if_thenBB28:
    mv	__mergedretVal.5,_copy_x.3 
    mv	__mergedretVal.4,__mergedretVal.5 
    mv	_gpnt.13,_gpnt.2 
    j	afterCallBB20
_copy_if_thenBB21:
    mv	__mergedretVal.4,_copy_x.3 
    mv	__mergedretVal.5,__mergedretVal.4 
    mv	_gpnt.16,_gpnt.1 
    j	afterCallBB11
_copy_if_thenBB20:
    mv	__mergedretVal.4,_copy_x.2 
    mv	__mergedretVal.2,__mergedretVal.4 
    mv	_gpnt.14,_gpnt.1 
    j	afterCallBB12
_copy_if_thenBB19:
    mv	__mergedretVal.3,_copy_x.1 
    mv	__mergedretVal.1,__mergedretVal.3 
    mv	_gpnt.2,_gpnt.1 
    j	afterCallBB13
_copy_if_end24:
    add __t.0,_copy_r.0,zero
    srai __t.0,__t.0,    1
    mv	__mid.1,__t.0 
    lui _lobits,%hi(buffer)
    sw _gbuffer.0, %lo(buffer)(_lobits)
    lui _lobits,%hi(edges)
    sw _gedges.0, %lo(edges)(_lobits)
    mv	a0,zero 
    mv	a1,__mid.1 
    call	sort
    la ptr,edges    
    lw _gedges.2, 0(ptr)
    la ptr,buffer    
    lw _gbuffer.2, 0(ptr)
    lui _lobits,%hi(buffer)
    sw _gbuffer.2, %lo(buffer)(_lobits)
    lui _lobits,%hi(edges)
    sw _gedges.2, %lo(edges)(_lobits)
    mv	a0,__mid.1 
    mv	a1,_copy_r.0 
    call	sort
    la ptr,edges    
    lw _gedges.3, 0(ptr)
    la ptr,buffer    
    lw _gbuffer.3, 0(ptr)
    mv	__rpos.1,__mid.1 
    mv	__rpos.2,__rpos.1 
    mv	__lpos.2,zero 
    mv	__i.2,zero 
_copy_forcondBB11:
    sub __t.0,_copy_r.0,zero
    blt	__i.2,__t.0,	_copy_forbodyBB11
    j	_copy_afterForBB6
_copy_forbodyBB11:
    beq	__lpos.2,__mid.1,	_copy_if_thenBB29
_copy_if_end35:
    beq	__rpos.2,_copy_r.0,	_copy_if_thenBB30
    j	_copy_if_end36
_copy_if_thenBB30:
    mv	__t.0,__lpos.2 
    addi __lpos.3,__lpos.2,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.3,__t.0
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.3,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__lpos.5,__lpos.3 
    mv	__rpos.5,__rpos.2 
_copy_forupdateBB6:
    addi __i.3,__i.2,    1
    mv	__lpos.2,__lpos.5 
    mv	__rpos.2,__rpos.5 
    mv	__i.2,__i.3 
    j	_copy_forcondBB11
_copy_if_end36:
    slli __t.0,__rpos.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.3,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__lpos.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.3,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 8(__t.0)
    lw __t.0, 8(__t.0)
    blt	__t.0,__t.0,	_copy_if_thenBB31
    j	_copy_if_end37
_copy_if_thenBB31:
    mv	__t.0,__lpos.2 
    addi __lpos.4,__lpos.2,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.3,__t.0
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.3,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__lpos.5,__lpos.4 
    mv	__rpos.5,__rpos.2 
    j	_copy_forupdateBB6
_copy_if_end37:
    mv	__t.0,__rpos.2 
    addi __rpos.3,__rpos.2,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.3,__t.0
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.3,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__lpos.5,__lpos.2 
    mv	__rpos.5,__rpos.3 
    j	_copy_forupdateBB6
_copy_if_thenBB29:
    mv	__t.0,__rpos.2 
    addi __rpos.4,__rpos.2,    1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.3,__t.0
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.3,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    mv	__lpos.5,__lpos.2 
    mv	__rpos.5,__rpos.4 
    j	_copy_forupdateBB6
_copy_afterForBB6:
    mv	__i.5,zero 
_copy_forcondBB12:
    blt	__i.5,__t.0,	_copy_forbodyBB12
paracopy15:
    mv	_gedges.1,_gedges.3 
    mv	_gbuffer.1,_gbuffer.3 
    j	afterCallBB9
_copy_forbodyBB12:
    slli __t.0,__i.5,    2
    addi __t.0,__t.0,    4
    add __t.0,_gbuffer.3,__t.0
    add __t.0,__i.5,zero
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.3,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    addi __i.6,__i.5,    1
    mv	__i.5,__i.6 
    j	_copy_forcondBB12
__forbodyBB1:
    li a0, 12
    call malloc
    mv	__t.0,a0 
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.0,__t.0
    sw __t.0,0(__t.0)
    call	getInt
    mv	__t.0,a0 
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.0,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    call	getInt
    mv	__t.0,a0 
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.0,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,4(__t.0)
    call	getInt
    mv	__t.0,a0 
    slli __t.0,__i.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gedges.0,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,8(__t.0)
    addi __i.5,__i.1,    1
    mv	__i.1,__i.5 
    j	__forcondBB1
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	pnt					#@pnt
    .p2align	2
pnt:
    .word	0
     
    .globl	edges					#@edges
    .p2align	2
edges:
    .word	0
     
    .globl	buffer					#@buffer
    .p2align	2
buffer:
    .word	0
     
    .globl	m					#@m
    .p2align	2
m:
    .word	0
     
    .globl	n					#@n
    .p2align	2
n:
    .word	0
     
