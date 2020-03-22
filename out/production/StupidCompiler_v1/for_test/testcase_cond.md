## Condintion of test
### current test
    IRBuilder
        
#### Semantic Analyze Passed
#### IRBuilder:
    e1  good
    e2  good
    e3  good
    e4  good
    e5  good
    e6  good 
    e7  good
    e8  good 
    e9  good
    e10 good
    t1  good
    t2  good (queen)
    t3  good 
    t4  good
    t5  good
    t6  good
    t7  good
    t8  good
    t9  good
    t10 good
    t11 good 
    t12 good
    t13 good 
    t14 good
    t15 good
    t16 good
    t17 good
    t18 good
    t19 good
    t20 good
    t21 good qsort
    t22 good
    t23 good
    t24 good (output error)
    t25 good
    t26 good
    t27 good
    t28 good
    t29 good
    t30 good
    t31 good
    t32 good
    t33 good
    t34 good
    t35 good
    t36 good
    t37 good
    t38 good
    t39 good
    t40 good
    t41 good
    t42 good
    t43 good
    t44 good
    t45 good
    t46 good
    t47 good
    t48 good
    t49 good
    t50 good
    t51 good
    t52 good
    t53 good
    t54 fail tricky: bool d = (0 != 0) && (a / 0 != 1)
    t55 good
    t56 good
    t57 good
    t58 good
    t59 fail input error
    t60 good
    t61 good
    t62 good
    t63 good
    t64 good 
    t65 good *SHA-1 (but crackSHA-1 needs runs too many insts)
    t66 good
    t67 good
    t68 good
    
    Found out the IRprinter mem size is not the same as mine,
    still need redo
    
## Thoughts
### IR

#### bugs:
    03/07: if stat has an empty then_clause empty block (my IRBuilder is broke)