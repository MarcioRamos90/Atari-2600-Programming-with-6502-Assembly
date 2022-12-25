    processor 6502

    seg code
    org $F000           ; Define the code origin at $F000 (the initail of the cartdrige)

Start:
    sei                 ; Disable interrupts
    cld                 ; Disable the BCD decimal math mode
    ldx  #$FF           ; Loads the X register with #$FF
    txs                 ; Trafers X resgister to (S)tack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clean the Page Zero region ($00 to $FF)
; Meaning the entire RAM and also the entire TIA registers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda  #0             ; A = 0
    ldx  #$FF           ; X = #$FF
MemLoop:
    sta  $0,X           ; Store the value A inside memory address $0 + x
    dex                 ; X--
    bne  MemLoop        ; Branch if last instruction is not equal Zero (z-flag is set)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the ROM size to exacly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org  $FFFC
    .word Start         ; Reset vector at $FFFC (where the program starts) 
    .word Start         ; Interrrupt vector at $FFFE (unused in the VCS)