%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    ; ......................................................
    ; if(a == b){
    ;   a++;
    ; }else{
    ;   b++;
    ; }
    ; a += b;
    ; ......................................................
    
    mov eax, 5 ; a = 5
    mov ebx, 3 ; b = 3
    
    ;........................IF ELSE STARTS HERE...........................
    
    ;condition
    cmp eax, ebx
    jne else ;if condition false jump over if body (negate desired codition)
    
    ;condition true (if body)
    inc eax ; a++
    jmp endif ;jump over else statement
    
    ;condition false (else body)
    else:
    inc ebx ; b++
    
    ;rest of the code
    endif:
    
    ;........................IF ELSE ENDS HERE...........................
    
    add eax, ebx ; a += b
    
    ;write your code here
    xor eax, eax
    ret