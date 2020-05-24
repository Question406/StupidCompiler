    .text
    .globl	gcd				#begin
    .p2align	2
    .type	gcd,@function
gcd:
gcd.entryBB1:
    mv	backup_ra,ra 
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
    mv	back_s10,s10 
    mv	y.0,a1 
    mv	x.0,a0 
    beq	y.0,zero,	if_thenBB1
if_end1:
    blt	x.0,y.0,	if_thenBB2
if_elseBB1:
    rem t.0,x.0,y.0
    mv	_copy_x.1,y.0 
    mv	_copy_y.1,t.0 
    beq	_copy_y.1,zero,	_copy_if_thenBB1
_copy_if_end1:
    blt	_copy_x.1,_copy_y.1,	_copy_if_thenBB2
_copy_if_elseBB1:
    rem __t.0,_copy_x.1,_copy_y.1
    mv	_copy_x.1,_copy_y.1 
    mv	_copy_y.1,__t.0 
    beq	_copy_y.1,zero,	_copy_if_thenBB3
_copy_if_end2:
    blt	_copy_x.1,_copy_y.1,	_copy_if_thenBB4
_copy_if_elseBB2:
    rem __t.0,_copy_x.1,_copy_y.1
    mv	a0,_copy_y.1 
    mv	a1,__t.0 
    call	gcd
    mv	__t.0,a0 
    mv	__mergedretVal.2,__t.0 
    mv	__mergedretVal.4,__mergedretVal.2 
afterCallBB1:
    mv	__t.0,__mergedretVal.4 
    mv	__mergedretVal.3,__t.0 
    mv	__mergedretVal.4,__mergedretVal.3 
afterCallBB2:
    mv	t.0,__mergedretVal.4 
    mv	mergedretVal.3,t.0 
    mv	mergedretVal.0,mergedretVal.3 
gcd.exitBB1:
    mv	s10,back_s10 
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
    mv	ra,backup_ra 
    mv	a0,mergedretVal.0 
    ret
_copy_if_thenBB4:
    mv	a0,_copy_y.1 
    mv	a1,_copy_x.1 
    call	gcd
    mv	__t.0,a0 
    mv	__mergedretVal.1,__t.0 
    mv	__mergedretVal.4,__mergedretVal.1 
    j	afterCallBB1
_copy_if_thenBB3:
    mv	__mergedretVal.3,_copy_x.1 
    mv	__mergedretVal.4,__mergedretVal.3 
    j	afterCallBB1
_copy_if_thenBB2:
    mv	a0,_copy_y.1 
    mv	a1,_copy_x.1 
    call	gcd
    mv	__t.0,a0 
    mv	__mergedretVal.2,__t.0 
    mv	__mergedretVal.4,__mergedretVal.2 
    j	afterCallBB2
_copy_if_thenBB1:
    mv	__mergedretVal.1,_copy_x.1 
    mv	__mergedretVal.4,__mergedretVal.1 
    j	afterCallBB2
if_thenBB2:
    mv	_copy_x.1,y.0 
    mv	_copy_y.1,x.0 
    beq	_copy_y.1,zero,	_copy_if_thenBB5
_copy_if_end3:
    blt	_copy_x.1,_copy_y.1,	_copy_if_thenBB6
_copy_if_elseBB3:
    rem __t.0,_copy_x.1,_copy_y.1
    mv	a0,_copy_y.1 
    mv	a1,__t.0 
    call	gcd
    mv	__t.0,a0 
    mv	__mergedretVal.3,__t.0 
    mv	__mergedretVal.1,__mergedretVal.3 
afterCallBB3:
    mv	t.0,__mergedretVal.1 
    mv	mergedretVal.2,t.0 
    mv	mergedretVal.0,mergedretVal.2 
    j	gcd.exitBB1
_copy_if_thenBB6:
    mv	a0,_copy_y.1 
    mv	a1,_copy_x.1 
    call	gcd
    mv	__t.0,a0 
    mv	__mergedretVal.4,__t.0 
    mv	__mergedretVal.1,__mergedretVal.4 
    j	afterCallBB3
_copy_if_thenBB5:
    mv	__mergedretVal.2,_copy_x.1 
    mv	__mergedretVal.1,__mergedretVal.2 
    j	afterCallBB3
if_thenBB1:
    mv	mergedretVal.1,x.0 
    mv	mergedretVal.0,mergedretVal.1 
    j	gcd.exitBB1
								 # func end
    .globl	update				#begin
    .p2align	2
    .type	update,@function
update:
update.entryBB1:
    mv	backup_ra,ra 
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
    mv	back_s10,s10 
    mv	r.0,a2 
    mv	l.0,a1 
    mv	o.0,a0 
    la ptr,L    
    lw _gL.0, 0(ptr)
    la ptr,sum    
    lw _gsum.0, 0(ptr)
    la ptr,b    
    lw _gb.0, 0(ptr)
    la ptr,p    
    lw _gp.0, 0(ptr)
    la ptr,pl    
    lw _gpl.0, 0(ptr)
    la ptr,pr    
    lw _gpr.0, 0(ptr)
    la ptr,now    
    lw _gnow.0, 0(ptr)
    la ptr,s    
    lw _gs.0, 0(ptr)
    la ptr,flag    
    lw _gflag.0, 0(ptr)
    la ptr,t    
    lw _gt.0, 0(ptr)
    ble	_gpl.0,l.0,	ifTrue1
if_end2:
    beq	l.0,r.0,	if_thenBB3
if_end3:
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gt.0,t.0
    lw t.0, 0(t.0)
    bgt	t.0,zero,	if_thenBB4
if_end4:
    slli t.0,o.0,    1
    mv	lc.0,t.0 
    slli t.0,o.0,    1
    addi t.0,t.0,    1
    mv	rc.0,t.0 
    add t.0,l.0,r.0
    srai t.0,t.0,    1
    mv	mid.0,t.0 
    ble	_gpl.0,mid.0,	if_thenBB5
paracopy1:
    mv	_gpr.5,_gpr.0 
    mv	_gnow.5,_gnow.0 
    mv	_gflag.5,_gflag.0 
    mv	_gsum.5,_gsum.0 
    mv	_gs.5,_gs.0 
    mv	_gb.5,_gb.0 
    mv	_gpl.5,_gpl.0 
    mv	_gL.5,_gL.0 
    mv	_gp.5,_gp.0 
    mv	_gt.5,_gt.0 
if_end5:
    addi t.0,mid.0,    1
    bge	_gpr.5,t.0,	if_thenBB6
paracopy2:
    mv	_gpr.10,_gpr.5 
    mv	_gnow.10,_gnow.5 
    mv	_gflag.10,_gflag.5 
    mv	_gsum.10,_gsum.5 
    mv	_gs.10,_gs.5 
    mv	_gb.10,_gb.5 
    mv	_gpl.10,_gpl.5 
    mv	_gL.10,_gL.5 
    mv	_gp.10,_gp.5 
    mv	_gt.10,_gt.5 
if_end6:
    slli t.0,rc.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.10,t.0
    slli t.0,lc.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.10,t.0
    lw t.0, 0(t.0)
    lw t.0, 0(t.0)
    add t.0,t.0,t.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.10,t.0
    sw t.0,0(t.0)
    slli t.0,rc.0,    2
    addi t.0,t.0,    4
    add t.0,_gflag.10,t.0
    slli t.0,lc.0,    2
    addi t.0,t.0,    4
    add t.0,_gflag.10,t.0
    lw t.0, 0(t.0)
    lw t.0, 0(t.0)
    and t.0,t.0,t.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gflag.10,t.0
    sw t.0,0(t.0)
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gflag.10,t.0
    lw t.0, 0(t.0)
    bgt	t.0,zero,	if_thenBB7
paracopy3:
    mv	_gpr.11,_gpr.10 
    mv	_gnow.11,_gnow.10 
    mv	_gflag.11,_gflag.10 
    mv	_gsum.11,_gsum.10 
    mv	_gs.11,_gs.10 
    mv	_gb.11,_gb.10 
    mv	_gpl.11,_gpl.10 
    mv	_gL.11,_gL.10 
    mv	_gp.11,_gp.10 
    mv	_gt.11,_gt.10 
update.exitBB1:
    lui _lobits,%hi(t)
    sw _gt.11, %lo(t)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.11, %lo(flag)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.11, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.11, %lo(now)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.11, %lo(pr)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.11, %lo(pl)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.11, %lo(p)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.11, %lo(b)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.11, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.11, %lo(L)(_lobits)
    mv	s10,back_s10 
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
    mv	ra,backup_ra 
    ret
if_thenBB7:
    mv	i.2,zero 
forcondBB1:
    blt	i.2,_gL.10,	forbodyBB1
afterForBB1:
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gnow.10,t.0
    li _t, 0
    sw _t,0(t.0)
    mv	_gpr.11,_gpr.10 
    mv	_gnow.11,_gnow.10 
    mv	_gflag.11,_gflag.10 
    mv	_gsum.11,_gsum.10 
    mv	_gs.11,_gs.10 
    mv	_gb.11,_gb.10 
    mv	_gpl.11,_gpl.10 
    mv	_gL.11,_gL.10 
    mv	_gp.11,_gp.10 
    mv	_gt.11,_gt.10 
    j	update.exitBB1
forbodyBB1:
    slli t.0,rc.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.10,t.0
    slli t.0,rc.0,    2
    addi t.0,t.0,    4
    add t.0,_gnow.10,t.0
    lw t.0, 0(t.0)
    add t.0,i.2,t.0
    rem t.0,t.0,_gL.10
    lw t.0, 0(t.0)
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    slli t.0,lc.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.10,t.0
    slli t.0,lc.0,    2
    addi t.0,t.0,    4
    add t.0,_gnow.10,t.0
    lw t.0, 0(t.0)
    add t.0,i.2,t.0
    rem t.0,t.0,_gL.10
    lw t.0, 0(t.0)
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    lw t.0, 0(t.0)
    add t.0,t.0,t.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.10,t.0
    lw t.0, 0(t.0)
    slli t.0,i.2,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    sw t.0,0(t.0)
    addi i.3,i.2,    1
    mv	i.2,i.3 
    j	forcondBB1
if_thenBB6:
    addi t.0,mid.0,    1
    mv	_copy_o.0,rc.0 
    mv	_copy_l.0,t.0 
    mv	_copy_r.0,r.0 
    ble	_gpl.5,_copy_l.0,	_copy_ifTrue1
_copy_if_end4:
    beq	_copy_l.0,_copy_r.0,	_copy_if_thenBB7
_copy_if_end5:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gt.5,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB8
_copy_if_end6:
    slli __t.0,_copy_o.0,    1
    mv	__lc.0,__t.0 
    slli __t.0,_copy_o.0,    1
    addi __t.0,__t.0,    1
    mv	__rc.0,__t.0 
    add __t.0,_copy_l.0,_copy_r.0
    srai __t.0,__t.0,    1
    mv	__mid.0,__t.0 
    ble	_gpl.5,__mid.0,	_copy_if_thenBB9
paracopy4:
    mv	_gpr.7,_gpr.5 
    mv	_gnow.7,_gnow.5 
    mv	_gflag.7,_gflag.5 
    mv	_gsum.7,_gsum.5 
    mv	_gs.7,_gs.5 
    mv	_gb.7,_gb.5 
    mv	_gpl.7,_gpl.5 
    mv	_gL.7,_gL.5 
    mv	_gp.7,_gp.5 
    mv	_gt.7,_gt.5 
_copy_if_end7:
    addi __t.0,__mid.0,    1
    bge	_gpr.7,__t.0,	_copy_if_thenBB10
paracopy5:
    mv	_gpr.9,_gpr.7 
    mv	_gnow.9,_gnow.7 
    mv	_gflag.9,_gflag.7 
    mv	_gsum.9,_gsum.7 
    mv	_gs.9,_gs.7 
    mv	_gb.9,_gb.7 
    mv	_gpl.9,_gpl.7 
    mv	_gL.9,_gL.7 
    mv	_gp.9,_gp.7 
    mv	_gt.9,_gt.7 
_copy_if_end8:
    slli __t.0,__rc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.9,__t.0
    slli __t.0,__lc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.9,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.9,__t.0
    sw __t.0,0(__t.0)
    slli __t.0,__rc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.9,__t.0
    slli __t.0,__lc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.9,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    and __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.9,__t.0
    sw __t.0,0(__t.0)
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.9,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB11
paracopy6:
    mv	_gpr.10,_gpr.9 
    mv	_gnow.10,_gnow.9 
    mv	_gflag.10,_gflag.9 
    mv	_gsum.10,_gsum.9 
    mv	_gs.10,_gs.9 
    mv	_gb.10,_gb.9 
    mv	_gpl.10,_gpl.9 
    mv	_gL.10,_gL.9 
    mv	_gp.10,_gp.9 
    mv	_gt.10,_gt.9 
    j	if_end6
_copy_if_thenBB11:
    mv	__i.2,zero 
_copy_forcondBB1:
    blt	__i.2,_gL.9,	_copy_forbodyBB1
_copy_afterForBB1:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.9,__t.0
    li _t, 0
    sw _t,0(__t.0)
    mv	_gpr.10,_gpr.9 
    mv	_gnow.10,_gnow.9 
    mv	_gflag.10,_gflag.9 
    mv	_gsum.10,_gsum.9 
    mv	_gs.10,_gs.9 
    mv	_gb.10,_gb.9 
    mv	_gpl.10,_gpl.9 
    mv	_gL.10,_gL.9 
    mv	_gp.10,_gp.9 
    mv	_gt.10,_gt.9 
    j	if_end6
_copy_forbodyBB1:
    slli __t.0,__rc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.9,__t.0
    slli __t.0,__rc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.9,__t.0
    lw __t.0, 0(__t.0)
    add __t.0,__i.2,__t.0
    rem __t.0,__t.0,_gL.9
    lw __t.0, 0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    slli __t.0,__lc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.9,__t.0
    slli __t.0,__lc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.9,__t.0
    lw __t.0, 0(__t.0)
    add __t.0,__i.2,__t.0
    rem __t.0,__t.0,_gL.9
    lw __t.0, 0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.9,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    addi __i.3,__i.2,    1
    mv	__i.2,__i.3 
    j	_copy_forcondBB1
_copy_if_thenBB10:
    addi __t.0,__mid.0,    1
    lui _lobits,%hi(t)
    sw _gt.7, %lo(t)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.7, %lo(flag)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.7, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.7, %lo(now)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.7, %lo(pr)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.7, %lo(pl)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.7, %lo(p)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.7, %lo(b)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.7, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.7, %lo(L)(_lobits)
    mv	a0,__rc.0 
    mv	a1,__t.0 
    mv	a2,_copy_r.0 
    call	update
    la ptr,L    
    lw _gL.8, 0(ptr)
    la ptr,sum    
    lw _gsum.8, 0(ptr)
    la ptr,b    
    lw _gb.8, 0(ptr)
    la ptr,p    
    lw _gp.8, 0(ptr)
    la ptr,pl    
    lw _gpl.8, 0(ptr)
    la ptr,pr    
    lw _gpr.8, 0(ptr)
    la ptr,now    
    lw _gnow.8, 0(ptr)
    la ptr,s    
    lw _gs.8, 0(ptr)
    la ptr,flag    
    lw _gflag.8, 0(ptr)
    la ptr,t    
    lw _gt.8, 0(ptr)
    mv	_gpr.9,_gpr.8 
    mv	_gnow.9,_gnow.8 
    mv	_gflag.9,_gflag.8 
    mv	_gsum.9,_gsum.8 
    mv	_gs.9,_gs.8 
    mv	_gb.9,_gb.8 
    mv	_gpl.9,_gpl.8 
    mv	_gL.9,_gL.8 
    mv	_gp.9,_gp.8 
    mv	_gt.9,_gt.8 
    j	_copy_if_end8
_copy_if_thenBB9:
    lui _lobits,%hi(t)
    sw _gt.5, %lo(t)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.5, %lo(flag)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.5, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.5, %lo(now)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.5, %lo(pr)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.5, %lo(pl)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.5, %lo(p)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.5, %lo(b)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.5, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.5, %lo(L)(_lobits)
    mv	a0,__lc.0 
    mv	a1,_copy_l.0 
    mv	a2,__mid.0 
    call	update
    la ptr,L    
    lw _gL.6, 0(ptr)
    la ptr,sum    
    lw _gsum.6, 0(ptr)
    la ptr,b    
    lw _gb.6, 0(ptr)
    la ptr,p    
    lw _gp.6, 0(ptr)
    la ptr,pl    
    lw _gpl.6, 0(ptr)
    la ptr,pr    
    lw _gpr.6, 0(ptr)
    la ptr,now    
    lw _gnow.6, 0(ptr)
    la ptr,s    
    lw _gs.6, 0(ptr)
    la ptr,flag    
    lw _gflag.6, 0(ptr)
    la ptr,t    
    lw _gt.6, 0(ptr)
    mv	_gpr.7,_gpr.6 
    mv	_gnow.7,_gnow.6 
    mv	_gflag.7,_gflag.6 
    mv	_gsum.7,_gsum.6 
    mv	_gs.7,_gs.6 
    mv	_gb.7,_gb.6 
    mv	_gpl.7,_gpl.6 
    mv	_gL.7,_gL.6 
    mv	_gp.7,_gp.6 
    mv	_gt.7,_gt.6 
    j	_copy_if_end7
_copy_if_thenBB8:
    mv	___o.0,_copy_o.0 
    slli ___t.0,___o.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.5,___t.0
    lw ___t.0, 0(___t.0)
    bgt	___t.0,zero,	_copy__if_thenBB1
    j	_copy_if_end6
_copy__if_thenBB1:
    slli ___t.0,___o.0,    1
    mv	___lc.0,___t.0 
    slli ___t.0,___o.0,    1
    addi ___t.0,___t.0,    1
    mv	___rc.0,___t.0 
    slli ___t.0,___o.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.5,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.5,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.5
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.5,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gs.5,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.5,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    slli ___t.0,___t.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,___t.0,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gsum.5,___t.0
    lw ___t.0, 0(___t.0)
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.5,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.5,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.5
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.5,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.5,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.5,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.5
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.5,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gs.5,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.5,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    slli ___t.0,___t.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,___t.0,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gsum.5,___t.0
    lw ___t.0, 0(___t.0)
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.5,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.5,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.5
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.5,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.5,___t.0
    li _t, 0
    sw _t,0(___t.0)
    j	_copy_if_end6
_copy_if_thenBB7:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.5,__t.0
    lw __t.0, 0(__t.0)
    mv	___x.0,__t.0 
    rem ___t.0,___x.0,_gp.5
    mul ___t.0,___t.0,___t.0
    mv	__t.0,___t.0 
    rem __t.0,__t.0,_gp.5
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.5,__t.0
    sw __t.0,0(__t.0)
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.5,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gb.5,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB12
paracopy7:
    mv	_gpr.10,_gpr.5 
    mv	_gnow.10,_gnow.5 
    mv	_gflag.10,_gflag.5 
    mv	_gsum.10,_gsum.5 
    mv	_gs.10,_gs.5 
    mv	_gb.10,_gb.5 
    mv	_gpl.10,_gpl.5 
    mv	_gL.10,_gL.5 
    mv	_gp.10,_gp.5 
    mv	_gt.10,_gt.5 
    j	if_end6
_copy_if_thenBB12:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.5,__t.0
    li _t, 1
    sw _t,0(__t.0)
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.5,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.5,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    sw __t.0,4(__t.0)
    li __i.2, 1
_copy_forcondBB2:
    blt	__i.2,_gL.5,	_copy_forbodyBB2
paracopy8:
    mv	_gpr.10,_gpr.5 
    mv	_gnow.10,_gnow.5 
    mv	_gflag.10,_gflag.5 
    mv	_gsum.10,_gsum.5 
    mv	_gs.10,_gs.5 
    mv	_gb.10,_gb.5 
    mv	_gpl.10,_gpl.5 
    mv	_gL.10,_gL.5 
    mv	_gp.10,_gp.5 
    mv	_gt.10,_gt.5 
    j	if_end6
_copy_forbodyBB2:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.5,__t.0
    addi __t.0,__i.2,    -1
    lw __t.0, 0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    mv	___x.0,__t.0 
    rem ___t.0,___x.0,_gp.5
    mul ___t.0,___t.0,___t.0
    mv	__t.0,___t.0 
    rem __t.0,__t.0,_gp.5
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.5,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    addi __i.3,__i.2,    1
    mv	__i.2,__i.3 
    j	_copy_forcondBB2
_copy_ifTrue1:
    bge	_gpr.5,_copy_r.0,	_copy_ifTrue2
    j	_copy_if_end4
_copy_ifTrue2:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.5,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB13
    j	_copy_if_end4
_copy_if_thenBB13:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.5,__t.0
    lw __t.0, 0(__t.0)
    addi __t.0,__t.0,    1
    rem __t.0,__t.0,_gL.5
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.5,__t.0
    sw __t.0,0(__t.0)
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.5,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.5,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.5,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gt.5,__t.0
    lw __t.0, 0(__t.0)
    addi __t.0,__t.0,    1
    rem __t.0,__t.0,_gL.5
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gt.5,__t.0
    sw __t.0,0(__t.0)
    mv	_gpr.10,_gpr.5 
    mv	_gnow.10,_gnow.5 
    mv	_gflag.10,_gflag.5 
    mv	_gsum.10,_gsum.5 
    mv	_gs.10,_gs.5 
    mv	_gb.10,_gb.5 
    mv	_gpl.10,_gpl.5 
    mv	_gL.10,_gL.5 
    mv	_gp.10,_gp.5 
    mv	_gt.10,_gt.5 
    j	if_end6
if_thenBB5:
    mv	_copy_o.0,lc.0 
    mv	_copy_l.0,l.0 
    mv	_copy_r.0,mid.0 
    ble	_gpl.0,_copy_l.0,	_copy_ifTrue3
_copy_if_end9:
    beq	_copy_l.0,_copy_r.0,	_copy_if_thenBB14
_copy_if_end10:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gt.0,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB15
_copy_if_end11:
    slli __t.0,_copy_o.0,    1
    mv	__lc.0,__t.0 
    slli __t.0,_copy_o.0,    1
    addi __t.0,__t.0,    1
    mv	__rc.0,__t.0 
    add __t.0,_copy_l.0,_copy_r.0
    srai __t.0,__t.0,    1
    mv	__mid.0,__t.0 
    ble	_gpl.0,__mid.0,	_copy_if_thenBB16
paracopy9:
    mv	_gpr.1,_gpr.0 
    mv	_gnow.1,_gnow.0 
    mv	_gflag.1,_gflag.0 
    mv	_gsum.1,_gsum.0 
    mv	_gs.1,_gs.0 
    mv	_gb.1,_gb.0 
    mv	_gpl.1,_gpl.0 
    mv	_gL.1,_gL.0 
    mv	_gp.1,_gp.0 
    mv	_gt.1,_gt.0 
_copy_if_end12:
    addi __t.0,__mid.0,    1
    bge	_gpr.1,__t.0,	_copy_if_thenBB17
paracopy10:
    mv	_gpr.3,_gpr.1 
    mv	_gnow.3,_gnow.1 
    mv	_gflag.3,_gflag.1 
    mv	_gsum.3,_gsum.1 
    mv	_gs.3,_gs.1 
    mv	_gb.3,_gb.1 
    mv	_gpl.3,_gpl.1 
    mv	_gL.3,_gL.1 
    mv	_gp.3,_gp.1 
    mv	_gt.3,_gt.1 
_copy_if_end13:
    slli __t.0,__rc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.3,__t.0
    slli __t.0,__lc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.3,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.3,__t.0
    sw __t.0,0(__t.0)
    slli __t.0,__rc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.3,__t.0
    slli __t.0,__lc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.3,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    and __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.3,__t.0
    sw __t.0,0(__t.0)
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.3,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB18
paracopy11:
    mv	_gpr.5,_gpr.3 
    mv	_gnow.5,_gnow.3 
    mv	_gflag.5,_gflag.3 
    mv	_gsum.5,_gsum.3 
    mv	_gs.5,_gs.3 
    mv	_gb.5,_gb.3 
    mv	_gpl.5,_gpl.3 
    mv	_gL.5,_gL.3 
    mv	_gp.5,_gp.3 
    mv	_gt.5,_gt.3 
    j	if_end5
_copy_if_thenBB18:
    mv	__i.2,zero 
_copy_forcondBB3:
    blt	__i.2,_gL.3,	_copy_forbodyBB3
_copy_afterForBB2:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.3,__t.0
    li _t, 0
    sw _t,0(__t.0)
    mv	_gpr.5,_gpr.3 
    mv	_gnow.5,_gnow.3 
    mv	_gflag.5,_gflag.3 
    mv	_gsum.5,_gsum.3 
    mv	_gs.5,_gs.3 
    mv	_gb.5,_gb.3 
    mv	_gpl.5,_gpl.3 
    mv	_gL.5,_gL.3 
    mv	_gp.5,_gp.3 
    mv	_gt.5,_gt.3 
    j	if_end5
_copy_forbodyBB3:
    slli __t.0,__rc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.3,__t.0
    slli __t.0,__rc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.3,__t.0
    lw __t.0, 0(__t.0)
    add __t.0,__i.2,__t.0
    rem __t.0,__t.0,_gL.3
    lw __t.0, 0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    slli __t.0,__lc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.3,__t.0
    slli __t.0,__lc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.3,__t.0
    lw __t.0, 0(__t.0)
    add __t.0,__i.2,__t.0
    rem __t.0,__t.0,_gL.3
    lw __t.0, 0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.3,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    addi __i.3,__i.2,    1
    mv	__i.2,__i.3 
    j	_copy_forcondBB3
_copy_if_thenBB17:
    addi __t.0,__mid.0,    1
    lui _lobits,%hi(t)
    sw _gt.1, %lo(t)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.1, %lo(flag)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.1, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.1, %lo(now)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.1, %lo(pr)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.1, %lo(pl)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.1, %lo(p)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.1, %lo(b)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.1, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.1, %lo(L)(_lobits)
    mv	a0,__rc.0 
    mv	a1,__t.0 
    mv	a2,_copy_r.0 
    call	update
    la ptr,L    
    lw _gL.2, 0(ptr)
    la ptr,sum    
    lw _gsum.2, 0(ptr)
    la ptr,b    
    lw _gb.2, 0(ptr)
    la ptr,p    
    lw _gp.2, 0(ptr)
    la ptr,pl    
    lw _gpl.2, 0(ptr)
    la ptr,pr    
    lw _gpr.2, 0(ptr)
    la ptr,now    
    lw _gnow.2, 0(ptr)
    la ptr,s    
    lw _gs.2, 0(ptr)
    la ptr,flag    
    lw _gflag.2, 0(ptr)
    la ptr,t    
    lw _gt.2, 0(ptr)
    mv	_gpr.3,_gpr.2 
    mv	_gnow.3,_gnow.2 
    mv	_gflag.3,_gflag.2 
    mv	_gsum.3,_gsum.2 
    mv	_gs.3,_gs.2 
    mv	_gb.3,_gb.2 
    mv	_gpl.3,_gpl.2 
    mv	_gL.3,_gL.2 
    mv	_gp.3,_gp.2 
    mv	_gt.3,_gt.2 
    j	_copy_if_end13
_copy_if_thenBB16:
    lui _lobits,%hi(t)
    sw _gt.0, %lo(t)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.0, %lo(flag)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.0, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.0, %lo(now)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.0, %lo(pr)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.0, %lo(pl)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.0, %lo(p)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.0, %lo(b)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.0, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.0, %lo(L)(_lobits)
    mv	a0,__lc.0 
    mv	a1,_copy_l.0 
    mv	a2,__mid.0 
    call	update
    la ptr,L    
    lw _gL.4, 0(ptr)
    la ptr,sum    
    lw _gsum.4, 0(ptr)
    la ptr,b    
    lw _gb.4, 0(ptr)
    la ptr,p    
    lw _gp.4, 0(ptr)
    la ptr,pl    
    lw _gpl.4, 0(ptr)
    la ptr,pr    
    lw _gpr.4, 0(ptr)
    la ptr,now    
    lw _gnow.4, 0(ptr)
    la ptr,s    
    lw _gs.4, 0(ptr)
    la ptr,flag    
    lw _gflag.4, 0(ptr)
    la ptr,t    
    lw _gt.4, 0(ptr)
    mv	_gpr.1,_gpr.4 
    mv	_gnow.1,_gnow.4 
    mv	_gflag.1,_gflag.4 
    mv	_gsum.1,_gsum.4 
    mv	_gs.1,_gs.4 
    mv	_gb.1,_gb.4 
    mv	_gpl.1,_gpl.4 
    mv	_gL.1,_gL.4 
    mv	_gp.1,_gp.4 
    mv	_gt.1,_gt.4 
    j	_copy_if_end12
_copy_if_thenBB15:
    mv	___o.1,_copy_o.0 
    slli ___t.0,___o.1,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    lw ___t.0, 0(___t.0)
    bgt	___t.0,zero,	_copy__if_thenBB2
    j	_copy_if_end11
_copy__if_thenBB2:
    slli ___t.0,___o.1,    1
    mv	___lc.0,___t.0 
    slli ___t.0,___o.1,    1
    addi ___t.0,___t.0,    1
    mv	___rc.0,___t.0 
    slli ___t.0,___o.1,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.0,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.0,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gs.0,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.0,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    slli ___t.0,___t.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,___t.0,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gsum.0,___t.0
    lw ___t.0, 0(___t.0)
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.1,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.1,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.0,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.0,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gs.0,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.0,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    slli ___t.0,___t.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,___t.0,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gsum.0,___t.0
    lw ___t.0, 0(___t.0)
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.1,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.1,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    li _t, 0
    sw _t,0(___t.0)
    j	_copy_if_end11
_copy_if_thenBB14:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.0,__t.0
    lw __t.0, 0(__t.0)
    mv	___x.0,__t.0 
    rem ___t.0,___x.0,_gp.0
    mul ___t.0,___t.0,___t.0
    mv	__t.0,___t.0 
    rem __t.0,__t.0,_gp.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.0,__t.0
    sw __t.0,0(__t.0)
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.0,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gb.0,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB19
paracopy12:
    mv	_gpr.5,_gpr.0 
    mv	_gnow.5,_gnow.0 
    mv	_gflag.5,_gflag.0 
    mv	_gsum.5,_gsum.0 
    mv	_gs.5,_gs.0 
    mv	_gb.5,_gb.0 
    mv	_gpl.5,_gpl.0 
    mv	_gL.5,_gL.0 
    mv	_gp.5,_gp.0 
    mv	_gt.5,_gt.0 
    j	if_end5
_copy_if_thenBB19:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.0,__t.0
    li _t, 1
    sw _t,0(__t.0)
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.0,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    sw __t.0,4(__t.0)
    li __i.2, 1
_copy_forcondBB4:
    blt	__i.2,_gL.0,	_copy_forbodyBB4
paracopy13:
    mv	_gpr.5,_gpr.0 
    mv	_gnow.5,_gnow.0 
    mv	_gflag.5,_gflag.0 
    mv	_gsum.5,_gsum.0 
    mv	_gs.5,_gs.0 
    mv	_gb.5,_gb.0 
    mv	_gpl.5,_gpl.0 
    mv	_gL.5,_gL.0 
    mv	_gp.5,_gp.0 
    mv	_gt.5,_gt.0 
    j	if_end5
_copy_forbodyBB4:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.0,__t.0
    addi __t.0,__i.2,    -1
    lw __t.0, 0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    mv	___x.0,__t.0 
    rem ___t.0,___x.0,_gp.0
    mul ___t.0,___t.0,___t.0
    mv	__t.0,___t.0 
    rem __t.0,__t.0,_gp.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.0,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    addi __i.3,__i.2,    1
    mv	__i.2,__i.3 
    j	_copy_forcondBB4
_copy_ifTrue3:
    bge	_gpr.0,_copy_r.0,	_copy_ifTrue4
    j	_copy_if_end9
_copy_ifTrue4:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.0,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB20
    j	_copy_if_end9
_copy_if_thenBB20:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.0,__t.0
    lw __t.0, 0(__t.0)
    addi __t.0,__t.0,    1
    rem __t.0,__t.0,_gL.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.0,__t.0
    sw __t.0,0(__t.0)
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.0,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.0,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gt.0,__t.0
    lw __t.0, 0(__t.0)
    addi __t.0,__t.0,    1
    rem __t.0,__t.0,_gL.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gt.0,__t.0
    sw __t.0,0(__t.0)
    mv	_gpr.5,_gpr.0 
    mv	_gnow.5,_gnow.0 
    mv	_gflag.5,_gflag.0 
    mv	_gsum.5,_gsum.0 
    mv	_gs.5,_gs.0 
    mv	_gb.5,_gb.0 
    mv	_gpl.5,_gpl.0 
    mv	_gL.5,_gL.0 
    mv	_gp.5,_gp.0 
    mv	_gt.5,_gt.0 
    j	if_end5
if_thenBB4:
    mv	_o.0,o.0 
    slli _t.0,_o.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    lw _t.0, 0(_t.0)
    bgt	_t.0,zero,	_if_thenBB1
    j	if_end4
_if_thenBB1:
    slli _t.0,_o.0,    1
    mv	_lc.0,_t.0 
    slli _t.0,_o.0,    1
    addi _t.0,_t.0,    1
    mv	_rc.0,_t.0 
    slli _t.0,_o.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gnow.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    add _t.0,_t.0,_t.0
    rem _t.0,_t.0,_gL.0
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gnow.0,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gs.0,_t.0
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gnow.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gsum.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,0(_t.0)
    slli _t.0,_o.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    add _t.0,_t.0,_t.0
    rem _t.0,_t.0,_gL.0
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_o.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gnow.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    add _t.0,_t.0,_t.0
    rem _t.0,_t.0,_gL.0
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gnow.0,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gs.0,_t.0
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gnow.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gsum.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,0(_t.0)
    slli _t.0,_o.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    add _t.0,_t.0,_t.0
    rem _t.0,_t.0,_gL.0
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_o.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    li _t, 0
    sw _t,0(_t.0)
    j	if_end4
if_thenBB3:
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.0,t.0
    lw t.0, 0(t.0)
    mv	_x.0,t.0 
    rem _t.0,_x.0,_gp.0
    mul _t.0,_t.0,_t.0
    mv	t.0,_t.0 
    rem t.0,t.0,_gp.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.0,t.0
    sw t.0,0(t.0)
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.0,t.0
    lw t.0, 0(t.0)
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gb.0,t.0
    lw t.0, 0(t.0)
    bgt	t.0,zero,	if_thenBB8
paracopy14:
    mv	_gpr.11,_gpr.0 
    mv	_gnow.11,_gnow.0 
    mv	_gflag.11,_gflag.0 
    mv	_gsum.11,_gsum.0 
    mv	_gs.11,_gs.0 
    mv	_gb.11,_gb.0 
    mv	_gpl.11,_gpl.0 
    mv	_gL.11,_gL.0 
    mv	_gp.11,_gp.0 
    mv	_gt.11,_gt.0 
    j	update.exitBB1
if_thenBB8:
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gflag.0,t.0
    li _t, 1
    sw _t,0(t.0)
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.0,t.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.0,t.0
    lw t.0, 0(t.0)
    lw t.0, 0(t.0)
    sw t.0,4(t.0)
    li i.2, 1
forcondBB2:
    blt	i.2,_gL.0,	forbodyBB2
paracopy15:
    mv	_gpr.11,_gpr.0 
    mv	_gnow.11,_gnow.0 
    mv	_gflag.11,_gflag.0 
    mv	_gsum.11,_gsum.0 
    mv	_gs.11,_gs.0 
    mv	_gb.11,_gb.0 
    mv	_gpl.11,_gpl.0 
    mv	_gL.11,_gL.0 
    mv	_gp.11,_gp.0 
    mv	_gt.11,_gt.0 
    j	update.exitBB1
forbodyBB2:
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.0,t.0
    addi t.0,i.2,    -1
    lw t.0, 0(t.0)
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    mv	_x.0,t.0 
    rem _t.0,_x.0,_gp.0
    mul _t.0,_t.0,_t.0
    mv	t.0,_t.0 
    rem t.0,t.0,_gp.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.0,t.0
    lw t.0, 0(t.0)
    slli t.0,i.2,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    sw t.0,0(t.0)
    addi i.3,i.2,    1
    mv	i.2,i.3 
    j	forcondBB2
ifTrue1:
    bge	_gpr.0,r.0,	ifTrue2
    j	if_end2
ifTrue2:
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gflag.0,t.0
    lw t.0, 0(t.0)
    bgt	t.0,zero,	if_thenBB9
    j	if_end2
if_thenBB9:
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gnow.0,t.0
    lw t.0, 0(t.0)
    addi t.0,t.0,    1
    rem t.0,t.0,_gL.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gnow.0,t.0
    sw t.0,0(t.0)
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.0,t.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gnow.0,t.0
    lw t.0, 0(t.0)
    lw t.0, 0(t.0)
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.0,t.0
    lw t.0, 0(t.0)
    sw t.0,0(t.0)
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gt.0,t.0
    lw t.0, 0(t.0)
    addi t.0,t.0,    1
    rem t.0,t.0,_gL.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gt.0,t.0
    sw t.0,0(t.0)
    mv	_gpr.11,_gpr.0 
    mv	_gnow.11,_gnow.0 
    mv	_gflag.11,_gflag.0 
    mv	_gsum.11,_gsum.0 
    mv	_gs.11,_gs.0 
    mv	_gb.11,_gb.0 
    mv	_gpl.11,_gpl.0 
    mv	_gL.11,_gL.0 
    mv	_gp.11,_gp.0 
    mv	_gt.11,_gt.0 
    j	update.exitBB1
								 # func end
    .globl	query				#begin
    .p2align	2
    .type	query,@function
query:
query.entryBB1:
    mv	backup_ra,ra 
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
    mv	back_s10,s10 
    mv	r.0,a2 
    mv	l.0,a1 
    mv	o.0,a0 
    la ptr,L    
    lw _gL.0, 0(ptr)
    la ptr,sum    
    lw _gsum.0, 0(ptr)
    la ptr,pl    
    lw _gpl.0, 0(ptr)
    la ptr,MOD    
    lw _gMOD.0, 0(ptr)
    la ptr,pr    
    lw _gpr.0, 0(ptr)
    la ptr,now    
    lw _gnow.0, 0(ptr)
    la ptr,s    
    lw _gs.0, 0(ptr)
    la ptr,t    
    lw _gt.0, 0(ptr)
    ble	_gpl.0,l.0,	ifTrue3
if_end7:
    slli t.0,o.0,    1
    mv	lc.1,t.0 
    slli t.0,o.0,    1
    addi t.0,t.0,    1
    mv	rc.1,t.0 
    add t.0,l.0,r.0
    srai t.0,t.0,    1
    mv	mid.1,t.0 
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gt.0,t.0
    lw t.0, 0(t.0)
    bgt	t.0,zero,	if_thenBB10
if_end8:
    ble	_gpl.0,mid.1,	if_thenBB11
paracopy16:
    mv	_gnow.2,_gnow.0 
    mv	_gL.2,_gL.0 
    mv	_gt.2,_gt.0 
    mv	_gMOD.2,_gMOD.0 
    mv	_gs.2,_gs.0 
    mv	_gpr.2,_gpr.0 
    mv	_gpl.2,_gpl.0 
    mv	_gsum.2,_gsum.0 
    mv	ss.2,zero 
if_end9:
    addi t.0,mid.1,    1
    bge	_gpr.2,t.0,	if_thenBB12
paracopy17:
    mv	_gnow.3,_gnow.2 
    mv	_gL.3,_gL.2 
    mv	_gt.3,_gt.2 
    mv	_gMOD.3,_gMOD.2 
    mv	_gs.3,_gs.2 
    mv	_gpr.3,_gpr.2 
    mv	_gpl.3,_gpl.2 
    mv	_gsum.3,_gsum.2 
    mv	ss.3,ss.2 
if_end10:
    mv	mergedretVal.1,ss.3 
    mv	_gnow.1,_gnow.3 
    mv	_gL.1,_gL.3 
    mv	_gt.1,_gt.3 
    mv	mergedretVal.0,mergedretVal.1 
    mv	_gMOD.1,_gMOD.3 
    mv	_gs.1,_gs.3 
    mv	_gpr.1,_gpr.3 
    mv	_gpl.1,_gpl.3 
    mv	_gsum.1,_gsum.3 
query.exitBB1:
    lui _lobits,%hi(t)
    sw _gt.1, %lo(t)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.1, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.1, %lo(now)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.1, %lo(pr)(_lobits)
    lui _lobits,%hi(MOD)
    sw _gMOD.1, %lo(MOD)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.1, %lo(pl)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.1, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.1, %lo(L)(_lobits)
    mv	s10,back_s10 
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
    mv	ra,backup_ra 
    mv	a0,mergedretVal.0 
    ret
if_thenBB12:
    addi t.0,mid.1,    1
    mv	_copy_o.2,rc.1 
    mv	_copy_l.2,t.0 
    mv	_copy_r.2,r.0 
    ble	_gpl.2,_copy_l.2,	_copy_ifTrue5
_copy_if_end14:
    slli __t.0,_copy_o.2,    1
    mv	__lc.2,__t.0 
    slli __t.0,_copy_o.2,    1
    addi __t.0,__t.0,    1
    mv	__rc.2,__t.0 
    add __t.0,_copy_l.2,_copy_r.2
    srai __t.0,__t.0,    1
    mv	__mid.2,__t.0 
    slli __t.0,_copy_o.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gt.2,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB21
_copy_if_end15:
    ble	_gpl.2,__mid.2,	_copy_if_thenBB22
paracopy18:
    mv	_gnow.4,_gnow.2 
    mv	_gL.4,_gL.2 
    mv	_gt.4,_gt.2 
    mv	_gMOD.4,_gMOD.2 
    mv	_gs.4,_gs.2 
    mv	_gpr.4,_gpr.2 
    mv	_gpl.4,_gpl.2 
    mv	_gsum.4,_gsum.2 
    mv	__ss.3,zero 
_copy_if_end16:
    addi __t.0,__mid.2,    1
    bge	_gpr.4,__t.0,	_copy_if_thenBB23
paracopy19:
    mv	_gnow.6,_gnow.4 
    mv	_gL.6,_gL.4 
    mv	__ss.5,__ss.3 
    mv	_gt.6,_gt.4 
    mv	_gMOD.6,_gMOD.4 
    mv	_gs.6,_gs.4 
    mv	_gpr.6,_gpr.4 
    mv	_gpl.6,_gpl.4 
    mv	_gsum.6,_gsum.4 
_copy_if_end17:
    mv	__mergedretVal.2,__ss.5 
    mv	_gnow.8,_gnow.6 
    mv	_gL.8,_gL.6 
    mv	_gt.8,_gt.6 
    mv	_gMOD.8,_gMOD.6 
    mv	_gs.8,_gs.6 
    mv	_gpr.8,_gpr.6 
    mv	__mergedretVal.4,__mergedretVal.2 
    mv	_gpl.8,_gpl.6 
    mv	_gsum.8,_gsum.6 
afterCallBB4:
    mv	t.0,__mergedretVal.4 
    add t.0,ss.2,t.0
    rem t.0,t.0,_gMOD.8
    mv	ss.4,t.0 
    mv	_gnow.3,_gnow.8 
    mv	_gL.3,_gL.8 
    mv	_gt.3,_gt.8 
    mv	_gMOD.3,_gMOD.8 
    mv	_gs.3,_gs.8 
    mv	_gpr.3,_gpr.8 
    mv	_gpl.3,_gpl.8 
    mv	_gsum.3,_gsum.8 
    mv	ss.3,ss.4 
    j	if_end10
_copy_if_thenBB23:
    addi __t.0,__mid.2,    1
    lui _lobits,%hi(t)
    sw _gt.4, %lo(t)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.4, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.4, %lo(now)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.4, %lo(pr)(_lobits)
    lui _lobits,%hi(MOD)
    sw _gMOD.4, %lo(MOD)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.4, %lo(pl)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.4, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.4, %lo(L)(_lobits)
    mv	a0,__rc.2 
    mv	a1,__t.0 
    mv	a2,_copy_r.2 
    call	query
    mv	__t.0,a0 
    la ptr,L    
    lw _gL.5, 0(ptr)
    la ptr,sum    
    lw _gsum.5, 0(ptr)
    la ptr,pl    
    lw _gpl.5, 0(ptr)
    la ptr,MOD    
    lw _gMOD.5, 0(ptr)
    la ptr,pr    
    lw _gpr.5, 0(ptr)
    la ptr,now    
    lw _gnow.5, 0(ptr)
    la ptr,s    
    lw _gs.5, 0(ptr)
    la ptr,t    
    lw _gt.5, 0(ptr)
    add __t.0,__ss.3,__t.0
    rem __t.0,__t.0,_gMOD.5
    mv	__ss.4,__t.0 
    mv	_gnow.6,_gnow.5 
    mv	_gL.6,_gL.5 
    mv	__ss.5,__ss.4 
    mv	_gt.6,_gt.5 
    mv	_gMOD.6,_gMOD.5 
    mv	_gs.6,_gs.5 
    mv	_gpr.6,_gpr.5 
    mv	_gpl.6,_gpl.5 
    mv	_gsum.6,_gsum.5 
    j	_copy_if_end17
_copy_if_thenBB22:
    lui _lobits,%hi(t)
    sw _gt.2, %lo(t)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.2, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.2, %lo(now)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.2, %lo(pr)(_lobits)
    lui _lobits,%hi(MOD)
    sw _gMOD.2, %lo(MOD)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.2, %lo(pl)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.2, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.2, %lo(L)(_lobits)
    mv	a0,__lc.2 
    mv	a1,_copy_l.2 
    mv	a2,__mid.2 
    call	query
    mv	__t.0,a0 
    la ptr,L    
    lw _gL.7, 0(ptr)
    la ptr,sum    
    lw _gsum.7, 0(ptr)
    la ptr,pl    
    lw _gpl.7, 0(ptr)
    la ptr,MOD    
    lw _gMOD.7, 0(ptr)
    la ptr,pr    
    lw _gpr.7, 0(ptr)
    la ptr,now    
    lw _gnow.7, 0(ptr)
    la ptr,s    
    lw _gs.7, 0(ptr)
    la ptr,t    
    lw _gt.7, 0(ptr)
    add __t.0,__t.0,zero
    rem __t.0,__t.0,_gMOD.7
    mv	__ss.6,__t.0 
    mv	_gnow.4,_gnow.7 
    mv	_gL.4,_gL.7 
    mv	__ss.3,__ss.6 
    mv	_gt.4,_gt.7 
    mv	_gMOD.4,_gMOD.7 
    mv	_gs.4,_gs.7 
    mv	_gpr.4,_gpr.7 
    mv	_gpl.4,_gpl.7 
    mv	_gsum.4,_gsum.7 
    j	_copy_if_end16
_copy_if_thenBB21:
    mv	___o.3,_copy_o.2 
    slli ___t.0,___o.3,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.2,___t.0
    lw ___t.0, 0(___t.0)
    bgt	___t.0,zero,	_copy__if_thenBB3
    j	_copy_if_end15
_copy__if_thenBB3:
    slli ___t.0,___o.3,    1
    mv	___lc.0,___t.0 
    slli ___t.0,___o.3,    1
    addi ___t.0,___t.0,    1
    mv	___rc.0,___t.0 
    slli ___t.0,___o.3,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.2,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.2,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.2
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.2,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gs.2,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.2,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    slli ___t.0,___t.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,___t.0,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gsum.2,___t.0
    lw ___t.0, 0(___t.0)
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.3,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.2,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.2,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.2
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.2,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.3,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.2,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.2,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.2
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.2,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gs.2,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.2,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    slli ___t.0,___t.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,___t.0,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gsum.2,___t.0
    lw ___t.0, 0(___t.0)
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.3,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.2,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.2,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.2
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.2,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.3,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.2,___t.0
    li _t, 0
    sw _t,0(___t.0)
    j	_copy_if_end15
_copy_ifTrue5:
    bge	_gpr.2,_copy_r.2,	_copy_if_thenBB24
    j	_copy_if_end14
_copy_if_thenBB24:
    slli __t.0,_copy_o.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.2,__t.0
    lw __t.0, 0(__t.0)
    mv	__mergedretVal.3,__t.0 
    mv	_gnow.8,_gnow.2 
    mv	_gL.8,_gL.2 
    mv	_gt.8,_gt.2 
    mv	_gMOD.8,_gMOD.2 
    mv	_gs.8,_gs.2 
    mv	_gpr.8,_gpr.2 
    mv	__mergedretVal.4,__mergedretVal.3 
    mv	_gpl.8,_gpl.2 
    mv	_gsum.8,_gsum.2 
    j	afterCallBB4
if_thenBB11:
    mv	_copy_o.2,lc.1 
    mv	_copy_l.2,l.0 
    mv	_copy_r.2,mid.1 
    ble	_gpl.0,_copy_l.2,	_copy_ifTrue6
_copy_if_end18:
    slli __t.0,_copy_o.2,    1
    mv	__lc.3,__t.0 
    slli __t.0,_copy_o.2,    1
    addi __t.0,__t.0,    1
    mv	__rc.3,__t.0 
    add __t.0,_copy_l.2,_copy_r.2
    srai __t.0,__t.0,    1
    mv	__mid.3,__t.0 
    slli __t.0,_copy_o.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gt.0,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB25
_copy_if_end19:
    ble	_gpl.0,__mid.3,	_copy_if_thenBB26
paracopy20:
    mv	_gnow.11,_gnow.0 
    mv	_gL.11,_gL.0 
    mv	_gt.11,_gt.0 
    mv	_gMOD.11,_gMOD.0 
    mv	_gs.11,_gs.0 
    mv	_gpr.11,_gpr.0 
    mv	_gpl.11,_gpl.0 
    mv	_gsum.11,_gsum.0 
    mv	__ss.5,zero 
_copy_if_end20:
    addi __t.0,__mid.3,    1
    bge	_gpr.11,__t.0,	_copy_if_thenBB27
paracopy21:
    mv	_gnow.13,_gnow.11 
    mv	_gL.13,_gL.11 
    mv	_gt.13,_gt.11 
    mv	_gMOD.13,_gMOD.11 
    mv	_gs.13,_gs.11 
    mv	_gpr.13,_gpr.11 
    mv	__ss.7,__ss.5 
    mv	_gpl.13,_gpl.11 
    mv	_gsum.13,_gsum.11 
_copy_if_end21:
    mv	__mergedretVal.4,__ss.7 
    mv	_gnow.9,_gnow.13 
    mv	_gL.9,_gL.13 
    mv	_gt.9,_gt.13 
    mv	_gMOD.9,_gMOD.13 
    mv	_gs.9,_gs.13 
    mv	_gpr.9,_gpr.13 
    mv	_gpl.9,_gpl.13 
    mv	_gsum.9,_gsum.13 
    mv	__mergedretVal.2,__mergedretVal.4 
afterCallBB5:
    mv	t.0,__mergedretVal.2 
    add t.0,t.0,zero
    rem t.0,t.0,_gMOD.9
    mv	ss.5,t.0 
    mv	_gnow.2,_gnow.9 
    mv	_gL.2,_gL.9 
    mv	_gt.2,_gt.9 
    mv	_gMOD.2,_gMOD.9 
    mv	_gs.2,_gs.9 
    mv	_gpr.2,_gpr.9 
    mv	_gpl.2,_gpl.9 
    mv	_gsum.2,_gsum.9 
    mv	ss.2,ss.5 
    j	if_end9
_copy_if_thenBB27:
    addi __t.0,__mid.3,    1
    lui _lobits,%hi(t)
    sw _gt.11, %lo(t)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.11, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.11, %lo(now)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.11, %lo(pr)(_lobits)
    lui _lobits,%hi(MOD)
    sw _gMOD.11, %lo(MOD)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.11, %lo(pl)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.11, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.11, %lo(L)(_lobits)
    mv	a0,__rc.3 
    mv	a1,__t.0 
    mv	a2,_copy_r.2 
    call	query
    mv	__t.0,a0 
    la ptr,L    
    lw _gL.12, 0(ptr)
    la ptr,sum    
    lw _gsum.12, 0(ptr)
    la ptr,pl    
    lw _gpl.12, 0(ptr)
    la ptr,MOD    
    lw _gMOD.12, 0(ptr)
    la ptr,pr    
    lw _gpr.12, 0(ptr)
    la ptr,now    
    lw _gnow.12, 0(ptr)
    la ptr,s    
    lw _gs.12, 0(ptr)
    la ptr,t    
    lw _gt.12, 0(ptr)
    add __t.0,__ss.5,__t.0
    rem __t.0,__t.0,_gMOD.12
    mv	__ss.6,__t.0 
    mv	_gnow.13,_gnow.12 
    mv	_gL.13,_gL.12 
    mv	_gt.13,_gt.12 
    mv	_gMOD.13,_gMOD.12 
    mv	_gs.13,_gs.12 
    mv	_gpr.13,_gpr.12 
    mv	__ss.7,__ss.6 
    mv	_gpl.13,_gpl.12 
    mv	_gsum.13,_gsum.12 
    j	_copy_if_end21
_copy_if_thenBB26:
    lui _lobits,%hi(t)
    sw _gt.0, %lo(t)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.0, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.0, %lo(now)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.0, %lo(pr)(_lobits)
    lui _lobits,%hi(MOD)
    sw _gMOD.0, %lo(MOD)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.0, %lo(pl)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.0, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.0, %lo(L)(_lobits)
    mv	a0,__lc.3 
    mv	a1,_copy_l.2 
    mv	a2,__mid.3 
    call	query
    mv	__t.0,a0 
    la ptr,L    
    lw _gL.10, 0(ptr)
    la ptr,sum    
    lw _gsum.10, 0(ptr)
    la ptr,pl    
    lw _gpl.10, 0(ptr)
    la ptr,MOD    
    lw _gMOD.10, 0(ptr)
    la ptr,pr    
    lw _gpr.10, 0(ptr)
    la ptr,now    
    lw _gnow.10, 0(ptr)
    la ptr,s    
    lw _gs.10, 0(ptr)
    la ptr,t    
    lw _gt.10, 0(ptr)
    add __t.0,__t.0,zero
    rem __t.0,__t.0,_gMOD.10
    mv	__ss.4,__t.0 
    mv	_gnow.11,_gnow.10 
    mv	_gL.11,_gL.10 
    mv	_gt.11,_gt.10 
    mv	_gMOD.11,_gMOD.10 
    mv	_gs.11,_gs.10 
    mv	_gpr.11,_gpr.10 
    mv	__ss.5,__ss.4 
    mv	_gpl.11,_gpl.10 
    mv	_gsum.11,_gsum.10 
    j	_copy_if_end20
_copy_if_thenBB25:
    mv	___o.4,_copy_o.2 
    slli ___t.0,___o.4,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    lw ___t.0, 0(___t.0)
    bgt	___t.0,zero,	_copy__if_thenBB4
    j	_copy_if_end19
_copy__if_thenBB4:
    slli ___t.0,___o.4,    1
    mv	___lc.0,___t.0 
    slli ___t.0,___o.4,    1
    addi ___t.0,___t.0,    1
    mv	___rc.0,___t.0 
    slli ___t.0,___o.4,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.0,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.0,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gs.0,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.0,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    slli ___t.0,___t.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,___t.0,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gsum.0,___t.0
    lw ___t.0, 0(___t.0)
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.4,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.0
    slli ___t.0,___lc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.4,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.0,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.0,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gs.0,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gnow.0,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    slli ___t.0,___t.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,___t.0,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gsum.0,___t.0
    lw ___t.0, 0(___t.0)
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.4,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    lw ___t.0, 0(___t.0)
    lw ___t.0, 0(___t.0)
    add ___t.0,___t.0,___t.0
    rem ___t.0,___t.0,_gL.0
    slli ___t.0,___rc.0,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    sw ___t.0,0(___t.0)
    slli ___t.0,___o.4,    2
    addi ___t.0,___t.0,    4
    add ___t.0,_gt.0,___t.0
    li _t, 0
    sw _t,0(___t.0)
    j	_copy_if_end19
_copy_ifTrue6:
    bge	_gpr.0,_copy_r.2,	_copy_if_thenBB28
    j	_copy_if_end18
_copy_if_thenBB28:
    slli __t.0,_copy_o.2,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.0,__t.0
    lw __t.0, 0(__t.0)
    mv	__mergedretVal.3,__t.0 
    mv	_gnow.9,_gnow.0 
    mv	_gL.9,_gL.0 
    mv	_gt.9,_gt.0 
    mv	_gMOD.9,_gMOD.0 
    mv	_gs.9,_gs.0 
    mv	_gpr.9,_gpr.0 
    mv	_gpl.9,_gpl.0 
    mv	_gsum.9,_gsum.0 
    mv	__mergedretVal.2,__mergedretVal.3 
    j	afterCallBB5
if_thenBB10:
    mv	_o.1,o.0 
    slli _t.0,_o.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    lw _t.0, 0(_t.0)
    bgt	_t.0,zero,	_if_thenBB2
    j	if_end8
_if_thenBB2:
    slli _t.0,_o.1,    1
    mv	_lc.0,_t.0 
    slli _t.0,_o.1,    1
    addi _t.0,_t.0,    1
    mv	_rc.0,_t.0 
    slli _t.0,_o.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gnow.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    add _t.0,_t.0,_t.0
    rem _t.0,_t.0,_gL.0
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gnow.0,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gs.0,_t.0
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gnow.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gsum.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,0(_t.0)
    slli _t.0,_o.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    add _t.0,_t.0,_t.0
    rem _t.0,_t.0,_gL.0
    slli _t.0,_lc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_o.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gnow.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    add _t.0,_t.0,_t.0
    rem _t.0,_t.0,_gL.0
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gnow.0,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gs.0,_t.0
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gnow.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    slli _t.0,_t.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_t.0,_t.0
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gsum.0,_t.0
    lw _t.0, 0(_t.0)
    sw _t.0,0(_t.0)
    slli _t.0,_o.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    lw _t.0, 0(_t.0)
    lw _t.0, 0(_t.0)
    add _t.0,_t.0,_t.0
    rem _t.0,_t.0,_gL.0
    slli _t.0,_rc.0,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    sw _t.0,0(_t.0)
    slli _t.0,_o.1,    2
    addi _t.0,_t.0,    4
    add _t.0,_gt.0,_t.0
    li _t, 0
    sw _t,0(_t.0)
    j	if_end8
ifTrue3:
    bge	_gpr.0,r.0,	if_thenBB13
    j	if_end7
if_thenBB13:
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.0,t.0
    lw t.0, 0(t.0)
    mv	mergedretVal.2,t.0 
    mv	_gnow.1,_gnow.0 
    mv	_gL.1,_gL.0 
    mv	_gt.1,_gt.0 
    mv	mergedretVal.0,mergedretVal.2 
    mv	_gMOD.1,_gMOD.0 
    mv	_gs.1,_gs.0 
    mv	_gpr.1,_gpr.0 
    mv	_gpl.1,_gpl.0 
    mv	_gsum.1,_gsum.0 
    j	query.exitBB1
								 # func end
    .globl	build				#begin
    .p2align	2
    .type	build,@function
build:
build.entryBB1:
    mv	backup_ra,ra 
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
    mv	back_s10,s10 
    mv	r.0,a2 
    mv	l.0,a1 
    mv	o.0,a0 
    la ptr,L    
    lw _gL.0, 0(ptr)
    la ptr,sum    
    lw _gsum.0, 0(ptr)
    la ptr,b    
    lw _gb.0, 0(ptr)
    la ptr,p    
    lw _gp.0, 0(ptr)
    la ptr,now    
    lw _gnow.0, 0(ptr)
    la ptr,s    
    lw _gs.0, 0(ptr)
    la ptr,flag    
    lw _gflag.0, 0(ptr)
    la ptr,a    
    lw _ga.0, 0(ptr)
    beq	l.0,r.0,	if_thenBB14
if_elseBB2:
    slli t.0,o.0,    1
    mv	lc.0,t.0 
    slli t.0,o.0,    1
    addi t.0,t.0,    1
    mv	rc.0,t.0 
    add t.0,l.0,r.0
    srai t.0,t.0,    1
    mv	mid.0,t.0 
    mv	_copy_o.0,lc.0 
    mv	_copy_l.0,l.0 
    mv	_copy_r.0,mid.0 
    beq	_copy_l.0,_copy_r.0,	_copy_if_thenBB29
_copy_if_elseBB4:
    slli __t.0,_copy_o.0,    1
    mv	__lc.1,__t.0 
    slli __t.0,_copy_o.0,    1
    addi __t.0,__t.0,    1
    mv	__rc.1,__t.0 
    add __t.0,_copy_l.0,_copy_r.0
    srai __t.0,__t.0,    1
    mv	__mid.0,__t.0 
    lui _lobits,%hi(a)
    sw _ga.0, %lo(a)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.0, %lo(flag)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.0, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.0, %lo(now)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.0, %lo(p)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.0, %lo(b)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.0, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.0, %lo(L)(_lobits)
    mv	a0,__lc.1 
    mv	a1,_copy_l.0 
    mv	a2,__mid.0 
    call	build
    la ptr,L    
    lw _gL.5, 0(ptr)
    la ptr,sum    
    lw _gsum.5, 0(ptr)
    la ptr,b    
    lw _gb.5, 0(ptr)
    la ptr,p    
    lw _gp.5, 0(ptr)
    la ptr,now    
    lw _gnow.5, 0(ptr)
    la ptr,s    
    lw _gs.5, 0(ptr)
    la ptr,flag    
    lw _gflag.5, 0(ptr)
    la ptr,a    
    lw _ga.5, 0(ptr)
    addi __t.0,__mid.0,    1
    lui _lobits,%hi(a)
    sw _ga.5, %lo(a)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.5, %lo(flag)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.5, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.5, %lo(now)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.5, %lo(p)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.5, %lo(b)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.5, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.5, %lo(L)(_lobits)
    mv	a0,__rc.1 
    mv	a1,__t.0 
    mv	a2,_copy_r.0 
    call	build
    la ptr,L    
    lw _gL.6, 0(ptr)
    la ptr,sum    
    lw _gsum.6, 0(ptr)
    la ptr,b    
    lw _gb.6, 0(ptr)
    la ptr,p    
    lw _gp.6, 0(ptr)
    la ptr,now    
    lw _gnow.6, 0(ptr)
    la ptr,s    
    lw _gs.6, 0(ptr)
    la ptr,flag    
    lw _gflag.6, 0(ptr)
    la ptr,a    
    lw _ga.6, 0(ptr)
    slli __t.0,__rc.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.6,__t.0
    slli __t.0,__lc.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.6,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.6,__t.0
    sw __t.0,0(__t.0)
    slli __t.0,__rc.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.6,__t.0
    slli __t.0,__lc.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.6,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    and __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.6,__t.0
    sw __t.0,0(__t.0)
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.6,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB30
paracopy22:
    mv	_gflag.1,_gflag.6 
    mv	_gb.1,_gb.6 
    mv	_gsum.1,_gsum.6 
    mv	_ga.1,_ga.6 
    mv	_gL.1,_gL.6 
    mv	_gs.1,_gs.6 
    mv	_gnow.1,_gnow.6 
    mv	_gp.1,_gp.6 
afterCallBB6:
    addi t.0,mid.0,    1
    mv	_copy_o.0,rc.0 
    mv	_copy_l.0,t.0 
    mv	_copy_r.0,r.0 
    beq	_copy_l.0,_copy_r.0,	_copy_if_thenBB31
_copy_if_elseBB5:
    slli __t.0,_copy_o.0,    1
    mv	__lc.0,__t.0 
    slli __t.0,_copy_o.0,    1
    addi __t.0,__t.0,    1
    mv	__rc.0,__t.0 
    add __t.0,_copy_l.0,_copy_r.0
    srai __t.0,__t.0,    1
    mv	__mid.0,__t.0 
    lui _lobits,%hi(a)
    sw _ga.1, %lo(a)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.1, %lo(flag)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.1, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.1, %lo(now)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.1, %lo(p)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.1, %lo(b)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.1, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.1, %lo(L)(_lobits)
    mv	a0,__lc.0 
    mv	a1,_copy_l.0 
    mv	a2,__mid.0 
    call	build
    la ptr,L    
    lw _gL.2, 0(ptr)
    la ptr,sum    
    lw _gsum.2, 0(ptr)
    la ptr,b    
    lw _gb.2, 0(ptr)
    la ptr,p    
    lw _gp.2, 0(ptr)
    la ptr,now    
    lw _gnow.2, 0(ptr)
    la ptr,s    
    lw _gs.2, 0(ptr)
    la ptr,flag    
    lw _gflag.2, 0(ptr)
    la ptr,a    
    lw _ga.2, 0(ptr)
    addi __t.0,__mid.0,    1
    lui _lobits,%hi(a)
    sw _ga.2, %lo(a)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.2, %lo(flag)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.2, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.2, %lo(now)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.2, %lo(p)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.2, %lo(b)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.2, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.2, %lo(L)(_lobits)
    mv	a0,__rc.0 
    mv	a1,__t.0 
    mv	a2,_copy_r.0 
    call	build
    la ptr,L    
    lw _gL.3, 0(ptr)
    la ptr,sum    
    lw _gsum.3, 0(ptr)
    la ptr,b    
    lw _gb.3, 0(ptr)
    la ptr,p    
    lw _gp.3, 0(ptr)
    la ptr,now    
    lw _gnow.3, 0(ptr)
    la ptr,s    
    lw _gs.3, 0(ptr)
    la ptr,flag    
    lw _gflag.3, 0(ptr)
    la ptr,a    
    lw _ga.3, 0(ptr)
    slli __t.0,__rc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.3,__t.0
    slli __t.0,__lc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.3,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.3,__t.0
    sw __t.0,0(__t.0)
    slli __t.0,__rc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.3,__t.0
    slli __t.0,__lc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.3,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    and __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.3,__t.0
    sw __t.0,0(__t.0)
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.3,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB32
paracopy23:
    mv	_gflag.4,_gflag.3 
    mv	_gb.4,_gb.3 
    mv	_gsum.4,_gsum.3 
    mv	_ga.4,_ga.3 
    mv	_gL.4,_gL.3 
    mv	_gs.4,_gs.3 
    mv	_gnow.4,_gnow.3 
    mv	_gp.4,_gp.3 
afterCallBB7:
    slli t.0,rc.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.4,t.0
    slli t.0,lc.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.4,t.0
    lw t.0, 0(t.0)
    lw t.0, 0(t.0)
    add t.0,t.0,t.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.4,t.0
    sw t.0,0(t.0)
    slli t.0,rc.0,    2
    addi t.0,t.0,    4
    add t.0,_gflag.4,t.0
    slli t.0,lc.0,    2
    addi t.0,t.0,    4
    add t.0,_gflag.4,t.0
    lw t.0, 0(t.0)
    lw t.0, 0(t.0)
    and t.0,t.0,t.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gflag.4,t.0
    sw t.0,0(t.0)
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gflag.4,t.0
    lw t.0, 0(t.0)
    bgt	t.0,zero,	if_thenBB15
paracopy24:
    mv	_gflag.7,_gflag.4 
    mv	_gb.7,_gb.4 
    mv	_gsum.7,_gsum.4 
    mv	_ga.7,_ga.4 
    mv	_gL.7,_gL.4 
    mv	_gs.7,_gs.4 
    mv	_gnow.7,_gnow.4 
    mv	_gp.7,_gp.4 
if_end11:
    lui _lobits,%hi(a)
    sw _ga.7, %lo(a)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.7, %lo(flag)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.7, %lo(s)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.7, %lo(now)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.7, %lo(p)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.7, %lo(b)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.7, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.7, %lo(L)(_lobits)
    mv	s10,back_s10 
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
    mv	ra,backup_ra 
    ret
if_thenBB15:
    mv	i.2,zero 
forcondBB3:
    blt	i.2,_gL.4,	forbodyBB3
afterForBB2:
    li _t, 0
    sw _t,4(_gnow.4)
    mv	_gflag.7,_gflag.4 
    mv	_gb.7,_gb.4 
    mv	_gsum.7,_gsum.4 
    mv	_ga.7,_ga.4 
    mv	_gL.7,_gL.4 
    mv	_gs.7,_gs.4 
    mv	_gnow.7,_gnow.4 
    mv	_gp.7,_gp.4 
    j	if_end11
forbodyBB3:
    slli t.0,rc.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.4,t.0
    lw t.0, 0(t.0)
    slli t.0,i.2,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    slli t.0,lc.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.4,t.0
    lw t.0, 0(t.0)
    slli t.0,i.2,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    lw t.0, 0(t.0)
    add t.0,t.0,t.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.4,t.0
    lw t.0, 0(t.0)
    slli t.0,i.2,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    sw t.0,0(t.0)
    addi i.3,i.2,    1
    mv	i.2,i.3 
    j	forcondBB3
_copy_if_thenBB32:
    mv	__i.2,zero 
_copy_forcondBB5:
    blt	__i.2,_gL.3,	_copy_forbodyBB5
_copy_afterForBB3:
    li _t, 0
    sw _t,4(_gnow.3)
    mv	_gflag.4,_gflag.3 
    mv	_gb.4,_gb.3 
    mv	_gsum.4,_gsum.3 
    mv	_ga.4,_ga.3 
    mv	_gL.4,_gL.3 
    mv	_gs.4,_gs.3 
    mv	_gnow.4,_gnow.3 
    mv	_gp.4,_gp.3 
    j	afterCallBB7
_copy_forbodyBB5:
    slli __t.0,__rc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.3,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    slli __t.0,__lc.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.3,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.3,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    addi __i.3,__i.2,    1
    mv	__i.2,__i.3 
    j	_copy_forcondBB5
_copy_if_thenBB31:
    slli __t.0,_copy_l.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_ga.1,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.1,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    slli __t.0,_copy_l.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_ga.1,__t.0
    lw __t.0, 0(__t.0)
    blt	__t.0,_gp.1,	_copy_ifTrue7
_copy_if_end22:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.1,__t.0
    li _t, 0
    sw _t,0(__t.0)
    mv	_gflag.4,_gflag.1 
    mv	_gb.4,_gb.1 
    mv	_gsum.4,_gsum.1 
    mv	_ga.4,_ga.1 
    mv	_gL.4,_gL.1 
    mv	_gs.4,_gs.1 
    mv	_gnow.4,_gnow.1 
    mv	_gp.4,_gp.1 
    j	afterCallBB7
_copy_ifTrue7:
    slli __t.0,_copy_l.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_ga.1,__t.0
    lw __t.0, 0(__t.0)
    bge	__t.0,zero,	_copy_ifTrue8
    j	_copy_if_end22
_copy_ifTrue8:
    slli __t.0,_copy_l.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_ga.1,__t.0
    lw __t.0, 0(__t.0)
    rem __t.0,__t.0,_gp.1
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gb.1,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB33
    j	_copy_if_end22
_copy_if_thenBB33:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.1,__t.0
    li _t, 1
    sw _t,0(__t.0)
    slli __t.0,_copy_l.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_ga.1,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.1,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    sw __t.0,4(__t.0)
    li __i.7, 1
_copy_forcondBB6:
    blt	__i.7,_gL.1,	_copy_forbodyBB6
    j	_copy_if_end22
_copy_forbodyBB6:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.1,__t.0
    addi __t.0,__i.7,    -1
    lw __t.0, 0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    mv	___x.0,__t.0 
    rem ___t.0,___x.0,_gp.1
    mul ___t.0,___t.0,___t.0
    mv	__t.0,___t.0 
    rem __t.0,__t.0,_gp.1
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.1,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__i.7,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    addi __i.8,__i.7,    1
    mv	__i.7,__i.8 
    j	_copy_forcondBB6
_copy_if_thenBB30:
    mv	__i.7,zero 
_copy_forcondBB7:
    blt	__i.7,_gL.6,	_copy_forbodyBB7
_copy_afterForBB4:
    li _t, 0
    sw _t,4(_gnow.6)
    mv	_gflag.1,_gflag.6 
    mv	_gb.1,_gb.6 
    mv	_gsum.1,_gsum.6 
    mv	_ga.1,_ga.6 
    mv	_gL.1,_gL.6 
    mv	_gs.1,_gs.6 
    mv	_gnow.1,_gnow.6 
    mv	_gp.1,_gp.6 
    j	afterCallBB6
_copy_forbodyBB7:
    slli __t.0,__rc.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.6,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__i.7,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    slli __t.0,__lc.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.6,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__i.7,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.6,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__i.7,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    addi __i.8,__i.7,    1
    mv	__i.7,__i.8 
    j	_copy_forcondBB7
_copy_if_thenBB29:
    slli __t.0,_copy_l.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_ga.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gsum.0,__t.0
    lw __t.0, 0(__t.0)
    sw __t.0,0(__t.0)
    slli __t.0,_copy_l.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_ga.0,__t.0
    lw __t.0, 0(__t.0)
    blt	__t.0,_gp.0,	_copy_ifTrue9
_copy_if_end23:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gnow.0,__t.0
    li _t, 0
    sw _t,0(__t.0)
    mv	_gflag.1,_gflag.0 
    mv	_gb.1,_gb.0 
    mv	_gsum.1,_gsum.0 
    mv	_ga.1,_ga.0 
    mv	_gL.1,_gL.0 
    mv	_gs.1,_gs.0 
    mv	_gnow.1,_gnow.0 
    mv	_gp.1,_gp.0 
    j	afterCallBB6
_copy_ifTrue9:
    slli __t.0,_copy_l.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_ga.0,__t.0
    lw __t.0, 0(__t.0)
    bge	__t.0,zero,	_copy_ifTrue10
    j	_copy_if_end23
_copy_ifTrue10:
    slli __t.0,_copy_l.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_ga.0,__t.0
    lw __t.0, 0(__t.0)
    rem __t.0,__t.0,_gp.0
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gb.0,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB34
    j	_copy_if_end23
_copy_if_thenBB34:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gflag.0,__t.0
    li _t, 1
    sw _t,0(__t.0)
    slli __t.0,_copy_l.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_ga.0,__t.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.0,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    sw __t.0,4(__t.0)
    li __i.3, 1
_copy_forcondBB8:
    blt	__i.3,_gL.0,	_copy_forbodyBB8
    j	_copy_if_end23
_copy_forbodyBB8:
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.0,__t.0
    addi __t.0,__i.3,    -1
    lw __t.0, 0(__t.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    mv	___x.0,__t.0 
    rem ___t.0,___x.0,_gp.0
    mul ___t.0,___t.0,___t.0
    mv	__t.0,___t.0 
    rem __t.0,__t.0,_gp.0
    slli __t.0,_copy_o.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gs.0,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,__i.3,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    addi __i.4,__i.3,    1
    mv	__i.3,__i.4 
    j	_copy_forcondBB8
if_thenBB14:
    slli t.0,l.0,    2
    addi t.0,t.0,    4
    add t.0,_ga.0,t.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gsum.0,t.0
    lw t.0, 0(t.0)
    sw t.0,0(t.0)
    slli t.0,l.0,    2
    addi t.0,t.0,    4
    add t.0,_ga.0,t.0
    lw t.0, 0(t.0)
    blt	t.0,_gp.0,	ifTrue4
if_end12:
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gnow.0,t.0
    li _t, 0
    sw _t,0(t.0)
    mv	_gflag.7,_gflag.0 
    mv	_gb.7,_gb.0 
    mv	_gsum.7,_gsum.0 
    mv	_ga.7,_ga.0 
    mv	_gL.7,_gL.0 
    mv	_gs.7,_gs.0 
    mv	_gnow.7,_gnow.0 
    mv	_gp.7,_gp.0 
    j	if_end11
ifTrue4:
    slli t.0,l.0,    2
    addi t.0,t.0,    4
    add t.0,_ga.0,t.0
    lw t.0, 0(t.0)
    bge	t.0,zero,	ifTrue5
    j	if_end12
ifTrue5:
    slli t.0,l.0,    2
    addi t.0,t.0,    4
    add t.0,_ga.0,t.0
    lw t.0, 0(t.0)
    rem t.0,t.0,_gp.0
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gb.0,t.0
    lw t.0, 0(t.0)
    bgt	t.0,zero,	if_thenBB16
    j	if_end12
if_thenBB16:
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gflag.0,t.0
    li _t, 1
    sw _t,0(t.0)
    slli t.0,l.0,    2
    addi t.0,t.0,    4
    add t.0,_ga.0,t.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.0,t.0
    lw t.0, 0(t.0)
    lw t.0, 0(t.0)
    sw t.0,4(t.0)
    li i.5, 1
forcondBB4:
    blt	i.5,_gL.0,	forbodyBB4
    j	if_end12
forbodyBB4:
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.0,t.0
    addi t.0,i.5,    -1
    lw t.0, 0(t.0)
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    mv	_x.0,t.0 
    rem _t.0,_x.0,_gp.0
    mul _t.0,_t.0,_t.0
    mv	t.0,_t.0 
    rem t.0,t.0,_gp.0
    slli t.0,o.0,    2
    addi t.0,t.0,    4
    add t.0,_gs.0,t.0
    lw t.0, 0(t.0)
    slli t.0,i.5,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    sw t.0,0(t.0)
    addi i.6,i.5,    1
    mv	i.5,i.6 
    j	forcondBB4
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    mv	backup_ra,ra 
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
    mv	back_s10,s10 
    li t, 2000024
    mv	a0,t 
    call malloc
    mv	t.0,a0 
    li _t, 500005
    sw _t,0(t.0)
    mv	_gb.0,t.0 
    li t, 2000024
    mv	a0,t 
    call malloc
    mv	t.0,a0 
    li _t, 500005
    sw _t,0(t.0)
    mv	_gnow.0,t.0 
    li t, 2000024
    mv	a0,t 
    call malloc
    mv	t.0,a0 
    li _t, 500005
    sw _t,0(t.0)
    mv	_gt.0,t.0 
    li t, 800024
    mv	a0,t 
    call malloc
    mv	t.0,a0 
    li _t, 200005
    sw _t,0(t.0)
    mv	_ga.0,t.0 
    li t, 2000024
    mv	a0,t 
    call malloc
    mv	t.0,a0 
    li _t, 500005
    sw _t,0(t.0)
    mv	_gflag.0,t.0 
    li t, 2000024
    mv	a0,t 
    call malloc
    mv	t.0,a0 
    li _t, 500005
    sw _t,0(t.0)
    mv	t.0,t.0 
    addi t.1,t.0,    4
    mv	t.0,t.0 
    li t, 2000020
    add t.1,t.0,t
    mv	t.2,t.1 
forcondBB5:
    ble	t.2,t.1,	forupdateBB1
afterForBB3:
    mv	_gs.0,t.0 
    li t, 2000024
    mv	a0,t 
    call malloc
    mv	t.0,a0 
    li _t, 500005
    sw _t,0(t.0)
    mv	_gsum.0,t.0 
    call	getInt
    mv	_t.0,a0 
    mv	_gn.0,_t.0 
    call	getInt
    mv	_t.0,a0 
    mv	_gm.0,_t.0 
    call	getInt
    mv	_t.0,a0 
    mv	_gp.0,_t.0 
    li _i.2, 1
    li _gno.1, 1
_forcondBB1:
    ble	_i.2,_gn.0,	_forbodyBB1
_afterForBB1:
    li t, 560024
    mv	a0,t 
    call malloc
    mv	__t.0,a0 
    li _t, 140005
    sw _t,0(__t.0)
    mv	__c.0,__t.0 
    li __i.2, 2
__forcondBB1:
    blt	__i.2,_gp.0,	__forbodyBB1
__afterForBB1:
    li __i.4, 2
__forcondBB2:
    blt	__i.4,_gp.0,	__forbodyBB2
__afterForBB2:
    li __i.6, 2
    li _gL.1, 1
__forcondBB3:
    blt	__i.6,_gp.0,	__forbodyBB3
_afterCallBB1:
    li _t, 1
    sw _t,4(_gb.0)
    li _t, 1
    sw _t,8(_gb.0)
    mv	_copy_r.0,_gn.0 
    li t, 1
    beq	t,_copy_r.0,	_copy_if_thenBB35
_copy_if_elseBB6:
    addi __t.0,_copy_r.0,    1
    srai __t.0,__t.0,    1
    mv	__mid.0,__t.0 
    lui _lobits,%hi(a)
    sw _ga.0, %lo(a)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.0, %lo(s)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.0, %lo(p)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.0, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.1, %lo(L)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.0, %lo(flag)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.0, %lo(now)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.0, %lo(b)(_lobits)
    li para, 2
    mv	a0,para 
    li para, 1
    mv	a1,para 
    mv	a2,__mid.0 
    call	build
    la ptr,b    
    lw _gb.4, 0(ptr)
    la ptr,now    
    lw _gnow.6, 0(ptr)
    la ptr,flag    
    lw _gflag.4, 0(ptr)
    la ptr,L    
    lw _gL.7, 0(ptr)
    la ptr,sum    
    lw _gsum.6, 0(ptr)
    la ptr,p    
    lw _gp.4, 0(ptr)
    la ptr,s    
    lw _gs.6, 0(ptr)
    la ptr,a    
    lw _ga.2, 0(ptr)
    addi __t.0,__mid.0,    1
    lui _lobits,%hi(a)
    sw _ga.2, %lo(a)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.6, %lo(s)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.4, %lo(p)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.6, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.7, %lo(L)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.4, %lo(flag)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.6, %lo(now)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.4, %lo(b)(_lobits)
    li para, 3
    mv	a0,para 
    mv	a1,__t.0 
    mv	a2,_copy_r.0 
    call	build
    la ptr,b    
    lw _gb.5, 0(ptr)
    la ptr,now    
    lw _gnow.7, 0(ptr)
    la ptr,flag    
    lw _gflag.5, 0(ptr)
    la ptr,L    
    lw _gL.8, 0(ptr)
    la ptr,sum    
    lw _gsum.7, 0(ptr)
    la ptr,p    
    lw _gp.5, 0(ptr)
    la ptr,s    
    lw _gs.7, 0(ptr)
    la ptr,a    
    lw _ga.3, 0(ptr)
    lw __t.0, 12(_gsum.7)
    lw __t.0, 16(_gsum.7)
    add __t.0,__t.0,__t.0
    sw __t.0,8(_gsum.7)
    lw __t.0, 12(_gflag.5)
    lw __t.0, 16(_gflag.5)
    and __t.0,__t.0,__t.0
    sw __t.0,8(_gflag.5)
    lw __t.0, 8(_gflag.5)
    bgt	__t.0,zero,	_copy_if_thenBB36
paracopy25:
    mv	_gnow.1,_gnow.7 
    mv	_gflag.1,_gflag.5 
    mv	_gm.1,_gm.0 
    mv	_gb.1,_gb.5 
    mv	_ga.1,_ga.3 
    mv	_gsum.1,_gsum.7 
    mv	_gt.1,_gt.0 
    mv	_gno.6,_gno.1 
    mv	_gp.1,_gp.5 
    mv	_gs.1,_gs.7 
    mv	_gL.2,_gL.8 
    mv	_gpl.1,zero 
    li t, 32761
    mv	_gMOD.1,t 
    mv	_gans.1,zero 
    mv	_gpr.1,zero 
_whileCondBB1:
    bgt	_gm.1,zero,	_whileBodyBB1
afterCallBB8:
    mv	a0,_gans.1 
    call	printInt
    lui _lobits,%hi(t)
    sw _gt.1, %lo(t)(_lobits)
    lui _lobits,%hi(a)
    sw _ga.1, %lo(a)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.1, %lo(s)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.1, %lo(pr)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.1, %lo(p)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.1, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.2, %lo(L)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.1, %lo(flag)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.1, %lo(now)(_lobits)
    lui _lobits,%hi(MOD)
    sw _gMOD.1, %lo(MOD)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.1, %lo(b)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.1, %lo(pl)(_lobits)
    mv	s10,back_s10 
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
    mv	ra,backup_ra 
    mv	a0,zero 
    ret
_whileBodyBB1:
    mv	_gno.7,_gno.6 
    li __i.3, 1
__forcondBB4:
    li t, 3
    blt	__i.3,t,	__forbodyBB4
__afterForBB3:
    blt	_gno.7,zero,	__if_thenBB1
paracopy26:
    mv	_gno.10,_gno.7 
_afterCallBB2:
    mv	_t.0,_gno.10 
    li t, 1
    and _t.0,_t.0,t
    mv	_gop.1,_t.0 
    mv	__high.0,_gn.0 
    li t, 1
    sub __t.0,__high.0,t
    addi __t.1,__t.0,    1
    mv	_gno.11,_gno.10 
    li _i.3, 1
_forcondBB2:
    li t, 3
    blt	_i.3,t,	_forbodyBB2
_afterForBB2:
    blt	_gno.11,zero,	_if_thenBB3
paracopy27:
    mv	_gno.14,_gno.11 
afterCallBB9:
    mv	__t.0,_gno.14 
    rem __t.0,__t.0,__t.1
    addi __t.0,__t.0,    1
    addi __t.0,__t.0,    1
    mv	_t.0,__t.0 
    mv	_gpl.2,_t.0 
    mv	__high.0,_gn.0 
    li t, 1
    sub __t.0,__high.0,t
    addi __t.1,__t.0,    1
    mv	_gno.15,_gno.14 
    li _i.3, 1
_forcondBB3:
    li t, 3
    blt	_i.3,t,	_forbodyBB3
_afterForBB3:
    blt	_gno.15,zero,	_if_thenBB4
paracopy28:
    mv	_gno.18,_gno.15 
afterCallBB10:
    mv	__t.0,_gno.18 
    rem __t.0,__t.0,__t.1
    addi __t.0,__t.0,    1
    addi __t.0,__t.0,    1
    mv	_t.0,__t.0 
    mv	_gpr.2,_t.0 
    mv	_gno.19,_gno.18 
    mv	_gpr.3,_gpr.2 
_whileCondBB2:
    ble	_gpr.3,_gpl.2,	_whileBodyBB2
_afterWhileBB1:
    beq	_gop.1,zero,	_if_thenBB5
paracopy29:
    mv	_gnow.3,_gnow.1 
    mv	_gflag.3,_gflag.1 
    mv	_gpl.4,_gpl.2 
    mv	_gb.3,_gb.1 
    mv	_gsum.3,_gsum.1 
    mv	_gt.3,_gt.1 
    mv	_gp.3,_gp.1 
    mv	_gs.3,_gs.1 
    mv	_gpr.5,_gpr.3 
    mv	_gL.4,_gL.2 
_if_end1:
    li t, 1
    beq	_gop.1,t,	_if_thenBB6
paracopy30:
    mv	_gnow.4,_gnow.3 
    mv	_gpl.5,_gpl.4 
    mv	_gMOD.2,_gMOD.1 
    mv	_gsum.4,_gsum.3 
    mv	_gt.4,_gt.3 
    mv	_gans.2,_gans.1 
    mv	_gs.4,_gs.3 
    mv	_gpr.6,_gpr.5 
    mv	_gL.5,_gL.4 
_if_end2:
    addi _gm.2,_gm.1,    -1
    mv	_gnow.1,_gnow.4 
    mv	_gflag.1,_gflag.3 
    mv	_gpl.1,_gpl.5 
    mv	_gMOD.1,_gMOD.2 
    mv	_gm.1,_gm.2 
    mv	_gb.1,_gb.3 
    mv	_gsum.1,_gsum.4 
    mv	_gt.1,_gt.4 
    mv	_gno.6,_gno.19 
    mv	_gp.1,_gp.3 
    mv	_gans.1,_gans.2 
    mv	_gs.1,_gs.4 
    mv	_gpr.1,_gpr.6 
    mv	_gL.2,_gL.5 
    j	_whileCondBB1
_if_thenBB6:
    lui _lobits,%hi(t)
    sw _gt.3, %lo(t)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.3, %lo(s)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.5, %lo(pr)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.3, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.4, %lo(L)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.3, %lo(now)(_lobits)
    lui _lobits,%hi(MOD)
    sw _gMOD.1, %lo(MOD)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.4, %lo(pl)(_lobits)
    li para, 1
    mv	a0,para 
    li para, 1
    mv	a1,para 
    mv	a2,_gn.0 
    call	query
    mv	_t.0,a0 
    la ptr,pl    
    lw _gpl.6, 0(ptr)
    la ptr,MOD    
    lw _gMOD.3, 0(ptr)
    la ptr,now    
    lw _gnow.5, 0(ptr)
    la ptr,L    
    lw _gL.6, 0(ptr)
    la ptr,sum    
    lw _gsum.5, 0(ptr)
    la ptr,pr    
    lw _gpr.7, 0(ptr)
    la ptr,s    
    lw _gs.5, 0(ptr)
    la ptr,t    
    lw _gt.5, 0(ptr)
    add _t.0,_gans.1,_t.0
    rem _t.0,_t.0,_gMOD.3
    mv	_gans.3,_t.0 
    mv	_gnow.4,_gnow.5 
    mv	_gpl.5,_gpl.6 
    mv	_gMOD.2,_gMOD.3 
    mv	_gsum.4,_gsum.5 
    mv	_gt.4,_gt.5 
    mv	_gans.2,_gans.3 
    mv	_gs.4,_gs.5 
    mv	_gpr.6,_gpr.7 
    mv	_gL.5,_gL.6 
    j	_if_end2
_if_thenBB5:
    lui _lobits,%hi(t)
    sw _gt.1, %lo(t)(_lobits)
    lui _lobits,%hi(s)
    sw _gs.1, %lo(s)(_lobits)
    lui _lobits,%hi(pr)
    sw _gpr.3, %lo(pr)(_lobits)
    lui _lobits,%hi(p)
    sw _gp.1, %lo(p)(_lobits)
    lui _lobits,%hi(sum)
    sw _gsum.1, %lo(sum)(_lobits)
    lui _lobits,%hi(L)
    sw _gL.2, %lo(L)(_lobits)
    lui _lobits,%hi(flag)
    sw _gflag.1, %lo(flag)(_lobits)
    lui _lobits,%hi(now)
    sw _gnow.1, %lo(now)(_lobits)
    lui _lobits,%hi(b)
    sw _gb.1, %lo(b)(_lobits)
    lui _lobits,%hi(pl)
    sw _gpl.2, %lo(pl)(_lobits)
    li para, 1
    mv	a0,para 
    li para, 1
    mv	a1,para 
    mv	a2,_gn.0 
    call	update
    la ptr,pl    
    lw _gpl.3, 0(ptr)
    la ptr,b    
    lw _gb.2, 0(ptr)
    la ptr,now    
    lw _gnow.2, 0(ptr)
    la ptr,flag    
    lw _gflag.2, 0(ptr)
    la ptr,L    
    lw _gL.3, 0(ptr)
    la ptr,sum    
    lw _gsum.2, 0(ptr)
    la ptr,p    
    lw _gp.2, 0(ptr)
    la ptr,pr    
    lw _gpr.4, 0(ptr)
    la ptr,s    
    lw _gs.2, 0(ptr)
    la ptr,t    
    lw _gt.2, 0(ptr)
    mv	_gnow.3,_gnow.2 
    mv	_gflag.3,_gflag.2 
    mv	_gpl.4,_gpl.3 
    mv	_gb.3,_gb.2 
    mv	_gsum.3,_gsum.2 
    mv	_gt.3,_gt.2 
    mv	_gp.3,_gp.2 
    mv	_gs.3,_gs.2 
    mv	_gpr.5,_gpr.4 
    mv	_gL.4,_gL.3 
    j	_if_end1
_whileBodyBB2:
    mv	__high.0,_gn.0 
    li t, 1
    sub __t.0,__high.0,t
    addi __t.2,__t.0,    1
    mv	_gno.20,_gno.19 
    li _i.4, 1
_forcondBB4:
    li t, 3
    blt	_i.4,t,	_forbodyBB4
_afterForBB4:
    blt	_gno.20,zero,	_if_thenBB7
paracopy31:
    mv	_gno.21,_gno.20 
afterCallBB11:
    mv	__t.0,_gno.21 
    rem __t.0,__t.0,__t.2
    addi __t.0,__t.0,    1
    addi __t.0,__t.0,    1
    mv	_t.0,__t.0 
    mv	_gpr.8,_t.0 
    mv	_gno.19,_gno.21 
    mv	_gpr.3,_gpr.8 
    j	_whileCondBB2
_if_thenBB7:
    sub _t.0,zero,_gno.20
    mv	_gno.22,_t.0 
    mv	_gno.21,_gno.22 
    j	afterCallBB11
_forbodyBB4:
    li t, 13131
    mul _t.0,_gno.20,t
    li t, 5353
    add _t.0,_t.0,t
    rem _t.0,_t.0,_gMOD.1
    mv	_gno.23,_t.0 
    addi _i.5,_i.4,    1
    mv	_i.4,_i.5 
    mv	_gno.20,_gno.23 
    j	_forcondBB4
_if_thenBB4:
    sub _t.0,zero,_gno.15
    mv	_gno.17,_t.0 
    mv	_gno.18,_gno.17 
    j	afterCallBB10
_forbodyBB3:
    li t, 13131
    mul _t.0,_gno.15,t
    li t, 5353
    add _t.0,_t.0,t
    rem _t.0,_t.0,_gMOD.1
    mv	_gno.16,_t.0 
    addi _i.4,_i.3,    1
    mv	_i.3,_i.4 
    mv	_gno.15,_gno.16 
    j	_forcondBB3
_if_thenBB3:
    sub _t.0,zero,_gno.11
    mv	_gno.13,_t.0 
    mv	_gno.14,_gno.13 
    j	afterCallBB9
_forbodyBB2:
    li t, 13131
    mul _t.0,_gno.11,t
    li t, 5353
    add _t.0,_t.0,t
    rem _t.0,_t.0,_gMOD.1
    mv	_gno.12,_t.0 
    addi _i.4,_i.3,    1
    mv	_i.3,_i.4 
    mv	_gno.11,_gno.12 
    j	_forcondBB2
__if_thenBB1:
    sub __t.0,zero,_gno.7
    mv	_gno.9,__t.0 
    mv	_gno.10,_gno.9 
    j	_afterCallBB2
__forbodyBB4:
    li t, 13131
    mul __t.0,_gno.7,t
    li t, 5353
    add __t.0,__t.0,t
    rem __t.0,__t.0,_gMOD.1
    mv	_gno.8,__t.0 
    addi __i.4,__i.3,    1
    mv	__i.3,__i.4 
    mv	_gno.7,_gno.8 
    j	__forcondBB4
_copy_if_thenBB36:
    mv	__i.7,zero 
_copy_forcondBB9:
    blt	__i.7,_gL.8,	_copy_forbodyBB9
_copy_afterForBB5:
    li _t, 0
    sw _t,4(_gnow.7)
    mv	_gnow.1,_gnow.7 
    mv	_gflag.1,_gflag.5 
    mv	_gm.1,_gm.0 
    mv	_gb.1,_gb.5 
    mv	_ga.1,_ga.3 
    mv	_gsum.1,_gsum.7 
    mv	_gt.1,_gt.0 
    mv	_gno.6,_gno.1 
    mv	_gp.1,_gp.5 
    mv	_gs.1,_gs.7 
    mv	_gL.2,_gL.8 
    mv	_gpl.1,zero 
    li t, 32761
    mv	_gMOD.1,t 
    mv	_gans.1,zero 
    mv	_gpr.1,zero 
    j	_whileCondBB1
_copy_forbodyBB9:
    lw __t.0, 16(_gs.7)
    slli __t.0,__i.7,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 12(_gs.7)
    slli __t.0,__i.7,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    lw __t.0, 8(_gs.7)
    slli __t.0,__i.7,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    addi __i.8,__i.7,    1
    mv	__i.7,__i.8 
    j	_copy_forcondBB9
_copy_if_thenBB35:
    lw __t.0, 8(_ga.0)
    sw __t.0,8(_gsum.0)
    lw __t.0, 8(_ga.0)
    blt	__t.0,_gp.0,	_copy_ifTrue11
_copy_if_end24:
    li _t, 0
    sw _t,8(_gnow.0)
    mv	_gnow.1,_gnow.0 
    mv	_gflag.1,_gflag.0 
    mv	_gm.1,_gm.0 
    mv	_gb.1,_gb.0 
    mv	_ga.1,_ga.0 
    mv	_gsum.1,_gsum.0 
    mv	_gt.1,_gt.0 
    mv	_gno.6,_gno.1 
    mv	_gp.1,_gp.0 
    mv	_gs.1,_gs.0 
    mv	_gL.2,_gL.1 
    mv	_gpl.1,zero 
    li t, 32761
    mv	_gMOD.1,t 
    mv	_gans.1,zero 
    mv	_gpr.1,zero 
    j	_whileCondBB1
_copy_ifTrue11:
    lw __t.0, 8(_ga.0)
    bge	__t.0,zero,	_copy_ifTrue12
    j	_copy_if_end24
_copy_ifTrue12:
    lw __t.0, 8(_ga.0)
    rem __t.0,__t.0,_gp.0
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,_gb.0,__t.0
    lw __t.0, 0(__t.0)
    bgt	__t.0,zero,	_copy_if_thenBB37
    j	_copy_if_end24
_copy_if_thenBB37:
    li _t, 1
    sw _t,8(_gflag.0)
    lw __t.0, 8(_gs.0)
    lw __t.0, 8(_ga.0)
    sw __t.0,4(__t.0)
    li __i.2, 1
_copy_forcondBB10:
    blt	__i.2,_gL.1,	_copy_forbodyBB10
    j	_copy_if_end24
_copy_forbodyBB10:
    addi __t.0,__i.2,    -1
    lw __t.0, 8(_gs.0)
    slli __t.0,__t.0,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    lw __t.0, 0(__t.0)
    mv	___x.0,__t.0 
    rem ___t.0,___x.0,_gp.0
    mul ___t.0,___t.0,___t.0
    mv	__t.0,___t.0 
    rem __t.0,__t.0,_gp.0
    lw __t.0, 8(_gs.0)
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    addi __i.3,__i.2,    1
    mv	__i.2,__i.3 
    j	_copy_forcondBB10
__forbodyBB3:
    slli __t.0,__i.6,    2
    addi __t.0,__t.0,    4
    add __t.0,__c.0,__t.0
    lw __t.0, 0(__t.0)
    mv	__x.1,__t.0 
    mv	__x.2,__x.1 
    li __j.2, 1
__forbodyBB5:
    mv	_x.0,__x.2 
    rem _t.0,_x.0,_gp.0
    mul _t.0,_t.0,_t.0
    mv	__t.0,_t.0 
    rem __t.0,__t.0,_gp.0
    mv	__x.3,__t.0 
    slli __t.0,__x.3,    2
    addi __t.0,__t.0,    4
    add __t.0,_gb.0,__t.0
    li _t, 1
    sw _t,0(__t.0)
    slli __t.0,__i.6,    2
    addi __t.0,__t.0,    4
    add __t.0,__c.0,__t.0
    lw __t.0, 0(__t.0)
    beq	__x.3,__t.0,	__afterForBB4
__forupdateBB1:
    addi __j.3,__j.2,    1
    mv	__j.2,__j.3 
    mv	__x.2,__x.3 
    j	__forbodyBB5
__afterForBB4:
    mv	_a.1,_gL.1 
    mv	_b.1,__j.2 
    mv	_copy_x.1,_a.1 
    mv	_copy_y.1,_b.1 
    beq	_copy_y.1,zero,	_copy_if_thenBB38
_copy_if_end25:
    blt	_copy_x.1,_copy_y.1,	_copy_if_thenBB39
_copy_if_elseBB7:
    rem __t.0,_copy_x.1,_copy_y.1
    mv	a0,_copy_y.1 
    mv	a1,__t.0 
    call	gcd
    mv	__t.0,a0 
    mv	__mergedretVal.2,__t.0 
    mv	__mergedretVal.4,__mergedretVal.2 
afterCallBB12:
    mv	_t.0,__mergedretVal.4 
    div _t.0,_a.1,_t.0
    mul _t.0,_t.0,_b.1
    mv	__t.0,_t.0 
    mv	_gL.9,__t.0 
    addi __i.7,__i.6,    1
    mv	__i.6,__i.7 
    mv	_gL.1,_gL.9 
    j	__forcondBB3
_copy_if_thenBB39:
    mv	a0,_copy_y.1 
    mv	a1,_copy_x.1 
    call	gcd
    mv	__t.0,a0 
    mv	__mergedretVal.1,__t.0 
    mv	__mergedretVal.4,__mergedretVal.1 
    j	afterCallBB12
_copy_if_thenBB38:
    mv	__mergedretVal.3,_copy_x.1 
    mv	__mergedretVal.4,__mergedretVal.3 
    j	afterCallBB12
__forbodyBB2:
    li __j.3, 1
__forcondBB5:
    li t, 15
    ble	__j.3,t,	__forbodyBB6
__forupdateBB2:
    addi __i.8,__i.4,    1
    mv	__i.4,__i.8 
    j	__forcondBB2
__forbodyBB6:
    slli __t.0,__i.4,    2
    addi __t.0,__t.0,    4
    add __t.0,__c.0,__t.0
    lw __t.0, 0(__t.0)
    mv	_x.0,__t.0 
    rem _t.0,_x.0,_gp.0
    mul _t.0,_t.0,_t.0
    mv	__t.0,_t.0 
    rem __t.0,__t.0,_gp.0
    slli __t.0,__i.4,    2
    addi __t.0,__t.0,    4
    add __t.0,__c.0,__t.0
    sw __t.0,0(__t.0)
    addi __j.4,__j.3,    1
    mv	__j.3,__j.4 
    j	__forcondBB5
__forbodyBB1:
    slli __t.0,__i.2,    2
    addi __t.0,__t.0,    4
    add __t.0,__c.0,__t.0
    sw __i.2,0(__t.0)
    addi __i.9,__i.2,    1
    mv	__i.2,__i.9 
    j	__forcondBB1
_forbodyBB1:
    mv	__high.0,_gp.0 
    sub __t.0,__high.0,zero
    addi __t.1,__t.0,    1
    mv	_gno.2,_gno.1 
    li _i.3, 1
_forcondBB5:
    li t, 3
    blt	_i.3,t,	_forbodyBB5
_afterForBB5:
    blt	_gno.2,zero,	_if_thenBB8
paracopy32:
    mv	_gno.4,_gno.2 
afterCallBB13:
    mv	__t.0,_gno.4 
    rem __t.0,__t.0,__t.1
    add __t.0,__t.0,zero
    addi __t.0,__t.0,    1
    mv	_t.0,__t.0 
    slli _t.0,_i.2,    2
    addi _t.0,_t.0,    4
    add _t.0,_ga.0,_t.0
    sw _t.0,0(_t.0)
    addi _i.3,_i.2,    1
    mv	_i.2,_i.3 
    mv	_gno.1,_gno.4 
    j	_forcondBB1
_if_thenBB8:
    sub _t.0,zero,_gno.2
    mv	_gno.3,_t.0 
    mv	_gno.4,_gno.3 
    j	afterCallBB13
_forbodyBB5:
    li t, 13131
    mul _t.0,_gno.2,t
    li t, 5353
    add _t.0,_t.0,t
    li t, 32761
    rem _t.0,_t.0,t
    mv	_gno.5,_t.0 
    addi _i.4,_i.3,    1
    mv	_i.3,_i.4 
    mv	_gno.2,_gno.5 
    j	_forcondBB5
forupdateBB1:
    li a0, 324
    call malloc
    mv	t.0,a0 
    li _t, 80
    sw _t,0(t.0)
    sw t.0,0(t.2)
    addi t.3,t.2,    4
    mv	t.2,t.3 
    j	forcondBB5
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	aa					#@aa
    .p2align	2
aa:
    .word	0
     
    .globl	bb					#@bb
    .p2align	2
bb:
    .word	0
     
    .globl	a					#@a
    .p2align	2
a:
    .word	0
     
    .globl	op					#@op
    .p2align	2
op:
    .word	0
     
    .globl	no					#@no
    .p2align	2
no:
    .word	0
     
    .globl	b					#@b
    .p2align	2
b:
    .word	0
     
    .globl	pr					#@pr
    .p2align	2
pr:
    .word	0
     
    .globl	flag					#@flag
    .p2align	2
flag:
    .word	0
     
    .globl	MOD					#@MOD
    .p2align	2
MOD:
    .word	0
     
    .globl	ans					#@ans
    .p2align	2
ans:
    .word	0
     
    .globl	sum					#@sum
    .p2align	2
sum:
    .word	0
     
    .globl	L					#@L
    .p2align	2
L:
    .word	0
     
    .globl	m					#@m
    .p2align	2
m:
    .word	0
     
    .globl	n					#@n
    .p2align	2
n:
    .word	0
     
    .globl	p					#@p
    .p2align	2
p:
    .word	0
     
    .globl	s					#@s
    .p2align	2
s:
    .word	0
     
    .globl	t					#@t
    .p2align	2
t:
    .word	0
     
    .globl	now					#@now
    .p2align	2
now:
    .word	0
     
    .globl	pl					#@pl
    .p2align	2
pl:
    .word	0
     
