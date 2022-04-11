%include "io.inc"

section .data
    a db "%d", 0

section .text
global CMAIN

CEXTERN printf ;in order to call c printf function

func:
    ;save ebp to stack and make it point to the top of stack 
    ;(stack structure from top : param1, ..., paramN (EBP + 8), EIP (EBP + 4), EBP (EBP points here), localvar1 (EBP - 4), ...)
    push ebp
    mov ebp, esp
    
    ;body of function
    mov eax, [ebp + 8]
    
    ;make esp (pointer to top of stack) point to ebp (end of eip and parameters)
    mov esp, ebp
    ;return ebp to its value before func call 
    pop ebp
    ;clear parameters and return
    ret 4

CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    mov eax, 8
    
    push eax;push eax as parameter to stack
    
    xor eax, eax;null eax (just for demosntration)
    
    call func;get parameter val returned in eax
    
    ;push parameters of printf to stack R to L
    push eax
    push a
    
    call printf
    ;clear parameters (c convention)
    add esp, 8
    
    
    
    xor eax, eax
    ret