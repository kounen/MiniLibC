; int toupper(int c)
; If c is a lowercase letter, toupper() returns its uppercase equivalent.
; Otherwise, it returns c.

BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section

GLOBAL toupper                          ; Export 'toupper'

toupper:
                    CMP EDI, 'a'
                    JB return_equivalent
                    CMP EDI, 'z'
                    JA return_equivalent
                    JMP return_uppercase


return_uppercase:
                    SUB EDI, 32
                    MOV EAX, EDI
                    RET

return_equivalent:
                    MOV EAX, EDI
                    RET