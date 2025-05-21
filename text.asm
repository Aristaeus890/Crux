;text

.PrintString
  tya
  pha
  txa 
  pha
  jsr DrawTextBox
  pla 
  tax
  pla 
  tay

  lda #28 ; define box
  jsr oswrch
  lda #7 ;lower left x
  jsr oswrch
  lda #28 ;lower left y 
  jsr oswrch
  lda #32 ;upper right x
  jsr oswrch
  lda #3 ;upper right y
  jsr oswrch

  lda StringListLo, y 
  sta readpointer
  lda StringListHi, y
  sta readpointer+1

  ldy #00
  .PrintLoop
  lda (readpointer), y 
  beq EndPrintString
  bpl NoSpecialCharacter ;load a dictionary string
  jsr ProcessDictionaryString
  equb BITSKIP2
  .NoSpecialCharacter
  jsr osasci
  iny 
  cpy scratch1
  bne PrintLoop 
  .EndPrintString
  jsr CopyBufferToBuffer
rts


.ProcessDictionaryString
  and #%01111111
  tax 
  lda DictionaryListLo, x 
  sta readpointer2
  lda DictionaryListHi, x 
  sta readpointer2+1
  tya 
  pha 
  ldy #00
  .ProcessDictionaryStringLoop
  lda (readpointer2), y 
  beq ProcessDictionaryStringEnd
  jsr osasci
  iny 
  cpy scratch2
  bne ProcessDictionaryStringLoop
  .ProcessDictionaryStringEnd
  pla 
  tay
  rts

.PrintDeath
  jsr prng
  and #%00011111
  tay
  jsr PrintString
rts

.AddTank
  ; Add 10 to the countdown timer, clamp to 30, branch to update UI
	inc ETank+1
	lda ETank+1
	cmp #3
	bcc ContinueUpdate
	lda #3
	sta ETank+1
	lda #0
	sta ETank
  beq ContinueUpdate ;always branch to update ui

.UpdateUi
  lda framecounter
  beq ContinueUpdate
  rts
  .ContinueUpdate
  ;set cursor position
  lda #$1f
  jsr oswrch
  lda #1
  jsr oswrch
  lda #5
  jsr oswrch

  ldx #1
  .DrawTimerLoop
  lda ETank, x 
  clc 
  adc #48
  jsr osasci
  dex 
  bpl DrawTimerLoop
rts

.PrintMapPosition
  ; define textbox
  lda #28 ; define box
  jsr oswrch
  lda #0 ;x lower left
  jsr oswrch
  lda #20 ;y lower left
  jsr oswrch
  lda #3 ;x upper left
  jsr oswrch
  lda #0 ; y upper left
  jsr oswrch
  lda #$1e ; reset cursor to top left
  jsr oswrch

  .CheckUiXpos
  lda uiflags
  lsr a 
  bcc CheckUiYpos
  .DrawUiXpos
  pha
  lda #88
  jsr osasci
  lda #58
  jsr osasci
  ldx mapposx
  lda BinaryToDecimalLo, x 
  jsr osasci
  lda BinaryToDecimalHi, x 
  jsr osasci
  pla
  .CheckUiYpos
  lsr a 
  bcc EndDrawUi
  .DrawUiYpos
  lda #89
  jsr osasci
  lda #58
  jsr osasci
  ldx mapposy
  lda BinaryToDecimalLo, x 
  jsr osasci
  lda BinaryToDecimalHi, x 
  jsr osasci

  lda #$0a
  jsr osasci
  ldx #7
  .EtankLoop
  txa 
  pha 
  lda Etank, x 
  jsr osasci
  pla 
  tax 
  dex
  bpl EtankLoop 
  .EndDrawUi
  jmp CopySideStripToOtherBuffer
;tailcall
  
.Etank
  equs "knaT -E "

.DrawTextBox
;top
  lda #$5a
  sta DrawBar+4
  lda #$be
  sta DrawBar+3
  ldy #25
  jsr DrawBar

  lda #$7c
  sta DrawBar+4
  lda #$78
  sta DrawBar+3
  ldy #25
  jsr DrawBar

  lda #%00000001
  sta DrawVBar+1
  sta DrawVBar+11
  lda #$5b
  sta DrawVBar+6
  lda #$f0
  sta DrawVBar+5
  ldy #25
  jsr DrawVBar

  lda #%10000000
  sta DrawVBar+1
  sta DrawVBar+11
  lda #$5c
  sta DrawVBar+6
  lda #$c8
  sta DrawVBar+5
  ldy #25
  jsr DrawVBar
  jsr CopyBufferToBuffer
rts

.DrawVBar
  lda #%00000001
  ldx #7
  .DrawVBarInner
  sta $5ab6, x
  lda DrawVBar+1
  eor #%00000001
  sta DrawVBar+1
  dex 
  bpl DrawVBarInner
  lda DrawVBar+5
  clc 
  adc #$40
  sta DrawVBar+5
  lda DrawVBar+6
  adc #1
  sta DrawVBar+6
  dey 
  bpl DrawVBar 
rts

.DrawBar
  lda #%10101010 
  sta $5ab6
  lda DrawBar+3
  clc 
  adc #8
  sta DrawBar+3
  lda DrawBar+4
  adc #0
  sta DrawBar+4
  dey 
  bpl DrawBar
rts





