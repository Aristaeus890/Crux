; .CollideWithTileMap
;   ;v1/2 = x,y 
;   ;x = entity id
;   ;preserves x, v1/2

;   ;s1/2 = xleft,xright
;   ;s3/4 = ytop,ybot
;   ;s5/6 = tile space x/y
;   lda entitiesxpos, x 
;   clc 
;   adc #0
;   sta scratch1
;   clc 
;   adc #7
;   sta scratch2

;   lda entitiesypos, x 
;   sta scratch3
;   clc 
;   adc #$07
;   sta scratch4

;   ;indexing into tile array=
;   ; (tilespacey * arrayheight) + tilespacex

;   ;convert x/y into tile space

;   ; simply divide by 16 to convert xpos to tilespace
;   lda scratch1 ; xleft
;   lsr a 
;   lsr a 
;   lsr a 
;   lsr a 
;   sta scratch1

;   lda scratch2
;   lsr a 
;   lsr a 
;   lsr a 
;   lsr a
;   sta scratch2


;   ; we need to divide by 16 to convert to tile space
;   ; then multiply by the 2d array height as part of the process to get the final index ((tilespacey * arrayheight) + tilespacex)
;   ; as we know the 2d array is ALWAYS 16 high (1 screen), we are effectively dividing by 16 then multiplying by 16
;   ; this can be simplified to simply masking the bottom 4 bits to discard the remainder
;   lda scratch3
;   and #%11110000
;   sta scratch3

;   lda scratch4
;   and #%11110000
;   sta scratch4

;   ; the final step is to add back the xcomponent to get the index into the 2d array
;   lda scratch1
;   clc 
;   adc scratch3
;   sta scratch5

;   lda scratch2
;   clc 
;   adc scratch3
;   sta scratch6

;   lda scratch1
;   clc 
;   adc scratch4
;   sta scratch7

;   lda scratch2
;   clc 
;   adc scratch4
;   sta scratch8

;   ;we now have 4 indexes, 1 for each corner of the colliding object
;   ;if any of these read into a 1 in the map, we have a collision

;   lda #$00
;   sta scratch1
;   sta scratch2
;   sta scratch3
;   sta scratch4
;   sta temp

;   ldy scratch5
;   lda collisionmap, y
;   clc 
;   lsr a 
;   rol scratch1
;   lsr a 
;   rol scratch2
;   lsr a 
;   rol scratch3
;   lsr a 
;   rol scratch4

;   lda entitiesxpos, x 
;   and #%11111000
;   beq noxindexadd1
;     inc temp
;   .noxindexadd1
;   lda entitiesypos, x 
;   and #%00001000
;   beq noxindeyadd1
;     inc temp
;     inc temp
;   .noxindeyadd1

;   ldy temp
;   lda scratch1, y
;   sta scratch5
;   sta scratch9

;   ;;

;   lda #$00
;   sta scratch1
;   sta scratch2
;   sta scratch3
;   sta scratch4
;   sta temp

;   ldy scratch6
;   lda collisionmap, y
;   clc 
;   lsr a 
;   rol scratch1
;   lsr a 
;   rol scratch2
;   lsr a 
;   rol scratch3
;   lsr a 
;   rol scratch4

;   lda entitiesxpos, x 
;   and #%11111000
;   beq noxindexadd2
;     inc temp
;   .noxindexadd2
;   lda entitiesypos, x 
;   and #%00001000
;   beq noxindeyadd2
;     inc temp
;     inc temp
;   .noxindeyadd2

;   ldy temp
;   lda scratch1, y
;   sta scratch6
;   ora scratch9
;   sta scratch9

; ;;

;   lda #$00
;   sta scratch1
;   sta scratch2
;   sta scratch3
;   sta scratch4
;   sta temp

;   ldy scratch7
;   lda collisionmap, y
;   clc 
;   lsr a 
;   rol scratch1
;   lsr a 
;   rol scratch2
;   lsr a 
;   rol scratch3
;   lsr a 
;   rol scratch4

;   lda entitiesxpos, x 
;   and #%11111000
;   beq noxindexadd3
;     inc temp
;   .noxindexadd3
;   lda entitiesypos, x 
;   and #%00001000
;   beq noxindeyadd3
;     inc temp
;     inc temp
;   .noxindeyadd3

;   ldy temp
;   lda scratch1, y
;   sta scratch7
;   ora scratch9
;   sta scratch9

; ;;

;   lda #$00
;   sta scratch1
;   sta scratch2
;   sta scratch3
;   sta scratch4
;   sta temp

;   ldy scratch8
;   lda collisionmap, y
;   clc 
;   lsr a 
;   rol scratch1
;   lsr a 
;   rol scratch2
;   lsr a 
;   rol scratch3
;   lsr a 
;   rol scratch4

;   lda entitiesxpos, x 
;   and #%11111000
;   beq noxindexadd4
;     inc temp
;   .noxindexadd4
;   lda entitiesypos, x 
;   and #%00001000
;   beq noxindeyadd4
;     inc temp
;     inc temp
;   .noxindeyadd4

;   ldy temp
;   lda scratch1, y
;   sta scratch8
;   ora scratch9
;   sta scratch9

;   ; ldy scratch8
;   ; lda collisionmap, y 
;   ; sta scratch8
;   ; ora scratch9
;   ; sta scratch9

;   lda scratch9
; rts

.CollideWithTileMap
  ;v1/2 = x,y 
  ;x = entity id
  ;preserves x, v1/2

  ;s1/2 = xleft,xright
  ;s3/4 = ytop,ybot
  ;s5/6 = tile space x/y
  lda entitiesxpos, x 
  clc 
  adc #0
  sta scratch1
  clc 
  adc #7
  sta scratch2

  lda entitiesypos, x 
  sta scratch3
  clc 
  adc #$07
  sta scratch4

  ;indexing into tile array=
  ; (tilespacey * arrayheight) + tilespacex

  ;convert x/y into tile space

  ; simply divide by 16 to convert xpos to tilespace
  lda scratch1 ; xleft
  lsr a 
  lsr a 
  lsr a 
  lsr a 
  sta scratch1

  lda scratch2
  lsr a 
  lsr a 
  lsr a 
  lsr a
  sta scratch2


  ; we need to divide by 16 to convert to tile space
  ; then multiply by the 2d array height as part of the process to get the final index ((tilespacey * arrayheight) + tilespacex)
  ; as we know the 2d array is ALWAYS 16 high (1 screen), we are effectively dividing by 16 then multiplying by 16
  ; this can be simplified to simply masking the bottom 4 bits to discard the remainder
  lda scratch3
  and #%11110000
  sta scratch3

  lda scratch4
  and #%11110000
  sta scratch4

  ; the final step is to add back the xcomponent on each point to get the index into the 2d array
  lda scratch1
  clc 
  adc scratch3
  sta scratch5

  lda scratch2
  clc 
  adc scratch3
  sta scratch6

  lda scratch1
  clc 
  adc scratch4
  sta scratch7

  lda scratch2
  clc 
  adc scratch4
  sta scratch8

  ;we now have 4 indexes, 1 for each corner of the colliding object
  ;if any of these read into a 1 in the map, we have a collision
  ldy scratch5
  lda collisionmap, y
  sta scratch5
  sta scratch9

  ldy scratch6
  lda collisionmap, y 
  sta scratch6
  ora scratch9
  sta scratch9

  ldy scratch7
  lda collisionmap, y 
  sta scratch7
  ora scratch9
  sta scratch9

  ldy scratch8
  lda collisionmap, y 
  sta scratch8
  ora scratch9
  sta scratch9

  lda scratch9
rts


.SpriteCollide
  stx currententity
  lda entitiesxpos, x 
  sta scratch1 ;left 
  clc 
  adc #$07
  sta scratch2 ;right 
  lda entitiesypos, x 
  sta scratch3 ;up
  clc
  adc #$07
  sta scratch4 ; down

  lda #$00
  tax 
  tay

  ; if any one sprite lies between these 4 points, there is an overlap
  .SpriteCollideLoop
  lda entitiestype, x 
  beq SpriteCollideNextSprite ; if no entity, skip
  cpx currententity
  beq SpriteCollideNextSprite ; don't allow collision with ourselves
  ;prepare collision test data 
  lda entitiesxpos, x 
  sta scratch5
  clc 
  adc #$07
  sta scratch6
  lda entitiesypos, x 
  sta scratch7
  clc
  adc #$07
  sta scratch8
  ;comparisons
  lda scratch1
  cmp scratch6
  bcs SpriteCollideNextSprite ; left to right
  lda scratch2
  cmp scratch5
  bcc SpriteCollideNextSprite ;right to left
  lda scratch3
  cmp scratch8
  bcs SpriteCollideNextSprite
  lda scratch4
  cmp scratch7
  bcc SpriteCollideNextSprite
  stx scratch1
  ldx currententity
  lda #$01
  rts

  .SpriteCollideNextSprite
    inx 
    cpx #NUMENTITIES
    beq SpriteCollideLoop
    lda #$00
rts

.LoadCollisionData
  
  lda mapposy
  asl a 
  asl a 
  asl a 
  asl a
  clc 
  adc mapposx
  tax 
  lda MetaColumnMap, x 
  ;use map byte to index into the list of screens
  tax 
  lda MapListLo, x 
  sta readpointer
  lda MapListHi, x 
  sta readpointer+1
  lda #$00
  tax 
  tay 
  stx extraloopcounter1
  stx extraloopcounter2

  .LoadCollisionDataLoop
    lda extraloopcounter1
    asl a 
    asl a 
    asl a 
    asl a
    clc 
    adc extraloopcounter2
    tax 
    ldy extraloopcounter2
    ;get metatile
    lda (readpointer), y
    tay 
    lda MetaColumnListLo, y 
    sta readpointer2
    lda MetaColumnListHi, y 
    sta readpointer2+1
    ldy extraloopcounter1
    lda (readpointer2), y

    sta collisionmap, x 

    ldx extraloopcounter1
    inx
    stx extraloopcounter1
    cpx #NUMMETAROWS
    beq onecollidercolumnwritten
    jmp LoadCollisionDataLoop
    .onecollidercolumnwritten


    ldx extraloopcounter2
    inx
    stx extraloopcounter2
    cpx #NUMMETACOLUMNS
    beq allcollidercolumnwritten
    lda #00
    sta extraloopcounter1
    jmp LoadCollisionDataLoop
    .allcollidercolumnwritten
rts
; align &100

; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10010010
; equb %10111010
; equb %01000100

; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %11111110
; equb %10000010
; equb %10000010
; equb %10000010

; equb %11111110
; equb %10000000
; equb %10000000
; equb %10000000
; equb %11111100
; equb %10000000
; equb %10000000
; equb %11111110

; equb %11111110
; equb %10000010
; equb %10000010
; equb %11111110
; equb %11000000
; equb %10100000
; equb %10010000
; equb %10001110

; equb %11111110
; equb %10000000
; equb %10000000
; equb %10000000
; equb %11111100
; equb %10000000
; equb %10000000
; equb %11111110

; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000

; equb %11111110
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %11111110

; equb %11111110
; equb %10000000
; equb %10000000
; equb %10000000
; equb %11111110
; equb %00000010
; equb %00000010
; equb %11111110

; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000

; equb %00010000
; equb %00101000
; equb %01000100
; equb %10000010
; equb %11111110
; equb %10000010
; equb %10000010
; equb %10000010

; equb %10000000
; equb %10000000
; equb %10000000
; equb %10000000
; equb %10000000
; equb %10000000
; equb %10000000
; equb %11111110

; equb %10000000
; equb %10000000
; equb %10000000
; equb %10000000
; equb %10000000
; equb %10000000
; equb %10000000
; equb %11111110

; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000

; equb %11111110
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000

; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %11111110
; equb %10000010
; equb %10000010
; equb %10000010

; equb %11111110
; equb %10000000
; equb %10000000
; equb %10000000
; equb %11111100
; equb %10000000
; equb %10000000
; equb %11111110

; equb %11111110
; equb %10000000
; equb %10000000
; equb %10000000
; equb %10001110
; equb %10000100
; equb %10000100
; equb %11111100

; equb %11111110
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %11111110

; equb %11111110
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %11111110

; equb %11111100
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %11111100

; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000

; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10010010
; equb %10111010
; equb %01000100


; equb %11111110
; equb %10000010
; equb %10000010
; equb %11111110
; equb %11000000
; equb %10100000
; equb %10010000
; equb %10001110


; equb %11111110
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %11111110


; equb %11111110
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000

; equb %11111110
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %11111110

; equb %10000010
; equb %11000010
; equb %10100010
; equb %10010010
; equb %10011010
; equb %10001010
; equb %10000110
; equb %10000010

; equb %11111110
; equb %10000000
; equb %10000000
; equb %10000000
; equb %10001110
; equb %10000100
; equb %10000100
; equb %11111100

; equb %00010000
; equb %00101000
; equb %01000100
; equb %10000010
; equb %11111110
; equb %10000010
; equb %10000010
; equb %10000010

; equb %11111100
; equb %10000010
; equb %10000010
; equb %10000010
; equb %11111110
; equb %10000010
; equb %10000010
; equb %11111100

; equb %11111110
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %11111110

; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %11111110

; equb %11111110
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000
; equb %00010000

; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000
; equb %00000000

; equb %11111110
; equb %10000000
; equb %10000000
; equb %10000000
; equb %10001110
; equb %10000100
; equb %10000100
; equb %11111100

; equb %00010000
; equb %00101000
; equb %01000100
; equb %10000010
; equb %11111110
; equb %10000010
; equb %10000010
; equb %10000010

; equb %01111100
; equb %10010010
; equb %10010010
; equb %10010010
; equb %10000010
; equb %10000010
; equb %10000010
; equb %10000010

; equb %11111110
; equb %10000000
; equb %10000000
; equb %10000000
; equb %11111000
; equb %10000000
; equb %10000000
; equb %11111110

; equb %11111110
; equb %10000000
; equb %10000000
; equb %10000000
; equb %11111110
; equb %00000010
; equb %00000010
; equb %11111110