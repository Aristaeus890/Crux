
.CreateStaticEntity
  ldx #$00
    .CreateStaticEntityLoop
      stx currententity
      lda staticentitiestype, x
      bne NextStaticEntity
      jsr CalculateDrawOffset ; store where on screen this sprite is to be drawn
      ldx currententity
      lda drawaddress
      sta staticentitiesdrawposlo, x
      lda drawaddress+1
      sta staticentitiesdrawposhi, x 
      lda variable3
      sta staticentitiestype, x
      tay 
      ; ;load and store animationdata for this sprite in pointer
      lda StaticEntityAnimationListLo, y
      sta readpointer
      sta staticentitiescurrentanimationlo, x 
      lda StaticEntityAnimationListHi, y
      sta readpointer+1
      sta staticentitiescurrentanimationhi, x 
      
      lda StaticEntitySpriteListLo, y 
      sta readpointer2
      lda StaticEntitySpriteListHi, y
      sta readpointer2+1

      ldy #$00
      ; ; at the same time use the animation data to set what sprite list we're drawing from
      lda (readpointer), y ;load first byte (duration)
      sta staticentitiestimer,x
      iny
      lda (readpointer), y ;load second byte (animation number)
      ;us e that byte to get the address of the sprite list
      asl a
      tay 
      lda (readpointer2), y 
      sta staticentitiescurrentspritelo, x 
      iny
      lda (readpointer2), y 
      sta staticentitiescurrentspritehi, x 

      lda #$02
      sta staticentitiesanimationtrack, x 
    rts
    .NextStaticEntity
      ldx currententity
      inx 
      cpx #NUMENTITIES
      bne CreateStaticEntityLoop
rts

.ProcessStaticEntities
  ;iterate over every static entity and process their behaviour
  ldx #$00 ;init loop counter
  .ProcessStaticEntitiesLoop
    stx currententity ; storing this means we can use the x register in this loop then reload it if we need to
    lda staticentitiestype, x 
    beq StaticEntityComplete ; if entity == 0, skip
    jsr AnimateStaticSprite

.StaticEntityComplete
  ; loop until we've gone over every entity and done their behaviour
  ldx currententity
  inx 
  cpx #NUMENTITIES
  bne ProcessStaticEntitiesLoop
rts

.CreateEntity ; var1=x var2=y var3= type
  ldx #$00
    .CreateEntityLoop ; search for an empty slot
      stx currententity
      lda entitiestype, x 
      bne NextEntityLoop ; if there is an entity here already, check the next one
      lda variable1 ; else store position and type in this slot
      sta entitiesxpos, x 
      lda variable2
      sta entitiesypos, x 
      lda variable3
      sta entitiestype, x 
      jsr CalculateDrawOffset
      ldx currententity
      lda drawaddress
      sta entitiesdrawposlolastframe, x
      sta entitiesdrawposlo, x
      lda drawaddress+1
      sta entitiesdrawposhi, x 
      sta entitiesdrawposhilastframe, x 
    rts

    .NextEntityLoop
      ;if we've gone over every allocated slot and they're all full, give up and go home
      inx 
      cpx #NUMENTITIES
      bne CreateEntityLoop 
rts

.ProcessEntities
  ;iterate over every entity and process their behaviour
  ldx #$00 ;init loop counter
  .ProcessEntitiesLoop
    stx currententity ; storing this means we can use the x register in this loop then reload it if we need to
    lda entitiestype, x 
    beq EntityComplete ; if entity == 0, skip
    tay ; use the entity type as an index into a jump table
    lda EntityStateMachineshi,y ;retrieve big byte of destination list
    sta readpointer+1 ; store big byte
    lda EntityStateMachineslo,y ; ditto little byte
    sta readpointer

    lda entitiesstate, x ;load current entity state
    asl a ; state functions are stored as words, so we need to multiply the index by 2 for the offsett to index properly
    tay 
    lda (readpointer), y ; load lobyte of final destination
    sta jumppointer ; store lo byte
    iny 
    lda (readpointer), y ;load hibyte
    sta jumppointer+1
    jmp (jumppointer) ; jump to correct state machine process

.EntityComplete
  ; loop until we've gone over every entity and done their behaviour
  ldx currententity
  inx 
  cpx #NUMENTITIES
  bne ProcessEntitiesLoop
rts

.GenericInit
  ; this is called for most entities as their starting state
  ; it inits animation 0 
  ; it sets state to state 1
  lda #0
  sta variable1
  jsr InitAnimation
  lda #$01
  sta entitiesstate, x 
  lda entitiesxpos, x 
  sta variable1
  lda entitiesypos, x 
  sta variable2
  lda #$00
  sta variable4
  jsr CalculateDrawOffset
  ldx currententity
  lda drawaddress
  sta entitiesdrawposlo, x
  lda drawaddress+1
  sta entitiesdrawposhi, x 
jmp EntityComplete

.ProcessStaticSprite
  ;this behaviour is for sprites that are intended to do nothing except cosmetically
  jsr AnimateSprite ;advance and switch animation frames if necessary
jmp EntityComplete

.ProcessPlayer
  jsr StoreLastFrameData ; store position before we move, so that we can properly clear the sprite later
  jsr AnimateSprite ;advance animation
  jsr CheckK
  cmp #2
  bne nok
  jsr ActionInvertGravity
  .nok
  ;JUMP
  jsr CheckW
  cmp #2
  bne noup 
    ldy waction
    jsr DoAction 
  .noup
  ;l/r movement
  jsr CheckA
  beq noleft
  ldy aaction
  jsr DoAction
  .noleft
  jsr CheckD
  beq noright
    ldy daction
    jsr DoAction
  .noright

  lda entitiesxpos, x 
  sta variable1
  lda entitiesypos, x 
  sta variable2

  jsr ApplyFriction
  jsr LimitSpeed
  jsr TestMovementX
  sta temp
  jsr TestMovementY
  bne nodowncollide
  ; if we're in the air, add to velocity and check for wallslide
    lda temp
    beq nowallslide
    lda #$02
    sta entitiesstate, x 
    lda #$00
    sta entitiesvxhi, x 
    sta entitiesvxlo, x 
    sta entitiesvyhi, x 
    sta entitiesvylo, x
    jsr SetEntityDrawPosition
    jmp EntityComplete
    .nowallslide
    lda globalgravitylo
    sta variable1
    lda globalgravityhi
    sta variable2
    jsr AddyVelocity
    jmp downcollide
  .nodowncollide
  ; else 0 velocity and assign on ground actions
    lda #00
    sta entitiesvyhi, x 
    sta entitiesvylo, x
    sta entitiesyposlo, x 
    lda #$03
    sta waction
  .downcollide

  ;if speed == 0, init idle animation
  lda entitiesvxhi, x 
  ora entitiesvxlo, x 
  ora entitiesvyhi, x 
  ora entitiesvylo, x 
  bne dontinitidleanimation
  sta variable1
  jsr InitAnimation
  .dontinitidleanimation
  jsr CheckScreenXit
  jsr CheckScreenYxit
  jsr SetEntityDrawPosition
jmp EntityComplete

.ProcessPlayerWallSliding
  jsr StoreLastFrameData
  jsr AnimateSprite
  lda #$04
  sta variable1
  lda #0
  sta variable2
  jsr AddyVelocity
  lda entitiesxpos, x 
  sta variable1
  lda entitiesypos, x 
  sta variable2
  jsr TestMovementY
  beq noendwallslide
  lda #$01
  sta entitiesstate, x 
  .noendwallslide

  jsr SetEntityDrawPosition
jmp EntityComplete

.ProcessFlameBracket
  jsr AnimateSprite
jmp EntityComplete

.TestMovementX
  ; attempts to move the entitiy according to their x velocity
  ; if it collides, it will set them back outside the colliding wall
  ; if it collides, it will return 1, else 0
  lda entitiesxpos, x ; set up vars for movement function
  sta variable1
  lda entitiesypos, x 
  sta variable2
  jsr ApplyxVelocity ; move entitiy
  .TestxLoopR ; check for rightcollision
    jsr CollideWithTileMap
    lda scratch6 ;s6/8 are right hand points on sprite and > 0 if a collision was deteced
    ora scratch8 ; we only care if either is > 0, so ora them to combine both bits
    beq TestxLoopL ; if both are 0, skip to check left hand
    lda entitiesxpos, x ; else load position
    and #%11110000 ;mask bottom 8 bits to snap the position to a 16x16 grid
    clc 
    adc #7 ; add offset to place us adjacent to wall we hit
    sta entitiesxpos, x
    lda #$01 ; return 1, as we collided
    rts
  .TestxLoopL
    jsr CollideWithTileMap
    lda scratch5
    ora scratch7
    beq XTestNoCollide
    lda entitiesxpos, x
    and #%11110000
    clc 
    adc #16
    sta entitiesxpos, x 
    lda #$01
    rts

  .XTestNoCollide
  lda #00 ; if no collision, return 0
rts

.TestMovementY ;returns 0 if no collide down, 1 if collide y
  lda entitiesxpos, x 
  sta variable1
  lda entitiesypos, x 
  sta variable2
  jsr ApplyyVelocity
  .TestyLoopU
    jsr CollideWithTileMap
    lda scratch5
    ora scratch6
    beq TestyLoopD
    lda entitiesypos, x 
    and #%11110000
    clc 
    adc #16
    sta entitiesypos, x 
    lda #$01
    rts 
  .TestyLoopD
    jsr CollideWithTileMap
    lda scratch7
    ora scratch8
    beq yTestNoCollide
    lda entitiesypos, x 
    and #%11110000
    clc 
    adc #8
    sta entitiesypos, x
    lda #0
    sta entitiesvyhi, x 
    sta entitiesvylo,x
    lda #$01
    rts
  .yTestNoCollide
  lda #$00
rts

.AddxVelocity
;var 1/2 = vello,velhi
; 16 bit addition
  lda variable1
  clc 
  adc entitiesvxlo, x 
  sta entitiesvxlo, x 
  lda variable2
  adc entitiesvxhi, x 
  sta entitiesvxhi, x 
rts

.SubxVelocity
    lda entitiesvxlo, x 
    sec 
    sbc variable1
    sta entitiesvxlo, x 
    lda entitiesvxhi, x 
    sbc variable2
    sta entitiesvxhi, x 
rts

.AddyVelocity
;var 1/2 = vello,velhi
  lda variable1
  clc 
  adc entitiesvylo, x 
  sta entitiesvylo, x 
  lda variable2
  adc entitiesvyhi, x 
  sta entitiesvyhi, x 
rts

.SubyVelocity
    lda entitiesvylo, x 
    sec 
    sbc variable1
    sta entitiesvylo, x 
    lda entitiesvyhi, x 
    sbc variable2
    sta entitiesvyhi, x 
rts

.ApplyxVelocity
  lda entitiesvxlo, x 
  clc 
  adc entitiesxposlo, x 
  sta entitiesxposlo, x 

  lda entitiesxpos, x 
  adc entitiesvxhi, x 
  sta entitiesxpos, x
rts

.CheckScreenYxit
  ldx currententity
  lda entitiesypos, x 
  cmp #$f8
  bcc nodownexit 
    lda #$09
    sta entitiesypos, x 
    lda #$03
    sta triggermapchange
    rts
  .nodownexit
  cmp #$08
  bcs noupexit 
  lda #$f7
  sta entitiesypos, x 
  lda #$04
  sta triggermapchange
  .noupexit
rts

.CheckScreenXit
  ldx currententity
  lda entitiesxpos, x 
  cmp #$f8
  bcc norightexit
    lda #$09
    sta entitiesxpos, x
    lda #$01
    sta triggermapchange
    rts
  .norightexit
  cmp #$08
    bcs noleftexit
    lda #$f7
    sta entitiesxpos, x
    lda #$02 
    sta triggermapchange
  .noleftexit
rts

.ApplyyVelocity
  lda entitiesvylo, x 
  clc 
  adc entitiesyposlo, x 
  sta entitiesyposlo, x 

  lda entitiesypos, x 
  adc entitiesvyhi, x 
  sta entitiesypos, x
rts

.ApplyFriction
  lda entitiesvxhi, x 
  ora entitiesvxlo, x 
  beq EndApplyFriction
  lda entitiesvxhi, x 
  bmi ApplyFrictionLeft
  .ApplyFrictionRight
  lda #PLAYER_FRICTION
  sta variable1
  lda #$00
  sta variable2
  jsr SubxVelocity
  lda entitiesvxhi, x 
  bpl EndApplyFriction
  lda #$00
  sta entitiesvxhi, x 
  sta entitiesvxlo, x
  rts  
  .ApplyFrictionLeft
  lda #PLAYER_FRICTION
  sta variable1
  lda #$00
  sta variable2
  jsr AddxVelocity
  lda entitiesvxhi, x 
  bmi EndApplyFriction
  lda #$00
  sta entitiesvxhi, x 
  sta entitiesvxlo, x
  .EndApplyFriction
rts

.LimitSpeed
  lda entitiesvxhi, x
  ora entitiesvxlo, x 
  beq NoSpeedLimitRight 
  lda entitiesvxhi, x 
  bpl LimitSpeedRight
  .LimitSpeedLeft
    lda entitiesvxhi, x 
    cmp #$ff
    bcs NoSpeedLimitRight
    lda entitiesvxlo, x 
    beq NoSpeedLimitRight
    lda #$00
    sta entitiesvxlo, x     
    lda #$ff
    sta entitiesvxhi, x 
    rts
  .LimitSpeedRight
    lda entitiesvxhi, x 
    beq NoSpeedLimitRight
    lda entitiesvxlo, x 
    beq NoSpeedLimitRight
    lda #$01
    sta entitiesvxhi, x 
    lda #0
    sta entitiesvxlo,x
  .NoSpeedLimitRight

  lda entitiesvyhi, x
  ora entitiesvylo, x 
  beq NoSpeedLimitDown 
  lda entitiesvyhi, x 
  bpl LimitSpeedDown

  .LimitSpeedUp
    lda entitiesvyhi, x 
    bpl LimitSpeedDown
    lda entitiesvylo, x 
    beq LimitSpeedDown
    lda entitiesvyhi, x 
    cmp #SPEED_MAX_UP
    bcs LimitSpeedDown
    lda #SPEED_MAX_UP
    sta entitiesvyhi, x
    lda #$00 
    sta entitiesvylo, x     
    rts

  .LimitSpeedDown
    lda entitiesvyhi, x
    bmi NoSpeedLimitDown
    lda entitiesvylo, x 
    beq NoSpeedLimitDown
    lda entitiesvyhi, x 
    cmp #SPEED_MAX_DOWN
    bcc NoSpeedLimitDown
    lda #SPEED_MAX_DOWN
    sta entitiesvyhi, x 
    lda #0
    sta entitiesvylo,x
  .NoSpeedLimitDown
rts

.SetEntityDrawPosition
; use entity position to calculate their origin in screen memory
  lda entitiesxpos, x 
  sta variable1
  lda entitiesypos, x 
  sta variable2
  jsr CalculateDrawOffset
  ldx currententity
  lda drawaddress
  sta entitiesdrawposlo, x
  lda drawaddress+1
  sta entitiesdrawposhi, x 
rts

.InitAnimation ; x = entitiy id, v1 = ani number
  ;use entity type to get the appropriate list of animations for this entity
  ldy entitiestype, x  
  lda AnimationListLo, y 
  sta readpointer
  lda AnimationListHi, y 
  sta readpointer+1

  lda variable1 ; load animation number
  asl a ;animations stored as words, so x2 the index
  tay 
  lda (readpointer), y ; load lo byte of animation data address
  sta readpointer2 ; store in pointer 
  sta entitiesanimationaddresslo, x ; save the address for faster access later
  iny 
  lda (readpointer), y ;load hi byte of animation data address
  sta readpointer2+1 ;store in pointer
  sta entitiesanimationaddresshi, x ; save the address for faster access later

  ldy #00 ; 
  lda (readpointer2), y ;load first byte of animation data (which sprite to display)
  sta scratch1 ;temp storage
  iny 
  lda (readpointer2), y ;load second b¥te (duration of this sprite frame)
  sta entitiesanimationtimer, x ; store the duration
  lda #$02 ; since we've read the first 2 bytes, set the index for how far through the ani we are to 2
  sta entitiesanimationtrack, x 

  lda scratch1
  jsr FetchSpriteAddress


rts

.FetchSpriteAddress 
  ;x = entitity identity
  ;a = sprite number to get


  pha
  ldx currententity
  lda SpriteListLo, x 
  sta readpointer
  lda SpriteListHi, x 
  sta readpointer+1

  pla
  asl a
  tay 
  lda (readpointer), y 
  sta entitiesspriteaddresslo, x 
  iny 
  lda (readpointer), y
  sta entitiesspriteaddresshi, x 
rts

.AnimateStaticSprite
  dec staticentitiestimer, x 
  beq AdvanceStaticAnimation
  rts
  .AdvanceStaticAnimation
  lda staticentitiescurrentanimationlo, x 
  sta readpointer
  lda staticentitiescurrentanimationhi, x 
  sta readpointer+1
  lda staticentitiestype, x 
  tay
  lda StaticEntitySpriteListLo, y 
  sta readpointer2
  lda StaticEntitySpriteListHi, y 
  sta readpointer2+1
  ldy staticentitiesanimationtrack, x 
  lda (readpointer), y
  bpl NoStaticAnimationLoop
    ldy #$00
    lda (readpointer), y
    sta staticentitiestimer, x 
    iny 
    lda (readpointer), y 
    asl a
    tay 
    lda (readpointer2), y 
    sta staticentitiescurrentspritelo, x 
    iny 
    lda (readpointer2), y 
    sta staticentitiescurrentspritehi, x

    lda #$02
    sta staticentitiesanimationtrack, x 
    rts
  .NoStaticAnimationLoop
    sta staticentitiestimer, x 
    iny 
    lda (readpointer), y 
    asl a
    tay 
    lda (readpointer2), y 
    sta staticentitiescurrentspritelo, x 
    iny 
    lda (readpointer2), y 
    sta staticentitiescurrentspritehi, x
    inc staticentitiesanimationtrack, x
    inc staticentitiesanimationtrack, x 
    ; iny 
    ; tya
    ; sta staticentitiesanimationtrack, x 

rts

.AnimateSprite
  dec entitiesanimationtimer, x 
  beq AdvanceAnimation ; if timer == 0, load a new sprite frame
  lda #$00 ;else return 0
  rts
  .AdvanceAnimation
  ;if animation timer is zero, advance animation
  lda entitiesanimationaddresslo, x ; retrieve stored address of our current animation data
  sta readpointer
  lda entitiesanimationaddresshi, x 
  sta readpointer+1 
  ldy entitiesanimationtrack, x ; use stored value to index into animation data 
  lda (readpointer), y ; read animation data at current pos
  .AnimationProcessByte
  ; cmp #$ff ;ff = loop
  bpl NoAnimationLoop ; if not ff, continue
    ;else reset from star of animation
    ldy #$00
    lda (readpointer), y ;load first byte of animation data (frame index)
    pha ; store temporarily
    iny 
    lda (readpointer), Y ;load second byte (duration)
    sta entitiesanimationtimer, x
    pla ;retrieve sprite index
    jsr FetchSpriteAddress
    lda #$02
    sta entitiesanimationtrack, x ;advance track past the first 2 bytes, since we just processed them
    lda #00
    rts
  .NoAnimationLoop
  ;load next animation frame and timer
  pha
  iny 
  lda (readpointer), y 
  sta entitiesanimationtimer, x
  inc entitiesanimationtrack, x 
  inc entitiesanimationtrack, x 
  pla
  jsr FetchSpriteAddress
  lda #$00
rts
   
.EnterState


.ActionNoAction
rts

.ActionMoveLeft
  lda #$01
  sta entitiesfliphorizontally,x
  ;if we aren't moving, init the run animation
  lda entitiesvxhi, x 
  ora entitiesvxlo, x 
  bne dontinitrunanimationleft; if vxhi and vxlo == 0, this is the first frame we're running so we need to init the animation
  lda #$01
  sta variable1
  jsr InitAnimation
  .dontinitrunanimationleft
  lda #PLAYER_ACCELERATION
  sta variable1
  lda #0
  sta variable2
  jsr SubxVelocity
rts

.ActionMoveRight
  lda #$00
  sta entitiesfliphorizontally,x
  ;if we aren't moving, init the run animation
  lda entitiesvxhi, x 
  ora entitiesvxlo, x 
  bne dontinitrunanimationright ; if vxhi and vxlo == 0, this is the first frame we're running so we need to init the animation
  lda #$01
  sta variable1
  jsr InitAnimation
  .dontinitrunanimationright
  ; add acceleration
  lda #PLAYER_ACCELERATION
  sta variable1
  lda #0
  sta variable2
  jsr AddxVelocity
rts

.ActionJump
  lda jumpstrengthlo
  sta entitiesvylo, x 
  lda jumpstrengthhi
  sta entitiesvyhi, x
  lda #01
  sta allowedjumps
  lda #$04 
  sta waction
rts

.ActionDoubleJump
  lda allowedjumps
  beq nodoublejumpallowed
  dec allowedjumps
  lda #00
  sta entitiesvylo, x 
  lda jumpstrengthhi
  asl a 
  sta entitiesvyhi, x
  lda #01
  .nodoublejumpallowed
rts

.ActionWallJump

.ActionInvertGravity
  lda globalgravityhi
  eor #$ff
  sta globalgravityhi
  lda jumpstrengthhi
  eor #$ff
  sta jumpstrengthhi
rts

.StoreLastFrameData
  ; copy data before its modified
  ; this is used to correctly clear sprites
  lda entitiesdrawposlo, x 
  sta entitiesdrawposlolastframe, x 
  lda entitiesdrawposhi, x 
  sta entitiesdrawposhilastframe, x 
  lda entitiesxpos, x 
  sta entitiesxposlastframe, x 
  lda entitiesypos, x 
  sta entitiesyposlastframe, x
rts