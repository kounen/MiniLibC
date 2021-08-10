; char *strchr(const char *s, int c)
; Returns a pointer to the first occurrence of the character c in the string s.

BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section

GLOBAL strchr                           ; Export 'strchr'

strchr:
            JMP loop                    ; Jump to loop label

find:
            MOV RAX, RDI                ; Move current pointer into rax register which stock program return value
            RET                         ; All done ! Return
lost:
            MOV RAX, 0x00               ; Move NULL into rax register which stock program return value
            RET                         ; All done ! Return

increment:
            INC RDI                     ; Increment pointer and continue to loop
            
loop:
            CMP BYTE [RDI], SIL         ; Compare current character with character parameter
            JE find                     ; If equal, jump to find label
            CMP BYTE [RDI], 0x00        ; Compare current character with '\0' (end of string)
            JE lost                     ; If equal, jump to lost label
            JMP increment               ; Jump to increment label





