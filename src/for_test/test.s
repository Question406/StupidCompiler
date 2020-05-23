    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    addi sp,sp,    -48
    sw ra, 24(sp) 
    sw s10, 20(sp) 
    sw s11, 0(sp) 
    sw s0, 16(sp) 
    sw s1, 28(sp) 
    sw s2, 8(sp) 
    sw s3, 12(sp) 
    sw s4, 4(sp) 
    mv	s0,s5 
    li a0, 1028
    call malloc
    li t5, 256
    sw t5,0(a0)
    mv	s3,a0 
    li a0, 1028
    call malloc
    li t5, 256
    sw t5,0(a0)
    mv	s2,a0 
    la s4,_globalStr115    
    la s5,_globalStr19    
    la s10,_globalStr39    
    la t5,_globalStr83    
    sw t5,4(s2)
    la t5,_globalStr97    
    sw t5,8(s2)
    la t5,_globalStr1    
    sw t5,12(s2)
    la t5,_globalStr16    
    sw t5,16(s2)
    la t5,_globalStr29    
    sw t5,20(s2)
    la t5,_globalStr47    
    sw t5,24(s2)
    la t5,_globalStr65    
    sw t5,28(s2)
    la t5,_globalStr80    
    sw t5,32(s2)
    la t5,_globalStr93    
    sw t5,36(s2)
    la t5,_globalStr109    
    sw t5,40(s2)
    la t5,_globalStr123    
    sw t5,44(s2)
    la t5,_globalStr13    
    sw t5,48(s2)
    la t5,_globalStr25    
    sw t5,52(s2)
    la t5,_globalStr44    
    sw t5,56(s2)
    la t5,_globalStr60    
    sw t5,60(s2)
    la t5,_globalStr76    
    sw t5,64(s2)
    la t5,_globalStr90    
    sw t5,68(s2)
    la t5,_globalStr105    
    sw t5,72(s2)
    la t5,_globalStr120    
    sw t5,76(s2)
    la t5,_globalStr9    
    sw t5,80(s2)
    la t5,_globalStr22    
    sw t5,84(s2)
    la t5,_globalStr38    
    sw t5,88(s2)
    la t5,_globalStr56    
    sw t5,92(s2)
    la t5,_globalStr72    
    sw t5,96(s2)
    la t5,_globalStr87    
    sw t5,100(s2)
    la t5,_globalStr101    
    sw t5,104(s2)
    la t5,_globalStr115    
    sw t5,108(s2)
    la t5,_globalStr5    
    sw t5,112(s2)
    la t5,_globalStr18    
    sw t5,116(s2)
    la t5,_globalStr32    
    sw t5,120(s2)
    la t5,_globalStr50    
    sw t5,124(s2)
    la t5,_globalStr67    
    sw t5,128(s2)
    la t5,_globalStr82    
    sw t5,132(s2)
    la t5,_globalStr96    
    sw t5,136(s2)
    la t5,_globalStr113    
    sw t5,140(s2)
    la t5,_globalStr0    
    sw t5,144(s2)
    la t5,_globalStr15    
    sw t5,148(s2)
    la t5,_globalStr27    
    sw t5,152(s2)
    la t5,_globalStr46    
    sw t5,156(s2)
    la t5,_globalStr64    
    sw t5,160(s2)
    la t5,_globalStr79    
    sw t5,164(s2)
    la t5,_globalStr92    
    sw t5,168(s2)
    la t5,_globalStr108    
    sw t5,172(s2)
    la t5,_globalStr122    
    sw t5,176(s2)
    la t5,_globalStr12    
    sw t5,180(s2)
    la t5,_globalStr24    
    sw t5,184(s2)
    la t5,_globalStr43    
    sw t5,188(s2)
    la t5,_globalStr59    
    sw t5,192(s2)
    la t5,_globalStr75    
    sw t5,196(s2)
    la t5,_globalStr89    
    sw t5,200(s2)
    la t5,_globalStr104    
    sw t5,204(s2)
    la t5,_globalStr118    
    sw t5,208(s2)
    la t5,_globalStr8    
    sw t5,212(s2)
    la t5,_globalStr21    
    sw t5,216(s2)
    la t5,_globalStr36    
    sw t5,220(s2)
    la t5,_globalStr55    
    sw t5,224(s2)
    la t5,_globalStr71    
    sw t5,228(s2)
    la t5,_globalStr86    
    sw t5,232(s2)
    la t5,_globalStr100    
    sw t5,236(s2)
    la t5,_globalStr4    
    sw t5,240(s2)
    la t5,_globalStr17    
    sw t5,244(s2)
    la t5,_globalStr31    
    sw t5,248(s2)
    la t5,_globalStr49    
    sw t5,252(s2)
    la t5,_globalStr66    
    sw t5,256(s2)
    la t5,_globalStr81    
    sw t5,260(s2)
    la t5,_globalStr95    
    sw t5,264(s2)
    la t5,_globalStr112    
    sw t5,268(s2)
    la t5,_globalStr125    
    sw t5,272(s2)
    la t5,_globalStr14    
    sw t5,276(s2)
    la t5,_globalStr26    
    sw t5,280(s2)
    la t5,_globalStr45    
    sw t5,284(s2)
    la t5,_globalStr63    
    sw t5,288(s2)
    la t5,_globalStr78    
    sw t5,292(s2)
    la t5,_globalStr91    
    sw t5,296(s2)
    la t5,_globalStr107    
    sw t5,300(s2)
    la t5,_globalStr121    
    sw t5,304(s2)
    la t5,_globalStr11    
    sw t5,308(s2)
    la t5,_globalStr23    
    sw t5,312(s2)
    la t5,_globalStr42    
    sw t5,316(s2)
    la t5,_globalStr58    
    sw t5,320(s2)
    la t5,_globalStr73    
    sw t5,324(s2)
    la t5,_globalStr88    
    sw t5,328(s2)
    la t5,_globalStr103    
    sw t5,332(s2)
    la t5,_globalStr117    
    sw t5,336(s2)
    la t5,_globalStr7    
    sw t5,340(s2)
    la t5,_globalStr20    
    sw t5,344(s2)
    la t5,_globalStr34    
    sw t5,348(s2)
    la t5,_globalStr54    
    sw t5,352(s2)
    la t5,_globalStr69    
    sw t5,356(s2)
    la t5,_globalStr85    
    sw t5,360(s2)
    la t5,_globalStr99    
    sw t5,364(s2)
    la t5,_globalStr114    
    sw t5,368(s2)
    la t5,_globalStr3    
    sw t5,372(s2)
    la t5,_globalStr57    
    sw t5,4(s3)
    la t5,_globalStr2    
    sw t5,8(s3)
    la t5,_globalStr37    
    sw t5,12(s3)
    la t5,_globalStr110    
    sw t5,16(s3)
    la t5,_globalStr30    
    sw t5,20(s3)
    la t5,_globalStr102    
    sw t5,24(s3)
    la t5,_globalStr61    
    sw t5,28(s3)
    la t5,_globalStr94    
    sw t5,32(s3)
    la t5,_globalStr98    
    sw t5,36(s3)
    la t5,_globalStr35    
    sw t5,40(s3)
    la t5,_globalStr111    
    sw t5,44(s3)
    la t5,_globalStr41    
    sw t5,48(s3)
    la t5,_globalStr126    
    sw t5,52(s3)
    la t5,_globalStr53    
    sw t5,56(s3)
    la t5,_globalStr28    
    sw t5,60(s3)
    la t5,_globalStr68    
    sw t5,64(s3)
    la t5,_globalStr84    
    sw t5,68(s3)
    la t5,_globalStr48    
    sw t5,72(s3)
    la t5,_globalStr126    
    sw t5,76(s3)
    la t5,_globalStr77    
    sw t5,80(s3)
    la t5,_globalStr33    
    sw t5,84(s3)
    la t5,_globalStr70    
    sw t5,88(s3)
    la t5,_globalStr126    
    sw t5,92(s3)
    la t5,_globalStr124    
    sw t5,96(s3)
    la t5,_globalStr51    
    sw t5,100(s3)
    la t5,_globalStr6    
    sw t5,104(s3)
    la t5,_globalStr116    
    sw t5,108(s3)
    la t5,_globalStr74    
    sw t5,112(s3)
    la t5,_globalStr119    
    sw t5,116(s3)
    la t5,_globalStr10    
    sw t5,120(s3)
    la t5,_globalStr106    
    sw t5,124(s3)
    la t5,_globalStr114    
    sw t5,128(s3)
    lw a0, 328(s2)
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 268(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 348(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 360(s2)
    call	_stringAdd
    call	println
    lw a0, 288(s2)
    lw a1, 276(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 348(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 64(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 64(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 288(s2)
    lw a1, 276(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 348(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 68(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 68(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 288(s2)
    lw a1, 276(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 348(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 72(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 72(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 288(s2)
    lw a1, 276(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 348(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 76(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 76(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 288(s2)
    lw a1, 276(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 348(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 80(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 80(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 288(s2)
    lw a1, 276(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 348(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 84(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 84(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 288(s2)
    lw a1, 276(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 348(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 88(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 88(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 288(s2)
    lw a1, 276(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 348(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 92(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 92(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 288(s2)
    lw a1, 276(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 348(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 96(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 96(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 288(s2)
    lw a1, 276(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 348(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 100(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 100(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 368(s2)
    call	println
    lw a0, 328(s2)
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 236(s2)
    call	_stringAdd
    lw a1, 240(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 344(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 236(s2)
    call	_stringAdd
    lw a1, 72(s2)
    call	_stringAdd
    lw a1, 84(s2)
    call	_stringAdd
    lw a1, 88(s2)
    call	_stringAdd
    lw a1, 240(s2)
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 328(s2)
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 236(s2)
    call	_stringAdd
    lw a1, 240(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 344(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 236(s2)
    call	_stringAdd
    lw a1, 72(s2)
    call	_stringAdd
    lw a1, 84(s2)
    call	_stringAdd
    lw a1, 88(s2)
    call	_stringAdd
    lw a1, 240(s2)
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 328(s2)
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 72(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 360(s2)
    call	_stringAdd
    call	println
    lw a0, 288(s2)
    lw a1, 276(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 112(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 100(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 236(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 44(s2)
    call	_stringAdd
    lw a1, 268(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 44(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 240(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 324(s2)
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 236(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 44(s2)
    call	_stringAdd
    lw a1, 268(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 60(s2)
    call	_stringAdd
    lw a1, 68(s2)
    call	_stringAdd
    lw a1, 64(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 44(s2)
    call	_stringAdd
    lw a1, 268(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 328(s2)
    call	_stringAdd
    lw a1, 20(s2)
    call	_stringAdd
    lw a1, 68(s2)
    call	_stringAdd
    lw a1, 64(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 44(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 240(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 368(s2)
    call	println
    lw a0, 328(s2)
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 72(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 360(s2)
    call	_stringAdd
    call	println
    lw a0, 288(s2)
    lw a1, 276(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 112(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    lw a1, 100(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 236(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 44(s2)
    call	_stringAdd
    lw a1, 268(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 44(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 240(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 324(s2)
    lw a1, 272(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 336(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 236(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 44(s2)
    call	_stringAdd
    lw a1, 268(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 60(s2)
    call	_stringAdd
    lw a1, 68(s2)
    call	_stringAdd
    lw a1, 64(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 44(s2)
    call	_stringAdd
    lw a1, 268(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 32(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 20(s2)
    call	_stringAdd
    lw a1, 68(s2)
    call	_stringAdd
    lw a1, 64(s2)
    call	_stringAdd
    lw a1, 36(s2)
    call	_stringAdd
    lw a1, 44(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 240(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 368(s2)
    call	println
    lw a0, 328(s2)
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 264(s2)
    call	_stringAdd
    lw a1, 312(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 328(s2)
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 256(s2)
    call	_stringAdd
    lw a1, 72(s2)
    call	_stringAdd
    lw a1, 320(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    mv	a1,s10 
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 328(s2)
    lw a1, 332(s2)
    call	_stringAdd
    lw a1, 324(s2)
    call	_stringAdd
    lw a1, 288(s2)
    call	_stringAdd
    lw a1, 308(s2)
    call	_stringAdd
    lw a1, 280(s2)
    call	_stringAdd
    lw a1, 4(s2)
    call	_stringAdd
    lw a1, 256(s2)
    call	_stringAdd
    lw a1, 72(s2)
    call	_stringAdd
    lw a1, 260(s2)
    call	_stringAdd
    lw a1, 116(s2)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    mv	a1,s10 
    call	_stringAdd
    mv	a1,s10 
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    lw a1, 108(s2)
    call	_stringAdd
    call	println
    lw a0, 4(s3)
    call	println
    mv	s10,zero 
    j	_forcondBB1
_forcondBB1:
    li t5, 93
    blt	s10,t5,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	s10,zero 
    j	_forcondBB2
_forcondBB2:
    li t5, 32
    blt	s10,t5,	_forbodyBB2
    j	_afterForBB2
_afterForBB2:
    li s2, 1
    j	_forcondBB3
_forcondBB3:
    li t5, 32
    blt	s2,t5,	_forbodyBB3
    j	afterCallBB1
_forbodyBB3:
    slli t5,s2,    2
    addi t5,t5,    4
    add t5,s3,t5
    lw a0, 0(t5)
    call	println
    addi s2,s2,    1
    j	_forcondBB3
afterCallBB1:
    mv	s5,s0 
    lw s4, 4(sp) 
    lw s3, 12(sp) 
    lw s2, 8(sp) 
    lw s1, 28(sp) 
    lw s0, 16(sp) 
    lw s11, 0(sp) 
    lw s10, 20(sp) 
    lw ra, 24(sp) 
    mv	a0,zero 
    addi sp,sp,    48
    ret
_forbodyBB2:
    slli t5,s10,    2
    addi t5,t5,    4
    add s1,s3,t5
    li t5, 9
    ble	s10,t5,	__if_thenBB1
    j	__if_end1
__if_thenBB1:
    mv	t5,s10 
    beq	t5,zero,	_if_thenBB1
    j	_if_end1
_if_thenBB1:
    la a1,_globalStr76    
    j	afterCallBB2
afterCallBB2:
    la a0,_globalStr52    
    call	_stringAdd
    la a1,_globalStr40    
    call	_stringAdd
    j	_afterCallBB1
_afterCallBB1:
    mv	a1,s5 
    call	_stringAdd
    lw a1, 0(s1)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    mv	a1,s4 
    call	_stringAdd
    call	println
    addi s10,s10,    1
    j	_forcondBB2
_if_end1:
    li t6, 1
    beq	t5,t6,	_if_thenBB2
    j	_if_end2
_if_thenBB2:
    la a1,_globalStr90    
    j	afterCallBB2
_if_end2:
    li t6, 2
    beq	t5,t6,	_if_thenBB3
    j	_if_end3
_if_thenBB3:
    la a1,_globalStr105    
    j	afterCallBB2
_if_end3:
    li t6, 3
    beq	t5,t6,	_if_thenBB4
    j	_if_end4
_if_thenBB4:
    la a1,_globalStr120    
    j	afterCallBB2
_if_end4:
    li t6, 4
    beq	t5,t6,	_if_thenBB5
    j	_if_end5
_if_thenBB5:
    la a1,_globalStr9    
    j	afterCallBB2
_if_end5:
    li t6, 5
    beq	t5,t6,	_if_thenBB6
    j	_if_end6
_if_end6:
    li t6, 6
    beq	t5,t6,	_if_thenBB7
    j	_if_end7
_if_end7:
    li t6, 7
    beq	t5,t6,	_if_thenBB8
    j	_if_end8
_if_end8:
    li t6, 8
    beq	t5,t6,	_if_thenBB9
    j	_if_end9
_if_end9:
    li t6, 9
    beq	t5,t6,	_if_thenBB10
    j	_if_end10
_if_end10:
    mv	a1,zero 
    j	afterCallBB2
_if_thenBB10:
    la a1,_globalStr87    
    j	afterCallBB2
_if_thenBB9:
    la a1,_globalStr72    
    j	afterCallBB2
_if_thenBB8:
    la a1,_globalStr56    
    j	afterCallBB2
_if_thenBB7:
    la a1,_globalStr38    
    j	afterCallBB2
_if_thenBB6:
    la a1,_globalStr22    
    j	afterCallBB2
__if_end1:
    li t5, 10
    rem t5,s10,t5
    beq	t5,zero,	_if_thenBB11
    j	_if_end11
_if_thenBB11:
    la s2,_globalStr76    
    j	afterCallBB3
afterCallBB3:
    li t5, 10
    div t5,s10,t5
    beq	t5,zero,	_if_thenBB12
    j	_if_end12
_if_thenBB12:
    la a1,_globalStr76    
    j	afterCallBB4
afterCallBB4:
    la a0,_globalStr52    
    call	_stringAdd
    mv	a1,s2 
    call	_stringAdd
    la a1,_globalStr40    
    call	_stringAdd
    j	_afterCallBB1
_if_end12:
    li t6, 1
    beq	t5,t6,	_if_thenBB13
    j	_if_end13
_if_thenBB13:
    la a1,_globalStr90    
    j	afterCallBB4
_if_end13:
    li t6, 2
    beq	t5,t6,	_if_thenBB14
    j	_if_end14
_if_thenBB14:
    la a1,_globalStr105    
    j	afterCallBB4
_if_end14:
    li t6, 3
    beq	t5,t6,	_if_thenBB15
    j	_if_end15
_if_thenBB15:
    la a1,_globalStr120    
    j	afterCallBB4
_if_end15:
    li t6, 4
    beq	t5,t6,	_if_thenBB16
    j	_if_end16
_if_end16:
    li t6, 5
    beq	t5,t6,	_if_thenBB17
    j	_if_end17
_if_end17:
    li t6, 6
    beq	t5,t6,	_if_thenBB18
    j	_if_end18
_if_end18:
    li t6, 7
    beq	t5,t6,	_if_thenBB19
    j	_if_end19
_if_thenBB19:
    la a1,_globalStr56    
    j	afterCallBB4
_if_end19:
    li t6, 8
    beq	t5,t6,	_if_thenBB20
    j	_if_end20
_if_end20:
    li t6, 9
    beq	t5,t6,	_if_thenBB21
    j	_if_end21
_if_end21:
    mv	a1,zero 
    j	afterCallBB4
_if_thenBB21:
    la a1,_globalStr87    
    j	afterCallBB4
_if_thenBB20:
    la a1,_globalStr72    
    j	afterCallBB4
_if_thenBB18:
    la a1,_globalStr38    
    j	afterCallBB4
_if_thenBB17:
    la a1,_globalStr22    
    j	afterCallBB4
_if_thenBB16:
    la a1,_globalStr9    
    j	afterCallBB4
_if_end11:
    li t6, 1
    beq	t5,t6,	_if_thenBB22
    j	_if_end22
_if_thenBB22:
    la s2,_globalStr90    
    j	afterCallBB3
_if_end22:
    li t6, 2
    beq	t5,t6,	_if_thenBB23
    j	_if_end23
_if_thenBB23:
    la s2,_globalStr105    
    j	afterCallBB3
_if_end23:
    li t6, 3
    beq	t5,t6,	_if_thenBB24
    j	_if_end24
_if_end24:
    li t6, 4
    beq	t5,t6,	_if_thenBB25
    j	_if_end25
_if_thenBB25:
    la s2,_globalStr9    
    j	afterCallBB3
_if_end25:
    li t6, 5
    beq	t5,t6,	_if_thenBB26
    j	_if_end26
_if_end26:
    li t6, 6
    beq	t5,t6,	_if_thenBB27
    j	_if_end27
_if_end27:
    li t6, 7
    beq	t5,t6,	_if_thenBB28
    j	_if_end28
_if_end28:
    li t6, 8
    beq	t5,t6,	_if_thenBB29
    j	_if_end29
_if_end29:
    li t6, 9
    beq	t5,t6,	_if_thenBB30
    j	_if_end30
_if_thenBB30:
    la s2,_globalStr87    
    j	afterCallBB3
_if_end30:
    mv	s2,zero 
    j	afterCallBB3
_if_thenBB29:
    la s2,_globalStr72    
    j	afterCallBB3
_if_thenBB28:
    la s2,_globalStr56    
    j	afterCallBB3
_if_thenBB27:
    la s2,_globalStr38    
    j	afterCallBB3
_if_thenBB26:
    la s2,_globalStr22    
    j	afterCallBB3
_if_thenBB24:
    la s2,_globalStr120    
    j	afterCallBB3
_forbodyBB1:
    slli t5,s10,    2
    addi t5,t5,    4
    add s1,s2,t5
    mv	t6,s10 
    li t5, 9
    ble	t6,t5,	__if_thenBB2
    j	__if_end2
__if_end2:
    li t5, 10
    rem t5,t6,t5
    beq	t5,zero,	_if_thenBB31
    j	_if_end31
_if_thenBB31:
    la t5,_globalStr76    
    j	afterCallBB5
afterCallBB5:
    mv	s11,t5 
    li t5, 10
    div t5,t6,t5
    beq	t5,zero,	_if_thenBB32
    j	_if_end32
_if_end32:
    li t6, 1
    beq	t5,t6,	_if_thenBB33
    j	_if_end33
_if_end33:
    li t6, 2
    beq	t5,t6,	_if_thenBB34
    j	_if_end34
_if_end34:
    li t6, 3
    beq	t5,t6,	_if_thenBB35
    j	_if_end35
_if_thenBB35:
    la a1,_globalStr120    
    j	afterCallBB6
afterCallBB6:
    la a0,_globalStr62    
    call	_stringAdd
    mv	a1,s11 
    call	_stringAdd
    la a1,_globalStr40    
    call	_stringAdd
    j	_afterCallBB2
_afterCallBB2:
    mv	a1,s5 
    call	_stringAdd
    lw a1, 0(s1)
    call	_stringAdd
    mv	a1,s5 
    call	_stringAdd
    mv	a1,s4 
    call	_stringAdd
    call	println
    addi t5,s10,    1
    mv	s10,t5 
    j	_forcondBB1
_if_end35:
    li t6, 4
    beq	t5,t6,	_if_thenBB36
    j	_if_end36
_if_thenBB36:
    la a1,_globalStr9    
    j	afterCallBB6
_if_end36:
    li t6, 5
    beq	t5,t6,	_if_thenBB37
    j	_if_end37
_if_end37:
    li t6, 6
    beq	t5,t6,	_if_thenBB38
    j	_if_end38
_if_end38:
    li t6, 7
    beq	t5,t6,	_if_thenBB39
    j	_if_end39
_if_end39:
    li t6, 8
    beq	t5,t6,	_if_thenBB40
    j	_if_end40
_if_thenBB40:
    la a1,_globalStr72    
    j	afterCallBB6
_if_end40:
    li t6, 9
    beq	t5,t6,	_if_thenBB41
    j	_if_end41
_if_thenBB41:
    la a1,_globalStr87    
    j	afterCallBB6
_if_end41:
    mv	a1,zero 
    j	afterCallBB6
_if_thenBB39:
    la a1,_globalStr56    
    j	afterCallBB6
_if_thenBB38:
    la a1,_globalStr38    
    j	afterCallBB6
_if_thenBB37:
    la a1,_globalStr22    
    j	afterCallBB6
_if_thenBB34:
    la a1,_globalStr105    
    j	afterCallBB6
_if_thenBB33:
    la a1,_globalStr90    
    j	afterCallBB6
_if_thenBB32:
    la a1,_globalStr76    
    j	afterCallBB6
_if_end31:
    li a0, 1
    beq	t5,a0,	_if_thenBB42
    j	_if_end42
_if_end42:
    li a0, 2
    beq	t5,a0,	_if_thenBB43
    j	_if_end43
_if_thenBB43:
    la t5,_globalStr105    
    j	afterCallBB5
_if_end43:
    li a0, 3
    beq	t5,a0,	_if_thenBB44
    j	_if_end44
_if_thenBB44:
    la t5,_globalStr120    
    j	afterCallBB5
_if_end44:
    li a0, 4
    beq	t5,a0,	_if_thenBB45
    j	_if_end45
_if_end45:
    li a0, 5
    beq	t5,a0,	_if_thenBB46
    j	_if_end46
_if_end46:
    li a0, 6
    beq	t5,a0,	_if_thenBB47
    j	_if_end47
_if_thenBB47:
    la t5,_globalStr38    
    j	afterCallBB5
_if_end47:
    li a0, 7
    beq	t5,a0,	_if_thenBB48
    j	_if_end48
_if_end48:
    li a0, 8
    beq	t5,a0,	_if_thenBB49
    j	_if_end49
_if_end49:
    li a0, 9
    beq	t5,a0,	_if_thenBB50
    j	_if_end50
_if_thenBB50:
    la t5,_globalStr87    
    j	afterCallBB5
_if_end50:
    mv	t5,zero 
    j	afterCallBB5
_if_thenBB49:
    la t5,_globalStr72    
    j	afterCallBB5
_if_thenBB48:
    la t5,_globalStr56    
    j	afterCallBB5
_if_thenBB46:
    la t5,_globalStr22    
    j	afterCallBB5
_if_thenBB45:
    la t5,_globalStr9    
    j	afterCallBB5
_if_thenBB42:
    la t5,_globalStr90    
    j	afterCallBB5
__if_thenBB2:
    beq	t6,zero,	_if_thenBB51
    j	_if_end51
_if_thenBB51:
    la a1,_globalStr76    
    j	afterCallBB7
afterCallBB7:
    la a0,_globalStr62    
    call	_stringAdd
    la a1,_globalStr40    
    call	_stringAdd
    j	_afterCallBB2
_if_end51:
    li t5, 1
    beq	t6,t5,	_if_thenBB52
    j	_if_end52
_if_thenBB52:
    la a1,_globalStr90    
    j	afterCallBB7
_if_end52:
    li t5, 2
    beq	t6,t5,	_if_thenBB53
    j	_if_end53
_if_thenBB53:
    la a1,_globalStr105    
    j	afterCallBB7
_if_end53:
    li t5, 3
    beq	t6,t5,	_if_thenBB54
    j	_if_end54
_if_thenBB54:
    la a1,_globalStr120    
    j	afterCallBB7
_if_end54:
    li t5, 4
    beq	t6,t5,	_if_thenBB55
    j	_if_end55
_if_thenBB55:
    la a1,_globalStr9    
    j	afterCallBB7
_if_end55:
    li t5, 5
    beq	t6,t5,	_if_thenBB56
    j	_if_end56
_if_thenBB56:
    la a1,_globalStr22    
    j	afterCallBB7
_if_end56:
    li t5, 6
    beq	t6,t5,	_if_thenBB57
    j	_if_end57
_if_end57:
    li t5, 7
    beq	t6,t5,	_if_thenBB58
    j	_if_end58
_if_thenBB58:
    la a1,_globalStr56    
    j	afterCallBB7
_if_end58:
    li t5, 8
    beq	t6,t5,	_if_thenBB59
    j	_if_end59
_if_end59:
    li t5, 9
    beq	t6,t5,	_if_thenBB60
    j	_if_end60
_if_end60:
    mv	a1,zero 
    j	afterCallBB7
_if_thenBB60:
    la a1,_globalStr87    
    j	afterCallBB7
_if_thenBB59:
    la a1,_globalStr72    
    j	afterCallBB7
_if_thenBB57:
    la a1,_globalStr38    
    j	afterCallBB7
								 # func end
    .section	.sdata,"aw",@progbits
    .globl	a2b					#@a2b
    .p2align	2
a2b:
    .word	0
     
    .globl	a2q					#@a2q
    .p2align	2
a2q:
    .word	0
     
    .globl	s					#@s
    .p2align	2
s:
    .word	0
     
    .globl	c					#@c
    .p2align	2
c:
    .word	0
     
    .globl	co					#@co
    .p2align	2
co:
    .word	0
     
    .globl	_globalStr0					#@_globalStr0
_globalStr0:
    .asciz  "D"    
    .globl	_globalStr1					#@_globalStr1
_globalStr1:
    .asciz  "#"    
    .globl	_globalStr2					#@_globalStr2
_globalStr2:
    .asciz  "println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[66]+c[71]+c[69]+c[82]+c[7]+c[71]+c[76]+c[82]+c[0]+c[86]+c[8]+c[89]);"    
    .globl	_globalStr3					#@_globalStr3
_globalStr3:
    .asciz  "~"    
    .globl	_globalStr4					#@_globalStr4
_globalStr4:
    .asciz  "]"    
    .globl	_globalStr5					#@_globalStr5
_globalStr5:
    .asciz  "<"    
    .globl	_globalStr6					#@_globalStr6
_globalStr6:
    .asciz  "println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[63]+c[17]+c[64]+c[28]+a2q+a2b+a2b+a2q+c[26]);"    
    .globl	_globalStr7					#@_globalStr7
_globalStr7:
    .asciz  "v"    
    .globl	_globalStr8					#@_globalStr8
_globalStr8:
    .asciz  "U"    
    .globl	_globalStr9					#@_globalStr9
_globalStr9:
    .asciz  "4"    
    .globl	_globalStr10					#@_globalStr10
_globalStr10:
    .asciz  "for(i=1;i<32;i++)println(s[i]);"    
    .globl	_globalStr11					#@_globalStr11
_globalStr11:
    .asciz  "n"    
    .globl	_globalStr12					#@_globalStr12
_globalStr12:
    .asciz  "M"    
    .globl	_globalStr13					#@_globalStr13
_globalStr13:
    .asciz  ","    
    .globl	_globalStr14					#@_globalStr14
_globalStr14:
    .asciz  "f"    
    .globl	_globalStr15					#@_globalStr15
_globalStr15:
    .asciz  "E"    
    .globl	_globalStr16					#@_globalStr16
_globalStr16:
    .asciz  "$"    
    .globl	_globalStr17					#@_globalStr17
_globalStr17:
    .asciz  "^"    
    .globl	_globalStr18					#@_globalStr18
_globalStr18:
    .asciz  "="    
    .globl	_globalStr19					#@_globalStr19
_globalStr19:
    .asciz  "\""    
    .globl	_globalStr20					#@_globalStr20
_globalStr20:
    .asciz  "w"    
    .globl	_globalStr21					#@_globalStr21
_globalStr21:
    .asciz  "V"    
    .globl	_globalStr22					#@_globalStr22
_globalStr22:
    .asciz  "5"    
    .globl	_globalStr23					#@_globalStr23
_globalStr23:
    .asciz  "o"    
    .globl	_globalStr24					#@_globalStr24
_globalStr24:
    .asciz  "N"    
    .globl	_globalStr25					#@_globalStr25
_globalStr25:
    .asciz  "-"    
    .globl	_globalStr26					#@_globalStr26
_globalStr26:
    .asciz  "g"    
    .globl	_globalStr27					#@_globalStr27
_globalStr27:
    .asciz  "F"    
    .globl	_globalStr28					#@_globalStr28
_globalStr28:
    .asciz  "println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[59]+c[0]+c[65]+c[28]+c[76]+c[67]+c[85]+c[0]+c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[17]+c[20]+c[21]+c[59]+c[26]);"    
    .globl	_globalStr29					#@_globalStr29
_globalStr29:
    .asciz  "%"    
    .globl	_globalStr30					#@_globalStr30
_globalStr30:
    .asciz  "println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[17]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[17]+a2q+c[26]);"    
    .globl	_globalStr31					#@_globalStr31
_globalStr31:
    .asciz  "_"    
    .globl	_globalStr32					#@_globalStr32
_globalStr32:
    .asciz  ">"    
    .globl	_globalStr33					#@_globalStr33
_globalStr33:
    .asciz  "println(c[71]+c[68]+c[7]+c[65]+c[65]+c[27]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[65]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);"    
    .globl	_globalStr34					#@_globalStr34
_globalStr34:
    .asciz  "x"    
    .globl	_globalStr35					#@_globalStr35
_globalStr35:
    .asciz  "println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[22]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[22]+a2q+c[26]);"    
    .globl	_globalStr36					#@_globalStr36
_globalStr36:
    .asciz  "W"    
    .globl	_globalStr37					#@_globalStr37
_globalStr37:
    .asciz  "println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[15]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[15]+a2q+c[26]);"    
    .globl	_globalStr38					#@_globalStr38
_globalStr38:
    .asciz  "6"    
    .globl	_globalStr39					#@_globalStr39
_globalStr39:
    .asciz  "\\"    
    .globl	_globalStr40					#@_globalStr40
_globalStr40:
    .asciz  "]="    
    .globl	_globalStr41					#@_globalStr41
_globalStr41:
    .asciz  "println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[24]+a2q+c[26]);"    
    .globl	_globalStr42					#@_globalStr42
_globalStr42:
    .asciz  "p"    
    .globl	_globalStr43					#@_globalStr43
_globalStr43:
    .asciz  "O"    
    .globl	_globalStr44					#@_globalStr44
_globalStr44:
    .asciz  "."    
    .globl	_globalStr45					#@_globalStr45
_globalStr45:
    .asciz  "h"    
    .globl	_globalStr46					#@_globalStr46
_globalStr46:
    .asciz  "G"    
    .globl	_globalStr47					#@_globalStr47
_globalStr47:
    .asciz  "&"    
    .globl	_globalStr48					#@_globalStr48
_globalStr48:
    .asciz  "println(c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[81]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[14]+c[16]+c[15]+c[8]+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[4]+c[16]+c[15]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);"    
    .globl	_globalStr49					#@_globalStr49
_globalStr49:
    .asciz  "`"    
    .globl	_globalStr50					#@_globalStr50
_globalStr50:
    .asciz  "?"    
    .globl	_globalStr51					#@_globalStr51
_globalStr51:
    .asciz  "println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[63]+c[17]+c[79]+c[28]+a2q+a2b+a2q+a2q+c[26]);"    
    .globl	_globalStr52					#@_globalStr52
_globalStr52:
    .asciz  "s["    
    .globl	_globalStr53					#@_globalStr53
_globalStr53:
    .asciz  "println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[59]+c[0]+c[81]+c[28]+c[76]+c[67]+c[85]+c[0]+c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[17]+c[20]+c[21]+c[59]+c[26]);"    
    .globl	_globalStr54					#@_globalStr54
_globalStr54:
    .asciz  "y"    
    .globl	_globalStr55					#@_globalStr55
_globalStr55:
    .asciz  "X"    
    .globl	_globalStr56					#@_globalStr56
_globalStr56:
    .asciz  "7"    
    .globl	_globalStr57					#@_globalStr57
_globalStr57:
    .asciz  "int main(){int i=0;// Quine is a a program that produces its source code as output."    
    .globl	_globalStr58					#@_globalStr58
_globalStr58:
    .asciz  "q"    
    .globl	_globalStr59					#@_globalStr59
_globalStr59:
    .asciz  "P"    
    .globl	_globalStr60					#@_globalStr60
_globalStr60:
    .asciz  "/"    
    .globl	_globalStr61					#@_globalStr61
_globalStr61:
    .asciz  "println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[19]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[19]+a2q+c[26]);"    
    .globl	_globalStr62					#@_globalStr62
_globalStr62:
    .asciz  "c["    
    .globl	_globalStr63					#@_globalStr63
_globalStr63:
    .asciz  "i"    
    .globl	_globalStr64					#@_globalStr64
_globalStr64:
    .asciz  "H"    
    .globl	_globalStr65					#@_globalStr65
_globalStr65:
    .asciz  "'"    
    .globl	_globalStr66					#@_globalStr66
_globalStr66:
    .asciz  "a"    
    .globl	_globalStr67					#@_globalStr67
_globalStr67:
    .asciz  "@"    
    .globl	_globalStr68					#@_globalStr68
_globalStr68:
    .asciz  "println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[81]+c[17]+c[7]+c[71]+c[76]+c[82]+c[0]+c[81]+c[81]+c[8]+c[89]);"    
    .globl	_globalStr69					#@_globalStr69
_globalStr69:
    .asciz  "z"    
    .globl	_globalStr70					#@_globalStr70
_globalStr70:
    .asciz  "println(c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[65]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[14]+c[16]+c[15]+c[8]+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[4]+c[16]+c[15]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);"    
    .globl	_globalStr71					#@_globalStr71
_globalStr71:
    .asciz  "Y"    
    .globl	_globalStr72					#@_globalStr72
_globalStr72:
    .asciz  "8"    
    .globl	_globalStr73					#@_globalStr73
_globalStr73:
    .asciz  "r"    
    .globl	_globalStr74					#@_globalStr74
_globalStr74:
    .asciz  "for(i=0;i<93;i++)println(c2(i)+a2q+c[i]+a2q+co);"    
    .globl	_globalStr75					#@_globalStr75
_globalStr75:
    .asciz  "Q"    
    .globl	_globalStr76					#@_globalStr76
_globalStr76:
    .asciz  "0"    
    .globl	_globalStr77					#@_globalStr77
_globalStr77:
    .asciz  "println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[65]+c[17]+c[7]+c[71]+c[76]+c[82]+c[0]+c[65]+c[65]+c[8]+c[89]);"    
    .globl	_globalStr78					#@_globalStr78
_globalStr78:
    .asciz  "j"    
    .globl	_globalStr79					#@_globalStr79
_globalStr79:
    .asciz  "I"    
    .globl	_globalStr80					#@_globalStr80
_globalStr80:
    .asciz  "("    
    .globl	_globalStr81					#@_globalStr81
_globalStr81:
    .asciz  "b"    
    .globl	_globalStr82					#@_globalStr82
_globalStr82:
    .asciz  "A"    
    .globl	_globalStr83					#@_globalStr83
_globalStr83:
    .asciz  " "    
    .globl	_globalStr84					#@_globalStr84
_globalStr84:
    .asciz  "println(c[71]+c[68]+c[7]+c[81]+c[81]+c[27]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[81]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);"    
    .globl	_globalStr85					#@_globalStr85
_globalStr85:
    .asciz  "{"    
    .globl	_globalStr86					#@_globalStr86
_globalStr86:
    .asciz  "Z"    
    .globl	_globalStr87					#@_globalStr87
_globalStr87:
    .asciz  "9"    
    .globl	_globalStr88					#@_globalStr88
_globalStr88:
    .asciz  "s"    
    .globl	_globalStr89					#@_globalStr89
_globalStr89:
    .asciz  "R"    
    .globl	_globalStr90					#@_globalStr90
_globalStr90:
    .asciz  "1"    
    .globl	_globalStr91					#@_globalStr91
_globalStr91:
    .asciz  "k"    
    .globl	_globalStr92					#@_globalStr92
_globalStr92:
    .asciz  "J"    
    .globl	_globalStr93					#@_globalStr93
_globalStr93:
    .asciz  ")"    
    .globl	_globalStr94					#@_globalStr94
_globalStr94:
    .asciz  "println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[20]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[20]+a2q+c[26]);"    
    .globl	_globalStr95					#@_globalStr95
_globalStr95:
    .asciz  "c"    
    .globl	_globalStr96					#@_globalStr96
_globalStr96:
    .asciz  "B"    
    .globl	_globalStr97					#@_globalStr97
_globalStr97:
    .asciz  "!"    
    .globl	_globalStr98					#@_globalStr98
_globalStr98:
    .asciz  "println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[21]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[21]+a2q+c[26]);"    
    .globl	_globalStr99					#@_globalStr99
_globalStr99:
    .asciz  "|"    
    .globl	_globalStr100					#@_globalStr100
_globalStr100:
    .asciz  "["    
    .globl	_globalStr101					#@_globalStr101
_globalStr101:
    .asciz  ":"    
    .globl	_globalStr102					#@_globalStr102
_globalStr102:
    .asciz  "println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[18]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[18]+a2q+c[26]);"    
    .globl	_globalStr103					#@_globalStr103
_globalStr103:
    .asciz  "t"    
    .globl	_globalStr104					#@_globalStr104
_globalStr104:
    .asciz  "S"    
    .globl	_globalStr105					#@_globalStr105
_globalStr105:
    .asciz  "2"    
    .globl	_globalStr106					#@_globalStr106
_globalStr106:
    .asciz  "return 0;"    
    .globl	_globalStr107					#@_globalStr107
_globalStr107:
    .asciz  "l"    
    .globl	_globalStr108					#@_globalStr108
_globalStr108:
    .asciz  "K"    
    .globl	_globalStr109					#@_globalStr109
_globalStr109:
    .asciz  "*"    
    .globl	_globalStr110					#@_globalStr110
_globalStr110:
    .asciz  "println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[16]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[16]+a2q+c[26]);"    
    .globl	_globalStr111					#@_globalStr111
_globalStr111:
    .asciz  "println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[23]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[23]+a2q+c[26]);"    
    .globl	_globalStr112					#@_globalStr112
_globalStr112:
    .asciz  "d"    
    .globl	_globalStr113					#@_globalStr113
_globalStr113:
    .asciz  "C"    
    .globl	_globalStr114					#@_globalStr114
_globalStr114:
    .asciz  "}"    
    .globl	_globalStr115					#@_globalStr115
_globalStr115:
    .asciz  ";"    
    .globl	_globalStr116					#@_globalStr116
_globalStr116:
    .asciz  "println(s[0]);"    
    .globl	_globalStr117					#@_globalStr117
_globalStr117:
    .asciz  "u"    
    .globl	_globalStr118					#@_globalStr118
_globalStr118:
    .asciz  "T"    
    .globl	_globalStr119					#@_globalStr119
_globalStr119:
    .asciz  "for(i=0;i<32;i++)println(s2(i)+a2q+s[i]+a2q+co);"    
    .globl	_globalStr120					#@_globalStr120
_globalStr120:
    .asciz  "3"    
    .globl	_globalStr121					#@_globalStr121
_globalStr121:
    .asciz  "m"    
    .globl	_globalStr122					#@_globalStr122
_globalStr122:
    .asciz  "L"    
    .globl	_globalStr123					#@_globalStr123
_globalStr123:
    .asciz  "+"    
    .globl	_globalStr124					#@_globalStr124
_globalStr124:
    .asciz  "println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[65]+c[77]+c[28]+a2q+c[26]+a2q+c[26]);"    
    .globl	_globalStr125					#@_globalStr125
_globalStr125:
    .asciz  "e"    
    .globl	_globalStr126					#@_globalStr126
_globalStr126:
    .asciz  "println(c[91]);"    
