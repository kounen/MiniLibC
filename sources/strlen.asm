; size_t strlen(const char *s)
; Returns the length of the string pointed to by s, excluding the terminating null byte ('\0').

BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section

GLOBAL strlen                           ; Export 'strlen'

strlen:
            XOR RCX, RCX                ; Set counter to 0
            JMP loop                    ; Jump to loop label

increment:
            INC RCX                     ; Increment counter
            
loop:
            CMP BYTE [RDI + RCX], 0x00  ; Compare current character with '\0' (end of string)
            JNE increment               ; Jump to increment label if character is not equal to '\0'
            MOV RAX, RCX                ; Move counter value into eax register which stock program return value
            RET                         ; All done ! Return




