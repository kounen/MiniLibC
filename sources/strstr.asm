; char *strstr(const char *haystack, const char *needle)
; Finds the first occurrence of the substring needle in the string haystack.
; The terminating null bytes ('\0') are not compared.
; Return a pointer to the beginning of the located substring, or NULL if not found.

BITS 64                                             ; 64-bit mode

SECTION .text                                       ; Code section

GLOBAL strstr                                       ; Export 'strstr'

strstr:
                        XOR RCX, RCX                ; Set haystack counter to 0
                        JMP loop                    ; Jump to loop label

increment_haystack:
                        INC RCX                     ; Increment haystack counter

loop:
                        XOR R13, R13                ; Set needle counter to 0
                        JMP loop_compare            ; Jump to loop_compare label

increment_strings:
                        INC RCX                     ; Increment haystack counter
                        INC R13                     ; Increment needle counter

loop_compare:
                        MOV R12B, [RSI + R13]       ; Copy into r12b needle[R13]
                        CMP R12B, 0x00              ; Compare needle[R13] to '\0'
                        JE quit                     ; If equals, needle match with haystack so return pointer on needle begin
                        MOV R11B, [RDI + RCX]       ; Copy into r11b haystack[RCX]
                        CMP R11B, 0x00              ; Compare haystack[RCX] to '\0'
                        JE return_null              ; If equals, needle doesn't match with haystack so return NULL
                        CMP R11B, R12B              ; Compare haystack[RCX] to needle[R13]
                        JE increment_strings        ; If equals, increment RCX and R13
                        JMP increment_haystack      ; Else, increment only RCX and reset R13 to 0

return_null:
                        MOV RAX, 0x00               ; Copy into RAX return register NULL value
                        RET                         ; All done ! Return

quit:
                        SUB RCX, R13                ; Substract to RCX counter R13 counter to set RCX as first needle character position
                        ADD RDI, RCX                ; Add this position to RDI. Then RDI point on first needle character
                        MOV RAX, RDI                ; Copy this pointer to RAX return register
                        RET                         ; All done ! Return