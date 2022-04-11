%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ; ......................................................
    ; do{
    ;   a += b;
    ; } while (a < b);
    ; b++;
    ; ......................................................
    
    mov eax, 5 ; a = 5
    mov ebx, 5 ; b = 5
    
    ;........................DOWHILE STARTS HERE...........................
   
    ;dowhile start
    dowhile:
        ;do body (a += b)
        add eax, ebx
        
        ;condition (a < b)
        cmp eax, ebx
        jl dowhile ;if condition is met jump to the start of dowhile
        
    ;........................DOWHILE ENDS HERE...........................
    
    ;rest of the code goes below
    inc ebx ; b++
    
    ;write your code here
    xor eax, eax
    ret