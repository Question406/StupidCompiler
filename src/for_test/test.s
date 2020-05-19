    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -32
    sw ra, 20(sp) 
    sw s0, 0(sp) 
    sw s11, 24(sp) 
    sw s10, 16(sp) 
    sw s9, 12(sp) 
    sw s8, 8(sp) 
    sw s7, 4(sp) 
    mv	s9,s6 
    li a0, 12
    call malloc
    li a2, 0
    sw a2,0(a0)
    li a2, 0
    sw a2,4(a0)
    li a2, 0
    sw a2,8(a0)
    mv	s8,a0 
    li a0, 12
    call malloc
    li a2, 0
    sw a2,0(a0)
    li a2, 0
    sw a2,4(a0)
    li a2, 0
    sw a2,8(a0)
    mv	s0,a0 
    li a0, 12
    call malloc
    li a2, 0
    sw a2,0(a0)
    li a2, 0
    sw a2,4(a0)
    li a2, 0
    sw a2,8(a0)
    mv	s10,a0 
    li a0, 12
    call malloc
    li a2, 0
    sw a2,0(a0)
    li a2, 0
    sw a2,4(a0)
    li a2, 0
    sw a2,8(a0)
    mv	s6,a0 
    lw a0, 0(s8)
    call	toString
    mv	a1,a0 
    la a0,_globalStr1    
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s7,a0 
    lw a0, 4(s8)
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s7,a0 
    lw a0, 8(s8)
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    la a1,_globalStr0    
    call	_stringAdd
    call	println
    mv	a2,s8 
    li a3, 849
    sw a3,0(a2)
    li a3, -463
    sw a3,4(a2)
    li a3, 480
    sw a3,8(a2)
    mv	a2,s0 
    li a3, -208
    sw a3,0(a2)
    li a3, 585
    sw a3,4(a2)
    li a3, -150
    sw a3,8(a2)
    mv	a2,s10 
    li a3, 360
    sw a3,0(a2)
    li a3, -670
    sw a3,4(a2)
    li a3, -742
    sw a3,8(a2)
    mv	a2,s6 
    li a3, -29
    sw a3,0(a2)
    li a3, -591
    sw a3,4(a2)
    li a3, -960
    sw a3,8(a2)
    mv	a2,s8 
    mv	a3,s0 
    lw t5, 0(a2)
    lw a7, 0(a3)
    add a7,t5,a7
    sw a7,0(a2)
    lw t5, 4(a2)
    lw a7, 4(a3)
    add a7,t5,a7
    sw a7,4(a2)
    lw a7, 8(a2)
    lw a3, 8(a3)
    add a3,a7,a3
    sw a3,8(a2)
    mv	a3,s0 
    mv	a2,s10 
    lw t5, 0(a3)
    lw a7, 0(a2)
    add a7,t5,a7
    sw a7,0(a3)
    lw t5, 4(a3)
    lw a7, 4(a2)
    add a7,t5,a7
    sw a7,4(a3)
    lw a7, 8(a3)
    lw a2, 8(a2)
    add a2,a7,a2
    sw a2,8(a3)
    mv	a2,s6 
    mv	a3,s10 
    lw t5, 0(a2)
    lw a7, 0(a3)
    add a7,t5,a7
    sw a7,0(a2)
    lw a7, 4(a2)
    lw t5, 4(a3)
    add a7,a7,t5
    sw a7,4(a2)
    lw a7, 8(a2)
    lw a3, 8(a3)
    add a3,a7,a3
    sw a3,8(a2)
    mv	a2,s10 
    mv	a3,s8 
    lw a7, 0(a2)
    lw t5, 0(a3)
    sub a7,a7,t5
    sw a7,0(a2)
    lw t5, 4(a2)
    lw a7, 4(a3)
    sub a7,t5,a7
    sw a7,4(a2)
    lw a7, 8(a2)
    lw a3, 8(a3)
    sub a3,a7,a3
    sw a3,8(a2)
    mv	a3,s0 
    mv	a2,s6 
    lw t5, 0(a3)
    lw a7, 0(a2)
    sub a7,t5,a7
    sw a7,0(a3)
    lw a7, 4(a3)
    lw t5, 4(a2)
    sub a7,a7,t5
    sw a7,4(a3)
    lw a7, 8(a3)
    lw a2, 8(a2)
    sub a2,a7,a2
    sw a2,8(a3)
    mv	a2,s6 
    mv	a3,s10 
    lw t5, 0(a2)
    lw a7, 0(a3)
    sub a7,t5,a7
    sw a7,0(a2)
    lw a7, 4(a2)
    lw t5, 4(a3)
    sub a7,a7,t5
    sw a7,4(a2)
    lw a7, 8(a2)
    lw a3, 8(a3)
    sub a3,a7,a3
    sw a3,8(a2)
    mv	a2,s10 
    mv	a3,s0 
    lw t5, 0(a2)
    lw a7, 0(a3)
    add a7,t5,a7
    sw a7,0(a2)
    lw t5, 4(a2)
    lw a7, 4(a3)
    add a7,t5,a7
    sw a7,4(a2)
    lw a7, 8(a2)
    lw a3, 8(a3)
    add a3,a7,a3
    sw a3,8(a2)
    mv	a3,s8 
    mv	a2,s0 
    lw t5, 0(a3)
    lw a7, 0(a2)
    add a7,t5,a7
    sw a7,0(a3)
    lw t5, 4(a3)
    lw a7, 4(a2)
    add a7,t5,a7
    sw a7,4(a3)
    lw a7, 8(a3)
    lw a2, 8(a2)
    add a2,a7,a2
    sw a2,8(a3)
    mv	a3,s0 
    mv	a2,s0 
    lw a7, 0(a3)
    lw t5, 0(a2)
    add a7,a7,t5
    sw a7,0(a3)
    lw a7, 4(a3)
    lw t5, 4(a2)
    add a7,a7,t5
    sw a7,4(a3)
    lw a7, 8(a3)
    lw a2, 8(a2)
    add a2,a7,a2
    sw a2,8(a3)
    mv	a2,s10 
    mv	a3,s10 
    lw a7, 0(a2)
    lw t5, 0(a3)
    add a7,a7,t5
    sw a7,0(a2)
    lw t5, 4(a2)
    lw a7, 4(a3)
    add a7,t5,a7
    sw a7,4(a2)
    lw a7, 8(a2)
    lw a3, 8(a3)
    add a3,a7,a3
    sw a3,8(a2)
    mv	a3,s8 
    mv	a2,s6 
    lw a7, 0(a3)
    lw t5, 0(a2)
    sub a7,a7,t5
    sw a7,0(a3)
    lw a7, 4(a3)
    lw t5, 4(a2)
    sub a7,a7,t5
    sw a7,4(a3)
    lw a7, 8(a3)
    lw a2, 8(a2)
    sub a2,a7,a2
    sw a2,8(a3)
    mv	a2,s8 
    mv	a3,s0 
    lw t5, 0(a2)
    lw a7, 0(a3)
    add a7,t5,a7
    sw a7,0(a2)
    lw a7, 4(a2)
    lw t5, 4(a3)
    add a7,a7,t5
    sw a7,4(a2)
    lw a7, 8(a2)
    lw a3, 8(a3)
    add a3,a7,a3
    sw a3,8(a2)
    mv	a2,s0 
    mv	a3,s10 
    lw t5, 0(a2)
    lw a7, 0(a3)
    sub a7,t5,a7
    sw a7,0(a2)
    lw t5, 4(a2)
    lw a7, 4(a3)
    sub a7,t5,a7
    sw a7,4(a2)
    lw a7, 8(a2)
    lw a3, 8(a3)
    sub a3,a7,a3
    sw a3,8(a2)
    mv	a2,s8 
    lw a3, 0(a2)
    lw a7, 0(a2)
    mul a3,a3,a7
    lw a7, 4(a2)
    lw t5, 4(a2)
    mul a7,a7,t5
    add a3,a3,a7
    lw a7, 8(a2)
    lw a2, 8(a2)
    mul a2,a7,a2
    add a0,a3,a2
    call	toString
    call	println
    mv	a2,s0 
    lw a7, 0(a2)
    lw a3, 0(a2)
    mul a7,a7,a3
    lw t5, 4(a2)
    lw a3, 4(a2)
    mul a3,t5,a3
    add a7,a7,a3
    lw a3, 8(a2)
    lw a2, 8(a2)
    mul a2,a3,a2
    add a0,a7,a2
    call	toString
    call	println
    mv	a2,s0 
    mv	a3,s10 
    lw a7, 0(a2)
    lw t5, 0(a3)
    sub t5,a7,t5
    lw a7, 0(a2)
    lw a0, 0(a3)
    sub a7,a7,a0
    mul a0,t5,a7
    lw a7, 4(a2)
    lw t5, 4(a3)
    sub t5,a7,t5
    lw a7, 4(a2)
    lw t0, 4(a3)
    sub a7,a7,t0
    mul a7,t5,a7
    add a0,a0,a7
    lw a7, 8(a2)
    lw t5, 8(a3)
    sub a7,a7,t5
    lw t5, 8(a2)
    lw a2, 8(a3)
    sub a2,t5,a2
    mul a2,a7,a2
    add a0,a0,a2
    call	toString
    call	println
    mv	a3,s6 
    mv	a2,s8 
    lw t5, 0(a3)
    lw a7, 0(a2)
    sub t5,t5,a7
    lw a7, 0(a3)
    lw a0, 0(a2)
    sub a7,a7,a0
    mul t0,t5,a7
    lw t5, 4(a3)
    lw a7, 4(a2)
    sub a0,t5,a7
    lw a7, 4(a3)
    lw t5, 4(a2)
    sub a7,a7,t5
    mul a7,a0,a7
    add a7,t0,a7
    lw t5, 8(a3)
    lw a0, 8(a2)
    sub t5,t5,a0
    lw a3, 8(a3)
    lw a2, 8(a2)
    sub a2,a3,a2
    mul a2,t5,a2
    add a0,a7,a2
    call	toString
    call	println
    mv	a2,s10 
    mv	a3,s8 
    lw a7, 0(a2)
    lw t5, 0(a3)
    mul a0,a7,t5
    lw a7, 4(a2)
    lw t5, 4(a3)
    mul a7,a7,t5
    add a7,a0,a7
    lw a2, 8(a2)
    lw a3, 8(a3)
    mul a2,a2,a3
    add a0,a7,a2
    call	toString
    call	println
    mv	s7,s6 
    li a0, 12
    call malloc
    li a2, 0
    sw a2,0(a0)
    li a2, 0
    sw a2,4(a0)
    li a2, 0
    sw a2,8(a0)
    lw a3, 4(s0)
    lw a2, 8(s7)
    mul a2,a3,a2
    lw a7, 8(s0)
    lw a3, 4(s7)
    mul a3,a7,a3
    sub a7,a2,a3
    lw a2, 8(s0)
    lw a3, 0(s7)
    mul a2,a2,a3
    lw t5, 0(s0)
    lw a3, 8(s7)
    mul a3,t5,a3
    sub a3,a2,a3
    lw a2, 0(s0)
    lw t5, 4(s7)
    mul t0,a2,t5
    lw a2, 4(s0)
    lw t5, 0(s7)
    mul a2,a2,t5
    sub a2,t0,a2
    sw a7,0(a0)
    sw a3,4(a0)
    sw a2,8(a0)
    mv	s7,a0 
    lw a0, 0(s7)
    call	toString
    mv	a1,a0 
    la a0,_globalStr1    
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s11,a0 
    lw a0, 4(s7)
    call	toString
    mv	a1,a0 
    mv	a0,s11 
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s11,a0 
    lw a0, 8(s7)
    call	toString
    mv	a1,a0 
    mv	a0,s11 
    call	_stringAdd
    la a1,_globalStr0    
    call	_stringAdd
    call	println
    lw a0, 0(s8)
    call	toString
    mv	a1,a0 
    la a0,_globalStr1    
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s7,a0 
    lw a0, 4(s8)
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s7,a0 
    lw a0, 8(s8)
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    la a1,_globalStr0    
    call	_stringAdd
    call	println
    mv	s8,s0 
    lw a0, 0(s8)
    call	toString
    mv	a1,a0 
    la a0,_globalStr1    
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s7,a0 
    lw a0, 4(s8)
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s7,a0 
    lw a0, 8(s8)
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    la a1,_globalStr0    
    call	_stringAdd
    call	println
    mv	s8,s10 
    lw a0, 0(s8)
    call	toString
    mv	a1,a0 
    la a0,_globalStr1    
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s7,a0 
    lw a0, 4(s8)
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s7,a0 
    lw a0, 8(s8)
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    la a1,_globalStr0    
    call	_stringAdd
    call	println
    mv	s8,s6 
    lw a0, 0(s8)
    call	toString
    mv	a1,a0 
    la a0,_globalStr1    
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s7,a0 
    lw a0, 4(s8)
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s7,a0 
    lw a0, 8(s8)
    call	toString
    mv	a1,a0 
    mv	a0,s7 
    call	_stringAdd
    la a1,_globalStr0    
    call	_stringAdd
    call	println
    mv	s6,s9 
    lw s7, 4(sp) 
    lw s8, 8(sp) 
    lw s9, 12(sp) 
    lw s10, 16(sp) 
    lw s11, 24(sp) 
    lw s0, 0(sp) 
    lw ra, 20(sp) 
    mv	a0,zero 
    addi sp,sp,    32
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
