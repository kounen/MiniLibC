; int tolower(int c)
; If c is an uppercase letter, tolower() returns its lowercase equivalent.
; Otherwise, it returns c.

BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section

GLOBAL tolower                          ; Export 'tolower'

tolower:
                    CMP EDI, 'A'
                    JB return_equivalent
                    CMP EDI, 'Z'
                    JA return_equivalent
                    JMP return_lowercase


return_lowercase:
                    ADD EDI, 32
                    MOV EAX, EDI
                    RET

return_equivalent:
                    MOV EAX, EDI
                    RET