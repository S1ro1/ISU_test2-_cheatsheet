%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    ; ......................................................
    ; for(int a = 0; a < b; a++){
    ;   c++;
    ; }
    ; b++;
    ; ......................................................
    
    mov ebx, 5 ; b = 5
    mov ecx, 3 ; c = 3
    
    ;........................FOR STARTS HERE...........................
    
    ;S_init (int a = 0)
    mov eax, 0
    
    ;for start
    for:
        ;condition (a < b)
        cmp eax, ebx
        jnl for_end ; if condition not met jump out of for
        
        ;for body (c++)
        inc ecx
        
        ;for update (a++)
        inc eax
        ;loop
        jmp for
        
    ;end of for loop (rest of code goes below)
    for_end:
    
    ;........................FOR ENDS HERE.............................
    
    inc ebx ; b++


    ;write your code here
    xor eax, eax
    ret