%include "rw32-2018.inc"

CEXTERN malloc

section .data
    task23A dd 6144,2048,3840,4608,3584,2304,-12032,-10752

section .text
_main:
    push ebp
    mov ebp, esp
    
    mov esi, task23A
    mov ecx, 8
    call test23
    mov ebx, ecx
    mov ecx, 0
    
    mov edi, eax
    
print_loop:

    mov eax, [edi+4*ecx]
    call WriteInt32
    call WriteNewLine

    inc ecx
    cmp ecx, ebx
    jne print_loop    

    pop ebp
    ret
   
;----------------------------------------       
test23:
    push ebp
    mov ebp, esp
    
    push ebx
    push ecx
    
    mov eax, ecx
    mov ebx, dword 4 
    imul ebx
    push ecx
    push eax
    call malloc
    
    pop ecx
    pop ecx

    mov ebx, ecx
    
    mov ecx, 0
    
outer:
    cmp ecx, ebx  
    jge end_loop
    
    push ecx
    mov eax, [esi+4*ecx]
    
    inner:
        inc ecx
        cmp ecx, ebx
        jz ok
        cmp eax, [esi+4*ecx]
        jle inner
        xchg eax, [esi+4*ecx]
        jmp inner
ok:
    pop ecx
    mov [esi+4*ecx], eax
    inc ecx
    jmp outer
    
end_loop:    
    mov eax, esi 
    
    pop ecx
    pop ebx
       
    pop ebp
    ret

