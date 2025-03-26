

.ReloadScreen
  jsr DrawMetaColumns
  jsr LoadCollisionData
rts

.DrawMetaColumns
  lda mapposy
  asl a 
  asl a
  asl a
  asl a
  clc 
  adc mapposx
  tax 
  lda MetaColumnMap, x 
  tax 
  lda MapListLo, x 
  sta readpointer
  lda MapListHi, x 
  sta readpointer+1


  lda #$00
  tay
  tax
  sta extraloopcounter1
  sta extraloopcounter2


  .InitNewMetaColumn
    lda #$58
    sta drawaddress+1
    lda #32
    sta drawaddress
    ldx extraloopcounter2
    lda Mult20, x
    clc 
    adc drawaddress
    sta drawaddress
    lda drawaddress+1
    adc #0
    sta drawaddress+1
    jsr TransferDrawAddress
  .DrawMetaColumnLoop
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
    tay 
    lda MetaTileListLo, y 
    sta readpointer2
    lda MetaTileListHi, y 
    sta readpointer2+1

    ldy #$03
    .unpackmetatileloop
    lda (readpointer2),y 
    sta scratch1, y 
    dey
    bpl unpackmetatileloop

    ldy scratch1
    lda TilePatternsLo, y 
    sta readpointer2
    lda TilePatternsHi, y 
    sta readpointer2+1

    ldy #7
    .MetaTileLp1
    lda (readpointer2), y 
    sta (drawaddress), y 
    sta (drawaddress2), y 
    dey 
    bpl MetaTileLp1


    jsr MoveDrawAddress1BlockRight

    jsr TransferDrawAddress

;;;
    ldy scratch2
    lda TilePatternsLo, y 
    sta readpointer2
    lda TilePatternsHi, y 
    sta readpointer2+1

    ldy #7
    .MetaTileLp2
    lda (readpointer2), y 
    sta (drawaddress), y 
    sta (drawaddress2), y 
    dey 
    bpl MetaTileLp2

    lda drawaddress
    clc 
    adc #$38
    sta drawaddress
    lda drawaddress+1
    adc #1
    sta drawaddress+1
    ; inc drawaddress+1

    jsr TransferDrawAddress

;;;;
    ldy scratch3
    lda TilePatternsLo, y 
    sta readpointer2
    lda TilePatternsHi, y 
    sta readpointer2+1

    ldy #7
    .MetaTileLp3
    lda (readpointer2), y 
    sta (drawaddress), y 
    sta (drawaddress2), y 
    dey 
    bpl MetaTileLp3

    jsr MoveDrawAddress1BlockRight

    jsr TransferDrawAddress
;;;;;
    ldy scratch4
    lda TilePatternsLo, y 
    sta readpointer2
    lda TilePatternsHi, y 
    sta readpointer2+1

    ldy #7
    .MetaTileLp4
    lda (readpointer2), y 
    sta (drawaddress), y 
    sta (drawaddress2), y 
    dey 
    bpl MetaTileLp4

    lda drawaddress
    clc 
    adc #$38
    sta drawaddress
    lda drawaddress+1
    adc #1
    sta drawaddress+1

    jsr TransferDrawAddress

    ldx extraloopcounter1
    inx
    stx extraloopcounter1
    cpx #NUMMETAROWS
    beq onecolumndrawn
    jmp DrawMetaColumnLoop
    .onecolumndrawn


    ldx extraloopcounter2
    inx
    stx extraloopcounter2
    cpx #NUMMETACOLUMNS
    beq allcolumnsdrawn
    lda #00
    sta extraloopcounter1
    jmp InitNewMetaColumn
    .allcolumnsdrawn

rts

.CalculateDrawOffset
  ; ((y/8) * 256) + ((y/8) * 64) + 32 + buffer address
  lda #32
  sta drawaddress

  ;mult y/8 by 256
  lda variable2
  lsr a 
  lsr a 
  lsr a
  sta drawaddress+1 ;storing in hibyte == x255

  ; mult y/8 by 64 w/lookup
  ; pla
  tax 
  lda CalcM64lo, x  
  adc drawaddress
  sta drawaddress

  lda drawaddress+1
  adc #0
  sta drawaddress+1

  lda CalcM64hi, x
  adc drawaddress+1
  sta drawaddress+1

; add x component 

  lda variable1
  and #%11111000
  adc drawaddress
  sta drawaddress
  lda drawaddress+1
  adc #0
  sta drawaddress+1
  lda drawaddress
  and #%11111000
  sta drawaddress

rts

.DrawToBuffer1
  lda #$58
  sta targetbuffer
  jsr ProcessDraw
  jsr ProcessDrawStatic
rts
.DrawToBuffer2
  lda #$30
  sta targetbuffer
  jsr ProcessDraw
  jsr ProcessDrawStatic
rts
.ClearBuffer1
  lda #$58
  sta targetbuffer
  jsr ProcessClear
rts
.ClearBuffer2
  lda #$30
  sta targetbuffer
  jsr ProcessClear
rts

.ProcessClear
    ldx #$00
    .ProcessClearLoop
      stx currententity
      lda entitiestype, x 
      beq ProcessNextClear

      lda entitiesdrawposlolastframe, x 
      sta drawaddress
      lda entitiesdrawposhilastframe, x
      clc 
      adc targetbuffer 
      sta drawaddress+1

      lda entitiesxposlastframe, x 
      and #7
      sta variable5
      lda entitiesyposlastframe, x 
      and #7
      sta variable6
      jsr ClearSingleUnalignedSprite
      ldx currententity

    .ProcessNextClear
    inx 
    cpx #NUMENTITIES
    beq EndClear
      jmp ProcessClearLoop
    .EndClear
rts

.ClearSingleUnalignedSprite
  ;top row
  ldy #7
  lda variable5
  beq noclearxoffset
  ldy #15
  .noclearxoffset
  .ClearSingleUnalignedSpriteLoop1
  lda #$00
  sta (drawaddress), y 
  dey 
  bpl ClearSingleUnalignedSpriteLoop1
  ;bottom row
  lda variable6
  beq EndClearSingleUnalignedSprite
  jsr MoveDrawAddressDown1Row
  ldy #7
  lda variable5
  beq noclearxoffset2
  ldy #15
  .noclearxoffset2
  .ClearSingleUnalignedSpriteLoop2
  lda #$00
  sta (drawaddress), y 
  dey 
  bpl ClearSingleUnalignedSpriteLoop2


  .EndClearSingleUnalignedSprite
rts


.ProcessDrawStatic
  ldx #$00
  .ProcessStaticDrawLoop
    stx currententity
    lda staticentitiestype, x 
    beq ProcessNextStaticDraw
    jsr DrawStaticSprites
    .ProcessNextStaticDraw
    ldx currententity
    inx 
    cpx #NUMENTITIES
    bne ProcessStaticDrawLoop
rts

.DrawStaticSprites
  ldx currententity
  lda staticentitiesdrawposlo, x 
  sta drawaddress
  sta scratch1
  lda staticentitiesdrawposhi, x 
  clc 
  adc targetbuffer
  sta drawaddress+1
  sta scratch2

  lda staticentitiescurrentspritelo, x 
  sta readpointer
  lda staticentitiescurrentspritehi, x 
  sta readpointer+1

  ldy #00
  lda (readpointer), y 
  sta readpointer2
  iny 
  lda (readpointer), y 
  sta readpointer2+1

  lda #$00
  sta scratch1

  lda #$02
  sta extraloopcounter2
  
  .DrawStaticSpriteLoopOuter
  lda #$02
  sta extraloopcounter1

  .DrawStaticSpriteLoopInner
  ldy #$07
  .DrawStaticSpriteLoop
    lda (readpointer2), y
    sta (drawaddress), y 
    dey
    bpl DrawStaticSpriteLoop
  jsr MoveDrawAddress1BlockRight
  lda scratch1
  clc 
  adc #2
  sta scratch1
  tay 
  lda (readpointer), y 
  sta readpointer2
  iny 
  lda (readpointer), y 
  sta readpointer2+1
  dec extraloopcounter1
  bne DrawStaticSpriteLoopInner
  
  jsr MoveDrawAddressDown1RowAndBack2
  dec extraloopcounter2
  bne DrawStaticSpriteLoopOuter
rts

.ProcessDraw

  ldx #$00
  .ProcessDrawLoop:
    stx currententity
    lda entitiestype, x 
    beq ProcessNextDraw
    lda entitiesdatalocationlo, x
    sta readpointer
    lda entitiesdatalocationhi, x 
    sta readpointer+1

    lda entitiesdrawposlo, x 
    sta variable1
    lda entitiesdrawposhi, x 
    clc 
    adc targetbuffer
    sta variable2

    ; lda entitieswidth, x 
    ; sta variable3
    ; lda entitiesheight, x 
    ; sta variable4

    lda entitiesxpos, x 
    and #7
    sta variable5

    lda entitiesypos, x 
    and #7
    sta variable6

    inc readpointer
    inc readpointer

    lda entitiesspriteaddresslo, x 
    sta readpointer
    lda entitiesspriteaddresshi, x 
    sta readpointer+1
    jsr DrawSingleSprite
    ldx currententity




  .ProcessNextDraw:
    inx 
    cpx #NUMENTITIES
    beq EndDraw
      jmp ProcessDrawLoop
    .EndDraw
rts


.DrawAlignedSprite;v1 = x (top left corner);v2 = y ;v3 = width (in 8 blocks);v4 = height (in 8 blocks)
  lda #$00
  sta scratch1
  sta scratch2
  sta scratch3
  sta scratch4
  sta scratch5
  sta scratch6
  sta scratch7
  sta scratch8

  lda variable1
  sta drawaddress
  lda variable2
  sta drawaddress+1

  lda variable3
  sta extraloopcounter1
  lda variable4
  sta extraloopcounter2
  ldy #$07
  .DrawAlignedSpriteLoop
    lda #$00
    sta scratch9
    ;8x8 loop
    lda (readpointer), y
    ldx variable5
    beq EndAlignedBitRotation
    .AlignedBitRotation
    ror a 
    ror scratch9
    dex 
    bne AlignedBitRotation
    ora scratch1, y 
    .EndAlignedBitRotation
    sta (drawaddress), y 
    lda scratch1, y 
    dey 
    bpl DrawAlignedSpriteLoop

    lda readpointer
    clc 
    adc #$08
    sta readpointer
    lda readpointer+1
    adc #$00
    sta readpointer+1

    jsr MoveDrawAddress1BlockRight

    ldy #$07
    dec extraloopcounter1
    bpl DrawAlignedSpriteLoop
    ;one hrow has been drawn
    ;draw final extra row of rotated bits
    ldy #$07
    .DrawAdditionAlignedBlock
    lda scratch1, y 
    sta (drawaddress), y 
    dey 
    bpl DrawAdditionAlignedBlock

    lda variable1
    clc 
    adc #$40
    sta drawaddress
    lda variable2
    adc #1
    sta drawaddress+1

    ldy #7
    lda variable3
    sta extraloopcounter1

    lda #0
    sta scratch1
    sta scratch2
    sta scratch3
    sta scratch4
    sta scratch5
    sta scratch6
    sta scratch7
    sta scratch8


    dec extraloopcounter2
    bmi EndAlignedSpriteDraw
    jmp DrawAlignedSpriteLoop
    .EndAlignedSpriteDraw
rts

.DrawSingleSprite
  ;v1 = drawaddresslo
  ;v2 = drawaddress hi
  ;v3 = sprite width 
  ;v4 = sprite height 
  ;v5 = xoffset
  ;v6 = yoffset
  ;readpointer = sprite address
  lda #$00
  sta scratch1

  ;offset the readpointer by how misaligned we are with the grid
  lda readpointer
  sec 
  sbc variable6
  sta readpointer

  ;store the base drawaddress in pointer
  lda variable1
  clc 
  sta drawaddress
  lda variable2
  sta drawaddress+1

  ;store the draw block 1 to the right of base drawaddress
  lda drawaddress
  clc 
  adc #8
  sta drawaddress2
  lda drawaddress+1
  adc #0
  sta drawaddress2+1

  ldy #$07 ; loop 8 times to draw an 8x8 sprite
  .DrawSingleUnalignedSpriteLoop
  lda #0
  sta scratch1
  lda (readpointer), y ;read row of pixels
  sta temp
  ldx currententity
  lda entitiesfliphorizontally, x 
  beq nohorizontalpixelflip1
  ldx temp
  lda ReverseBitsTable, x 
  sta temp
  .nohorizontalpixelflip1
  lda temp
  jsr Spritexrotation ; shift pixels to the right based on offset from grid
  ora (drawaddress), y ; ora means we don't overwrite what's already there
  sta (drawaddress), y ;store final pixels in baseaddress
  dey 
  cpy variable6 ; this will break the loop early based on the yoffet from the grid
  bpl DrawSingleUnalignedSpriteLoop


  ;move base address down by 1 block
  jsr MoveDrawAddressDown1Row

  ;store baseaddress +1 block right
  lda drawaddress
  clc 
  adc #8
  sta drawaddress2
  lda drawaddress+1
  adc #0
  sta drawaddress2+1

  lda variable6 ; if there is no yoffset, we can skip the rest of the draw
  ;as the sprite is vertically aligned with the grid
  beq EndDrawSingleSprite

  lda readpointer
  clc 
  adc #8
  sta readpointer
  lda readpointer+1
  adc #0
  sta readpointer+1

  ldy variable6
  dey
  .DrawSingleUnalignedSpriteLoop2
  lda #0
  sta scratch1
  lda (readpointer), y
  jsr Spritexrotation
  ora (drawaddress), y
  sta (drawaddress),y
  dey
  bpl DrawSingleUnalignedSpriteLoop2

  .EndDrawSingleSprite

rts

.Spritexrotation
  ldx variable5 ; load xoffset from grid as loopcounter
  beq EndSpritexrotation ;if no offset, skip routine
  .Spritexrotationloop
  lsr a ;move bit1 of current pixel strip into carry
  ror scratch1 ; move carry into bit 8 of temp mem
  dex ;loop for each xoffset
  bne Spritexrotationloop
  pha ;store modded pixel strip
  lda scratch1 ; retrieve shifted out pixels
  sta (drawaddress2), y ; store shifted pixels one block to the right
  pla ;retrieve stored pixels
  .EndSpritexrotation
rts


.CheckForMapChange
  lda triggermapchange
  beq nomapchange
    tay 
    lda MapChangeFunctionsLo, y 
    sta jumppointer
    lda MapChangeFunctionsHi, y 
    sta jumppointer+1
    jsr JumpToPointerRoutine
    lda #$00
    sta triggermapchange
  .nomapchange
rts

.MapChangeNone
.MapChangeLeft
  dec mapposx
  bcc nomapxunderflow
  lda #15
  sta mapposx
  .nomapxunderflow
  jsr ReloadScreen
rts
.MapChangeRight
  lda mapposx
  clc 
  adc #1
  cmp #16
  bne nomapxoverflow
  lda #0
  .nomapxoverflow
  sta mapposx
  jsr ReloadScreen
rts
.MapChangeUp
  dec mapposy
  jsr ReloadScreen
rts
.MapChangeDown
  inc mapposy
  jsr ReloadScreen
rts
 

.TransferDrawAddress
  lda drawaddress
  sta drawaddress2
  lda drawaddress+1
  sec 
  sbc #$28
  sta drawaddress2+1
rts

.MoveDrawAddressDown1Row
  lda drawaddress
  clc
  adc #$40 
  sta drawaddress
  lda drawaddress+1
  adc #1
  sta drawaddress+1
rts

.MoveDrawAddressDown1RowAndBack2
  lda drawaddress
  clc
  adc #$30
  sta drawaddress
  lda drawaddress+1
  adc #1
  sta drawaddress+1
rts

.MoveDrawAddress1BlockRight
  lda drawaddress
  clc 
  adc #8
  sta drawaddress
  lda drawaddress+1
  adc #0
  sta drawaddress+1
rts

