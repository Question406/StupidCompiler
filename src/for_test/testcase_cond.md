## Condintion of test
### current test
    IRBuilder
        
#### Semantic Analyze Passed
#### IRBuilder (Raw):
    good now.
    
    
#### Optimize: cur phase: SSAConstruct testing
    GlobalVarResolve: need to fix, seems having problem if no funcinliner makes them up for it 
    FuncInliner: need to fix for recursive call like f -> g, g -> f
    CFGSimplify: need to fix, SSAConstructor found out this has some
    SSAConstructor: seems good, all problems occurs because of bugs before it
    
    
## Thoughts
    