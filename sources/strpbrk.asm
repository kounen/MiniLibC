; char *strpbrk(const char *s, const char *accept)
; Locates the first occurrence in the string s of any of the bytes in the string accept.
; Returns a pointer to the byte in s that matches one of the bytes in accept.
; Or NULL if no such byte is found.

BITS 64                                     ; 64-bit mode

SECTION .text                               ; Code section

GLOBAL strpbrk                              ; Export 'strpbrk'

strpbrk:
                XOR RCX, RCX                ; Set s counter to 0
                JMP loop_s                  ; Loop into s

increment_s:
                INC RCX                     ; Increment s counter

loop_s:
                MOV R11B, BYTE [RDI + RCX]  ; Copy into R11B s[RCX]
                CMP R11B, 0x00              ; Compare it with '\0'
                JE return_null              ; If equals, none match between s and accept, so return NULL
                XOR R13, R13                ; Set accept counter to 0 and loop into accept

loop_accept:
                MOV R12B, BYTE [RSI + R13]  ; Copy into R12B accept[R13]
                CMP R12B, 0x00              ; Compare it with '\0'
                JE increment_s              ; If equals, current s character doesn't match with any accept character. So continue with s next character
                CMP R11B, R12B              ; Compare s[RCX] with accept[R13]
                JE quit                     ; If equals, return a pointer to current s character
                INC R13                     ; Else continue to check occurrence with other accept character
                JMP loop_accept             ; And loop for this after incrementing accept counter

return_null:
                MOV RAX, 0x00               ; Copy into RAX return register NULL value
                RET                         ; All done ! Return

quit:
                ADD RDI, RCX                ; Add this position to RDI. Then RDI point on s character occurrence
                MOV RAX, RDI                ; Copy this pointer to RAX return register
                RET                         ; All done ! Return