; int strncmp(const char *s1, const char *s2, size_t n);
; Compares the two strings s1 and s2 but only the first (at most) n bytes of s1 and s2.
; Returns < 0 : the first character that does not match has a lower value in s1 than in s2.
; Returns 0 : the contents of both strings are equal.
; Returns > 0 : the first character that does not match has a greater value in s1 than in s2.

BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section

GLOBAL strncmp                          ; Export 'strncmp'

strncmp:
            XOR RCX, RCX                ; Set counter to 0
            JMP loop                    ; Jump to loop label

quit:       
            SUB R11B, R12B              ; Substract s1 current character with s2 current character
            MOVSX EAX, R11B             ; Copy the result in register return value
            RET                         ; All done ! Return

end_loop:
            MOV EAX, 0x00               ; Load in register return value 0
            RET                         ; All done ! Return

increment:
            INC RCX                     ; Increment counter
            
loop:
            CMP RCX, RDX                ; Compare counter with third parameter
            JE end_loop                 ; If equal, strings are equals so return 0
            MOV R11B, BYTE [RDI + RCX]  ; Copy into r11b s1 current character
            MOV R12B, BYTE [RSI + RCX]  ; Copy into r12b s2 current character
            CMP R11B, 0x00              ; Compare s1 current character with '\0'
            JE quit                     ; Jump if equal
            CMP R12B, 0x00              ; Compare s2 current character with '\0'
            JE quit                     ; Jump if equal
            CMP R11B, R12B              ; Compare s1 current character with s2 current character
            JNE quit                    ; Jump if not equal
            JMP increment               ; Jump to increment label