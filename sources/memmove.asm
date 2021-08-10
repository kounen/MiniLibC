; void *memmove(void *dest, const void *src, size_t n)
; Copies n bytes from memory area src to memory area dest.
; The memory areas may overlap : copying takes place as though the bytes 
;   in src are first copied into a temporary array that does not overlap src
;   or dest, and the bytes are then copied from the temporary array to dest.
; Returns a pointer to dest.

BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section

GLOBAL memmove                          ; Export 'memmove'

memmove:
            CMP RDX, 0x00               ; Compare third parameter with 0
            JE quit                     ; If equal jump to quit label
            XOR RCX, RCX                ; Set counter to 0
            JMP push_stack              ; Jump to push_stack label

quit:
            MOV RAX, RDI                ; Load into RAX return value register, destination pointer
            RET                         ; All done ! Return

increment:
            INC RCX                     ; Increment counter

push_stack:
            CMP RCX, RDX                ; Compare counter and third parameter
            JE pop_stack                ; If equal, we are at end of string source and so jump to pop_stack label
            MOVSX R11, BYTE [RSI + RCX] ; Else load into R11 register current source character
            push R11                    ; And pop this register to the top of the stack
            JMP increment               ; And to loop, jump to increment label

pop_stack:
            DEC RCX                     ; Decrement counter
            POP R11                     ; Get last source character
            MOV BYTE [RDI + RCX], R11B  ; Copy it at the end of destination ptr according to third parameter
            CMP RCX, 0x00               ; Compare counter to 0
            JE quit                     ; If counter is 0, jump to quit label
            JMP pop_stack               ; Else continue to pop the stack to copy every n source character to dest
