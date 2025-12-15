

.ReadKeyboard
  lda #$00
  sta keysthisframe 
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
  rol keysthisframe
  bcc TestEndKeyboardWrite
  .NoKeyBoardWrite
  clc 
  rol keysthisframe
  .TestEndKeyboardWrite
  dey
  bpl ReadKeyboardLoop
  ; at this point keysthisframe contains 8 bits, each representing whether a key was pressed
rts

.DoAction ; action in y
lda InputActionsHi, y 
pha
lda InputActionsLo, y 
pha
rts

.CheckKeyJustPressed
  sta scratch1
  ; key in a 
  ; if !oldkey && newkey then key just pressed
  lda keyslastframe 
  and scratch1
  bne No
  lda keysthisframe
  and scratch1 
  beq No
  lda #$01
  rts
  .No
  lda #$00
  rts
.CheckKeyReleased
  ; key in a 
  ; if oldkey && !newkey then key just released
  sta scratch1
  lda #$f0
  sta KeyCheckerSmoc1
  lda #$d0
  sta KeyCheckerSmoc2
  bmi KeyCheckerSmoc

.CheckKeyHeld
  ; key in a 
  ; if oldkey && newkey then key just pressed
  sta scratch1
  lda #$f0
  sta KeyCheckerSmoc1
  sta KeyCheckerSmoc2
  ;allow to fall through
.KeyCheckerSmoc
  lda keyslastframe 
  and scratch1
  .KeyCheckerSmoc1
  beq NoKeyPressed
  lda keysthisframe
  and scratch1 
  .KeyCheckerSmoc2
  beq NoKeyPressed
  lda #$01
rts

.CheckKeyPressed
;key in a 
  and keysthisframe
  beq NoKeyPressed
  lda #$01
  rts 
.NoKeyPressed
  lda #$00
rts



; Called at the end of the frame
.CleanUpInput
  lda keysthisframe 
  sta keyslastframe
rts
