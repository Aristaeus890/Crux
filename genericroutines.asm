


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
    ldy #%00011000
    lda viewmem
    beq setbuffertomem1
    ldy #4
    .setbuffertomem1
    jmp SetBufferMem

.FlipBuffer2
    lda SCREENADDRESS2HI
    sta currentbuffer+1
    lda #$00
    sta currentbuffer    

    ldy #%00101100
    lda viewmem
    beq setbuffertomem2
    ldy #4
    .setbuffertomem2
    ;allow to fall through

.SetBufferMem
    lda #$97
    ldx #$03
    jsr osbyte
    lda bufferflag
    eor #$01
    sta bufferflag
rts
; prng
;
; Returns a random 8-bit number in A (0-255), clobbers Y (0).
;
; Requires a 2-byte value on the zero page called "seed".
; Initialize seed to any value except 0 before the first call to prng.
; (A seed value of 0 will cause prng to always return 0.)
;
; This is a 16-bit Galois linear feedback shift register with polynomial $0039.
; The sequence of numbers it generates will repeat after 65535 calls.
;
; Execution time is an average of 125 cycles (excluding jsr and rts)

;   https://www.nesdev.org/wiki/Random_number_generator
.prng:
	ldy #8     ; iteration count (generates 8 bits)
	lda seed+0
.prng1
	asl a    ; shift the register
	rol seed+1
	bcc prng2
	eor #$39   ; apply XOR feedback whenever a 1 bit is shifted out
.prng2
	dey
	bne prng1
	sta seed+0
	cmp #0     ; reload flags
rts

.CalcMapPosIndex
    ;fetches a pointer to the screen data for the current x/y screen and puts it in readpointer1
    ;destroys a/x
    ;map width = 16x16
    ;map index = ypos * mapwidth + xpos

    lda mapposy
    jsr Mult16
    clc 
    adc mapposx
    tax 
    lda MetaColumnMap, x 
    tax 
    lda MapListLo, x 
    sta readpointer
    lda MapListHi, x 
    sta readpointer+1
rts

.Div16
    lsr a 
    lsr a 
    lsr a 
    lsr a
rts

.Mult16
    asl a 
    asl a 
    asl a 
    asl a
rts

.GetMultipleOf8
    tay 
    lda Mult8Table, y 
rts

.Mult8
    asl a 
    asl a 
    asl a
rts

.CorruptTile
    lda #$00
    sta scratch1

    jsr prng
    and #$01
    clc 
    adc #$09

    sta scratch2

    jsr prng 
    tay 
    eor (scratch1), y
    sta (scratch1), y 
    jsr prng
rts

.ReverseBitOrder
  sta temp

  lsr temp
  rol a
  lsr temp
  rol a
  lsr temp
  rol a
  lsr temp
  rol a

  lsr temp
  rol a
  lsr temp
  rol a
  lsr temp
  rol a
  lsr temp
  rol a
rts

; .WasteFrames ; burns frames = to y 
;     ; returns undefined registers and 0 in y
;     tya 
;     pha 
;     lda #19:jsr osbyte ; wait for vsync
;     dey 
;     bpl WasteFrames
; rts

; Self Modified Code Blocks
.SmocWrite256
    ; overwrite 256 sequential bytes with value of a
    sta $0000, y 
    iny 
    bne SmocWrite256
rts

.SMOCReadWrite256
;10 bytes
    ;load/store 256 bytes from one abs adress to another
    lda $0000, y ;0,1,2
    sta $0000, y ;3,4,5
    iny
    bne SMOCReadWrite256
rts

.SMOCReadWriteVariableLoop
;10 bytes
    ;load store a variable number of sequential bytes from an address to another
    lda $0000, y 
    sta $0000, y 
    dey
    bne SMOCReadWriteVariableLoop
rts


.CopySideStripToOtherBuffer
    lda #00
    ldx #30

    sta SMOCReadWriteVariableLoop+1
    sta SMOCReadWriteVariableLoop+4
    lda #$58
    sta SMOCReadWriteVariableLoop+2
    lda #$30
    sta SMOCReadWriteVariableLoop+5
    .CopySideStripToOtherBufferLoop
    ldy #31
    jsr SMOCReadWriteVariableLoop
    lda SMOCReadWriteVariableLoop+1
    clc 
    adc #$40
    sta SMOCReadWriteVariableLoop+1
    sta SMOCReadWriteVariableLoop+4
    lda SMOCReadWriteVariableLoop+2
    adc #1
    sta SMOCReadWriteVariableLoop+2
    sec 
    sbc #$28
    sta SMOCReadWriteVariableLoop+5
    ldy #31
    jsr SMOCReadWriteVariableLoop
    dex 
    bne CopySideStripToOtherBufferLoop
    .EndCopySideStripToOtherBuffer
rts


.DistanceTo ; entity 1 in x, entity 2 in y
    lda entitiesxpos, x 
    sec 
    sbc entitiesxpos, y 
    bcs NoDistXUnderflow
    eor #%11111111
    .NoDistXUnderflow
    sta scratch1
rts

.Reset
    lda #$01
    sta bufferflag
    ldx #$ff
    txs 
    jmp mainloop