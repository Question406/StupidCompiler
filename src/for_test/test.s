    .text
    .globl	A.A						 # func begin 
    .p2align	2
    .type	A.A,@function
A.A:
%A.A.entryBB1:
    addi sp,sp,    -16
    sw ra, 8(sp) 
    sw s7, 4(sp) 
    add s7,a0,zero
    li a0, 4
    call malloc
    sw a0, 0(sp) 
    lw a0, 0(sp) 
    call	B.B
    lw t1, 0(sp) 
    sw t1,0(s7)
    lw s7, 4(sp) 
    lw ra, 8(sp) 
    addi sp,sp,    16
    ret
								 # func end
    .globl	B.B						 # func begin 
    .p2align	2
    .type	B.B,@function
B.B:
%B.B.entryBB1:
    addi sp,sp,    -16
    sw ra, 8(sp) 
    sw s7, 4(sp) 
    add s7,a0,zero
    li a0, 4
    call malloc
    sw a0, 0(sp) 
    lw a0, 0(sp) 
    call	A.A
    lw t1, 0(sp) 
    sw t1,0(s7)
    lw s7, 4(sp) 
    lw ra, 8(sp) 
    addi sp,sp,    16
    ret
								 # func end
    .globl	main						 # func begin 
    .p2align	2
    .type	main,@function
main:
%__init.entryBB1:
    addi sp,sp,    -16
    sw ra, 8(sp) 
    sw s7, 4(sp) 
    sw s6, 0(sp) 
    li a0, 4
    call malloc
    mv	s6,a0 
    mv	a0,s6 
    call	A.A
    li a0, 4
    call malloc
    mv	s7,a0 
    mv	a0,s7 
    call	B.B
    add t1,s6,zero
    sw s7,0(t1)
    add t1,s7,zero
    sw s6,0(t1)
    lw s6, 0(sp) 
    lw s7, 4(sp) 
    lw ra, 8(sp) 
    mv	a0,zero 
    addi sp,sp,    16
    ret
								 # func end
    .section	.sdata,"aw",@progbits
