


.JumpToPointerRoutine:
    jmp (jumppointer)


.FlipScreenBuffer

    lda bufferflag
    bne FlipBuffer2

.FlipBuffer1
    lda SCREENADDRESS1HI
    sta currentbuffer+1
    lda #$00
    sta currentbuffer    

    lda #216
    and #%00111111
    tay
    lda #VIEWMEM
    beq setbuffertomem1
    ldy #4
    .setbuffertomem1

    ; ldy #4
    lda #$97
    ldx #$03
    jsr osbyte
    lda bufferflag
    eor #$01
    sta bufferflag
rts

.FlipBuffer2
    lda SCREENADDRESS2HI
    sta currentbuffer+1
    lda #$00
    sta currentbuffer    

    lda #236
    and #%00111111
    tay
    lda #VIEWMEM
    beq setbuffertomem2
    ldy #4
    .setbuffertomem2
    lda #$97
    ldx #$03
    jsr osbyte
    lda bufferflag
    eor #$01
    sta bufferflag
rts

