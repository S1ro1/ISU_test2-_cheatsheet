%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging

    ; ......................................................
    ; while(a < b){
    ;   a += b;
    ; }
    ; b++;
    ; ......................................................
    
    mov eax, 5 ; a = 8;
    mov ebx, 8 ; b = 8;
    
    ;........................WHILE STARTS HERE...........................
    
    ;while start
    while:
        ;condition (a < b)
        cmp eax, ebx
        jnl while_end ;if condition not met, jump out of while
        
        ;while loop body (a += b)
        add eax, ebx
        
        ;loop jump
        jmp while
    
    ;end of while loop (rest of the code after while_end:)
    while_end:
    
    ;........................WHILE ENDS HERE...........................
    
    inc ebx ; b++
    
    
    ;write your code here
    xor eax, eax
    ret