%include "io.inc"

section .data
    fmt db "%d", 10, 0; format for printf EOL can be used instead of 10, 0

section .text
global CMAIN

CEXTERN printf; in order to call c printf func

fastcall_func:
    push ebp
    mov ebp, esp
    ;returns param1 - param2 + param3 - param4 in eax register
    mov eax, ecx
    sub eax, edx
    add eax, [ebp + 8]
    sub eax, [ebp + 12]
    
    mov esp, ebp
    pop ebp
    ret 8

stdcall_func:
    push ebp
    mov ebp, esp
    ;returns param1 - param2 in eax register
    mov eax, [ebp+8]
    sub eax, [ebp+12]
    
    mov esp, ebp
    pop ebp
    ret 8

pascal_func:
    push ebp
    mov ebp, esp
    ;returns param1 - param2 in eax register
    mov eax, [ebp+12]
    sub eax, [ebp+8]
    
    mov esp, ebp
    pop ebp
    ret 8

CMAIN:
    mov ebp, esp; for correct debugging

    ;......................CDECL CONVENTION................................
    ;PARAMS TO STACK: R to L (R first)
    ;STACK CLEANS: person calling func
    ;NAME DECORATION: _symbol
    ;printf(fmt, eax);
    
    mov eax, 8
    
    push eax ; first push what we want to print
    push fmt ; next format pointer
    
    call printf ; call c func
    
    add esp, 8; clear the 2 args
    
    ;......................PASCAL CONVENTION................................
    ;PARAMS TO STACK: L to R (L first)
    ;STACK CLEANS: inside func
    ;NAME DECORATION: symbol
    ;a = 8; b = 5; pascal_func(a, b); print result
     
    mov eax, 8
    mov ebx, 5
    
    push eax ; push a
    push ebx ; push b
    
    call pascal_func
    
    push eax ; first push what we want to print
    push fmt ; next format pointer
    
    call printf ; call c func
    
    add esp, 8; clear the 2 args
    
    ;......................STDCALL CONVENTION................................
    ;PARAMS TO STACK: R to L (R first)
    ;STACK CLEANS: inside func
    ;NAME DECORATION: _symbol@4
    ;a = 7; b = 5; stdcall_func(a, b); print result
     
    mov eax, 7
    mov ebx, 5
    
    push ebx ; push b
    push eax ; push a
    
    call stdcall_func
    
    push eax ; first push what we want to print
    push fmt ; next format pointer
    
    call printf ; call c func
    
    add esp, 8; clear the 2 args
    
    ;......................FASTCALL CONVENTION................................
    ;PARAMS TO STACK: R to L (R first but first two params in ECX and EDX)
    ;STACK CLEANS: inside func
    ;NAME DECORATION: @symbol@8
    ;a = 7; b = 5; c = 4; d = 2; fastcall_func(a, b, c, d); print result
     
    mov ecx, 7 ; pass first param in ECX (a)
    mov edx, 5 ; pass second param in EDX (b)
    mov eax, 4 ; set val of c
    mov ebx, 2 ; set val of d
    
    push ebx ; push d
    push eax ; push c
    
    call fastcall_func
    
    push eax ; first push what we want to print
    push fmt ; next format pointer
    
    call printf ; call c func
    
    add esp, 8; clear the 2 args
    
    ;write your code here
    xor eax, eax
    ret