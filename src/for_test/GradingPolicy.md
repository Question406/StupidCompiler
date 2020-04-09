# Grading Policy for Compiler 2020

## Grading Policy

In this course, you are required to implement a compiler that turns Mx code
to RISC-V assembly, and contribute one test case. Your score will consist of
three parts: basic (85%), advanced (5%) parts and misc (10%).

### Basic (85 points)
There will be three baselines B0, B1 and B2. If your implementation is correct, 
you can expect it to pass B0, which will earn you 75 points. If you implement
several non-trivial optimization passes such as dead code elimination, local 
value numbering / common subexpression elimination and constant propagation,
then you will be around B1, and if you pass B1, you will get 80 points. 
Finally, if you pass B2, you will get 85 points. 

If the performance of your compiler is between two baselines, say, B0 and B1, 
your score on this part will be between 80 and 85. 

### Advanced (5 points)
This part is for the students who are going to do research in system-related
area. Namely, you are not required to do this part, and your score will be 
< 95, which is still, in some sense, acceptable. If you choose to do this part,
you need to implement some advanced compiler techniques, and here are two 
possible  options.
* Implement an assembler so that your compiler can produce an object file, and
  test the correctness in a RISC-V Linux with emulators such as QEMU.
* Implement some advanced optimization algorithm such as the one described in
  the paper Karthik Gargi, *A Sparse Algorithm for Predicated Global Value 
  Numbering*, 2002.
You can also choose other compiler techniques to implement, but please contact
TAs first before you start to implement them.

Finally, you will need to give a short lecture (~ 20 min) about the technique 
you have implemented. 

### Misc (10 points)
You will get full score on this part as long as the quality of your code and
test case is not too bad.
