; int strcasecmp(const char *s1, const char *s2);
; Compares the two strings s1 and s2, ignoring the case of the characters.
; Returns < 0 : the first character that does not match has a lower value in s1 than in s2.
; Returns 0 : the contents of both strings are equal.
; Returns > 0 : the first character that does not match has a greater value in s1 than in s2.

BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section

GLOBAL strcasecmp                       ; Export 'strcasecmp'

strcasecmp:
            XOR RCX, RCX                ; Set counter to 0
            JMP loop                    ; Jump to loop label

increment:
            CMP R11B, 0x00              ; Compare s1[counter] with '\0'
            JE quit                     ; Jump to quit label if s1[counter] is equal to '\0'
            INC RCX                     ; Increment counter and continue to loop
            
loop:
            MOV R11B, BYTE [RDI + RCX]  ; Copy into r11b s1 current character
            MOV R12B, BYTE [RSI + RCX]  ; Copy into r12b s2 current character
            CMP R11B, 'A'               ; Compare s1[counter] with 'A'
            JB check_s2                 ; If s1[counter] < 'A', s1[counter] is not alpha so check s2[counter]
            CMP R11B, 'Z'               ; Compare s1[counter] with 'Z'
            JA check_s2                 ; If s1[counter] > 'Z', s1[counter] is not ALPHA so check s2[counter]
            ADD R11B, 32                ; Else s1[counter] is ALPHA, so lowercase it to alpha and go to check_s2 label

check_s2:
            CMP R12B, 'A'               ; Compare s2[counter] with 'A'
            JB compare                  ; If s2[counter] < 'A', s2[counter] is not alpha so jump to compare label
            CMP R12B, 'Z'               ; Compare s2[counter] with 'Z'
            JA compare                  ; If s2[counter] > 'Z', s2[counter] is not ALPHA so jump to compare label
            ADD R12B, 32                ; Else s2[counter] is ALPHA, so lowercase it to alpha and go to compare label

compare:
            CMP R11B, R12B              ; Compare s1[counter] and s2[counter]
            JE increment                ; If equal jump to increment label else go to quit label

quit:       
            SUB R11B, R12B              ; Substract s1 current character with s2 current character
            MOVSX EAX, R11B             ; Copy the result in register return value
            RET                         ; All done ! Return