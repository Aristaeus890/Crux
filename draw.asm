
.ClearScreen

  lda #$58
  sta SmocWrite256+2
  lda #32
  sta SmocWrite256+1

  ldy #$00
  ldx #40
  .ClearScreenLoop
  lda #$00
  jsr SmocWrite256
  lda SmocWrite256+1
  clc 
  adc #$40
  sta SmocWrite256+1
  lda SmocWrite256+2
  adc #1
  sta SmocWrite256+2
  dex 
  bne ClearScreenLoop
  jsr CopyBufferToBuffer
rts

.CopyBufferToBuffer
  lda #$00
  tay
  ldx #40

  sta SMOCReadWrite256+1
  sta SMOCReadWrite256+4
  lda #$58
  sta SMOCReadWrite256+2
  lda #$30
  sta SMOCReadWrite256+5

  .CopyScreenLoop
  jsr SMOCReadWrite256
  inc SMOCReadWrite256+2
  inc SMOCReadWrite256+5
  dex 
  bne CopyScreenLoop

rts

; .DefaultMMTSLoc
;   equb %0000_0000
;   equb %0000_1111
;   equb %0000_0000
;   equb %1111_0000

; .DefaultMMTSType
;   equb 0,0,10,10

.DrawExits
  ldx #<mmtfConveyerLeft2
  stx readpointer
  ldx #>mmtfConveyerLeft2
  stx readpointer+1

  ;turn map pos into index 
  lda mapposy 
  jsr Mult16 
  clc 
  adc mapposx
  lsr a 
  tax 
  lda ScreenExitData, x 
  beq AllPathsClear
  ;work out if we're left or right 4 bits
  sta scratch1
  lda mapposx
  and #%00000001
  beq RightSide
  bne DrawExitTiles
  .RightSide
  lda scratch1
  jsr Div16
  sta scratch1
  .DrawExitTiles
  lda scratch1
  ; juggling registers and vars is troublesome if this is a loop
  ldy #$03
  jsr DrawSingleExitTile
  ldy #$02
  jsr DrawSingleExitTile
  ldy #$01
  jsr DrawSingleExitTile
  ldy #$00
  jmp DrawSingleExitTile
  .AllPathsClear
rts

.DrawSingleExitTile
  ror a 
  bcc EndDrawSingleExitTile
  pha
  ; pha 
  lda ExitPositionslo, y 
  sta drawaddress
  lda ExitPositionshi, y 
  sta drawaddress+1
  jsr DrawSingleMetaMetaTile
  pla 
.EndDrawSingleExitTile
rts

.DrawMetaMetaTiles
  jsr ClearScreen
  ; draw default mmts that will show on every screen
  ldy #$00
  sty scratch7
  .LoadDefaultTilesLoop
  jsr CalcMapPosIndex
  ldy #$00
  lda (readpointer), y
  and #%00001111
  tay 
  lda DefaultScreenMMTsLo, y 
  sta readpointer2
  lda DefaultScreenMMTsHi, y 
  sta readpointer2+1

  ldy scratch7
  lda (readpointer2), y 
  cmp #$ff
  beq NoFinishDefaultLoad
  pha 
  and #%11110000
  sta variable1
  pla 
  jsr Mult16
  sta variable2
  jsr CalculateDrawOffset
  lda drawaddress+1
  clc 
  adc #$58
  sta drawaddress+1
  inc scratch7
  ldy scratch7
  lda (readpointer2), y 
  tay 
  lda MetaMetaTileListLo, y 
  sta readpointer
  lda MetaMetaTileListHi, y 
  sta readpointer+1

  jsr DrawSingleMetaMetaTile
  inc scratch7
  bpl LoadDefaultTilesLoop
  .NoFinishDefaultLoad

  lda #GEOMETRYDATAOFFSET ; index on screen data to geometry blocks
  sta scratch7
  .DrawMetaMetaLoop
  jsr CalcMapPosIndex ; get location of current screen data in readpointer
  ldy scratch7 ; load index to geometry data
  lda (readpointer), y 
  cmp #$ff
  bne NoFinishScreenLoad ; CHANGE TO BPL LATER
  rts
  .NoFinishScreenLoad
  and #%11110000 ; byte is split between x/y, process x first
  sta variable1 
  lda (readpointer), y
  jsr Mult16 ; replace upper 4 bits with lower  to get ypos
  sta variable2
  jsr CalculateDrawOffset
  lda drawaddress+1
  ; clc 
  adc #$58
  sta drawaddress+1

  inc scratch7 ;increment to the metametatile id of the block
  ldy scratch7
  lda (readpointer), y 
  tay 
  lda MetaMetaTileListLo, y 
  sta readpointer
  lda MetaMetaTileListHi, y 
  sta readpointer+1

  jsr DrawSingleMetaMetaTile
  inc scratch7
  bpl DrawMetaMetaLoop ; always branch. Screen data must take 0-127 bytes for this to work
rts


.DrawSingleMetaMetaTile
  ; metametatile data address in readpointer
  ;base address in drawaddress

  lda drawaddress
  sta scratch9
  lda drawaddress+1
  sta scratch10

  lda #$00
  sta scratch8
  .DrawSingleMetaMetaTileLoopOuter
  lda drawaddress
  sta scratch5
  lda drawaddress+1
  sta scratch6
  ldy scratch8
  ;load width of block
  lda (readpointer), y 
  cmp #$ff
  bne NoEndMetaMetaTile
  rts
  .NoEndMetaMetaTile
  sta temp
  tax 
  iny 
  .DrawSingleMetaMetaTileLoop
  txa 
  pha 
  tya 
  pha 
  lda (readpointer), y
  ; all meta tiles are 8 bytes. Therefore the lo byte lookup can be replaced by multiplying by 8
  ; and using that as the lo byte ONLY if the list of metatiles is also page aligned
  ; this lets us eliminate the entire lookup table of lo bytes
  jsr GetMultipleOf8
  sta readpointer2
  lda MetaTileListHi, y 
  sta readpointer2+1
  jsr DrawSingleMetaTile

  lda scratch5
  sta drawaddress
  lda scratch6
  sta drawaddress+1
  jsr MoveDrawAddress1BlockRight
  jsr MoveDrawAddress1BlockRight
  lda drawaddress
  sta scratch5
  lda drawaddress+1
  sta scratch6

  pla 
  tay 
  iny 
  pla 
  tax 
  dex
  bne DrawSingleMetaMetaTileLoop

  lda scratch8
  ; clc 
  adc temp
  adc #1
  sta scratch8

  lda scratch9
  ; clc 
  adc #$80
  sta drawaddress
  sta scratch9
  lda scratch10
  adc #2
  sta drawaddress+1
  sta scratch10

  bcc DrawSingleMetaMetaTileLoopOuter ; always branch. adc has cleared carry

.DrawSingleMetaTile

  ; metatile address in readpointer2
  ; drawaddress in drawaddress
  ; destroys x/y, s1-4, readpointer 2
  ldx #00
  ldy #00

  lda (readpointer2), y
  sta scratch1
  iny
  lda (readpointer2), y 
  sta scratch2
  iny
  lda (readpointer2), y 
  sta scratch3
  iny
  lda (readpointer2), y 
  sta scratch4

  .DrawSingleMetaTileLoop
  lda scratch1, x 
  jsr GetMultipleOf8
  sta DrawTileLoop+1
  ; sta readpointer2
  lda TilePatternsHi, y 
  ; sta readpointer2+1
  sta DrawTileLoop+2
  jsr DrawTile

  ldy #7
  lda MetaTileDrawOffsetsLo, x 
  clc
  adc drawaddress
  sta drawaddress
  lda MetaTileDrawOffsetsHi, x 
  adc drawaddress+1
  sta drawaddress+1
  inx 
  cpx #4
  bne DrawSingleMetaTileLoop
rts


.DrawTile
  ldy #7
  .DrawTileLoop
  lda $ffff, y 
  sta (drawaddress), y 
  dey 
  bpl DrawTileLoop
rts

.ReloadScreen
  ; ldy #NUMTILECORRUPTION
  ; .blobo
  ; tya 
  ; pha 
  ; jsr CorruptTile
  ; pla 
  ; tay 
  ; dey 
  ; bne blobo

  jsr DrawMetaMetaTiles
  jsr DrawExits
  jsr CopyBufferToBuffer
  jsr LoadCollisionData
  jsr LoadExitCollision
  jsr ReloadEntities
  jsr PrintMapPosition
  jmp ReloadPalette
  ; jsr Reset
  ; tailcall

.CalculateDrawOffset 
  ;given x/y in var 1/2, calculate a drawaddress in screen memory
  ; destroys y,a
  ; ((y/8) * 256) + ((y/8) * 64) + 32 + buffer address
  lda #32
  sta drawaddress
  ;y/8 x 256
  lda variable2
  lsr a 
  lsr a 
  lsr a
  sta drawaddress+1 ;storing in hibyte == x255

  ; mult y/8 by 64 w/lookup
  tay
  lda CalcM64lo, y  
  adc drawaddress
  sta drawaddress

  lda drawaddress+1
  adc #0
  sta drawaddress+1

  lda CalcM64hi, y
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
  bpl ProcessDraw ;always branch

.DrawToBuffer2
  lda #$30
  sta targetbuffer
  ;allow to fall through

.ProcessDraw
  ldx #0
  .ProcessDrawLoop
    stx currententity
    ; lda entitiesredraw, x 
    ; beq ProcessNextDraw
    lda entitiestype, x 
    beq ProcessNextDraw
    ;check if we need to draw a static entitiy
    lda entitiesstatic, x 
    beq DrawRegularEnts
    bne DrawStaticSprites ;always branch
    .DrawRegularEnts
    dec entitiesredraw, x 

    lda entitiesdrawposlo, x 
    sta drawaddress
    lda entitiesdrawposhi, x 
    clc 
    adc targetbuffer
    sta drawaddress+1

    ; x alignment with 8x8 grid
    lda entitiesxpos, x 
    and #7
    sta variable5
    ; y alignement with 8x8 grid
    lda entitiesypos, x 
    and #7
    sta variable6

    lda entitiesspriteaddresslo, x 
    sec 
    sbc variable6  ;offset the readpointer by how misaligned we are with the grid
    sta readpointer
    lda entitiesspriteaddresshi, x 
    sta readpointer+1

    lda #0
    sta scratch1
    lda variable5
    beq AlignedX
    inc scratch1
    .AlignedX
    lda variable6
    beq AlignedY
    lda scratch1
    ora #%00000010
    sta scratch1
    .AlignedY
    ldy scratch1
    lda DrawFunctionListLo, y
    sta jumppointer
    lda DrawFunctionListHi, y 
    sta jumppointer+1
    jsr JumpToPointerRoutine
  .ProcessNextDraw
    ldx currententity
    inx
    cpx #NUMENTITIES
    bne ProcessDrawLoop
rts

.ClearBuffer1
  lda #$58
  sta targetbuffer
  bpl ProcessClear ;always branch

.ClearBuffer2
  lda #$30
  sta targetbuffer
  ;let fall through

.ProcessClear
    ldx #NUMENTITIES-1
    .ProcessClearLoop
      stx currententity
      lda entitiestype, x 
      beq ProcessNextClear
      lda entitiesredraw, x 
      beq ProcessNextClear
      lda targetbuffer
      sta variable1
      jsr SpriteClearPreparation
      ldx currententity
    .ProcessNextClear
    dex 
    bpl ProcessClearLoop
rts

.DrawStaticSprites
  ldx currententity
  lda entitiesdrawposlo, x 
  sta drawaddress
  sta scratch2
  lda entitiesdrawposhi, x 
  clc 
  adc targetbuffer
  sta drawaddress+1
  sta scratch3

  lda entitiesspriteaddresslo, x 
  sta readpointer
  lda entitiesspriteaddresshi, x 
  sta readpointer+1
  ldy #00
  lda (readpointer), y
  sta readpointer2
  iny 
  lda (readpointer), y 
  sta readpointer2+1

  lda #$00
  sta scratch1

  lda entitiesheight, x 
  lda #2
  sta extraloopcounter2

  .DrawStaticSpriteLoopOuter
  lda entitieswidth, x 
  lda #2
  sta extraloopcounter1

  .DrawStaticSpriteLoopInner
  ldy #$07
  .DrawStaticSpriteLoop
  lda (readpointer2), y
  ; eor (drawaddress), y 
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
  
  lda scratch2
  clc 
  adc #$40
  sta scratch2
  sta drawaddress
  lda scratch3
  adc #1
  sta scratch3
  sta drawaddress+1

  dec extraloopcounter2
  bne DrawStaticSpriteLoopOuter
  jmp ProcessNextDraw ; too far to branch

.ClearSingleUnalignedSprite
  ;top row
  ldy #7
  lda variable5
  beq noclearxoffset
  ldy #15
  .noclearxoffset
  lda #$00
  .ClearSingleUnalignedSpriteLoop1
  sta $ffff, y 
  dey 
  bpl ClearSingleUnalignedSpriteLoop1
  ;bottom row
  lda entitiesyposlastframe, x 
  and #7
  beq EndClearSingleUnalignedSprite
  lda ClearSingleUnalignedSpriteLoop1+1
  clc
  adc #$40
  sta ClearSingleUnalignedSpriteLoop2+1
  lda ClearSingleUnalignedSpriteLoop1+2
  adc #1
  sta ClearSingleUnalignedSpriteLoop2+2

  ldy #7
  lda variable5
  beq noclearxoffset2
  ldy #15
  .noclearxoffset2
  lda #$00
  .ClearSingleUnalignedSpriteLoop2
  sta $ffff, y 
  dey 
  bpl ClearSingleUnalignedSpriteLoop2
  .EndClearSingleUnalignedSprite
rts


.DrawAlignedSprite
  ldy #$07
  ldx currententity
  lda entitiesfliphorizontally, x 
  bne DrawAlignedSpriteFlippedLoop
  .DrawAlignedSpriteUnFlipped
  .DrawAlignedSpriteLoop
  lda (readpointer), y 
  ora (drawaddress), y 
  sta (drawaddress), y 
  dey 
  bpl DrawAlignedSpriteLoop
  bmi EndDrawAlignedSprite
  .DrawAlignedSpriteFlipped
  .DrawAlignedSpriteFlippedLoop
  lda (readpointer), y 
  jsr ReverseBitOrder
  ora (drawaddress), y 
  sta (drawaddress), y 
  dey 
  bpl DrawAlignedSpriteFlippedLoop
  .EndDrawAlignedSprite
  rts

.DrawUnAlignedSpriteX
  lda #$00
  sta scratch1

  lda drawaddress
  sta XUnalignedWrite+1
  sta XUnalignedWrite+4
  clc 
  adc #$08
  sta XUnalignedWrite+9
  sta XUnalignedWrite+12
    
  lda drawaddress+1
  sta XUnalignedWrite+2
  sta XUnalignedWrite+5
  adc #0
  sta XUnalignedWrite+10
  sta XUnalignedWrite+13
  ldy #$07
  .DrawUnAlignedSpriteXLoop
  lda #0
  sta scratch1
  lda (readpointer), y
  pha
  lda entitiesfliphorizontally, x 
  beq nohorizontalpixelflip1
  pla
  jsr ReverseBitOrder
  equb BITSKIP
  .nohorizontalpixelflip1
  pla
  jsr SPXRot
  .XUnalignedWrite
  ora $ffff, y ;012
  sta $ffff, y ;345
  lda scratch1 ;6_7
  ora $ffff, y ;8_9_10
  sta $ffff, y ;11_12_13
  dey 
  bpl DrawUnAlignedSpriteXLoop
rts



.DrawUnAlignedSpriteY
  ldy #$07
  .DrawUnAlignedSpriteYLoop
  lda (readpointer), y
  pha
  lda entitiesfliphorizontally, x 
  beq nohorizontalpixelflip2
  pla
  jsr ReverseBitOrder
  equb BITSKIP
  .nohorizontalpixelflip2
  pla
  ora (drawaddress), y 
  sta (drawaddress), y 
  dey 
  cpy variable6
  bpl DrawUnAlignedSpriteYLoop

  lda drawaddress
  clc 
  adc #$40
  sta drawaddress
  lda drawaddress+1
  adc #1
  sta drawaddress+1

  lda readpointer
  adc #8
  sta readpointer
  lda readpointer+1
  adc #0
  sta readpointer+1

  ldy variable6
  .DrawUnAlignedSpriteYLoop2
  lda (readpointer), y
  pha
  lda entitiesfliphorizontally, x 
  beq nohorizontalpixelflip3
  pla
  jsr ReverseBitOrder
  equb BITSKIP
  .nohorizontalpixelflip3
  pla
  ora (drawaddress), y 
  sta (drawaddress), y 
  dey 
  bpl DrawUnAlignedSpriteYLoop2
rts


.DrawUnAlignedSpriteXY
  lda drawaddress
  clc 
  adc #$08
  sta drawaddress2
  lda drawaddress+1
  adc #0
  sta drawaddress2+1
  ldy #$07
  .DrawUnAlignedSpriteXYLoop
  lda #0
  sta scratch1
  lda (readpointer), y
  pha
  lda entitiesfliphorizontally, x 
  beq nohorizontalpixelflip4
  pla
  jsr ReverseBitOrder
  equb BITSKIP
  .nohorizontalpixelflip4
  pla
  jsr SPXRot
  ora (drawaddress), y 
  sta (drawaddress), y 
  lda scratch1
  ora (drawaddress2), y 
  sta (drawaddress2), y   
  dey 
  cpy variable6
  bpl DrawUnAlignedSpriteXYLoop

  lda drawaddress
  clc 
  adc #$40
  sta drawaddress
  lda drawaddress+1
  adc #1
  sta drawaddress+1

  lda drawaddress
  adc #8
  sta drawaddress2
  lda drawaddress+1
  adc #0
  sta drawaddress2+1

  lda readpointer
  adc #8
  sta readpointer
  lda readpointer+1
  adc #0
  sta readpointer+1

  ldy variable6
  .DrawUnAlignedSpriteXYLoop5
  lda #0
  sta scratch1
  lda (readpointer), y
  pha
  lda entitiesfliphorizontally, x 
  beq nohorizontalpixelflip5
  pla
  jsr ReverseBitOrder
  equb BITSKIP
  .nohorizontalpixelflip5
  pla
  jsr SPXRot
  ora (drawaddress), y 
  sta (drawaddress), y 
  lda scratch1
  ora (drawaddress2), y 
  sta (drawaddress2), y 
  dey 
  bpl DrawUnAlignedSpriteXYLoop5
rts


.SPXRot
  ldx variable5 ; load xoffset from grid as loopcounter
  beq EndSPXRot ;if no offset, skip routine
  .SPXRotLoop
  lsr a ;move bit1 of current pixel strip into carry
  ror scratch1 ; move carry into bit 8 of temp mem
  dex ;loop for each xoffset
  bne SPXRotLoop
  .EndSPXRot
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

.RandomisePalette
  jsr prng
  and #%00001111 ;0-15
  tay 
  bpl SetPalette ;always branch
.ReloadPalette
  jsr CalcMapPosIndex
  ldy #00
  lda (readpointer), y
  jsr Div16 
  ; bmi RandomisePalette
  tay 
  ;fallthrough to set pal, SP can be invoked on its own too
.SetPalette
  lda PaletteListLo, y 
  sta readpointer
  lda PaletteListHi, y 
  sta readpointer+1

  ldy #00
  jsr WritePaletteBlock
  ldy #1
  ; let fall through
.WritePaletteBlock
  lda (readpointer), y 
  sty paletteblock
  sta paletteblock+1

  ldx #<paletteblock
  ldy #>paletteblock

  lda #$0c
  jsr osword
rts

; .cyclepal
;   inc palcycle
;   lda palcycle
;   cmp #14
;   bne nopalreset
;   lda #2
;   sta palcycle
;   .nopalreset
;   tay
;   lda PaletteListLo, y 
;   sta readpointer
;   lda PaletteListHi, y 
;   sta readpointer+1
;   ldy #00
;   jsr WritePaletteBlock
;   ldy #1
;   jsr WritePaletteBlock
; rts

.SpriteClearPreparation
  lda entitiesdrawposlolastframe, x 
  sta ClearSingleUnalignedSpriteLoop1+1
  lda entitiesdrawposhilastframe, x
  clc 
  adc variable1 
  sta ClearSingleUnalignedSpriteLoop1+2
  lda entitiesxposlastframe, x 
  and #7
  sta variable5
  jmp ClearSingleUnalignedSprite ; no condition to guarantee branching