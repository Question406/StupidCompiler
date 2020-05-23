    .text
    .globl	main				#begin
    .p2align	2
    .type	main,@function
main:
__init.entryBB1:
    mv	backup_ra,ra 
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
    mv	back_s9,s9 
    li a0, 1028
    call malloc
    mv	t.0,a0 
    li _t, 256
    sw _t,0(t.0)
    mv	_gs.0,t.0 
    li a0, 1028
    call malloc
    mv	t.0,a0 
    li _t, 256
    sw _t,0(t.0)
    mv	_gc.0,t.0 
    la _gco.0,_globalStr115    
    la _ga2q.0,_globalStr19    
    la _ga2b.0,_globalStr39    
    la _t,_globalStr83    
    sw _t,4(_gc.0)
    la _t,_globalStr97    
    sw _t,8(_gc.0)
    la _t,_globalStr1    
    sw _t,12(_gc.0)
    la _t,_globalStr16    
    sw _t,16(_gc.0)
    la _t,_globalStr29    
    sw _t,20(_gc.0)
    la _t,_globalStr47    
    sw _t,24(_gc.0)
    la _t,_globalStr65    
    sw _t,28(_gc.0)
    la _t,_globalStr80    
    sw _t,32(_gc.0)
    la _t,_globalStr93    
    sw _t,36(_gc.0)
    la _t,_globalStr109    
    sw _t,40(_gc.0)
    la _t,_globalStr123    
    sw _t,44(_gc.0)
    la _t,_globalStr13    
    sw _t,48(_gc.0)
    la _t,_globalStr25    
    sw _t,52(_gc.0)
    la _t,_globalStr44    
    sw _t,56(_gc.0)
    la _t,_globalStr60    
    sw _t,60(_gc.0)
    la _t,_globalStr76    
    sw _t,64(_gc.0)
    la _t,_globalStr90    
    sw _t,68(_gc.0)
    la _t,_globalStr105    
    sw _t,72(_gc.0)
    la _t,_globalStr120    
    sw _t,76(_gc.0)
    la _t,_globalStr9    
    sw _t,80(_gc.0)
    la _t,_globalStr22    
    sw _t,84(_gc.0)
    la _t,_globalStr38    
    sw _t,88(_gc.0)
    la _t,_globalStr56    
    sw _t,92(_gc.0)
    la _t,_globalStr72    
    sw _t,96(_gc.0)
    la _t,_globalStr87    
    sw _t,100(_gc.0)
    la _t,_globalStr101    
    sw _t,104(_gc.0)
    la _t,_globalStr115    
    sw _t,108(_gc.0)
    la _t,_globalStr5    
    sw _t,112(_gc.0)
    la _t,_globalStr18    
    sw _t,116(_gc.0)
    la _t,_globalStr32    
    sw _t,120(_gc.0)
    la _t,_globalStr50    
    sw _t,124(_gc.0)
    la _t,_globalStr67    
    sw _t,128(_gc.0)
    la _t,_globalStr82    
    sw _t,132(_gc.0)
    la _t,_globalStr96    
    sw _t,136(_gc.0)
    la _t,_globalStr113    
    sw _t,140(_gc.0)
    la _t,_globalStr0    
    sw _t,144(_gc.0)
    la _t,_globalStr15    
    sw _t,148(_gc.0)
    la _t,_globalStr27    
    sw _t,152(_gc.0)
    la _t,_globalStr46    
    sw _t,156(_gc.0)
    la _t,_globalStr64    
    sw _t,160(_gc.0)
    la _t,_globalStr79    
    sw _t,164(_gc.0)
    la _t,_globalStr92    
    sw _t,168(_gc.0)
    la _t,_globalStr108    
    sw _t,172(_gc.0)
    la _t,_globalStr122    
    sw _t,176(_gc.0)
    la _t,_globalStr12    
    sw _t,180(_gc.0)
    la _t,_globalStr24    
    sw _t,184(_gc.0)
    la _t,_globalStr43    
    sw _t,188(_gc.0)
    la _t,_globalStr59    
    sw _t,192(_gc.0)
    la _t,_globalStr75    
    sw _t,196(_gc.0)
    la _t,_globalStr89    
    sw _t,200(_gc.0)
    la _t,_globalStr104    
    sw _t,204(_gc.0)
    la _t,_globalStr118    
    sw _t,208(_gc.0)
    la _t,_globalStr8    
    sw _t,212(_gc.0)
    la _t,_globalStr21    
    sw _t,216(_gc.0)
    la _t,_globalStr36    
    sw _t,220(_gc.0)
    la _t,_globalStr55    
    sw _t,224(_gc.0)
    la _t,_globalStr71    
    sw _t,228(_gc.0)
    la _t,_globalStr86    
    sw _t,232(_gc.0)
    la _t,_globalStr100    
    sw _t,236(_gc.0)
    la _t,_globalStr4    
    sw _t,240(_gc.0)
    la _t,_globalStr17    
    sw _t,244(_gc.0)
    la _t,_globalStr31    
    sw _t,248(_gc.0)
    la _t,_globalStr49    
    sw _t,252(_gc.0)
    la _t,_globalStr66    
    sw _t,256(_gc.0)
    la _t,_globalStr81    
    sw _t,260(_gc.0)
    la _t,_globalStr95    
    sw _t,264(_gc.0)
    la _t,_globalStr112    
    sw _t,268(_gc.0)
    la _t,_globalStr125    
    sw _t,272(_gc.0)
    la _t,_globalStr14    
    sw _t,276(_gc.0)
    la _t,_globalStr26    
    sw _t,280(_gc.0)
    la _t,_globalStr45    
    sw _t,284(_gc.0)
    la _t,_globalStr63    
    sw _t,288(_gc.0)
    la _t,_globalStr78    
    sw _t,292(_gc.0)
    la _t,_globalStr91    
    sw _t,296(_gc.0)
    la _t,_globalStr107    
    sw _t,300(_gc.0)
    la _t,_globalStr121    
    sw _t,304(_gc.0)
    la _t,_globalStr11    
    sw _t,308(_gc.0)
    la _t,_globalStr23    
    sw _t,312(_gc.0)
    la _t,_globalStr42    
    sw _t,316(_gc.0)
    la _t,_globalStr58    
    sw _t,320(_gc.0)
    la _t,_globalStr73    
    sw _t,324(_gc.0)
    la _t,_globalStr88    
    sw _t,328(_gc.0)
    la _t,_globalStr103    
    sw _t,332(_gc.0)
    la _t,_globalStr117    
    sw _t,336(_gc.0)
    la _t,_globalStr7    
    sw _t,340(_gc.0)
    la _t,_globalStr20    
    sw _t,344(_gc.0)
    la _t,_globalStr34    
    sw _t,348(_gc.0)
    la _t,_globalStr54    
    sw _t,352(_gc.0)
    la _t,_globalStr69    
    sw _t,356(_gc.0)
    la _t,_globalStr85    
    sw _t,360(_gc.0)
    la _t,_globalStr99    
    sw _t,364(_gc.0)
    la _t,_globalStr114    
    sw _t,368(_gc.0)
    la _t,_globalStr3    
    sw _t,372(_gc.0)
    la _t,_globalStr57    
    sw _t,4(_gs.0)
    la _t,_globalStr2    
    sw _t,8(_gs.0)
    la _t,_globalStr37    
    sw _t,12(_gs.0)
    la _t,_globalStr110    
    sw _t,16(_gs.0)
    la _t,_globalStr30    
    sw _t,20(_gs.0)
    la _t,_globalStr102    
    sw _t,24(_gs.0)
    la _t,_globalStr61    
    sw _t,28(_gs.0)
    la _t,_globalStr94    
    sw _t,32(_gs.0)
    la _t,_globalStr98    
    sw _t,36(_gs.0)
    la _t,_globalStr35    
    sw _t,40(_gs.0)
    la _t,_globalStr111    
    sw _t,44(_gs.0)
    la _t,_globalStr41    
    sw _t,48(_gs.0)
    la _t,_globalStr126    
    sw _t,52(_gs.0)
    la _t,_globalStr53    
    sw _t,56(_gs.0)
    la _t,_globalStr28    
    sw _t,60(_gs.0)
    la _t,_globalStr68    
    sw _t,64(_gs.0)
    la _t,_globalStr84    
    sw _t,68(_gs.0)
    la _t,_globalStr48    
    sw _t,72(_gs.0)
    la _t,_globalStr126    
    sw _t,76(_gs.0)
    la _t,_globalStr77    
    sw _t,80(_gs.0)
    la _t,_globalStr33    
    sw _t,84(_gs.0)
    la _t,_globalStr70    
    sw _t,88(_gs.0)
    la _t,_globalStr126    
    sw _t,92(_gs.0)
    la _t,_globalStr124    
    sw _t,96(_gs.0)
    la _t,_globalStr51    
    sw _t,100(_gs.0)
    la _t,_globalStr6    
    sw _t,104(_gs.0)
    la _t,_globalStr116    
    sw _t,108(_gs.0)
    la _t,_globalStr74    
    sw _t,112(_gs.0)
    la _t,_globalStr119    
    sw _t,116(_gs.0)
    la _t,_globalStr10    
    sw _t,120(_gs.0)
    la _t,_globalStr106    
    sw _t,124(_gs.0)
    la _t,_globalStr114    
    sw _t,128(_gs.0)
    lw _t.0, 328(_gc.0)
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 268(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 348(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 360(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 288(_gc.0)
    lw _t.0, 276(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 348(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 64(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 64(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 288(_gc.0)
    lw _t.0, 276(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 348(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 68(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 68(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 288(_gc.0)
    lw _t.0, 276(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 348(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 72(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 72(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 288(_gc.0)
    lw _t.0, 276(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 348(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 76(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 76(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 288(_gc.0)
    lw _t.0, 276(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 348(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 80(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 80(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 288(_gc.0)
    lw _t.0, 276(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 348(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 84(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 84(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 288(_gc.0)
    lw _t.0, 276(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 348(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 88(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 88(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 288(_gc.0)
    lw _t.0, 276(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 348(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 92(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 92(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 288(_gc.0)
    lw _t.0, 276(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 348(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 96(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 96(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 288(_gc.0)
    lw _t.0, 276(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 348(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 100(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 100(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 368(_gc.0)
    mv	a0,_t.0 
    call	println
    lw _t.0, 328(_gc.0)
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 236(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 240(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 344(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 236(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 72(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 84(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 88(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 240(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 328(_gc.0)
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 236(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 240(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 344(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 236(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 72(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 84(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 88(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 240(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 328(_gc.0)
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 72(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 360(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 288(_gc.0)
    lw _t.0, 276(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 112(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 100(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 236(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 44(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 268(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 44(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 240(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 324(_gc.0)
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 236(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 44(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 268(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 60(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 68(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 64(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 44(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 268(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 328(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 20(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 68(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 64(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 44(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 240(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 368(_gc.0)
    mv	a0,_t.0 
    call	println
    lw _t.0, 328(_gc.0)
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 72(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 360(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 288(_gc.0)
    lw _t.0, 276(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 112(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 100(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 236(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 44(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 268(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 44(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 240(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 324(_gc.0)
    lw _t.0, 272(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 336(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 236(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 44(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 268(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 60(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 68(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 64(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 44(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 268(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 32(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 20(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 68(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 64(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 36(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 44(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 240(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 368(_gc.0)
    mv	a0,_t.0 
    call	println
    lw _t.0, 328(_gc.0)
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 264(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 312(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 328(_gc.0)
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 256(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 72(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 320(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2b.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 328(_gc.0)
    lw _t.0, 332(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 324(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 288(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 308(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 280(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 4(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 256(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 72(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 260(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 116(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2b.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2b.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 108(_gc.0)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    lw _t.0, 4(_gs.0)
    mv	a0,_t.0 
    call	println
    mv	_i.2,zero 
    j	_forcondBB1
_forcondBB1:
    li t, 93
    blt	_i.2,t,	_forbodyBB1
    j	_afterForBB1
_afterForBB1:
    mv	_i.4,zero 
    j	_forcondBB2
_forcondBB2:
    li t, 32
    blt	_i.4,t,	_forbodyBB2
    j	_afterForBB2
_afterForBB2:
    li _i.6, 1
    j	_forcondBB3
_forcondBB3:
    li t, 32
    blt	_i.6,t,	_forbodyBB3
    j	afterCallBB1
_forbodyBB3:
    slli _t.0,_i.6,    2
    addi _t.0,_t.0,    4
    add _t.0,_gs.0,_t.0
    lw _t.0, 0(_t.0)
    mv	a0,_t.0 
    call	println
    addi _i.7,_i.6,    1
    mv	_i.6,_i.7 
    j	_forcondBB3
afterCallBB1:
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
    mv	s11,back_s11 
    mv	s10,back_s10 
    mv	ra,backup_ra 
    mv	a0,zero 
    ret
_forbodyBB2:
    slli _t.0,_i.4,    2
    addi _t.0,_t.0,    4
    add _t.1,_gs.0,_t.0
    mv	__ss.1,_i.4 
    li t, 9
    ble	__ss.1,t,	__if_thenBB1
    j	__if_end1
__if_thenBB1:
    mv	_x.1,__ss.1 
    beq	_x.1,zero,	_if_thenBB1
    j	_if_end1
_if_thenBB1:
    la _mergedretVal.1,_globalStr76    
    mv	_mergedretVal.12,_mergedretVal.1 
    j	afterCallBB2
afterCallBB2:
    mv	__t.0,_mergedretVal.12 
    la para,_globalStr52    
    mv	a0,para 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr40    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	__mergedretVal.1,__t.0 
    mv	__mergedretVal.2,__mergedretVal.1 
    j	_afterCallBB1
_afterCallBB1:
    mv	_t.0,__mergedretVal.2 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 0(_t.1)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_gco.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    addi _i.8,_i.4,    1
    mv	_i.4,_i.8 
    j	_forcondBB2
_if_end1:
    li t, 1
    beq	_x.1,t,	_if_thenBB2
    j	_if_end2
_if_thenBB2:
    la _mergedretVal.2,_globalStr90    
    mv	_mergedretVal.12,_mergedretVal.2 
    j	afterCallBB2
_if_end2:
    li t, 2
    beq	_x.1,t,	_if_thenBB3
    j	_if_end3
_if_thenBB3:
    la _mergedretVal.3,_globalStr105    
    mv	_mergedretVal.12,_mergedretVal.3 
    j	afterCallBB2
_if_end3:
    li t, 3
    beq	_x.1,t,	_if_thenBB4
    j	_if_end4
_if_thenBB4:
    la _mergedretVal.4,_globalStr120    
    mv	_mergedretVal.12,_mergedretVal.4 
    j	afterCallBB2
_if_end4:
    li t, 4
    beq	_x.1,t,	_if_thenBB5
    j	_if_end5
_if_thenBB5:
    la _mergedretVal.5,_globalStr9    
    mv	_mergedretVal.12,_mergedretVal.5 
    j	afterCallBB2
_if_end5:
    li t, 5
    beq	_x.1,t,	_if_thenBB6
    j	_if_end6
_if_end6:
    li t, 6
    beq	_x.1,t,	_if_thenBB7
    j	_if_end7
_if_end7:
    li t, 7
    beq	_x.1,t,	_if_thenBB8
    j	_if_end8
_if_end8:
    li t, 8
    beq	_x.1,t,	_if_thenBB9
    j	_if_end9
_if_end9:
    li t, 9
    beq	_x.1,t,	_if_thenBB10
    j	_if_end10
_if_end10:
    mv	_mergedretVal.12,zero 
    j	afterCallBB2
_if_thenBB10:
    la _mergedretVal.7,_globalStr87    
    mv	_mergedretVal.12,_mergedretVal.7 
    j	afterCallBB2
_if_thenBB9:
    la _mergedretVal.8,_globalStr72    
    mv	_mergedretVal.12,_mergedretVal.8 
    j	afterCallBB2
_if_thenBB8:
    la _mergedretVal.9,_globalStr56    
    mv	_mergedretVal.12,_mergedretVal.9 
    j	afterCallBB2
_if_thenBB7:
    la _mergedretVal.10,_globalStr38    
    mv	_mergedretVal.12,_mergedretVal.10 
    j	afterCallBB2
_if_thenBB6:
    la _mergedretVal.11,_globalStr22    
    mv	_mergedretVal.12,_mergedretVal.11 
    j	afterCallBB2
__if_end1:
    li t, 10
    rem __t.0,__ss.1,t
    mv	_x.2,__t.0 
    beq	_x.2,zero,	_if_thenBB11
    j	_if_end11
_if_thenBB11:
    la _mergedretVal.2,_globalStr76    
    mv	_mergedretVal.13,_mergedretVal.2 
    j	afterCallBB3
afterCallBB3:
    mv	__t.2,_mergedretVal.13 
    li t, 10
    div __t.0,__ss.1,t
    mv	_x.2,__t.0 
    beq	_x.2,zero,	_if_thenBB12
    j	_if_end12
_if_thenBB12:
    la _mergedretVal.3,_globalStr76    
    mv	_mergedretVal.2,_mergedretVal.3 
    j	afterCallBB4
afterCallBB4:
    mv	__t.0,_mergedretVal.2 
    la para,_globalStr52    
    mv	a0,para 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.2 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr40    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	__mergedretVal.3,__t.0 
    mv	__mergedretVal.2,__mergedretVal.3 
    j	_afterCallBB1
_if_end12:
    li t, 1
    beq	_x.2,t,	_if_thenBB13
    j	_if_end13
_if_thenBB13:
    la _mergedretVal.4,_globalStr90    
    mv	_mergedretVal.2,_mergedretVal.4 
    j	afterCallBB4
_if_end13:
    li t, 2
    beq	_x.2,t,	_if_thenBB14
    j	_if_end14
_if_thenBB14:
    la _mergedretVal.5,_globalStr105    
    mv	_mergedretVal.2,_mergedretVal.5 
    j	afterCallBB4
_if_end14:
    li t, 3
    beq	_x.2,t,	_if_thenBB15
    j	_if_end15
_if_thenBB15:
    la _mergedretVal.6,_globalStr120    
    mv	_mergedretVal.2,_mergedretVal.6 
    j	afterCallBB4
_if_end15:
    li t, 4
    beq	_x.2,t,	_if_thenBB16
    j	_if_end16
_if_end16:
    li t, 5
    beq	_x.2,t,	_if_thenBB17
    j	_if_end17
_if_end17:
    li t, 6
    beq	_x.2,t,	_if_thenBB18
    j	_if_end18
_if_end18:
    li t, 7
    beq	_x.2,t,	_if_thenBB19
    j	_if_end19
_if_thenBB19:
    la _mergedretVal.7,_globalStr56    
    mv	_mergedretVal.2,_mergedretVal.7 
    j	afterCallBB4
_if_end19:
    li t, 8
    beq	_x.2,t,	_if_thenBB20
    j	_if_end20
_if_end20:
    li t, 9
    beq	_x.2,t,	_if_thenBB21
    j	_if_end21
_if_end21:
    mv	_mergedretVal.2,zero 
    j	afterCallBB4
_if_thenBB21:
    la _mergedretVal.9,_globalStr87    
    mv	_mergedretVal.2,_mergedretVal.9 
    j	afterCallBB4
_if_thenBB20:
    la _mergedretVal.10,_globalStr72    
    mv	_mergedretVal.2,_mergedretVal.10 
    j	afterCallBB4
_if_thenBB18:
    la _mergedretVal.11,_globalStr38    
    mv	_mergedretVal.2,_mergedretVal.11 
    j	afterCallBB4
_if_thenBB17:
    la _mergedretVal.12,_globalStr22    
    mv	_mergedretVal.2,_mergedretVal.12 
    j	afterCallBB4
_if_thenBB16:
    la _mergedretVal.13,_globalStr9    
    mv	_mergedretVal.2,_mergedretVal.13 
    j	afterCallBB4
_if_end11:
    li t, 1
    beq	_x.2,t,	_if_thenBB22
    j	_if_end22
_if_thenBB22:
    la _mergedretVal.3,_globalStr90    
    mv	_mergedretVal.13,_mergedretVal.3 
    j	afterCallBB3
_if_end22:
    li t, 2
    beq	_x.2,t,	_if_thenBB23
    j	_if_end23
_if_thenBB23:
    la _mergedretVal.4,_globalStr105    
    mv	_mergedretVal.13,_mergedretVal.4 
    j	afterCallBB3
_if_end23:
    li t, 3
    beq	_x.2,t,	_if_thenBB24
    j	_if_end24
_if_end24:
    li t, 4
    beq	_x.2,t,	_if_thenBB25
    j	_if_end25
_if_thenBB25:
    la _mergedretVal.5,_globalStr9    
    mv	_mergedretVal.13,_mergedretVal.5 
    j	afterCallBB3
_if_end25:
    li t, 5
    beq	_x.2,t,	_if_thenBB26
    j	_if_end26
_if_end26:
    li t, 6
    beq	_x.2,t,	_if_thenBB27
    j	_if_end27
_if_end27:
    li t, 7
    beq	_x.2,t,	_if_thenBB28
    j	_if_end28
_if_end28:
    li t, 8
    beq	_x.2,t,	_if_thenBB29
    j	_if_end29
_if_end29:
    li t, 9
    beq	_x.2,t,	_if_thenBB30
    j	_if_end30
_if_thenBB30:
    la _mergedretVal.6,_globalStr87    
    mv	_mergedretVal.13,_mergedretVal.6 
    j	afterCallBB3
_if_end30:
    mv	_mergedretVal.13,zero 
    j	afterCallBB3
_if_thenBB29:
    la _mergedretVal.8,_globalStr72    
    mv	_mergedretVal.13,_mergedretVal.8 
    j	afterCallBB3
_if_thenBB28:
    la _mergedretVal.9,_globalStr56    
    mv	_mergedretVal.13,_mergedretVal.9 
    j	afterCallBB3
_if_thenBB27:
    la _mergedretVal.10,_globalStr38    
    mv	_mergedretVal.13,_mergedretVal.10 
    j	afterCallBB3
_if_thenBB26:
    la _mergedretVal.11,_globalStr22    
    mv	_mergedretVal.13,_mergedretVal.11 
    j	afterCallBB3
_if_thenBB24:
    la _mergedretVal.12,_globalStr120    
    mv	_mergedretVal.13,_mergedretVal.12 
    j	afterCallBB3
_forbodyBB1:
    slli _t.0,_i.2,    2
    addi _t.0,_t.0,    4
    add _t.1,_gc.0,_t.0
    mv	__cc.1,_i.2 
    li t, 9
    ble	__cc.1,t,	__if_thenBB2
    j	__if_end2
__if_end2:
    li t, 10
    rem __t.0,__cc.1,t
    mv	_x.1,__t.0 
    beq	_x.1,zero,	_if_thenBB31
    j	_if_end31
_if_thenBB31:
    la _mergedretVal.1,_globalStr76    
    mv	_mergedretVal.2,_mergedretVal.1 
    j	afterCallBB5
afterCallBB5:
    mv	__t.1,_mergedretVal.2 
    li t, 10
    div __t.0,__cc.1,t
    mv	_x.1,__t.0 
    beq	_x.1,zero,	_if_thenBB32
    j	_if_end32
_if_end32:
    li t, 1
    beq	_x.1,t,	_if_thenBB33
    j	_if_end33
_if_end33:
    li t, 2
    beq	_x.1,t,	_if_thenBB34
    j	_if_end34
_if_end34:
    li t, 3
    beq	_x.1,t,	_if_thenBB35
    j	_if_end35
_if_thenBB35:
    la _mergedretVal.2,_globalStr120    
    mv	_mergedretVal.1,_mergedretVal.2 
    j	afterCallBB6
afterCallBB6:
    mv	__t.0,_mergedretVal.1 
    la para,_globalStr62    
    mv	a0,para 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    mv	a1,__t.1 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr40    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	__mergedretVal.1,__t.0 
    mv	__mergedretVal.2,__mergedretVal.1 
    j	_afterCallBB2
_afterCallBB2:
    mv	_t.0,__mergedretVal.2 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    lw _t.0, 0(_t.1)
    mv	a0,_t.0 
    mv	a1,_t.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_ga2q.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    mv	a1,_gco.0 
    call	_stringAdd
    mv	_t.0,a0 
    mv	a0,_t.0 
    call	println
    addi _i.9,_i.2,    1
    mv	_i.2,_i.9 
    j	_forcondBB1
_if_end35:
    li t, 4
    beq	_x.1,t,	_if_thenBB36
    j	_if_end36
_if_thenBB36:
    la _mergedretVal.3,_globalStr9    
    mv	_mergedretVal.1,_mergedretVal.3 
    j	afterCallBB6
_if_end36:
    li t, 5
    beq	_x.1,t,	_if_thenBB37
    j	_if_end37
_if_end37:
    li t, 6
    beq	_x.1,t,	_if_thenBB38
    j	_if_end38
_if_end38:
    li t, 7
    beq	_x.1,t,	_if_thenBB39
    j	_if_end39
_if_end39:
    li t, 8
    beq	_x.1,t,	_if_thenBB40
    j	_if_end40
_if_thenBB40:
    la _mergedretVal.4,_globalStr72    
    mv	_mergedretVal.1,_mergedretVal.4 
    j	afterCallBB6
_if_end40:
    li t, 9
    beq	_x.1,t,	_if_thenBB41
    j	_if_end41
_if_thenBB41:
    la _mergedretVal.5,_globalStr87    
    mv	_mergedretVal.1,_mergedretVal.5 
    j	afterCallBB6
_if_end41:
    mv	_mergedretVal.1,zero 
    j	afterCallBB6
_if_thenBB39:
    la _mergedretVal.7,_globalStr56    
    mv	_mergedretVal.1,_mergedretVal.7 
    j	afterCallBB6
_if_thenBB38:
    la _mergedretVal.8,_globalStr38    
    mv	_mergedretVal.1,_mergedretVal.8 
    j	afterCallBB6
_if_thenBB37:
    la _mergedretVal.9,_globalStr22    
    mv	_mergedretVal.1,_mergedretVal.9 
    j	afterCallBB6
_if_thenBB34:
    la _mergedretVal.10,_globalStr105    
    mv	_mergedretVal.1,_mergedretVal.10 
    j	afterCallBB6
_if_thenBB33:
    la _mergedretVal.11,_globalStr90    
    mv	_mergedretVal.1,_mergedretVal.11 
    j	afterCallBB6
_if_thenBB32:
    la _mergedretVal.12,_globalStr76    
    mv	_mergedretVal.1,_mergedretVal.12 
    j	afterCallBB6
_if_end31:
    li t, 1
    beq	_x.1,t,	_if_thenBB42
    j	_if_end42
_if_end42:
    li t, 2
    beq	_x.1,t,	_if_thenBB43
    j	_if_end43
_if_thenBB43:
    la _mergedretVal.3,_globalStr105    
    mv	_mergedretVal.2,_mergedretVal.3 
    j	afterCallBB5
_if_end43:
    li t, 3
    beq	_x.1,t,	_if_thenBB44
    j	_if_end44
_if_thenBB44:
    la _mergedretVal.4,_globalStr120    
    mv	_mergedretVal.2,_mergedretVal.4 
    j	afterCallBB5
_if_end44:
    li t, 4
    beq	_x.1,t,	_if_thenBB45
    j	_if_end45
_if_end45:
    li t, 5
    beq	_x.1,t,	_if_thenBB46
    j	_if_end46
_if_end46:
    li t, 6
    beq	_x.1,t,	_if_thenBB47
    j	_if_end47
_if_thenBB47:
    la _mergedretVal.5,_globalStr38    
    mv	_mergedretVal.2,_mergedretVal.5 
    j	afterCallBB5
_if_end47:
    li t, 7
    beq	_x.1,t,	_if_thenBB48
    j	_if_end48
_if_end48:
    li t, 8
    beq	_x.1,t,	_if_thenBB49
    j	_if_end49
_if_end49:
    li t, 9
    beq	_x.1,t,	_if_thenBB50
    j	_if_end50
_if_thenBB50:
    la _mergedretVal.6,_globalStr87    
    mv	_mergedretVal.2,_mergedretVal.6 
    j	afterCallBB5
_if_end50:
    mv	_mergedretVal.2,zero 
    j	afterCallBB5
_if_thenBB49:
    la _mergedretVal.8,_globalStr72    
    mv	_mergedretVal.2,_mergedretVal.8 
    j	afterCallBB5
_if_thenBB48:
    la _mergedretVal.9,_globalStr56    
    mv	_mergedretVal.2,_mergedretVal.9 
    j	afterCallBB5
_if_thenBB46:
    la _mergedretVal.10,_globalStr22    
    mv	_mergedretVal.2,_mergedretVal.10 
    j	afterCallBB5
_if_thenBB45:
    la _mergedretVal.11,_globalStr9    
    mv	_mergedretVal.2,_mergedretVal.11 
    j	afterCallBB5
_if_thenBB42:
    la _mergedretVal.12,_globalStr90    
    mv	_mergedretVal.2,_mergedretVal.12 
    j	afterCallBB5
__if_thenBB2:
    mv	_x.2,__cc.1 
    beq	_x.2,zero,	_if_thenBB51
    j	_if_end51
_if_thenBB51:
    la _mergedretVal.2,_globalStr76    
    mv	_mergedretVal.13,_mergedretVal.2 
    j	afterCallBB7
afterCallBB7:
    mv	__t.0,_mergedretVal.13 
    la para,_globalStr62    
    mv	a0,para 
    mv	a1,__t.0 
    call	_stringAdd
    mv	__t.0,a0 
    mv	a0,__t.0 
    la para,_globalStr40    
    mv	a1,para 
    call	_stringAdd
    mv	__t.0,a0 
    mv	__mergedretVal.3,__t.0 
    mv	__mergedretVal.2,__mergedretVal.3 
    j	_afterCallBB2
_if_end51:
    li t, 1
    beq	_x.2,t,	_if_thenBB52
    j	_if_end52
_if_thenBB52:
    la _mergedretVal.3,_globalStr90    
    mv	_mergedretVal.13,_mergedretVal.3 
    j	afterCallBB7
_if_end52:
    li t, 2
    beq	_x.2,t,	_if_thenBB53
    j	_if_end53
_if_thenBB53:
    la _mergedretVal.4,_globalStr105    
    mv	_mergedretVal.13,_mergedretVal.4 
    j	afterCallBB7
_if_end53:
    li t, 3
    beq	_x.2,t,	_if_thenBB54
    j	_if_end54
_if_thenBB54:
    la _mergedretVal.5,_globalStr120    
    mv	_mergedretVal.13,_mergedretVal.5 
    j	afterCallBB7
_if_end54:
    li t, 4
    beq	_x.2,t,	_if_thenBB55
    j	_if_end55
_if_thenBB55:
    la _mergedretVal.6,_globalStr9    
    mv	_mergedretVal.13,_mergedretVal.6 
    j	afterCallBB7
_if_end55:
    li t, 5
    beq	_x.2,t,	_if_thenBB56
    j	_if_end56
_if_thenBB56:
    la _mergedretVal.7,_globalStr22    
    mv	_mergedretVal.13,_mergedretVal.7 
    j	afterCallBB7
_if_end56:
    li t, 6
    beq	_x.2,t,	_if_thenBB57
    j	_if_end57
_if_end57:
    li t, 7
    beq	_x.2,t,	_if_thenBB58
    j	_if_end58
_if_thenBB58:
    la _mergedretVal.8,_globalStr56    
    mv	_mergedretVal.13,_mergedretVal.8 
    j	afterCallBB7
_if_end58:
    li t, 8
    beq	_x.2,t,	_if_thenBB59
    j	_if_end59
_if_end59:
    li t, 9
    beq	_x.2,t,	_if_thenBB60
    j	_if_end60
_if_end60:
    mv	_mergedretVal.13,zero 
    j	afterCallBB7
_if_thenBB60:
    la _mergedretVal.10,_globalStr87    
    mv	_mergedretVal.13,_mergedretVal.10 
    j	afterCallBB7
_if_thenBB59:
    la _mergedretVal.11,_globalStr72    
    mv	_mergedretVal.13,_mergedretVal.11 
    j	afterCallBB7
_if_thenBB57:
    la _mergedretVal.12,_globalStr38    
    mv	_mergedretVal.13,_mergedretVal.12 
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
