; void *memcpy(void *dest, const void *src, size_t n)
; Copies n bytes from memory area src to memory area dest.
; Returns a pointer to dest.

BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section

GLOBAL memcpy                           ; Export 'memcpy'

memcpy:
            XOR RCX, RCX                ; Set counter to 0
            JMP loop                    ; Jump to loop label

quit:
            MOV RAX, RDI                ; Move first parameter to register return value
            RET                         ; All done ! Return

increment:
            INC RCX                     ; Increment counter

loop:
            CMP RCX, RDX                ; Compare counter with third parameter
            JE quit                     ; Quit the loop
            MOV R11B, BYTE [RSI + RCX]  ; Move current source character to temporary register
            MOV BYTE [RDI + RCX], R11B  ; Move temporary content register to destination index
            JMP increment               ; Jump to increment label
