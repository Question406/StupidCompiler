    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -1040
    sw ra, 204(sp) 
    sw s0, 668(sp) 
    sw s1, 352(sp) 
    sw s2, 356(sp) 
    sw s3, 380(sp) 
    sw s4, 704(sp) 
    sw s5, 496(sp) 
    sw s6, 928(sp) 
    sw s7, 140(sp) 
    sw s8, 684(sp) 
    sw s9, 272(sp) 
    sw s10, 768(sp) 
    sw s11, 52(sp) 
    li a0, 8
    call malloc
    li t0, 1
    sw t0,0(a0)
    li t0, 0
    sw t0,4(a0)
    addi t6,a0,    4
    lw t0, 0(t6)
    addi t0,t0,    1
    sw t0, 628(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 392(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 616(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 208(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 612(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 116(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 972(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 428(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 912(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 452(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 128(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 524(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 1012(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 152(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 432(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 480(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 148(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 740(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 976(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 996(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 336(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 640(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 92(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 132(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 688(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 648(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 660(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 164(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 172(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 652(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 796(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 484(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 752(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 376(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 180(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 96(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 716(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 40(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 952(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 984(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 828(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 340(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 444(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 520(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 924(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 644(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 260(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 584(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 808(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 624(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 904(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 84(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 780(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 844(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 248(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 468(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 536(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 160(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 776(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 316(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 956(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 736(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 244(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 36(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 212(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 604(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 44(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 800(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 632(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 840(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 144(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 364(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 532(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 20(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 72(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 988(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 880(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 1020(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 680(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 312(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 948(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 592(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 332(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 12(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 188(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 320(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 552(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 732(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 940(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 460(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 252(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 156(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 440(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 228(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 284(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 372(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 792(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 664(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 240(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 408(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 700(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 388(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 876(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 236(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 852(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 80(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 404(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 980(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 76(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 268(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 88(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 216(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 816(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 760(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 720(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 108(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 488(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 456(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 288(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 256(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 264(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 64(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 920(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 200(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 548(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 104(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 368(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 412(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 436(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 528(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 424(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 884(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 608(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 324(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 576(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 848(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 224(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 672(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 656(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 756(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 348(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 788(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 676(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 280(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 48(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 888(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 908(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 544(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 1004(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 232(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 508(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 296(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 708(sp) 
    sw t0,0(t6)
    addi s6,t0,    1
    sw s6,0(t6)
    mv	t0,s6 
    addi t0,t0,    1
    sw t0, 900(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 916(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 184(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 944(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 936(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 696(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 556(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 596(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 4(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 1000(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 784(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 168(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 68(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 124(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 540(sp) 
    sw t0,0(t6)
    addi s9,t0,    1
    sw s9,0(t6)
    mv	t0,s9 
    addi s0,t0,    1
    sw s0,0(t6)
    mv	t0,s0 
    addi t0,t0,    1
    sw t0, 824(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 864(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 400(sp) 
    sw t0,0(t6)
    addi s4,t0,    1
    sw s4,0(t6)
    mv	t0,s4 
    addi t0,t0,    1
    sw t0, 56(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 748(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 1008(sp) 
    sw t0,0(t6)
    addi s7,t0,    1
    sw s7,0(t6)
    mv	t0,s7 
    addi t0,t0,    1
    sw t0, 300(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 112(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 728(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 812(sp) 
    sw t0,0(t6)
    addi s2,t0,    1
    sw s2,0(t6)
    mv	t0,s2 
    addi t0,t0,    1
    sw t0, 512(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 420(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 1024(sp) 
    sw t0,0(t6)
    addi s3,t0,    1
    sw s3,0(t6)
    mv	t0,s3 
    addi t0,t0,    1
    sw t0, 724(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 308(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 464(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 712(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 856(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 328(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 504(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 192(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 960(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 636(sp) 
    sw t0,0(t6)
    addi s8,t0,    1
    sw s8,0(t6)
    mv	t0,s8 
    addi t0,t0,    1
    sw t0, 304(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 448(sp) 
    sw t0,0(t6)
    addi s11,t0,    1
    sw s11,0(t6)
    mv	t0,s11 
    addi t0,t0,    1
    sw t0, 220(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 836(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 276(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 744(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 396(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 120(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 772(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 16(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 968(sp) 
    sw t0,0(t6)
    addi s5,t0,    1
    sw s5,0(t6)
    mv	t0,s5 
    addi s1,t0,    1
    sw s1,0(t6)
    mv	t0,s1 
    addi t0,t0,    1
    sw t0, 28(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 136(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 100(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 588(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 600(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 344(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 492(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 964(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 360(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 196(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 560(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 860(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 8(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 564(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 176(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 472(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 620(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 292(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 60(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 872(sp) 
    sw t0,0(t6)
    addi s10,t0,    1
    sw s10,0(t6)
    mv	t0,s10 
    addi t0,t0,    1
    sw t0, 384(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 516(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 820(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 580(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 32(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 416(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 692(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 992(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 572(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 764(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 500(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 0(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 868(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 896(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 24(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 1016(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 568(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 476(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 804(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 832(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 892(sp) 
    sw t0,0(t6)
    addi t0,t0,    1
    sw t0, 932(sp) 
    sw t0,0(t6)
    lw a0, 628(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 392(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 616(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 208(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 612(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 116(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 972(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 428(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 912(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 452(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 128(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 524(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1012(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 152(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 432(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 480(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 148(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 740(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 976(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 996(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 336(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 640(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 92(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 132(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 688(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 648(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 660(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 164(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 172(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 652(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 796(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 484(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 752(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 376(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 180(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 96(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 716(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 40(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 952(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 984(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 828(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 340(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 444(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 520(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 924(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 644(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 260(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 584(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 808(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 624(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 904(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 84(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 780(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 844(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 248(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 468(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 536(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 160(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 776(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 316(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 956(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 736(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 244(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 36(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 212(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 604(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 44(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 800(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 632(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 840(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 144(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 364(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 532(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 20(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 72(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 988(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 880(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1020(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 680(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 312(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 948(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 592(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 332(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 12(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 188(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 320(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 552(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 732(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 940(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 460(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 252(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 156(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 440(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 228(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 284(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 372(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 792(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 664(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 240(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 408(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 700(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 388(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 876(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 236(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 852(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 80(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 404(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 980(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 76(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 268(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 88(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 216(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 816(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 760(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 720(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 108(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 488(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 456(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 288(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 256(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 264(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 64(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 920(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 200(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 548(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 104(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 368(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 412(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 436(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 528(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 424(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 884(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 608(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 324(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 576(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 848(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 224(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 672(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 656(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 756(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 348(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 788(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 676(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 280(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 48(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 888(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 908(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 544(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1004(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 232(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 508(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 296(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 708(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s6 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 900(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 916(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 184(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 944(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 936(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 696(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 556(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 596(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 4(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1000(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 784(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 168(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 68(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 124(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 540(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s9 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s0 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 824(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 864(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 400(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s4 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 56(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 748(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1008(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s7 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 300(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 112(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 728(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 812(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s2 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 512(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 420(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1024(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s3 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 724(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 308(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 464(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 712(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 856(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 328(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 504(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 192(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 960(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 636(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s8 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 304(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 448(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s11 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 220(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 836(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 276(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 744(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 396(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 120(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 772(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 16(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 968(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s5 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s1 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 28(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 136(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 100(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 588(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 600(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 344(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 492(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 964(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 360(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 196(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 560(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 860(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 8(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 564(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 176(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 472(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 620(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 292(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 60(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 872(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s10 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 384(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 516(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 820(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 580(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 32(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 416(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 692(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 992(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 572(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 764(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 500(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 0(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 868(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 896(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 24(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1016(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 568(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 476(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 804(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 832(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 892(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 932(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    la a0,_globalStr0    
    call	println
    lw a0, 628(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 392(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 616(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 208(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 612(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 116(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 972(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 428(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 912(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 452(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 128(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 524(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1012(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 152(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 432(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 480(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 148(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 740(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 976(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 996(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 336(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 640(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 92(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 132(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 688(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 648(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 660(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 164(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 172(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 652(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 796(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 484(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 752(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 376(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 180(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 96(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 716(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 40(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 952(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 984(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 828(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 340(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 444(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 520(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 924(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 644(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 260(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 584(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 808(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 624(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 904(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 84(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 780(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 844(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 248(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 468(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 536(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 160(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 776(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 316(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 956(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 736(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 244(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 36(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 212(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 604(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 44(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 800(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 632(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 840(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 144(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 364(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 532(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 20(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 72(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 988(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 880(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1020(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 680(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 312(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 948(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 592(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 332(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 12(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 188(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 320(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 552(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 732(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 940(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 460(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 252(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 156(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 440(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 228(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 284(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 372(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 792(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 664(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 240(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 408(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 700(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 388(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 876(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 236(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 852(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 80(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 404(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 980(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 76(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 268(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 88(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 216(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 816(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 760(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 720(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 108(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 488(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 456(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 288(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 256(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 264(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 64(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 920(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 200(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 548(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 104(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 368(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 412(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 436(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 528(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 424(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 884(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 608(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 324(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 576(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 848(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 224(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 672(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 656(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 756(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 348(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 788(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 676(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 280(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 48(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 888(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 908(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 544(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1004(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 232(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 508(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 296(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 708(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s6 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 900(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 916(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 184(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 944(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 936(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 696(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 556(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 596(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 4(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1000(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 784(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 168(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 68(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 124(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 540(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s9 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s0 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 824(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 864(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 400(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s4 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 56(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 748(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1008(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s7 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 300(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 112(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 728(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 812(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s2 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 512(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 420(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1024(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s3 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 724(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 308(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 464(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 712(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 856(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 328(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 504(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 192(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 960(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 636(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s8 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 304(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 448(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s11 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 220(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 836(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 276(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 744(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 396(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 120(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 772(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 16(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 968(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s5 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s1 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 28(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 136(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 100(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 588(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 600(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 344(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 492(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 964(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 360(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 196(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 560(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 860(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 8(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 564(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 176(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 472(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 620(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 292(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 60(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 872(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    mv	a0,s10 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 384(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 516(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 820(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 580(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 32(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 416(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 692(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 992(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 572(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 764(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 500(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 0(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 868(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 896(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 24(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 1016(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 568(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 476(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 804(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 832(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 892(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    lw a0, 932(sp) 
    call	toString
    la a1,_globalStr1    
    call	_stringAdd
    call	print
    la a0,_globalStr0    
    call	println
    lw s11, 52(sp) 
    lw s10, 768(sp) 
    lw s9, 272(sp) 
    lw s8, 684(sp) 
    lw s7, 140(sp) 
    lw s6, 928(sp) 
    lw s5, 496(sp) 
    lw s4, 704(sp) 
    lw s3, 380(sp) 
    lw s2, 356(sp) 
    lw s1, 352(sp) 
    lw s0, 668(sp) 
    lw ra, 204(sp) 
    mv	a0,zero 
    addi sp,sp,    1040
    ret
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	count					#@count
    .p2align	2
count:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  ""    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  " "    
