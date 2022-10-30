Main:
   ADDI X1, XZR, #5  // int j = 5;
   ADDI X2, XZR, #3  // int k = 3;
   
   SUBI X28, X28, #16  // Allocating stacks
   STUR X9, [X28, #8]
   STUR X19, [X28, #0]
   
   BL Multiply
   ADD X20, X0, XZR  // int h = Multiply(j,k);
   B End

Multiply:
   ADDI X9, XZR, #0  // int i = 0
   ADDI X19, XZR, #0  //int r = 0
Loop:   
   SUBS XZR, X9, X2  // while (i < b){};
   B.GE Return  // Exit the loop, if i == b.
   ADD X19, X19, X1
   ADDI X9, X9, #1  
   B Loop
Return:   
   ADD X0, X19, XZR  // Stores X19, into X0 for return.
   LDUR X19, [X28, #0]  // Deallocating stacks
   LDUR X9, [X28, #8]
   ADDI X28, X28, #16
   BR X30  // Return address

End:
   ADDI X0, XZR, #0  // return 0;