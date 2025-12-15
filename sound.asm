

.PlaySound
  ;sound to play in y
  ;osword call returns undefined registers, so store them here
  txa 
  pha
  ; tya
  ; pha

  ; ldy variable1
  lda SoundListLo, y 
  tax
  ; sta scratch1
  lda SoundListHi, y 
  tay
  ; sta scratch2

  lda #OSWORDSOUND
  ; ldx scratch1
  ; ldy scratch2
  jsr osword

  ; pla 
  ; tay
  pla 
  tax
rts

