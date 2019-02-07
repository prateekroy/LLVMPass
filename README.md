# llvm-pass-skeleton

Prerequisite - Follow https://www.cs.cornell.edu/~asampson/blog/llvm.html to write a basic pass.

This repo has three parts :

    - Print out the number of memory access instructions, branch instructions, and arithmetic instructions, in each function in the source code. 
    - Loop identification and analyse loop nests.
    - Identifying dependence between loop variables in a nested loop, interchanging loop nests which are independent of each other. 

Build:

    $ cd llvm-pass-skeleton
    $ mkdir build
    $ cd build
    $ cmake ..
    $ make
    $ cd ..

Run:

    $ clang -Xclang -load -Xclang build/skeleton/libSkeletonPass.* something.c
