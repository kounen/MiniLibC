; int isalpha(int c)
; Checks for an alphabetic character.
; Returns nonzero if the character c falls into the tested class, and 0 if not.

BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section

GLOBAL isalpha                          ; Export 'isalpha'

isalpha:
                    CMP EDI, 'A'
                    JB return_false
                    CMP EDI, 'Z'
                    JA check_lowercase
                    JMP return_true

check_lowercase:
                    CMP EDI, 'a'
                    JB return_false
                    CMP EDI, 'z'
                    JA return_false
                    JMP return_true

return_true:
                    MOV EAX, 1
                    RET

return_false:
                    MOV EAX, 0
                    RET