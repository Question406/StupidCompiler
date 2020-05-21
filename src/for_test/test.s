    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    li a0, 20
    ret
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	x					#@x
    .p2align	2
x:
    .word	0
     
