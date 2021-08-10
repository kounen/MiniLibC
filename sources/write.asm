; ssize_t write(int fd, const void *buf, size_t count)
; Writes up to count bytes from the buffer starting at buf to the file referred to by fd.
; On success, the number of bytes written is returned.
; On error, -1 is returned.

BITS 64                         ; 64-bit mode

SECTION .text                   ; Code section

GLOBAL write                    ; Export 'write'

write:
        MOV RAX, 0x01           ; 0x01 = Syscall number for write function
        SYSCALL
        RET