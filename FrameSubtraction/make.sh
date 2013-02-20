#!/bin/bash

gcc main.c -march=corei7-avx -mtune=corei7-avx -ftree-vectorizer-verbose=1 -O3 -S -o assemblyAVX.asm 
gcc main.c -march=corei7-avx -mtune=corei7-avx -ftree-vectorizer-verbose=1 -O3 -o SubtractionAVX


gcc main.c -S -o assembly.asm 
gcc main.c -o Subtraction

exit 0
