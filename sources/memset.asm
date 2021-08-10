; void *memset(void *s, int c, size_t n)
; Fills the first n bytes of the memory area pointed to by s with the constant byte c.
; Returns a pointer to the memory area s.

BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section

GLOBAL memset                           ; Export 'memset'

memset:
            XOR RCX, RCX                ; Set counter to 0
            MOV RAX, RDI                ; Move first parameter to register return value
            JMP loop                    ; Jump to loop label

quit:
            RET                         ; All done ! Return

increment:
            INC RCX                     ; Increment counter

loop:
            CMP RCX, RDX                ; Compare counter with third parameter
            JE quit                     ; Quit the loop
            MOV BYTE [RAX + RCX], SIL   ; Compare current character with parameter character
            JMP increment               ; Jump to increment label