
    processor 6502
    seg Code           ; Define a new segment named "Code"
    org $F000          ; Define the origin of the ROM code at memory address $F000
Start:
    ldy #10

Loop:

    tya                ; Transfer Y to A
    sta $80,y          ; Store the value in A inside memory position $80+Y
    dey                ; Decrement Y
    bpl Loop           ; Branch back to "Loop" until we are done   

    org $FFFC          ; End the ROM by adding required values to memory position $FFFC
    .word Start        ; Put 2 bytes with the reset address at memory position $FFFC
    .word Start        ; Put 2 bytes with the break address at memory position $FFFE