;text

.FindStringForWorldLocation
  lda mapposy
  jsr Mult16
  clc 
  adc mapposx
  tax 
  lda MetaColumnMap, x 
  ldy #$ff
  .FindStringLoop
  iny
  cmp TextWorldLocations, y
  bne FindStringLoop
  .EndFindStringLoop
  lda TextWorldStrings, y 
rts

; TextWorldLocations

.PrintString
  ;string id in Y

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
  beq FinishSpecialCharacter
  ; equb BITSKIP2
  .NoSpecialCharacter
  jsr osasci
  .FinishSpecialCharacter
  iny 
  ; cpy scratch1
  ; bne PrintLoop 
  jmp PrintLoop
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

.AddTankGradual
  lda framecounter
  and #%00001000 
  beq ContinueGradualAdd
  rts
  .ContinueGradualAdd
  inc ETank
  lda ETank
  cmp #11
  bne ContinueUpdate


.AddTank
  ; Add 10 to the countdown timer, clamp to 30, branch to update UI
	inc ETank+1
  .TankOverFlowCheck
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
