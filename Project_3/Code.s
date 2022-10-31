Main:
   ADDI X0, XZR, #5
   ADDI X1, XZR, #10
   ADDI X2, XZR, #8
   ADDI X3, XZR, #2
   ADDI X4, XZR, #5
   ADDI X5, XZR, #10
   ADDI X6, XZR, #7
   ADDI X7, XZR, #12
   
   SUBI X28, X28, #24
   STUR X19, [X28, #16]
   STUR X20, [X28, #8]
   STUR X21, [X28, #0]
   
   BL Average
   ADD X0, XZR, X19
   B Exit
   
Average:
   ADD X21, X0, X1
   ADD X21, X21, X2
   ADD X21, X21, X3
   ADD X21, X21, X4
   ADD X21, X21, X5
   ADD X21, X21, X6
   ADD X21, X21, X7
   ADDI X20, XZR, #8
   BL Divide
   BR X30   // Stuck in a loop here.
   
Divide:
   ADDI X19, XZR, #0
Loop:
   SUBS XZR, X21, X20
   B.LE Return
   SUB X21, X21, X20
   ADDI X19, X19, #1
   B Loop
Return:
   ADD X0, X19, XZR
   BR X30
