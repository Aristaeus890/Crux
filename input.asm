

.InitKeys
  lda #$01
  sta aaction
  lda #$02
  sta daction
  lda #$03
  sta waction
  lda #$00
  sta saction
rts

.DoAction ; action in y
;w = 0, a = 1, s = 2, d = 3
;use action as an index in a jump table telling us what to do (e.g. jump)
lda InputActionsLo, y 
sta jumppointer
lda InputActionsHi, y 
sta jumppointer+1
jsr JumpToPointerRoutine
rts

.ReadKeyboard
  ; read keyboard
  ; 8 bytes are read into keys
  lda #$00:sta keys ; zero out keys from last frame
  .WCheck
  lda #$21:eor #$80:tax:lda #$79:jsr osbyte ; check for W key with OScommand
  txa 
  bpl EndWCheck ; if we loaded 0, w was not pressed, so we can skip
  lda #%00000001
  sta keys ; for first byte we don't need to ora, as we know keys == 0
  .EndWCheck

  .SCheck
  lda #$51:eor #$80:tax:lda #$79:jsr osbyte ; check for W key with OScommand
  txa 
  bpl EndSCheck
  lda #%00000010
  ora keys ;ora to preserve input of other keys
  sta keys
  .EndSCheck

  .ACheck
  lda #$41:eor #$80:tax:lda #$79:jsr osbyte ; check for W key with OScommand
  txa 
  bpl EndACheck
  lda #%00000100
  ora keys
  sta keys
  .EndACheck

  .DCheck
  lda #$32:eor #$80:tax:lda #$79:jsr osbyte ; check for W key with OScommand
  txa 
  bpl EndDCheck
  lda #%00001000
  ora keys
  sta keys
  .EndDCheck

  .KCheck
  lda #$46:eor #$80:tax:lda #$79:jsr osbyte ; check for W key with OScommand
  txa 
  bpl EndKCheck
  lda #%00010000
  ora keys
  sta keys
  .EndKCheck

  .LCheck
  lda #$56:eor #$80:tax:lda #$79:jsr osbyte ; check for W key with OScommand
  txa 
  bpl EndLCheck
  lda #%00100000
  ora keys
  sta keys
  .EndLCheck

rts


.CheckW
  lda keys
  and #%00000001 ; we set the lowest bit if w was pressed in read keys
  beq CheckWRelease ; if 1 is not set, we need to check if it was set last frame, if so, it was released this frame
  lda keysflag ; 
  ora #$01
  sta keysflag
  lda #$01 ; return 1 to show it was pressed 
  rts

  .CheckWRelease
    lda keysflag
    and #$01
    beq EndCheckW
    lda keysflag
    eor #$01
    sta keysflag
    lda #$02
    rts
.EndCheckW
lda #$00
rts

.CheckS
  lda keys
  and #%00000010
  beq CheckSRelease
  lda keysflag
  ora #$02
  sta keysflag
  lda #$01
  rts

  .CheckSRelease
    lda keysflag
    and #$02
    beq EndCheckS
    lda keysflag
    eor #$02
    sta keysflag
    lda #$02
    rts
.EndCheckS
lda #$00
rts

.CheckA
  lda keys
  and #%00000100
  beq CheckARelease
  lda keysflag
  ora #$04
  sta keysflag
  lda #$01
  rts

  .CheckARelease
    lda keysflag
    and #$04
    beq EndCheckA
    lda keysflag
    eor #$04
    sta keysflag
    lda #$02
    rts
.EndCheckA
lda #$00
rts

.CheckD
  lda keys
  and #%00001000
  beq CheckDRelease
  lda keysflag
  ora #$08
  sta keysflag
  lda #$01
  rts

  .CheckDRelease
    lda keysflag
    and #$08
    beq EndCheckD
    lda keysflag
    eor #$08
    sta keysflag
    lda #$02
    rts
.EndCheckD
lda #$00
rts

.CheckK
  lda keys
  and #%00010000
  beq CheckKRelease
  lda keysflag
  ora #$10
  sta keysflag
  lda #$01
  rts

  .CheckKRelease
    lda keysflag
    and #$10
    beq EndCheckK
    lda keysflag
    eor #$10
    sta keysflag
    lda #$02
    rts
.EndCheckK
lda #$00
rts

.CheckL
  lda keys
  and #%00100000
  beq CheckLRelease
  lda keysflag
  ora #$20
  sta keysflag
  lda #$01
  rts

  .CheckLRelease
    lda keysflag
    and #$20
    beq EndCheckK
    lda keysflag
    eor #$20
    sta keysflag
    lda #$02
    rts
.EndCheckL
lda #$00
rts