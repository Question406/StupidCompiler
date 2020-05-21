    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    mv	backup_ra,ra 
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
    mv	back_s7,s7 
    mv	back_s8,s8 
    li a0, 12
    call malloc
    mv	_t.0,a0 
    li _t, 0
    sw _t,0(_t.0)
    li _t, 0
    sw _t,4(_t.0)
    li _t, 0
    sw _t,8(_t.0)
    li a0, 12
    call malloc
    mv	_t.0,a0 
    li _t, 0
    sw _t,0(_t.0)
    li _t, 0
    sw _t,4(_t.0)
    li _t, 0
    sw _t,8(_t.0)
    li a0, 12
    call malloc
    mv	_t.0,a0 
    li _t, 0
    sw _t,0(_t.0)
    li _t, 0
    sw _t,4(_t.0)
    li _t, 0
    sw _t,8(_t.0)
    li a0, 12
    call malloc
    mv	_t.0,a0 
    li _t, 0
    sw _t,0(_t.0)
    li _t, 0
    sw _t,4(_t.0)
    li _t, 0
    sw _t,8(_t.0)
    add __t.0,_t.0,zero
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    la para,_globalStr1    
    mv	a0,para 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr2    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    addi __t.0,_t.0,    4
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr2    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    addi __t.0,_t.0,    8
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    li _t, 849
    sw _t,0(_t.0)
    li _t, -463
    sw _t,4(_t.0)
    li _t, 480
    sw _t,8(_t.0)
    li _t, -208
    sw _t,0(_t.0)
    li _t, 585
    sw _t,4(_t.0)
    li _t, -150
    sw _t,8(_t.0)
    li _t, 360
    sw _t,0(_t.0)
    li _t, -670
    sw _t,4(_t.0)
    li _t, -742
    sw _t,8(_t.0)
    li _t, -29
    sw _t,0(_t.0)
    li _t, -591
    sw _t,4(_t.0)
    li _t, -960
    sw _t,8(_t.0)
    add __t.0,_t.0,zero
    add __t.0,_t.0,zero
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    add __t.0,_t.0,zero
    sw __t.0,0(__t.0)
    addi __t.0,_t.0,    4
    addi __t.0,_t.0,    4
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    addi __t.0,_t.0,    4
    sw __t.0,0(__t.0)
    addi __t.0,_t.0,    8
    addi __t.0,_t.0,    8
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    addi __t.0,_t.0,    8
    sw __t.0,0(__t.0)
    add __t.0,_t.0,zero
    add __t.0,_t.0,zero
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    add __t.0,_t.0,zero
    sw __t.0,0(__t.0)
    addi __t.0,_t.0,    4
    addi __t.0,_t.0,    4
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    addi __t.0,_t.0,    4
    sw __t.0,0(__t.0)
    addi __t.0,_t.0,    8
    addi __t.0,_t.0,    8
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    addi __t.0,_t.0,    8
    sw __t.0,0(__t.0)
    lw __t.0, 0(_t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(_t.0)
    lw __t.0, 4(_t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,4(_t.0)
    lw __t.0, 8(_t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,8(_t.0)
    lw __t.0, 0(_t.0)
    lw __t.0, 0(_t.0)
    sub __t.0,__t.0,__t.0
    sw __t.0,0(_t.0)
    lw __t.0, 4(_t.0)
    lw __t.0, 4(_t.0)
    sub __t.0,__t.0,__t.0
    sw __t.0,4(_t.0)
    lw __t.0, 8(_t.0)
    lw __t.0, 8(_t.0)
    sub __t.0,__t.0,__t.0
    sw __t.0,8(_t.0)
    add __t.0,_t.0,zero
    add __t.0,_t.0,zero
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    sub __t.0,__t.0,__t.0
    add __t.0,_t.0,zero
    sw __t.0,0(__t.0)
    addi __t.0,_t.0,    4
    addi __t.0,_t.0,    4
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    sub __t.0,__t.0,__t.0
    addi __t.0,_t.0,    4
    sw __t.0,0(__t.0)
    addi __t.0,_t.0,    8
    addi __t.0,_t.0,    8
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    sub __t.0,__t.0,__t.0
    addi __t.0,_t.0,    8
    sw __t.0,0(__t.0)
    add __t.0,_t.0,zero
    lw __t.0, 0(_t.0)
    lw __t.0, 0(__t.0)
    sub __t.0,__t.0,__t.0
    sw __t.0,0(_t.0)
    addi __t.0,_t.0,    4
    lw __t.0, 4(_t.0)
    lw __t.0, 0(__t.0)
    sub __t.0,__t.0,__t.0
    sw __t.0,4(_t.0)
    addi __t.0,_t.0,    8
    lw __t.0, 8(_t.0)
    lw __t.0, 0(__t.0)
    sub __t.0,__t.0,__t.0
    sw __t.0,8(_t.0)
    add __t.0,_t.0,zero
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    add __t.0,_t.0,zero
    sw __t.0,0(__t.0)
    addi __t.0,_t.0,    4
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    addi __t.0,_t.0,    4
    sw __t.0,0(__t.0)
    addi __t.0,_t.0,    8
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    addi __t.0,_t.0,    8
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(_t.0)
    lw __t.0, 0(__t.0)
    sub __t.0,__t.0,__t.0
    sw __t.0,0(_t.0)
    lw __t.0, 4(_t.0)
    lw __t.0, 0(__t.0)
    sub __t.0,__t.0,__t.0
    sw __t.0,4(_t.0)
    lw __t.0, 8(_t.0)
    lw __t.0, 0(__t.0)
    sub __t.0,__t.0,__t.0
    sw __t.0,8(_t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    add __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    sub __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    sub __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(__t.0)
    lw __t.0, 0(__t.0)
    sub __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    lw __t.0, 0(_t.0)
    lw __t.0, 0(_t.0)
    mul __t.0,__t.0,__t.0
    lw __t.0, 4(_t.0)
    lw __t.0, 4(_t.0)
    mul __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    lw __t.0, 8(_t.0)
    lw __t.0, 8(_t.0)
    mul __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    mv	a0,__t.0 
    call	printlnInt
    lw __t.0, 0(_t.0)
    lw __t.0, 0(_t.0)
    mul __t.0,__t.0,__t.0
    lw __t.0, 4(_t.0)
    lw __t.0, 4(_t.0)
    mul __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    lw __t.0, 8(_t.0)
    lw __t.0, 8(_t.0)
    mul __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    mv	a0,__t.0 
    call	printlnInt
    lw __t.0, 0(_t.0)
    lw __t.0, 0(_t.0)
    sub __t.0,__t.0,__t.0
    lw __t.0, 0(_t.0)
    lw __t.0, 0(_t.0)
    sub __t.0,__t.0,__t.0
    mul __t.0,__t.0,__t.0
    lw __t.0, 4(_t.0)
    lw __t.0, 4(_t.0)
    sub __t.0,__t.0,__t.0
    lw __t.0, 4(_t.0)
    lw __t.0, 4(_t.0)
    sub __t.0,__t.0,__t.0
    mul __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    lw __t.0, 8(_t.0)
    lw __t.0, 8(_t.0)
    sub __t.0,__t.0,__t.0
    lw __t.0, 8(_t.0)
    lw __t.0, 8(_t.0)
    sub __t.0,__t.0,__t.0
    mul __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    mv	a0,__t.0 
    call	printlnInt
    lw __t.0, 0(_t.0)
    lw __t.0, 0(_t.0)
    sub __t.0,__t.0,__t.0
    lw __t.0, 0(_t.0)
    lw __t.0, 0(_t.0)
    sub __t.0,__t.0,__t.0
    mul __t.0,__t.0,__t.0
    lw __t.0, 4(_t.0)
    lw __t.0, 4(_t.0)
    sub __t.0,__t.0,__t.0
    lw __t.0, 4(_t.0)
    lw __t.0, 4(_t.0)
    sub __t.0,__t.0,__t.0
    mul __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    lw __t.0, 8(_t.0)
    lw __t.0, 8(_t.0)
    sub __t.0,__t.0,__t.0
    lw __t.0, 8(_t.0)
    lw __t.0, 8(_t.0)
    sub __t.0,__t.0,__t.0
    mul __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    mv	a0,__t.0 
    call	printlnInt
    lw __t.0, 0(_t.0)
    lw __t.0, 0(_t.0)
    mul __t.0,__t.0,__t.0
    lw __t.0, 4(_t.0)
    lw __t.0, 4(_t.0)
    mul __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    lw __t.0, 8(_t.0)
    lw __t.0, 8(_t.0)
    mul __t.0,__t.0,__t.0
    add __t.0,__t.0,__t.0
    mv	a0,__t.0 
    call	printlnInt
    li a0, 12
    call malloc
    mv	__t.0,a0 
    li _t, 0
    sw _t,0(__t.0)
    li _t, 0
    sw _t,4(__t.0)
    li _t, 0
    sw _t,8(__t.0)
    lw __t.0, 4(_t.0)
    lw __t.0, 8(_t.0)
    mul __t.0,__t.0,__t.0
    lw __t.0, 8(_t.0)
    lw __t.0, 4(_t.0)
    mul __t.0,__t.0,__t.0
    sub __t.0,__t.0,__t.0
    lw __t.0, 8(_t.0)
    lw __t.0, 0(_t.0)
    mul __t.0,__t.0,__t.0
    lw __t.0, 0(_t.0)
    lw __t.0, 8(_t.0)
    mul __t.0,__t.0,__t.0
    sub __t.0,__t.0,__t.0
    lw __t.0, 0(_t.0)
    lw __t.0, 4(_t.0)
    mul __t.0,__t.0,__t.0
    lw __t.0, 4(_t.0)
    lw __t.0, 0(_t.0)
    mul __t.0,__t.0,__t.0
    sub __t.0,__t.0,__t.0
    sw __t.0,0(__t.0)
    sw __t.0,4(__t.0)
    sw __t.0,8(__t.0)
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    la para,_globalStr1    
    mv	a0,para 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr2    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    lw __t.0, 4(__t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr2    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    lw __t.0, 8(__t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    la para,_globalStr1    
    mv	a0,para 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr2    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr2    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    lw __t.0, 0(__t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    lw __t.0, 0(_t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    la para,_globalStr1    
    mv	a0,para 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr2    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    lw __t.0, 4(_t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr2    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    lw __t.0, 8(_t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    lw __t.0, 0(_t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    la para,_globalStr1    
    mv	a0,para 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr2    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    lw __t.0, 4(_t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr2    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    lw __t.0, 8(_t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    lw __t.0, 0(_t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    la para,_globalStr1    
    mv	a0,para 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr2    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    lw __t.0, 4(_t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr2    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    lw __t.0, 8(_t.0)
    mv	a0,__t.0 
    call	toString
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr0    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    call	println
    mv	s8,back_s8 
    mv	s7,back_s7 
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
    mv	ra,backup_ra 
    mv	a0,zero 
    ret
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  ")"    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  "("    
    .globl	_globalStr2					#@_globalStr2
_globalStr2:
    .asciz  ", "    
