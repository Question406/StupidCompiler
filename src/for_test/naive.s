    .text
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
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
    la ptr,age    
    lw _gage.0, 0(ptr)
    la ptr,eng    
    lw _geng.0, 0(ptr)
    li a0, 4
    call malloc
    mv	_t.0,a0 
    li a0, 16
    call malloc
    mv	_t.0,a0 
    li _t, 3
    sw _t,0(_t.0)
    mv	_boys.0,_t.0 
    li a0, 8
    call malloc
    mv	_t.0,a0 
    li _t, 1
    sw _t,0(_t.0)
    mv	_t.0,_t.0 
    addi _t.1,_t.0,    4
    mv	_t.0,_t.0 
    addi _t.1,_t.0,    4
    mv	_t.2,_t.1 
    mv	breaker,_t.2 
    j	%_forcondBB1
%_forcondBB1:
    ble	_t.2,_t.1,	%_forupdateBB1
    j	%_afterForBB1
%_forupdateBB1:
    li a0, 12
    call malloc
    mv	_t.1,a0 
    li _t, 2
    sw _t,0(_t.1)
    mv	_t.1,_t.1 
    addi _t.2,_t.1,    4
    mv	_t.1,_t.1 
    addi _t.2,_t.1,    8
    mv	_t.3,_t.2 
    mv	breaker,_t.3 
    j	%_forcondBB2
%_forcondBB2:
    ble	_t.3,_t.2,	%_forupdateBB2
    j	%_afterForBB2
%_forupdateBB2:
    li a0, 16
    call malloc
    mv	_t.0,a0 
    li _t, 3
    sw _t,0(_t.0)
    sw _t.0,0(_t.3)
    addi _t.4,_t.3,    4
    mv	_t.3,_t.4 
    mv	breaker,_t.3 
    j	%_forcondBB2
%_afterForBB2:
    sw _t.1,0(_t.2)
    addi _t.3,_t.2,    4
    mv	_t.2,_t.3 
    mv	breaker,_t.2 
    j	%_forcondBB1
%_afterForBB1:
    mv	_boyss.0,_t.0 
    li a0, 12
    call malloc
    mv	_t.0,a0 
    mv	_haha.0,_t.0 
    addi _t.0,_boys.0,    12
    lw _t.0, 0(_t.0)
    addi _t.0,_boyss.0,    8
    lw _t.0, 0(_t.0)
    addi _t.0,_t.0,    12
    lw _t.0, 0(_t.0)
    addi _t.0,_t.0,    16
    lw _t.0, 0(_t.0)
    li a0, 12
    call malloc
    mv	_t.0,a0 
    mv	__m0.0,_t.0 
    mv	__i.2,zero 
    j	%__forcondBB1
%__forcondBB1:
    lw __t.0, 0(    0)
    blt	__i.2,__t.0,	%__forbodyBB1
    j	%_afterCallBB1
%__forbodyBB1:
    addi __t.0,__m0.0,    4
    lw __t.0, 0(__t.0)
    addi __t.0,__t.0,    1
    sw __t.0,0(__t.0)
    addi __i.3,__i.2,    1
    mv	__i.2,__i.3 
    mv	breaker,__i.2 
    j	%__forcondBB1
%_afterCallBB1:
    mv	_i.2,zero 
    j	%_forcondBB3
%_forcondBB3:
    li t, 3
    blt	_i.2,t,	%_forbodyBB1
    j	%_afterForBB3
%_afterForBB3:
    mv	_i.5,zero 
    j	%_forcondBB4
%_forcondBB4:
    li t, 3
    blt	_i.5,t,	%_forbodyBB2
    j	%_forbodyBB3
%_forbodyBB2:
    li t, 4
    mul _t.0,_i.5,t
    addi _t.0,_t.0,    4
    add _t.0,_boys.0,_t.0
    lw _t.0, 0(_t.0)
    mv	__m0.1,_haha.0 
    mv	__boys.1,_t.0 
    mv	__i.3,zero 
    j	%__forcondBB2
%__forcondBB2:
    add __t.0,__boys.1,zero
    lw __t.0, 0(__t.0)
    blt	__i.3,__t.0,	%__forbodyBB2
    j	%_afterCallBB2
%__forbodyBB2:
    addi __t.0,__m0.1,    4
    lw __t.0, 0(__t.0)
    addi __t.0,__t.0,    1
    sw __t.0,0(__t.0)
    addi __i.4,__i.3,    1
    mv	__i.3,__i.4 
    mv	breaker,__i.3 
    j	%__forcondBB2
%_afterCallBB2:
    addi _i.6,_i.5,    1
    mv	_i.5,_i.6 
    mv	breaker,_i.5 
    j	%_forcondBB4
%_forbodyBB3:
    j	%_forbodyBB3
%_forbodyBB1:
    li t, 4
    mul _t.0,_i.2,t
    addi _t.0,_t.0,    4
    add _t.0,_boys.0,_t.0
    lw _t.0, 0(_t.0)
    mv	__m0.1,_haha.0 
    mv	__boys.1,_t.0 
    mv	__i.3,zero 
    j	%__forcondBB3
%__forcondBB3:
    add __t.0,__boys.1,zero
    lw __t.0, 0(__t.0)
    blt	__i.3,__t.0,	%__forbodyBB3
    j	%_afterCallBB3
%_afterCallBB3:
    addi _i.3,_i.2,    1
    mv	_i.2,_i.3 
    mv	breaker,_i.2 
    j	%_forcondBB3
%__forbodyBB3:
    addi __t.0,__m0.1,    4
    lw __t.0, 0(__t.0)
    addi __t.0,__t.0,    1
    sw __t.0,0(__t.0)
    addi __i.4,__i.3,    1
    mv	__i.3,__i.4 
    mv	breaker,__i.3 
    j	%__forcondBB3
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	age					#@age
    .p2align	2
age:
    .word	0
     
    .globl	eng					#@eng
    .p2align	2
eng:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  "Four score and seven years ago"    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  "naive!\n"    
    .globl	_globalStr2					#@_globalStr2
_globalStr2:
    .asciz  "fast!\n"    
    .globl	_globalStr3					#@_globalStr3
_globalStr3:
    .asciz  "too young\\too simple."    
    .globl	_globalStr4					#@_globalStr4
_globalStr4:
    .asciz  "test"    
    .globl	_globalStr5					#@_globalStr5
_globalStr5:
    .asciz  "Four score and seven years ago\n\\\""    
    .globl	_globalStr6					#@_globalStr6
_globalStr6:
    .asciz  "HongKong"    
    .globl	_globalStr7					#@_globalStr7
_globalStr7:
    .asciz  "too young!\\"    
    .globl	_globalStr8					#@_globalStr8
_globalStr8:
    .asciz  "wukefengggao\n"    
