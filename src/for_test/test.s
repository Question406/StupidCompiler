    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -176
    sw ra, 132(sp) 
    sw s9, 32(sp) 
    sw s10, 128(sp) 
    sw s11, 156(sp) 
    sw s0, 72(sp) 
    sw s1, 140(sp) 
    sw s2, 4(sp) 
    sw s3, 88(sp) 
    sw s4, 96(sp) 
    sw s5, 152(sp) 
    sw s6, 20(sp) 
    sw s7, 136(sp) 
    sw s8, 48(sp) 
    li a0, 12
    call malloc
    mv	s10,a0 
    li t2, 0
    sw t2,0(s10)
    li t2, 0
    sw t2,4(s10)
    li t2, 0
    sw t2,8(s10)
    li a0, 12
    call malloc
    mv	s11,a0 
    li t2, 0
    sw t2,0(s11)
    li t2, 0
    sw t2,4(s11)
    li t2, 0
    sw t2,8(s11)
    li a0, 12
    call malloc
    mv	s3,a0 
    li t2, 0
    sw t2,0(s3)
    li t2, 0
    sw t2,4(s3)
    li t2, 0
    sw t2,8(s3)
    li a0, 12
    call malloc
    mv	s7,a0 
    li t2, 0
    sw t2,0(s7)
    li t2, 0
    sw t2,4(s7)
    li t2, 0
    sw t2,8(s7)
    add t2,s10,zero
    sw t2, 8(sp) 
    lw t2, 8(sp) 
    lw a0, 0(t2)
    call	toString
    mv	a1,a0 
    la a0,_globalStr1    
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s0,a0 
    addi t2,s10,    4
    sw t2, 56(sp) 
    lw t2, 56(sp) 
    lw a0, 0(t2)
    call	toString
    mv	a1,a0 
    mv	a0,s0 
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s0,a0 
    addi t2,s10,    8
    sw t2, 52(sp) 
    lw t2, 52(sp) 
    lw a0, 0(t2)
    call	toString
    mv	a1,a0 
    mv	a0,s0 
    call	_stringAdd
    la a1,_globalStr0    
    call	_stringAdd
    call	println
    li t2, 849
    sw t2,0(s10)
    li t2, -463
    sw t2,4(s10)
    li t2, 480
    sw t2,8(s10)
    li t2, -208
    sw t2,0(s11)
    li t2, 585
    sw t2,4(s11)
    li t2, -150
    sw t2,8(s11)
    li t2, 360
    sw t2,0(s3)
    li t2, -670
    sw t2,4(s3)
    li t2, -742
    sw t2,8(s3)
    li t2, -29
    sw t2,0(s7)
    li t2, -591
    sw t2,4(s7)
    li t2, -960
    sw t2,8(s7)
    add s5,s10,zero
    add s6,s11,zero
    lw t1, 0(s5)
    lw t2, 0(s6)
    add t2,t1,t2
    add ra,s10,zero
    sw t2,0(ra)
    addi a0,s10,    4
    addi t0,s11,    4
    lw t1, 0(a0)
    lw t2, 0(t0)
    add t2,t1,t2
    addi s4,s10,    4
    sw t2,0(s4)
    addi t2,s10,    8
    addi a3,s11,    8
    lw t1, 0(t2)
    lw a2, 0(a3)
    add t1,t1,a2
    addi s0,s10,    8
    sw t1,0(s0)
    add s9,s11,zero
    add a6,s3,zero
    lw a2, 0(s9)
    lw t1, 0(a6)
    add t1,a2,t1
    add a2,s11,zero
    sw a2, 164(sp) 
    lw a2, 164(sp) 
    sw t1,0(a2)
    addi t4,s11,    4
    addi s2,s3,    4
    lw a2, 0(t4)
    lw t1, 0(s2)
    add t1,a2,t1
    addi a5,s11,    4
    sw t1,0(a5)
    addi s8,s11,    8
    addi t5,s3,    8
    lw t1, 0(s8)
    lw a2, 0(t5)
    add a2,t1,a2
    addi t1,s11,    8
    sw t1, 44(sp) 
    lw t1, 44(sp) 
    sw a2,0(t1)
    lw t1, 0(s7)
    lw a2, 0(a6)
    add t1,t1,a2
    sw t1,0(s7)
    lw a2, 4(s7)
    lw t1, 0(s2)
    add t1,a2,t1
    sw t1,4(s7)
    lw a2, 8(s7)
    lw t1, 0(t5)
    add t1,a2,t1
    sw t1,8(s7)
    lw a2, 0(s3)
    lw t1, 0(s10)
    sub t1,a2,t1
    sw t1,0(s3)
    lw t1, 4(s3)
    lw a2, 4(s10)
    sub t1,t1,a2
    sw t1,4(s3)
    lw a2, 8(s3)
    lw t1, 8(s10)
    sub t1,a2,t1
    sw t1,8(s3)
    add t1,s11,zero
    sw t1, 120(sp) 
    add t1,s7,zero
    sw t1, 148(sp) 
    lw t1, 120(sp) 
    lw a2, 0(t1)
    lw t1, 148(sp) 
    lw t1, 0(t1)
    sub a2,a2,t1
    add t1,s11,zero
    sw t1, 28(sp) 
    lw t1, 28(sp) 
    sw a2,0(t1)
    addi t1,s11,    4
    sw t1, 64(sp) 
    addi a4,s7,    4
    lw t1, 64(sp) 
    lw a2, 0(t1)
    lw t1, 0(a4)
    sub t1,a2,t1
    addi a2,s11,    4
    sw a2, 80(sp) 
    lw a2, 80(sp) 
    sw t1,0(a2)
    addi a7,s11,    8
    addi t1,s7,    8
    sw t1, 60(sp) 
    lw a2, 0(a7)
    lw t1, 60(sp) 
    lw t1, 0(t1)
    sub a2,a2,t1
    addi t1,s11,    8
    sw t1, 144(sp) 
    lw t1, 144(sp) 
    sw a2,0(t1)
    add t1,s3,zero
    sw t1, 0(sp) 
    lw t1, 0(s7)
    lw a2, 0(sp) 
    lw a2, 0(a2)
    sub t1,t1,a2
    sw t1,0(s7)
    addi t1,s3,    4
    sw t1, 104(sp) 
    lw a2, 4(s7)
    lw t1, 104(sp) 
    lw t1, 0(t1)
    sub t1,a2,t1
    sw t1,4(s7)
    addi t3,s3,    8
    lw a2, 8(s7)
    lw t1, 0(t3)
    sub t1,a2,t1
    sw t1,8(s7)
    add t6,s3,zero
    lw a2, 0(t6)
    lw t1, 0(s6)
    add t1,a2,t1
    add a2,s3,zero
    sw a2, 124(sp) 
    lw a2, 124(sp) 
    sw t1,0(a2)
    addi t1,s3,    4
    sw t1, 16(sp) 
    lw t1, 16(sp) 
    lw t1, 0(t1)
    lw a2, 0(t0)
    add t1,t1,a2
    addi a1,s3,    4
    sw t1,0(a1)
    addi t1,s3,    8
    sw t1, 160(sp) 
    lw t1, 160(sp) 
    lw t1, 0(t1)
    sw t1, 84(sp) 
    lw t1, 0(a3)
    lw a2, 84(sp) 
    add t1,a2,t1
    sw t1, 12(sp) 
    addi a2,s3,    8
    lw t1, 12(sp) 
    sw t1,0(a2)
    lw t1, 0(s5)
    sw t1, 36(sp) 
    lw t1, 0(s6)
    sw t1, 116(sp) 
    lw t1, 36(sp) 
    lw s1, 116(sp) 
    add t1,t1,s1
    sw t1, 108(sp) 
    lw t1, 108(sp) 
    sw t1,0(ra)
    lw t1, 0(a0)
    sw t1, 76(sp) 
    lw t1, 0(t0)
    sw t1, 24(sp) 
    lw t1, 76(sp) 
    lw s1, 24(sp) 
    add t1,t1,s1
    sw t1, 40(sp) 
    lw t1, 40(sp) 
    sw t1,0(s4)
    lw t1, 0(t2)
    sw t1, 92(sp) 
    lw t1, 0(a3)
    sw t1, 112(sp) 
    lw t1, 112(sp) 
    lw s1, 92(sp) 
    add t1,s1,t1
    sw t1, 68(sp) 
    lw t1, 68(sp) 
    sw t1,0(s0)
    lw s1, 0(s9)
    lw t1, 0(s6)
    sw t1, 100(sp) 
    lw t1, 100(sp) 
    add s1,s1,t1
    lw t1, 164(sp) 
    sw s1,0(t1)
    lw t4, 0(t4)
    lw t1, 0(t0)
    add t1,t4,t1
    sw t1,0(a5)
    lw a5, 0(s8)
    lw t1, 0(a3)
    add a5,a5,t1
    lw t1, 44(sp) 
    sw a5,0(t1)
    lw a5, 0(t6)
    lw t1, 0(a6)
    add t1,a5,t1
    lw a5, 124(sp) 
    sw t1,0(a5)
    lw t1, 16(sp) 
    lw a5, 0(t1)
    lw t1, 0(s2)
    add t1,a5,t1
    sw t1,0(a1)
    lw t1, 160(sp) 
    lw a5, 0(t1)
    lw t1, 0(t5)
    add t1,a5,t1
    sw t1,0(a2)
    lw a2, 0(s10)
    lw t1, 148(sp) 
    lw t1, 0(t1)
    sub t1,a2,t1
    sw t1,0(s10)
    lw t1, 4(s10)
    lw a2, 0(a4)
    sub t1,t1,a2
    sw t1,4(s10)
    lw a2, 8(s10)
    lw t1, 60(sp) 
    lw t1, 0(t1)
    sub t1,a2,t1
    sw t1,8(s10)
    lw a2, 0(s5)
    lw t1, 0(s6)
    add t1,a2,t1
    sw t1,0(ra)
    lw t1, 0(a0)
    lw a2, 0(t0)
    add t1,t1,a2
    sw t1,0(s4)
    lw t2, 0(t2)
    lw t1, 0(a3)
    add t2,t2,t1
    sw t2,0(s0)
    lw t2, 120(sp) 
    lw t1, 0(t2)
    lw t2, 0(sp) 
    lw t2, 0(t2)
    sub t1,t1,t2
    lw t2, 28(sp) 
    sw t1,0(t2)
    lw t2, 64(sp) 
    lw t2, 0(t2)
    lw t1, 104(sp) 
    lw t1, 0(t1)
    sub t1,t2,t1
    lw t2, 80(sp) 
    sw t1,0(t2)
    lw t2, 0(a7)
    lw t1, 0(t3)
    sub t2,t2,t1
    lw t1, 144(sp) 
    sw t2,0(t1)
    lw t1, 0(s10)
    mv	t2,t1 
    mul a2,t1,t2
    lw t2, 4(s10)
    mv	t1,t2 
    mul t2,t2,t1
    add a2,a2,t2
    lw t2, 8(s10)
    mv	t1,t2 
    mul t2,t2,t1
    add a0,a2,t2
    call	printlnInt
    lw t1, 0(s11)
    mv	t2,t1 
    mul a2,t1,t2
    lw t1, 4(s11)
    mv	t2,t1 
    mul t2,t1,t2
    add t2,a2,t2
    lw t1, 8(s11)
    mv	a2,t1 
    mul t1,t1,a2
    add a0,t2,t1
    call	printlnInt
    lw t1, 0(s11)
    lw t2, 0(s3)
    sub a2,t1,t2
    lw t1, 0(s11)
    lw t2, 0(s3)
    sub t2,t1,t2
    mul t1,a2,t2
    lw a2, 4(s11)
    lw t2, 4(s3)
    sub a2,a2,t2
    lw a5, 4(s11)
    lw t2, 4(s3)
    sub t2,a5,t2
    mul t2,a2,t2
    add a5,t1,t2
    lw t1, 8(s11)
    lw t2, 8(s3)
    sub a2,t1,t2
    lw t2, 8(s11)
    lw t1, 8(s3)
    sub t2,t2,t1
    mul t2,a2,t2
    add a0,a5,t2
    call	printlnInt
    lw t1, 0(s7)
    lw t2, 0(s10)
    sub t1,t1,t2
    lw t2, 0(s7)
    lw a2, 0(s10)
    sub t2,t2,a2
    mul a5,t1,t2
    lw t1, 4(s7)
    lw t2, 4(s10)
    sub a2,t1,t2
    lw t2, 4(s7)
    lw t1, 4(s10)
    sub t2,t2,t1
    mul t2,a2,t2
    add t2,a5,t2
    lw t1, 8(s7)
    lw a2, 8(s10)
    sub a5,t1,a2
    lw a2, 8(s7)
    lw t1, 8(s10)
    sub t1,a2,t1
    mul t1,a5,t1
    add a0,t2,t1
    call	printlnInt
    lw t2, 0(s3)
    lw t1, 0(s10)
    mul t2,t2,t1
    lw a2, 4(s3)
    lw t1, 4(s10)
    mul t1,a2,t1
    add a2,t2,t1
    lw t1, 8(s3)
    lw t2, 8(s10)
    mul t2,t1,t2
    add a0,a2,t2
    call	printlnInt
    li a0, 12
    call malloc
    mv	s10,a0 
    li t2, 0
    sw t2,0(s10)
    li t2, 0
    sw t2,4(s10)
    li t2, 0
    sw t2,8(s10)
    lw t1, 4(s11)
    lw t2, 8(s7)
    mul a2,t1,t2
    lw t2, 8(s11)
    lw t1, 4(s7)
    mul t2,t2,t1
    sub a5,a2,t2
    lw t2, 8(s11)
    lw t1, 0(s7)
    mul t1,t2,t1
    lw t2, 0(s11)
    lw a2, 8(s7)
    mul t2,t2,a2
    sub t4,t1,t2
    lw t2, 0(s11)
    lw t1, 4(s7)
    mul t1,t2,t1
    lw a2, 4(s11)
    lw t2, 0(s7)
    mul t2,a2,t2
    sub t2,t1,t2
    sw a5,0(s10)
    sw t4,4(s10)
    sw t2,8(s10)
    lw a0, 0(s10)
    call	toString
    mv	a1,a0 
    la a0,_globalStr1    
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s0,a0 
    lw a0, 4(s10)
    call	toString
    mv	a1,a0 
    mv	a0,s0 
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s0,a0 
    lw a0, 8(s10)
    call	toString
    mv	a1,a0 
    mv	a0,s0 
    call	_stringAdd
    la a1,_globalStr0    
    call	_stringAdd
    call	println
    lw t2, 8(sp) 
    lw a0, 0(t2)
    call	toString
    mv	a1,a0 
    la a0,_globalStr1    
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s10,a0 
    lw t2, 56(sp) 
    lw a0, 0(t2)
    call	toString
    mv	a1,a0 
    mv	a0,s10 
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s10,a0 
    lw t2, 52(sp) 
    lw a0, 0(t2)
    call	toString
    mv	a1,a0 
    mv	a0,s10 
    call	_stringAdd
    la a1,_globalStr0    
    call	_stringAdd
    call	println
    lw a0, 0(s11)
    call	toString
    mv	a1,a0 
    la a0,_globalStr1    
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s10,a0 
    lw a0, 4(s11)
    call	toString
    mv	a1,a0 
    mv	a0,s10 
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s10,a0 
    lw a0, 8(s11)
    call	toString
    mv	a1,a0 
    mv	a0,s10 
    call	_stringAdd
    la a1,_globalStr0    
    call	_stringAdd
    call	println
    lw a0, 0(s3)
    call	toString
    mv	a1,a0 
    la a0,_globalStr1    
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s10,a0 
    lw a0, 4(s3)
    call	toString
    mv	a1,a0 
    mv	a0,s10 
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s10,a0 
    lw a0, 8(s3)
    call	toString
    mv	a1,a0 
    mv	a0,s10 
    call	_stringAdd
    la a1,_globalStr0    
    call	_stringAdd
    call	println
    lw a0, 0(s7)
    call	toString
    mv	a1,a0 
    la a0,_globalStr1    
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s10,a0 
    lw a0, 4(s7)
    call	toString
    mv	a1,a0 
    mv	a0,s10 
    call	_stringAdd
    la a1,_globalStr2    
    call	_stringAdd
    mv	s10,a0 
    lw a0, 8(s7)
    call	toString
    mv	a1,a0 
    mv	a0,s10 
    call	_stringAdd
    la a1,_globalStr0    
    call	_stringAdd
    call	println
    lw s8, 48(sp) 
    lw s7, 136(sp) 
    lw s6, 20(sp) 
    lw s5, 152(sp) 
    lw s4, 96(sp) 
    lw s3, 88(sp) 
    lw s2, 4(sp) 
    lw s1, 140(sp) 
    lw s0, 72(sp) 
    lw s11, 156(sp) 
    lw s10, 128(sp) 
    lw s9, 32(sp) 
    lw ra, 132(sp) 
    mv	a0,zero 
    addi sp,sp,    176
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
