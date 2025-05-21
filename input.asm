

.DoAction ; action in y
;w = 0, a = 1, s = 2, d = 3
;use action as an index in a jump table telling us what to do on an action
lda InputActionsHi, y 
pha
lda InputActionsLo, y 
pha
rts

.KeysToRead
  equb %10100001;w
  equb %11010001;s
  equb %11000001;a
  equb %10110010;d
  equb %11000110;k
  equb %11010110;l
  equb %10110111;p
  equb %11001001;return


.ReadKeyboard
  lda #$00
  sta keys
  ldy #7
  .ReadKeyboardLoop
  sty temp ; os call destroys x/y
  ldx KeysToRead, y
  lda #$79
  jsr osbyte
  ldy temp
  txa 
  bpl NoKeyBoardWrite
  sec 
  rol keys
  bcc TestEndKeyboardWrite
  .NoKeyBoardWrite
  clc 
  rol keys
  .TestEndKeyboardWrite
  dey
  bpl ReadKeyboardLoop
rts


.CheckKey
  ;key to check in a 
  sta scratch8
  lda keys
  and scratch8
  beq CheckKeyRelease
  lda keysflag
  ora scratch8
  sta keysflag
  lda #$01
  rts

.CheckKeyRelease
    lda keysflag
    and scratch8
    beq EndCheckKey
    lda keysflag
    eor scratch8
    sta keysflag
    lda #$02
    rts
.EndCheckKey
lda #$00
rts

; .CheckW
;   lda keys
;   and #%00000001 ; we set the lowest bit if w was pressed in read keys
;   beq CheckWRelease ; if 1 is not set, we need to check if it was set last frame, if so, it was released this frame
;   lda keysflag ; 
;   ora #$01
;   sta keysflag
;   lda #$01 ; return 1 to show it was pressed 
;   rts

;   .CheckWRelease
;     lda keysflag
;     and #$01
;     beq EndCheckW
;     lda keysflag
;     eor #$01
;     sta keysflag
;     lda #$02
;     rts
; .EndCheckW
; lda #$00
; rts

; .CheckS
;   lda keys
;   and #%00000010
;   beq CheckSRelease
;   lda keysflag
;   ora #$02
;   sta keysflag
;   lda #$01
;   rts

;   .CheckSRelease
;     lda keysflag
;     and #$02
;     beq EndCheckS
;     lda keysflag
;     eor #$02
;     sta keysflag
;     lda #$02
;     rts
; .EndCheckS
; lda #$00
; rts

; .CheckA
;   lda keys
;   and #%00000100
;   beq CheckARelease
;   lda keysflag
;   ora #$04
;   sta keysflag
;   lda #$01
;   rts

;   .CheckARelease
;     lda keysflag
;     and #$04
;     beq EndCheckA
;     lda keysflag
;     eor #$04
;     sta keysflag
;     lda #$02
;     rts
; .EndCheckA
; lda #$00
; rts

; .CheckD
;   lda keys
;   and #%00001000
;   beq CheckDRelease
;   lda keysflag
;   ora #$08
;   sta keysflag
;   lda #$01
;   rts

;   .CheckDRelease
;     lda keysflag
;     and #$08
;     beq EndCheckD
;     lda keysflag
;     eor #$08
;     sta keysflag
;     lda #$02
;     rts
; .EndCheckD
; lda #$00
; rts

; .CheckK
;   lda keys
;   and #%00010000
;   beq CheckKRelease
;   lda keysflag
;   ora #$10
;   sta keysflag
;   lda #$01
;   rts

;   .CheckKRelease
;     lda keysflag
;     and #$10
;     beq EndCheckK
;     lda keysflag
;     eor #$10
;     sta keysflag
;     lda #$02
;     rts
; .EndCheckK
; lda #$00
; rts

; .CheckL
;   lda keys
;   and #%00100000
;   beq CheckLRelease
;   lda keysflag
;   ora #$20
;   sta keysflag
;   lda #$01
;   rts

;   .CheckLRelease
;     lda keysflag
;     and #$20
;     beq EndCheckK
;     lda keysflag
;     eor #$20
;     sta keysflag
;     lda #$02
;     rts
; .EndCheckL
; lda #$00
; rts

; .CheckP
;   lda keys
;   and #%01000000
;   beq CheckPRelease
;   lda keysflag
;   ora #$40
;   sta keysflag
;   lda #$01
;   rts

;   .CheckPRelease
;     lda keysflag
;     and #$40
;     beq EndCheckP
;     lda keysflag
;     eor #$40
;     sta keysflag
;     lda #$02
;     rts
; .EndCheckP
; lda #$00
; rts

; .CheckReturn
;   lda keys
;   and #%10000000
;   beq CheckReturnRelease
;   lda keysflag
;   ora #$80
;   sta keysflag
;   lda #$01
;   rts

;   .CheckReturnRelease
;     lda keysflag
;     and #$80
;     beq EndCheckReturn
;     lda keysflag
;     eor #$80
;     sta keysflag
;     lda #$02
;     rts
; .EndCheckReturn
; lda #$00
; rts