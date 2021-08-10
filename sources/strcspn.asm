; size_t strcspn(const char *s, const char *reject);
; Calculates the length of the initial segment of s which consists entirely of bytes not in reject.
; Returns the number of bytes in the initial segment of s which are not in the string reject.

BITS 64                                     ; 64-bit mode

SECTION .text                               ; Code section

GLOBAL strcspn                              ; Export 'strcspn'

strcspn:
                XOR RCX, RCX                ; Set s counter to 0
                JMP loop_s                  ; Loop into s

increment_s:
                INC RCX                     ; Increment s counter

loop_s:
                MOV R11B, BYTE [RDI + RCX]  ; Copy into R11B s[RCX]
                CMP R11B, 0x00              ; Compare it with '\0'
                JE quit                     ; If equals, none match between s and reject, so return s length
                XOR R13, R13                ; Set reject counter to 0 and loop into reject

loop_reject:
                MOV R12B, BYTE [RSI + R13]  ; Copy into R12B reject[R13]
                CMP R12B, 0x00              ; Compare it with '\0'
                JE increment_s              ; If equals, current s character doesn't match with any reject character. So continue with s next character
                CMP R11B, R12B              ; Compare s[RCX] with reject[R13]
                JE quit                     ; If equals, jump to quit label
                INC R13                     ; Else continue to check occurrence with other reject character
                JMP loop_reject             ; And loop for this after incrementing reject counter

quit:
                MOV RAX, RCX                ; Copy s counter to RAX return register
                RET                         ; All done ! Return