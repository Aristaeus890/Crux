
.CollideWithTileMap
  ;x = entity id
  ;assumes an 8x8 collision box with the entity origin in the top left
  ;tests each corner of that rectangle against the collision map
  ;stores the result of each corner in scratch 5-8
  ;stores the overall result in scratch 9

  lda entitiesxpos, x 
  sta scratch1
  clc 
  adc #7
  sta scratch2

  lda entitiesypos, x 
  adc #0
  sta scratch3
  adc #7
  sta scratch4

  ;indexing into tile array=
  ; (tilespacey * arrayheight) + tilespacex

  ;convert x/y into tile space

  ; simply divide by 16 to convert xpos to tilespace
  lda scratch1 ; xleft
  jsr Div16
  sta scratch1

  lda scratch2
  jsr Div16
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
  adc scratch3
  sta scratch6

  lda scratch1
  adc scratch4
  sta scratch7

  lda scratch2
  adc scratch4
  sta scratch8

  ;we now have 4 indexes, 1 for each corner of the colliding object

  lda #0
  sta variable1
  sta variable2
  lda scratch5
  sta variable3
  jsr GetInteriorTileCollision
  sta scratch5
  sta scratch9

  lda #7
  sta variable1
  lda scratch6
  sta variable3
  jsr GetInteriorTileCollision
  sta scratch6
  ora scratch9
  sta scratch9

  lda #7
  sta variable2
  lda scratch8
  sta variable3
  jsr GetInteriorTileCollision
  sta scratch8
  ora scratch9
  sta scratch9

  lda #0
  sta variable1
  lda scratch7
  sta variable3
  jsr GetInteriorTileCollision
  sta scratch7
  ora scratch9
  sta scratch9
rts

  
.GetInteriorTileCollision
  ;v1 = xoffset
  ;v2 = yoffset
  lda #0
  sta temp
  lda entitiesxpos, x 
  ; clc 
  adc variable1
  and #%00001111
  cmp #8
  bcc noxinc
  inc temp
  .noxinc
  lda entitiesypos, x 
  ; clc 
  adc variable2
  and #%00001111
  cmp #8
  bcc noyinc
  inc temp
  inc temp
  .noyinc
  ldy variable3
  lda collisionmap, y 
  tay 
  lda Mult8Table, y 
  sta readpointer
  lda MetaTileListHi, y 
  sta readpointer+1

  lda #4
  clc 
  adc temp
  tay
  lda (readpointer), y 
rts


.SpriteCollide
  lda entitiesxpos, x 
  sta scratch1 ;left 
  ; clc
  adc #$07
  sta scratch2 ;right 
  lda entitiesypos, x 
  sta scratch3 ;up
  adc #$07
  sta scratch4 ; down

  ldy #00
  ; if any one sprite lies between these 4 points, there is an overlap
  .SpriteCollideLoop
  lda entitiestype, y
  beq SpriteCollideNextSprite ; if no entity, skip
  cpy currententity
  beq SpriteCollideNextSprite ; don't allow collision with ourselves
  ;prepare collision test data 
  lda entitiesxpos, y 
  sta scratch5
  clc 
  adc entitieswidth, x 
  sta scratch6
  lda entitiesypos, y 
  sta scratch7
  adc entitiesheight, x 
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
  sty scratch1
  stx scratch2
  ;successful collision, entity index in Y
  lda entitiestype, y 
  tay 
  lda EntityCollisionInitial, y 
  tay 
  lda CollisionFuncsHi, y 
  pha 
  lda CollisionFuncsLo, y 
  pha 
  rts


  ; ldx currententity
  lda #$01
  rts

  .SpriteCollideNextSprite
    iny 
    cpy #NUMENTITIES
    bne SpriteCollideLoop
    lda #$00
    sta scratch1
rts


.LoadCollisionData
  ;s1 = index into screen data 
  ;s2 = x/y of current block's origin

  ; clear collision memory
  lda #<collisionmap
  sta SmocWrite256+1
  lda #>collisionmap
  sta SmocWrite256+2
  lda #00
  tay
  jsr SmocWrite256

  ;load collision data for base room template
  ldy #00
  sty scratch7
  .LoadDefaultRoomCollisionData
  jsr CalcMapPosIndex
  ldy #00
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
  beq FinishLoadDefaultRoomCollisionData
  pha
  jsr Div16
  sta scratch3
  pla
  jsr Mult16
  clc 
  adc scratch3
  sta scratch2
  inc scratch7
  ldy scratch7
  lda (readpointer2), y 
  tay 
  lda MetaMetaTileListLo, y 
  sta readpointer
  lda MetaMetaTileListHi, y 
  sta readpointer+1
  jsr LoadCollisionMMT
  inc scratch7
  bpl LoadDefaultRoomCollisionData ;always branch

  .FinishLoadDefaultRoomCollisionData

  ;load collision data for room specific geometry
  lda #GEOMETRYDATAOFFSET
  sta scratch1 ; index into screen entities
  .LoadCollisionDataLoop
  jsr CalcMapPosIndex ;current screen in readpointer
  ldy scratch1 ; load current screen data index
  lda (readpointer), y 
  cmp #$ff ; if ff, end of data stream
  bne ContinueCollisionLoad
  rts
  .ContinueCollisionLoad
  pha
  ; sta scratch2 ; s2 = xy origin of the current block
  ; lda scratch2
  jsr Div16
  sta scratch3
  pla
  jsr Mult16
  clc 
  adc scratch3
  sta scratch2 ; index into col memory


  inc scratch1
  ldy scratch1
  lda (readpointer), y ; load id of MMT to get col data from
  tay 
  lda MetaMetaTileListLo, y 
  sta readpointer
  lda MetaMetaTileListHi, y 
  sta readpointer+1
  jsr LoadCollisionMMT
  inc scratch1
  bpl LoadCollisionDataLoop ;always branch

.LoadCollisionMMT
  lda scratch2
  sta scratch3
  ldy #00
  sta scratch4
  .LoadCollisionMMTLoop
  lda (readpointer), y ; load block width
  cmp #$ff
  bne ContinueLoadCollisionMMT
  rts
  .ContinueLoadCollisionMMT
  clc 
  adc scratch3
  sta scratch5
  ldx scratch3
  iny 
  .argh
  lda (readpointer), y 
  sta collisionmap, x 
  iny 
  inx 
  cpx scratch5
  bne argh
  lda scratch3
  clc 
  adc #16
  sta scratch3
  jmp LoadCollisionMMTLoop

.WriteToCollisionMap
  ;writes a metatile to memory
  ;v1=x,v2=y, a = tile to write
  pha
  lda variable1
  jsr Div16
  sta scratch1
  
  lda variable2
  and #%11110000
  clc 
  adc scratch1
  tay 
  pla 
  sta collisionmap, y 
rts

.SpriteCollideNone
rts

.SpriteCollideKillPlayer
  jmp Respawn

.SpriteCollideETank
  ldy scratch1
  lda #0
  sta entitiestype, y
  lda #SOUNDFLUIDPICKUP
  sta variable1
  jsr PlaySound
  ldx currententity
  jmp AddTank

.SpriteCollideTeleport
  ldy scratch1
  lda entitiesxpos, y
  jsr Div16
  sta mapposx
  lda entitiesypos, y
  jsr Div16
  sta mapposy
  jmp ReloadScreen

.SpriteCollideKey
  lda uiflags
  ora #%10000000
  sta uiflags
  ldy scratch1
  lda #0
  sta entitiestype, y
rts

.SpriteCollideBounce
  ldy scratch1
  lda #19
  sta entitiestype, y
  lda #25 
  sta entitiesstate, y  

  ; lda entitiesxpos, y 
  ; sta variable1
  ; lda entitiesypos, y 
  ; sta variable2
  ; lda #19
  ; sta variable3
  ; jsr CreateEntity

  lda #10
  sta entitiesanimationtimer, y 
  jmp PlayerEnterStateBouncing