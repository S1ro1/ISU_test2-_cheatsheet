%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging

    ;..................................................................
    ; switch(x){
    ;   case val1:
    ;       a++;
    ;       break;
    ;   case val2:
    ;       b++;
    ;       break;
    ;   default:
    ;       c++;
    ; }
    ; d++;
    ;...................................................................

    mov eax, 5; a = val1 = 5
    mov ebx, 3; b = val2 = 3
    mov ecx, 1; c = val3 = 1
    mov edx, 0; d = 0
    mov esi, 3; x = 3
    
    ;........................SWITCH STARTS HERE...........................
    
    case_1:
        ;condition if x is case_1
        cmp esi, eax
        jne case_2 ;if not jump to next case
        inc eax ;body of case (a++)
        jmp break ;break (jump to end)
    case_2:
        cmp esi, ebx
        jne case_default
        inc ebx
        jmp break
    case_default:
        inc ecx
    break:
    ;........................SWITCH ENDS HERE...........................
    
    inc edx;d++
    ;write your code here
    xor eax, eax
    ret