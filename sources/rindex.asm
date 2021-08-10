; char *rindex(const char *s, int c)
; Returns a pointer to the last occurrence of the character c in the string s.
; The terminating null byte ('\0') is considered to be a part of the string.

BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section

GLOBAL rindex                           ; Export 'rindex'

rindex:

go_to_end:
                CMP BYTE [RDI], 0x00    ; Compare current string character with '\0'
                JE loop                 ; If equal, we are at the end of the string, so jump to loop label
                INC RDI                 ; Else increment RDI pointer
                JMP go_to_end           ; Loop while string s pointer is not null

loop:
                CMP SIL, 0x00           ; Check if second parameter is '\0'
                JE quit                 ; Then return a pointer to the '\0' character
                DEC RDI                 ; Else decrement RDI to point on the last not null string s character
                CMP BYTE [RDI], SIL     ; Compare current character with second parameter
                JE quit                 ; If equal, return a pointer on the current character
                CMP BYTE [RDI], 0x00    ; Check if current character is not null
                JE return_null          ; Then return null
                JMP loop                ; Else continue to loop

quit:
                MOV RAX, RDI            ; Load in RAX return register, RDI pointer
                RET                     ; All done ! Return

return_null:
                XOR RAX, RAX            ; Set RAX return register to null
                RET                     ; All done ! Return