; int isdigit(int c)
; Checks for a digit (0 through 9).
; Returns nonzero if the character c falls into the tested class, and 0 if not.

BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section

GLOBAL isdigit                          ; Export 'isdigit'

isdigit:
                CMP EDI, '0'
                JB return_false
                CMP EDI, '9'
                JA return_false
                JMP return_true

return_true:
                MOV EAX, 1
                RET

return_false:
                MOV EAX, 0
                RET