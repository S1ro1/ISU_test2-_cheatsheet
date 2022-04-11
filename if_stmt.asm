%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    ; ......................................................
    ; if(a == b){
    ;   a++;
    ; }
    ; b++;
    ; ......................................................
    
    mov eax, 5 ; a = 5
    mov ebx, 3 ; b = 3
    
    ;........................IF STARTS HERE...........................
    
    ;condition (a == b)
    cmp eax, ebx
    jne false ;if condition false jump over if body (negate desired codition)
    
    ;condition true (if body)
    inc eax ; a++
    
    ;condition false (rest of code)
    false:
    
    ;........................IF ENDS HERE...........................
    
    inc ebx ; b++
    
    ;write your code here
    xor eax, eax
    ret