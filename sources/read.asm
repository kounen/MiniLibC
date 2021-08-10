; ssize_t read(int fd, void *buf, size_t count)
; Attempts to read up to count bytes from file descriptor fd into the buffer starting at buf.
; On success, the number of bytes read is returned (zero indicates end of file).
; On error, -1 is returned.

BITS 64                         ; 64-bit mode

SECTION .text                   ; Code section

GLOBAL read                     ; Export 'read'

read:
        MOV RAX, 0x00           ; 0x00 = Syscall number for read function
        SYSCALL
        RET