    .text
    .globl	A.A						 # func begin 
    .p2align	2
    .type	A.A,@function
A.A:
%A.A.entryBB1:
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
    mv	this.0,a0 
    la ptr,countB    
    lw _gcountB.0, 0(ptr)
    la ptr,countA    
    lw _gcountA.0, 0(ptr)
    addi t.0,this.0,    12
    addi _gcountA.1,_gcountA.0,    1
    sw _gcountA.1,0(t.0)
    addi t.0,this.0,    12
    lw t.0, 0(t.0)
    li t, 2
    rem t.0,t.0,t
    beq	t.0,zero,	%if_thenBB1
    j	%if_elseBB1
%if_thenBB1:
    add t.0,this.0,zero
    li a0, 16
    call malloc
    mv	t.0,a0 
    lui _lobits,%hi(countB)
    sw _gcountB.0, %lo(countB)(_lobits)
    lui _lobits,%hi(countA)
    sw _gcountA.1, %lo(countA)(_lobits)
    mv	a0,t.0 
    call	A.A
    la ptr,countA    
    lw _gcountA.3, 0(ptr)
    la ptr,countB    
    lw _gcountB.2, 0(ptr)
    sw t.0,0(t.0)
    li t, 2
    rem t.0,_gcountB.2,t
    beq	t.0,zero,	%if_thenBB2
    j	%if_elseBB2
%if_elseBB2:
    addi t.0,this.0,    4
    li _t, 0
    sw _t,0(t.0)
    mv	_gcountA.2,_gcountA.3 
    mv	_gcountB.1,_gcountB.2 
    mv	breaker,_gcountA.2 
    mv	_gcountA.2,_gcountA.2 
    mv	breaker,_gcountB.1 
    j	%if_end1
%if_thenBB2:
    addi t.0,this.0,    4
    li a0, 8
    call malloc
    mv	t.0,a0 
    lui _lobits,%hi(countB)
    sw _gcountB.2, %lo(countB)(_lobits)
    mv	a0,t.0 
    call	B.B
    la ptr,countB    
    lw _gcountB.3, 0(ptr)
    sw t.0,0(t.0)
    mv	_gcountA.2,_gcountA.3 
    mv	_gcountB.1,_gcountB.3 
    mv	breaker,_gcountA.2 
    mv	_gcountA.2,_gcountA.2 
    mv	breaker,_gcountB.1 
    j	%if_end1
%if_elseBB1:
    add t.0,this.0,zero
    li _t, 0
    sw _t,0(t.0)
    mv	_gcountA.2,_gcountA.1 
    mv	_gcountB.1,_gcountB.0 
    mv	breaker,_gcountA.2 
    mv	_gcountA.2,_gcountA.2 
    mv	breaker,_gcountB.1 
    j	%if_end1
%if_end1:
    addi t.0,this.0,    8
    li a0, 12
    call malloc
    mv	t.0,a0 
    li _t, 2
    sw _t,0(t.0)
    sw t.0,0(t.0)
    addi t.0,this.0,    8
    lw t.0, 0(t.0)
    addi t.0,t.0,    4
    li a0, 28
    call malloc
    mv	t.0,a0 
    li _t, 6
    sw _t,0(t.0)
    mv	t.0,t.0 
    addi t.1,t.0,    4
    mv	t.0,t.0 
    addi t.1,t.0,    24
    mv	t.2,t.1 
    mv	breaker,t.2 
    j	%forcondBB1
%forcondBB1:
    ble	t.2,t.1,	%forupdateBB1
    j	%afterForBB1
%forupdateBB1:
    li a0, 28
    call malloc
    mv	t.1,a0 
    li _t, 6
    sw _t,0(t.1)
    mv	t.1,t.1 
    addi t.2,t.1,    4
    mv	t.1,t.1 
    addi t.2,t.1,    24
    mv	t.3,t.2 
    mv	breaker,t.3 
    j	%forcondBB2
%forcondBB2:
    ble	t.3,t.2,	%forupdateBB2
    j	%afterForBB2
%forupdateBB2:
    li a0, 28
    call malloc
    mv	t.2,a0 
    li _t, 6
    sw _t,0(t.2)
    mv	t.2,t.2 
    addi t.3,t.2,    4
    mv	t.2,t.2 
    addi t.3,t.2,    24
    mv	t.4,t.3 
    mv	breaker,t.4 
    j	%forcondBB3
%forcondBB3:
    ble	t.4,t.3,	%forupdateBB3
    j	%afterForBB3
%afterForBB3:
    sw t.2,0(t.3)
    addi t.4,t.3,    4
    mv	t.3,t.4 
    mv	breaker,t.3 
    j	%forcondBB2
%forupdateBB3:
    li a0, 52
    call malloc
    mv	t.0,a0 
    li _t, 6
    sw _t,0(t.0)
    sw t.0,0(t.4)
    addi t.5,t.4,    4
    mv	t.4,t.5 
    mv	breaker,t.4 
    j	%forcondBB3
%afterForBB2:
    sw t.1,0(t.2)
    addi t.3,t.2,    4
    mv	t.2,t.3 
    mv	breaker,t.2 
    j	%forcondBB1
%afterForBB1:
    addi t.0,t.0,    12
    lw t.0, 0(t.0)
    addi t.0,t.0,    16
    lw t.0, 0(t.0)
    addi t.0,t.0,    16
    lw t.0, 0(t.0)
    sw t.0,0(t.0)
    addi t.0,this.0,    8
    lw t.0, 0(t.0)
    addi t.0,t.0,    8
    li _t, 0
    sw _t,0(t.0)
    addi t.0,this.0,    8
    lw t.0, 0(t.0)
    mv	a0,t.0 
    call	_arraySize
    mv	t.0,a0 
    li t, 2
    bne	t.0,t,	%if_thenBB3
    j	%if_end2
%if_thenBB3:
    la para,_globalStr2    
    mv	a0,para 
    call	println
    j	%if_end2
%if_end2:
    lui _lobits,%hi(countB)
    sw _gcountB.1, %lo(countB)(_lobits)
    lui _lobits,%hi(countA)
    sw _gcountA.2, %lo(countA)(_lobits)
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
    ret
								 # func end
    .globl	B.B						 # func begin 
    .p2align	2
    .type	B.B,@function
B.B:
%B.B.entryBB1:
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
    mv	this.0,a0 
    la ptr,countB    
    lw _gcountB.0, 0(ptr)
    add t.0,this.0,zero
    addi _gcountB.1,_gcountB.0,    1
    sw _gcountB.1,0(t.0)
    addi t.0,this.0,    4
    li a0, 16
    call malloc
    mv	t.0,a0 
    lui _lobits,%hi(countB)
    sw _gcountB.1, %lo(countB)(_lobits)
    mv	a0,t.0 
    call	A.A
    la ptr,countB    
    lw _gcountB.2, 0(ptr)
    mv	_this.0,t.0 
    addi _t.0,_this.0,    8
    lw _t.0, 0(_t.0)
    addi _t.0,_t.0,    4
    lw _t.0, 0(_t.0)
    mv	t.0,_t.0 
    addi t.0,t.0,    4
    lw t.0, 0(t.0)
    mv	_this.0,t.0 
    mv	t.0,_this.0 
    mv	_this.0,t.0 
    mv	t.0,_this.0 
    sw t.0,0(t.0)
    lui _lobits,%hi(countB)
    sw _gcountB.2, %lo(countB)(_lobits)
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
    ret
								 # func end
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
    la ptr,countB    
    lw _gcountB.0, 0(ptr)
    la ptr,countA    
    lw _gcountA.0, 0(ptr)
    la ptr,countC    
    lw _gcountC.0, 0(ptr)
    la ptr,something    
    lw _gsomething.0, 0(ptr)
    mv	_i.2,zero 
    j	%_forbodyBB1
%_forbodyBB1:
    xori _t.0,_i.2,    627
    xori _t.0,_t.0,    666
    li t, 1
    beq	_t.0,t,	%_if_thenBB1
    j	%_forupdateBB1
%_forupdateBB1:
    addi _i.3,_i.2,    1
    mv	_i.2,_i.3 
    mv	breaker,_i.2 
    j	%_forbodyBB1
%_if_thenBB1:
    mv	a0,_i.2 
    call	toString
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    mv	_i.0,zero 
    mv	a0,_i.0 
    call	toString
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    li _i.0, 1
    mv	a0,_i.0 
    call	toString
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    mv	_gcountA.1,zero 
    mv	_gcountB.1,zero 
    mv	_gcountC.1,zero 
    li a0, 8
    call malloc
    mv	__t.0,a0 
    lui _lobits,%hi(countB)
    sw _gcountB.1, %lo(countB)(_lobits)
    mv	a0,__t.0 
    call	B.B
    la ptr,countB    
    lw _gcountB.2, 0(ptr)
    mv	a0,_gcountA.1 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr1    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,_gcountB.2 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr1    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,_gcountC.1 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    li _gcountA.2, 1
    li _gcountB.3, 1
    li _gcountC.2, 1
    li a0, 8
    call malloc
    mv	__t.0,a0 
    lui _lobits,%hi(countB)
    sw _gcountB.3, %lo(countB)(_lobits)
    mv	a0,__t.0 
    call	B.B
    la ptr,countB    
    lw _gcountB.4, 0(ptr)
    li t, 1
    sub __t.0,_gcountA.2,t
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr1    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    li t, 1
    sub __t.0,_gcountB.4,t
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr1    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    li t, 1
    sub __t.0,_gcountC.2,t
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	print
    la para,_globalStr5    
    mv	a0,para 
    call	print
    mv	___this.0,_gsomething.0 
    mv	__t.0,___this.0 
    addi __t.0,__t.0,    4
    lw __t.0, 0(__t.0)
    addi __t.0,_gsomething.0,    4
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    call	stringLength
    mv	__t.0,a0 
    li t, 1
    sub __t.0,__t.0,t
    mv	a0,__t.0 
    li para, 1
    mv	a1,para 
    mv	a2,__t.0 
    call	_stringSubstring
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	_stringParseInt
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    addi __t.0,_gsomething.0,    4
    lw __t.0, 0(__t.0)
    li t, 42
    andi __t.0,t,    21
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringOrd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	__temp.0,__t.0 
    addi __t.0,_gsomething.0,    4
    lw __t.0, 0(__t.0)
    mv	a0,__temp.0 
    mv	a1,__t.0 
    call	_stringLess
    mv	__t.0,a0 
    bne	__t.0, zero %__if_thenBB1
    j	%__if_elseBB1
%__if_thenBB1:
    addi __t.0,_gsomething.0,    4
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    la para,_globalStr3    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__temp.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    j	%_whileBodyBB1
%__if_elseBB1:
    addi __t.0,_gsomething.0,    4
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    la para,_globalStr6    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__temp.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    j	%_whileBodyBB1
%_whileBodyBB1:
    li t, 2
    rem _t.0,_i.2,t
    beq	_t.0,zero,	%_whileBodyBB1
    j	%_if_end1
%_if_end1:
    mv	a0,_i.2 
    call	toString
    mv	_t.0,a0 
    mv	a0,_t.0 
    la para,_globalStr4    
    mv	a1,para 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	print
    j	%_whileBodyBB1
								 # func end
    .globl	C.Me						 # func begin 
    .p2align	2
    .type	C.Me,@function
C.Me:
%C.Me.entryBB1:
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
    mv	this.0,a0 
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
    mv	a0,this.0 
    ret
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	countA					#@countA
    .p2align	2
countA:
    .word	0
     
    .globl	countB					#@countB
    .p2align	2
countB:
    .word	0
     
    .globl	countC					#@countC
    .p2align	2
countC:
    .word	0
     
    .globl	something					#@something
    .p2align	2
something:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  ""    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  " "    
    .globl	_globalStr2					#@_globalStr2
_globalStr2:
    .asciz  "Oops!"    
    .globl	_globalStr3					#@_globalStr3
_globalStr3:
    .asciz  ">"    
    .globl	_globalStr4					#@_globalStr4
_globalStr4:
    .asciz  ","    
    .globl	_globalStr5					#@_globalStr5
_globalStr5:
    .asciz  "\n"    
    .globl	_globalStr6					#@_globalStr6
_globalStr6:
    .asciz  "<="    
