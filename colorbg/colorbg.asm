    processor 6502

    include "vcs.h"
    include "macro.h"

    seg code
    org $F000           ; defines the ROM origin

START:
    CLEAN_START         ; Macro to safely clean the macro


    ; Set background color to yellow
    
    lda #$1E            ; Load colorinto A (#$1E is an NTSC yellow)
    sta COLUBK          ; Store A to Background color Address $09

    jmp START           ; Repeat from start

    ; Fill ROM size to exacly 4KB

    org $FFFC           ; define otigin to $FFFC
    .word START         ; Reset vector at $FFFC (where th program starts)
    .word START         ; Interrupt vector at $FFFE (unused in the VCS)
