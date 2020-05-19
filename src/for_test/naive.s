    .text
    .globl	search				#begin
    .p2align	2
    .type	search,@function
search:
search.entryBB1:
    mv	backup_ra,ra 
    mv	back_s1,s1 
    mv	back_s0,s0 
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
    mv	z.0,a2 
    mv	y.0,a1 
    mv	x.0,a0 
    la ptr,make    
    lw _gmake.0, 0(ptr)
    la ptr,color    
    lw _gcolor.0, 0(ptr)
    la ptr,count    
    lw _gcount.0, 0(ptr)
    bgt	y.0,zero,	if_thenBB1
    j	iffalse1
iffalse1:
    blt	y.0,zero,	if_thenBB1
    j	iffalse2
iffalse2:
    beq	x.0,zero,	if_thenBB1
    j	iffalse3
iffalse3:
    li t, 1
    sub t.0,x.0,t
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    li t, 1
    sub t.0,x.0,t
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    lw t.0, 4(t.0)
    lw t.0, 8(t.0)
    add t.0,t.0,t.0
    li t, 1
    sub t.0,x.0,t
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    lw t.0, 12(t.0)
    add t.0,t.0,t.0
    li t, 15
    beq	t.0,t,	if_thenBB1
    j	paracopy1
if_thenBB1:
    li t, 2
    beq	x.0,t,	ifTrue1
    j	if_elseBB1
if_elseBB1:
    li t, 2
    beq	y.0,t,	if_thenBB2
    j	if_elseBB2
if_elseBB2:
    mv	_gcount.1,_gcount.0 
    mv	_gmake.1,_gmake.0 
    mv	_gcolor.1,_gcolor.0 
    mv	breaker,_gcount.1 
    mv	_gcount.1,_gcount.1 
    mv	breaker,_gmake.1 
    mv	_gmake.1,_gmake.1 
    mv	breaker,_gcolor.1 
    li i.2, 1
    j	forcondBB1
forcondBB1:
    li t, 9
    ble	i.2,t,	forbodyBB1
    j	paracopy2
paracopy2:
    mv	_gcount.9,_gcount.1 
    mv	_gmake.9,_gmake.1 
    mv	_gcolor.9,_gcolor.1 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
if_end1:
    lui _lobits,%hi(count)
    sw _gcount.9, %lo(count)(_lobits)
    lui _lobits,%hi(color)
    sw _gcolor.9, %lo(color)(_lobits)
    lui _lobits,%hi(make)
    sw _gmake.9, %lo(make)(_lobits)
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
    mv	s0,back_s0 
    mv	s1,back_s1 
    mv	ra,backup_ra 
    ret
forbodyBB1:
    slli t.0,i.2,    2
    addi t.0,t.0,    4
    add t.0,_gcolor.1,t.0
    lw t.0, 0(t.0)
    beq	t.0,zero,	if_thenBB3
    j	paracopy3
paracopy3:
    mv	_gcount.5,_gcount.1 
    mv	_gmake.5,_gmake.1 
    mv	_gcolor.5,_gcolor.1 
    mv	breaker,_gcount.5 
    mv	_gcount.5,_gcount.5 
    mv	breaker,_gmake.5 
    mv	_gmake.5,_gmake.5 
    mv	breaker,_gcolor.5 
    j	forupdateBB1
forupdateBB1:
    addi i.3,i.2,    1
    mv	_gcount.1,_gcount.5 
    mv	_gmake.1,_gmake.5 
    mv	i.2,i.3 
    mv	_gcolor.1,_gcolor.5 
    mv	breaker,_gcount.1 
    mv	_gcount.1,_gcount.1 
    mv	breaker,_gmake.1 
    mv	_gmake.1,_gmake.1 
    mv	breaker,i.2 
    mv	i.2,i.2 
    mv	breaker,_gcolor.1 
    j	forcondBB1
if_thenBB3:
    slli t.0,i.2,    2
    addi t.0,t.0,    4
    add t.0,_gcolor.1,t.0
    li _t, 1
    sw _t,0(t.0)
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.1,t.0
    lw t.0, 0(t.0)
    slli t.0,y.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    sw i.2,0(t.0)
    li t, 2
    beq	y.0,t,	if_thenBB4
    j	if_elseBB3
if_elseBB3:
    addi t.0,y.0,    1
    add t.0,z.0,i.2
    lui _lobits,%hi(count)
    sw _gcount.1, %lo(count)(_lobits)
    lui _lobits,%hi(color)
    sw _gcolor.1, %lo(color)(_lobits)
    lui _lobits,%hi(make)
    sw _gmake.1, %lo(make)(_lobits)
    mv	a0,x.0 
    mv	a1,t.0 
    mv	a2,t.0 
    call	search
    la ptr,make    
    lw _gmake.2, 0(ptr)
    la ptr,color    
    lw _gcolor.2, 0(ptr)
    la ptr,count    
    lw _gcount.2, 0(ptr)
    mv	_gcount.4,_gcount.2 
    mv	_gmake.4,_gmake.2 
    mv	_gcolor.4,_gcolor.2 
    mv	breaker,_gcount.4 
    mv	_gcount.4,_gcount.4 
    mv	breaker,_gmake.4 
    mv	_gmake.4,_gmake.4 
    mv	breaker,_gcolor.4 
    j	if_end2
if_end2:
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.4,t.0
    lw t.0, 0(t.0)
    slli t.0,y.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    li _t, 0
    sw _t,0(t.0)
    slli t.0,i.2,    2
    addi t.0,t.0,    4
    add t.0,_gcolor.4,t.0
    li _t, 0
    sw _t,0(t.0)
    mv	_gcount.5,_gcount.4 
    mv	_gmake.5,_gmake.4 
    mv	_gcolor.5,_gcolor.4 
    mv	breaker,_gcount.5 
    mv	_gcount.5,_gcount.5 
    mv	breaker,_gmake.5 
    mv	_gmake.5,_gmake.5 
    mv	breaker,_gcolor.5 
    j	forupdateBB1
if_thenBB4:
    addi t.0,x.0,    1
    add t.0,z.0,i.2
    lui _lobits,%hi(count)
    sw _gcount.1, %lo(count)(_lobits)
    lui _lobits,%hi(color)
    sw _gcolor.1, %lo(color)(_lobits)
    lui _lobits,%hi(make)
    sw _gmake.1, %lo(make)(_lobits)
    mv	a0,t.0 
    mv	a1,zero 
    mv	a2,t.0 
    call	search
    la ptr,make    
    lw _gmake.3, 0(ptr)
    la ptr,color    
    lw _gcolor.3, 0(ptr)
    la ptr,count    
    lw _gcount.3, 0(ptr)
    mv	_gcount.4,_gcount.3 
    mv	_gmake.4,_gmake.3 
    mv	_gcolor.4,_gcolor.3 
    mv	breaker,_gcount.4 
    mv	_gcount.4,_gcount.4 
    mv	breaker,_gmake.4 
    mv	_gmake.4,_gmake.4 
    mv	breaker,_gcolor.4 
    j	if_end2
if_thenBB2:
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    lw t.0, 4(t.0)
    li t, 15
    sub t.0,t,t.0
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    lw t.0, 8(t.0)
    sub t.0,t.0,t.0
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    slli t.0,y.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    sw t.0,0(t.0)
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    slli t.0,y.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    bgt	t.0,zero,	ifTrue2
    j	paracopy4
ifTrue2:
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    slli t.0,y.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    li t, 10
    blt	t.0,t,	ifTrue3
    j	paracopy5
ifTrue3:
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    slli t.0,y.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gcolor.0,t.0
    lw t.0, 0(t.0)
    beq	t.0,zero,	if_thenBB5
    j	paracopy6
if_thenBB5:
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    slli t.0,y.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gcolor.0,t.0
    li _t, 1
    sw _t,0(t.0)
    li t, 2
    beq	y.0,t,	if_thenBB6
    j	if_elseBB4
if_thenBB6:
    addi t.0,x.0,    1
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    slli t.0,y.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    add t.0,z.0,t.0
    lui _lobits,%hi(count)
    sw _gcount.0, %lo(count)(_lobits)
    lui _lobits,%hi(color)
    sw _gcolor.0, %lo(color)(_lobits)
    lui _lobits,%hi(make)
    sw _gmake.0, %lo(make)(_lobits)
    mv	a0,t.0 
    mv	a1,zero 
    mv	a2,t.0 
    call	search
    la ptr,make    
    lw _gmake.6, 0(ptr)
    la ptr,color    
    lw _gcolor.6, 0(ptr)
    la ptr,count    
    lw _gcount.6, 0(ptr)
    mv	_gcount.8,_gcount.6 
    mv	_gmake.8,_gmake.6 
    mv	_gcolor.8,_gcolor.6 
    mv	breaker,_gcount.8 
    mv	_gcount.8,_gcount.8 
    mv	breaker,_gmake.8 
    mv	_gmake.8,_gmake.8 
    mv	breaker,_gcolor.8 
    j	if_end3
if_end3:
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.8,t.0
    lw t.0, 0(t.0)
    slli t.0,y.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    slli t.0,t.0,    2
    addi t.0,t.0,    4
    add t.0,_gcolor.8,t.0
    li _t, 0
    sw _t,0(t.0)
    mv	_gcount.9,_gcount.8 
    mv	_gmake.9,_gmake.8 
    mv	_gcolor.9,_gcolor.8 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
if_elseBB4:
    addi t.0,y.0,    1
    slli t.0,x.0,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    slli t.0,y.0,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    add t.0,z.0,t.0
    lui _lobits,%hi(count)
    sw _gcount.0, %lo(count)(_lobits)
    lui _lobits,%hi(color)
    sw _gcolor.0, %lo(color)(_lobits)
    lui _lobits,%hi(make)
    sw _gmake.0, %lo(make)(_lobits)
    mv	a0,x.0 
    mv	a1,t.0 
    mv	a2,t.0 
    call	search
    la ptr,make    
    lw _gmake.7, 0(ptr)
    la ptr,color    
    lw _gcolor.7, 0(ptr)
    la ptr,count    
    lw _gcount.7, 0(ptr)
    mv	_gcount.8,_gcount.7 
    mv	_gmake.8,_gmake.7 
    mv	_gcolor.8,_gcolor.7 
    mv	breaker,_gcount.8 
    mv	_gcount.8,_gcount.8 
    mv	breaker,_gmake.8 
    mv	_gmake.8,_gmake.8 
    mv	breaker,_gcolor.8 
    j	if_end3
paracopy6:
    mv	_gcount.9,_gcount.0 
    mv	_gmake.9,_gmake.0 
    mv	_gcolor.9,_gcolor.0 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
paracopy5:
    mv	_gcount.9,_gcount.0 
    mv	_gmake.9,_gmake.0 
    mv	_gcolor.9,_gcolor.0 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
paracopy4:
    mv	_gcount.9,_gcount.0 
    mv	_gmake.9,_gmake.0 
    mv	_gcolor.9,_gcolor.0 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
ifTrue1:
    li t, 2
    beq	y.0,t,	if_thenBB7
    j	if_elseBB1
if_thenBB7:
    li t, 45
    sub t.0,t,z.0
    lw t.0, 12(_gmake.0)
    sw t.0,12(t.0)
    lw t.0, 4(_gmake.0)
    lw t.0, 4(_gmake.0)
    lw t.0, 4(t.0)
    lw t.0, 8(t.0)
    add t.0,t.0,t.0
    lw t.0, 4(_gmake.0)
    lw t.0, 12(t.0)
    add t.0,t.0,t.0
    mv	s.1,t.0 
    lw t.0, 8(_gmake.0)
    lw t.0, 8(_gmake.0)
    lw t.0, 4(t.0)
    lw t.0, 8(t.0)
    add t.0,t.0,t.0
    lw t.0, 8(_gmake.0)
    lw t.0, 12(t.0)
    add t.0,t.0,t.0
    beq	t.0,s.1,	ifTrue4
    j	paracopy7
ifTrue4:
    lw t.0, 12(_gmake.0)
    lw t.0, 12(_gmake.0)
    lw t.0, 4(t.0)
    lw t.0, 8(t.0)
    add t.0,t.0,t.0
    lw t.0, 12(_gmake.0)
    lw t.0, 12(t.0)
    add t.0,t.0,t.0
    beq	t.0,s.1,	ifTrue5
    j	paracopy8
paracopy8:
    mv	_gcount.9,_gcount.0 
    mv	_gmake.9,_gmake.0 
    mv	_gcolor.9,_gcolor.0 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
ifTrue5:
    lw t.0, 4(_gmake.0)
    lw t.0, 8(_gmake.0)
    lw t.0, 4(t.0)
    lw t.0, 4(t.0)
    add t.0,t.0,t.0
    lw t.0, 12(_gmake.0)
    lw t.0, 4(t.0)
    add t.0,t.0,t.0
    beq	t.0,s.1,	ifTrue6
    j	paracopy9
ifTrue6:
    lw t.0, 4(_gmake.0)
    lw t.0, 8(_gmake.0)
    lw t.0, 8(t.0)
    lw t.0, 8(t.0)
    add t.0,t.0,t.0
    lw t.0, 12(_gmake.0)
    lw t.0, 8(t.0)
    add t.0,t.0,t.0
    beq	t.0,s.1,	ifTrue7
    j	paracopy10
paracopy10:
    mv	_gcount.9,_gcount.0 
    mv	_gmake.9,_gmake.0 
    mv	_gcolor.9,_gcolor.0 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
ifTrue7:
    lw t.0, 4(_gmake.0)
    lw t.0, 8(_gmake.0)
    lw t.0, 12(t.0)
    lw t.0, 12(t.0)
    add t.0,t.0,t.0
    lw t.0, 12(_gmake.0)
    lw t.0, 12(t.0)
    add t.0,t.0,t.0
    beq	t.0,s.1,	ifTrue8
    j	paracopy11
ifTrue8:
    lw t.0, 4(_gmake.0)
    lw t.0, 8(_gmake.0)
    lw t.0, 4(t.0)
    lw t.0, 8(t.0)
    add t.0,t.0,t.0
    lw t.0, 12(_gmake.0)
    lw t.0, 12(t.0)
    add t.0,t.0,t.0
    beq	t.0,s.1,	ifTrue9
    j	paracopy12
ifTrue9:
    lw t.0, 12(_gmake.0)
    lw t.0, 8(_gmake.0)
    lw t.0, 4(t.0)
    lw t.0, 8(t.0)
    add t.0,t.0,t.0
    lw t.0, 4(_gmake.0)
    lw t.0, 12(t.0)
    add t.0,t.0,t.0
    beq	t.0,s.1,	if_thenBB8
    j	paracopy13
if_thenBB8:
    lw t.0, 4(_gcount.0)
    addi t.0,t.0,    1
    sw t.0,4(_gcount.0)
    mv	i.5,zero 
    j	forcondBB2
forcondBB2:
    li t, 2
    ble	i.5,t,	forbodyBB2
    j	afterForBB1
forbodyBB2:
    mv	j.3,zero 
    j	forcondBB3
forcondBB3:
    li t, 2
    ble	j.3,t,	forbodyBB3
    j	afterForBB2
forbodyBB3:
    slli t.0,i.5,    2
    addi t.0,t.0,    4
    add t.0,_gmake.0,t.0
    lw t.0, 0(t.0)
    slli t.0,j.3,    2
    addi t.0,t.0,    4
    add t.0,t.0,t.0
    lw t.0, 0(t.0)
    mv	a0,t.0 
    call	toString
    mv	t.0,a0 
    mv	a0,t.0 
    call	print
    la para,_globalStr0    
    mv	a0,para 
    call	print
    addi j.4,j.3,    1
    mv	j.3,j.4 
    mv	breaker,j.3 
    j	forcondBB3
afterForBB2:
    la para,_globalStr1    
    mv	a0,para 
    call	print
    addi i.6,i.5,    1
    mv	i.5,i.6 
    mv	breaker,i.5 
    j	forcondBB2
afterForBB1:
    la para,_globalStr1    
    mv	a0,para 
    call	print
    mv	_gcount.9,_gcount.0 
    mv	_gmake.9,_gmake.0 
    mv	_gcolor.9,_gcolor.0 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
paracopy13:
    mv	_gcount.9,_gcount.0 
    mv	_gmake.9,_gmake.0 
    mv	_gcolor.9,_gcolor.0 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
paracopy12:
    mv	_gcount.9,_gcount.0 
    mv	_gmake.9,_gmake.0 
    mv	_gcolor.9,_gcolor.0 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
paracopy11:
    mv	_gcount.9,_gcount.0 
    mv	_gmake.9,_gmake.0 
    mv	_gcolor.9,_gcolor.0 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
paracopy9:
    mv	_gcount.9,_gcount.0 
    mv	_gmake.9,_gmake.0 
    mv	_gcolor.9,_gcolor.0 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
paracopy7:
    mv	_gcount.9,_gcount.0 
    mv	_gmake.9,_gmake.0 
    mv	_gcolor.9,_gcolor.0 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
paracopy1:
    mv	_gcount.9,_gcount.0 
    mv	_gmake.9,_gmake.0 
    mv	_gcolor.9,_gcolor.0 
    mv	breaker,_gcount.9 
    mv	_gcount.9,_gcount.9 
    mv	breaker,_gmake.9 
    mv	_gmake.9,_gmake.9 
    mv	breaker,_gcolor.9 
    j	if_end1
								 # func end
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    mv	backup_ra,ra 
    mv	back_s1,s1 
    mv	back_s0,s0 
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
    li a0, 44
    call malloc
    mv	t.0,a0 
    li _t, 10
    sw _t,0(t.0)
    mv	_gcolor.0,t.0 
    li a0, 8
    call malloc
    mv	t.0,a0 
    li _t, 1
    sw _t,0(t.0)
    mv	_gcount.0,t.0 
    li _t, 0
    sw _t,4(_gcount.0)
    li a0, 16
    call malloc
    mv	__t.0,a0 
    li _t, 3
    sw _t,0(__t.0)
    mv	_gmake.0,__t.0 
    mv	_gi.1,zero 
    j	__forcondBB1
__forcondBB1:
    li t, 3
    blt	_gi.1,t,	__forbodyBB1
    j	afterCallBB1
__forbodyBB1:
    li a0, 16
    call malloc
    mv	__t.0,a0 
    li _t, 3
    sw _t,0(__t.0)
    slli __t.0,_gi.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gmake.0,__t.0
    sw __t.0,0(__t.0)
    mv	_gj.2,zero 
    j	__forcondBB2
__forcondBB2:
    li t, 3
    blt	_gj.2,t,	__forbodyBB2
    j	__forupdateBB1
__forbodyBB2:
    slli __t.0,_gi.1,    2
    addi __t.0,__t.0,    4
    add __t.0,_gmake.0,__t.0
    lw __t.0, 0(__t.0)
    slli __t.0,_gj.2,    2
    addi __t.0,__t.0,    4
    add __t.0,__t.0,__t.0
    li _t, 0
    sw _t,0(__t.0)
    addi _gj.3,_gj.2,    1
    mv	_gj.2,_gj.3 
    mv	breaker,_gj.2 
    j	__forcondBB2
__forupdateBB1:
    addi _gi.2,_gi.1,    1
    mv	_gi.1,_gi.2 
    mv	breaker,_gi.1 
    j	__forcondBB1
afterCallBB1:
    lui _lobits,%hi(count)
    sw _gcount.0, %lo(count)(_lobits)
    lui _lobits,%hi(color)
    sw _gcolor.0, %lo(color)(_lobits)
    lui _lobits,%hi(make)
    sw _gmake.0, %lo(make)(_lobits)
    mv	a0,zero 
    mv	a1,zero 
    mv	a2,zero 
    call	search
    la ptr,make    
    lw _gmake.1, 0(ptr)
    la ptr,color    
    lw _gcolor.1, 0(ptr)
    la ptr,count    
    lw _gcount.1, 0(ptr)
    lw _t.0, 4(_gcount.1)
    mv	a0,_t.0 
    call	toString
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lui _lobits,%hi(count)
    sw _gcount.1, %lo(count)(_lobits)
    lui _lobits,%hi(color)
    sw _gcolor.1, %lo(color)(_lobits)
    lui _lobits,%hi(make)
    sw _gmake.1, %lo(make)(_lobits)
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
    mv	s0,back_s0 
    mv	s1,back_s1 
    mv	ra,backup_ra 
    mv	a0,zero 
    ret
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	color					#@color
    .p2align	2
color:
    .word	0
     
    .globl	count					#@count
    .p2align	2
count:
    .word	0
     
    .globl	i					#@i
    .p2align	2
i:
    .word	0
     
    .globl	j					#@j
    .p2align	2
j:
    .word	0
     
    .globl	make					#@make
    .p2align	2
make:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  " "    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  "\n"    
