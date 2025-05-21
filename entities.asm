;;;;;;
;ENTITIES
;;;;;;

.CreateEntity ; var1=x var2=y var3= type
  ldy #00
    .CreateEntityLoop ; search for an empty slot
      lda entitiestype, x 
      bne NextEntityLoop ; if there is an entity here already, check the next one
      lda variable1 ; else store position and type in this slot
      sta entitiesxpos, x 
      lda variable2
      sta entitiesypos, x
      ; lda variable3
      ; bmi NoSetPosNonStatic
      ; lda entitiesypos, x 
      ; clc 
      ; adc #$08
      ; sta entitiesypos, x 
      ; .NoSetPosNonStatic
      lda variable3
      bpl NoCreateStatic
      sta entitiesstatic, x 
      sec 
      sbc #128
      .NoCreateStatic
      sta entitiestype, x 
      lda variable3
      bpl NoStaticWidth
      lda #$10
      equb BITSKIP2
      .NoStaticWidth
      lda #$07
      sta entitieswidth, x 
      sta entitiesheight, x 

      jsr prng
      and #%00000001
      sta entitiesspecial, x 

      jsr CalculateDrawOffset
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

; .ProcessEntities
;   ;iterate over every entity and process their behaviour  
;   ldx #NUMENTITIES-1
;   pha
;   .ProcessEntitiesLoop
;     lda entitiestype, x 
;     beq NoEntityInSlot
;     jsr StoreLastFrameData
;     ; could cache this at the start of the loop
;     ; save 2 cycles per entity over 5 entities
;     ; so 10 cycles if all 10 entity slots are filled is probably not worth the bytes 
;     lda #>EndProcessEntity
;     pha 
;     lda #<EndProcessEntity-1
;     pha

;     lda entitiesstate, x 
;     tay 
;     lda EntityStatesHi, y 
;     pha 
;     lda EntityStatesLo, y 
;     pha 

;     tax 
;     pha
;   .NoEntityInSlot
;     dex
;     bpl ProcessEntitiesLoop
;     pla 
;     tax 
;     stx currententity
;     ; ldx #$00
;     ; stx currententity
; rts

; .EndProcessEntity
;   jsr SetEntityDrawPosition
;   pla
;   tax 
;   stx currententity
;   ; inc currententity
;   ; ldx currententity
; rts

.ProcessEntities
  ;iterate over every entity and process their behaviour

  ; lda framecounter
  ; lsr a 
  ; bcc ProcessEvenFrames
  ; ldx #1
  ; equb BITSKIP2
  ; .ProcessEvenFrames
  

  ldx #NUMENTITIES-1
  .ProcessEntitiesLoop
    lda entitiestype, x 
    beq NoEntityInSlot ; if no entity, we rts to entitycomplete and start a new loop
    stx currententity ; storing this means we can use the x register in this loop then reload it if we need to
    ; set up rts jump to process the end of this entity loop

    lda #>EntityComplete 
    pha
    lda #<EntityComplete-1
    pha

    ;else set up rts jump to state function
    jsr StoreLastFrameData
    lda entitiesstate, x 
    tay 
    lda EntityStatesHi, y 
    pha 
    lda EntityStatesLo, y 
    pha 
    .JumpToEntityFunctions
    rts

  .EntityComplete
    ; loop until we've gone over every entity and done their behaviour
    ldx currententity
    jsr SetEntityDrawPosition
    .NoEntityInSlot
    dex
    bpl ProcessEntitiesLoop
rts

.GenericInit
  ; lda entitiesstatic, x 
  ; bne StaticInit
  ; lda entitiesypos, x 
  ; clc 
  ; adc #$08
  ; sta entitiesypos, x 
  ; .StaticInit

  ldy entitiestype, x 
  lda EntityStatesInitial, y
  sta entitiesstate, x 
  jsr StoreXYAsVariable
  jsr CalculateDrawOffset
  lda drawaddress
  sta entitiesdrawposlo, x
  lda drawaddress+1
  sta entitiesdrawposhi, x 
  ldy entitiestype, x 
  lda EntityAnimationInitial, y
  jmp InitAnimation

.ProcessPlayer
  jsr PlayerInput
  jsr TestMovementX
  inc entitiesypos,x
  lda #PLAYER_FRICTION
  sta variable1
  jsr ApplyFriction
  jsr LimitSpeed
  jsr TestMovementY
  ; if we didn't hit the ground, shift state and end function
  bne playercollidedwithground
    ldy #PLAYERSTATEFALLING
    jmp PlayerEnterState
  .playercollidedwithground
  jsr SpriteCollide
  jsr CheckForSpecialTileEffect
  jmp AnimateSprite
  ; jmp CollideWithStaticEntities



.ProcessPlayerWallSliding
  lda entitiesxpos, x 
  pha
  jsr PlayerInput
  lda entitiesfliphorizontally, x 
  bne checkslideleft
  .checkslideright
  inc entitiesxpos, x 
  equb BITSKIP2 ; use a bit instruction to skip next 2 bytes
  .checkslideleft
  dec entitiesxpos, x 
  jsr TestMovementX
  lda lastxcollision
  bne nofalloffwallslide
  pla 
  sta entitiesxpos, x 
  ldy #PLAYERSTATEFALLING
  jmp PlayerEnterState
  .nofalloffwallslide
  pla
  lda #WALLSLIDESPEEDLO
  ldy #WALLSLIDESPEEDHI
  jsr AddyVelocity
  jsr TestMovementY
  beq noendwallslide2
  ldy #PLAYERSTATEONFLOOR
  jmp PlayerEnterState 
  .noendwallslide2
  jsr SpriteCollide
  rts

.ProcessPlayerJumping ; (Crouching)

  rts

.ProcessPlayerFalling
  jsr PlayerInput
  .nostatechangejumping1
  ; add and apply gravity1
  lda globalgravitylo
  ldy globalgravityhi
  jsr AddyVelocity
  jsr LimitSpeed
  jsr TestMovementX
  jsr TestMovementY 
  beq playerstillfalling
    ldy #PLAYERSTATEONFLOOR
    jsr PlayerEnterState
  .playerstillfalling
  ;check for wall slide 
  jsr CheckForWallslide
  .nowallslide1
  jsr SpriteCollide
  jsr AnimateSprite
  ; jmp CollideWithStaticEntities
  rts

;crawler behaviour
  ; Continue in same direction
  ; Lower into the floor/ceiling at a right angle to the direction
  ; check for collision
  ; if colliding, reset position and continue 
  ; else shift state to continue in a new direction

.ProcessCrawlerRight
  inc entitiesxpos, x 
  jsr CrawlerDirSwitchY
  dec entitiesypos, x 
  jmp AnimateSprite


.ProcessCrawlerDown
  inc entitiesypos, x 
  jmp AnimateSprite


.CrawlerDirSwitchX

.CrawlerDirSwitchY
  ; check down
  inc entitiesypos, x 
  jsr CollideWithTileMap
  lda scratch7
  ora scratch8
  beq CrawlerXSwitch
  dec entitiesypos, x 
  dec entitiesypos, x 
  jsr CollideWithTileMap
  lda scratch5
  ora scratch6
  beq CrawlerXSwitch
  inc entitiesypos, x 


  .CrawlerXSwitch
  dec entitiesxpos, x 
  jsr CollideWithTileMap
  lda scratch7
  ora scratch8
  beq NoCrawlerSwitchDown
  inc entitiesstate, x 
  inc entitiesxpos, x 
  jmp AnimateSprite
  .NoCrawlerSwitchDown
  dec entitiesypos, x 
  dec entitiesypos, x
  jsr CollideWithTileMap
  lda scratch5
  ora scratch8
  beq NoCrawlerSwitchUp
  rts
  .NoCrawlerSwitchUp
  rts

.ProcessHBouncer
  lda entitiesfliphorizontally, x 
  beq HBouncerRight
  dec entitiesxpos, x 
  equb BITSKIP2
  .HBouncerRight
  inc entitiesxpos, x 
  jsr CollideWithTileMap
  lda scratch5
  ora scratch6
  ora scratch7
  ora scratch8
  beq NoBouncerHFlip
  lda entitiesfliphorizontally, x 
  eor #$01
  sta entitiesfliphorizontally, x 
  jmp ProcessHBouncer
  .NoBouncerHFlip
  rts

.ProcessVBouncer
  lda entitiesspecial, x 
  beq VBouncerDown
  dec entitiesypos, x 
  equb BITSKIP2
  .VBouncerDown
  inc entitiesypos, x 
  jsr CollideWithTileMap
  lda scratch5
  ora scratch6
  ora scratch7
  ora scratch8
  beq NoBouncerFlip
  ; lda #SOUNDJUMP
  ; sta variable1
  ; jsr PlaySound
  lda entitiesspecial, x 
  eor #$01
  sta entitiesspecial, x 
  jmp ProcessVBouncer
  .NoBouncerFlip
  rts
  jmp AnimateSprite

.ProcessBouncerEnabled
  jmp AnimateSprite

.ProcessBouncerDisabled
  dec entitiesanimationtimer, x 
  bne NoBouncerReenable
  lda #24
  sta entitiesstate, x 
  lda #18
  sta entitiestype, x 
  .NoBouncerReenable
rts

.PlayerInput

  lda #KEYW
  jsr CheckKey
  beq noplayerw
  ldy waction
  jsr DoAction
  .noplayerw

  lda #KEYA
  jsr CheckKey
  beq noplayera
  ldy aaction
  jsr DoAction
  .noplayera

  lda #KEYD
  jsr CheckKey
  beq noplayerd
    ldy daction
    jsr DoAction
  .noplayerd

  lda #KEYK
  jsr CheckKey
  cmp #2
  bne noplayerk
    ldy kaction
    jsr DoAction
  .noplayerk

  lda #2
  jsr CheckKey
  beq noplayerl
    ldy saction
    jsr DoAction
  .noplayerl

  lda #128
  jsr CheckKey
  cmp #2
  bne noplayerreturn
    ldy returnaction
    jmp DoAction
  .noplayerreturn
rts

.ProcessPlayerDiving
  ; jsr StoreLastFrameData
  lda globalgravitylo
  ldy globalgravityhi
  jsr AddyVelocity
  ; jsr LimitSpeed
  jsr TestMovementX
  jsr TestMovementY 
  beq playerstilldiving
    ldy #PLAYERSTATESLIDING
    jsr PlayerEnterState
  .playerstilldiving
  jsr CheckForWallslide
  .nowallslide3

  jsr SpriteCollide
  jsr AnimateSprite
rts
  ; jmp CollideWithStaticEntities
; jmp EntityComplete

.ProcessPlayerSliding
  jsr PlayerInput
    ; add and apply gravity
  lda globalgravitylo
  ldy globalgravityhi
  jsr AddyVelocity
  lda #PLAYER_FRICTION_SLIDING
  sta variable1
  jsr ApplyFriction
  ; jsr LimitSpeed
  jsr TestMovementX
  beq slidingdidnothitwall
    ldy #PLAYERSTATEONFLOOR
    jsr PlayerEnterState
  .slidingdidnothitwall
  jsr TestMovementY
  lda entitiesvxhi, x 
  ora entitiesvxlo, x 
  bne slidingnostop
    ldy #PLAYERSTATEONFLOOR
    jsr PlayerEnterState
  .slidingnostop
  jsr SpriteCollide
  jsr AnimateSprite
  jsr CheckForSpecialTileEffect
  ; jmp CollideWithStaticEntities
rts

.ProcessPlayerOnLadder
  lda #KEYW
  jsr CheckKey
  beq noladderup
  jsr AnimateSprite
  dec entitiesypos, x 
  .noladderup
  lda #KEYS
  jsr CheckKey
  beq noladderdown
  jsr AnimateSprite
  inc entitiesypos, x 
  .noladderdown
  lda #KEYA
  jsr CheckKey
  beq noladderleft
  dec entitiesxpos, x 
  .noladderleft
  lda #KEYD
  jsr CheckKey
  beq noladderight
  inc entitiesxpos, x 
  .noladderight
  jsr TestMovementX
  jsr TestMovementY
  lda scratch9
  bmi noexitladder
    ldy #PLAYERSTATEFALLING
    jsr PlayerEnterState
  .noexitladder
  ; jmp CollideWithStaticEntities
rts

.TestMovementX
  ; attempts to move the entitiy according to their x velocity
  ; if it collides, it will set them back outside the colliding wall
  ; if it collides, it will set lastxcollision to the collision bits of whatever it collided with, else set it to zero
  ; jsr StoreXYAsVariable
  jsr ApplyxVelocity ; move entity
  jsr CollideWithTileMap
  ; lda entitiesvxhi, x 
  ; bmi TestxLoopL
  .TestxLoopR ; check for rightcollision
    lda scratch6 ;s6/8 are right hand points on sprite and > 0 if a collision was deteced
    ora scratch8 ; we only care if either is > 0, so ora them to combine both bits
    sta lastxcollision
    lsr a 
    bcc TestxLoopL
    lda entitiesxpos, x ; else load position
    and #%11111000 ;mask bottom 3 bits to snap the position to a 8x8 grid
    sta entitiesxpos, x
    lda #$01 ; return 1, as we collided
    rts
  .TestxLoopL
    lda scratch5
    ora scratch7
    sta lastxcollision
    lsr a 
    bcc XTestNoCollide
    lda entitiesxpos, x
    and #%11111000
    clc 
    adc #8
    sta entitiesxpos, x 
    lda #$01
    rts
  .XTestNoCollide
  lda #00 ; if no collision, return 0
  sta lastxcollision
rts
.TestMovementY ;returns 0 if no collide down, 1 if collide y
  ; jsr StoreXYAsVariable
  jsr ApplyyVelocity
  jsr CollideWithTileMap
  .TestyLoopU
    lda scratch5
    ora scratch6
    sta lastycollision
    lsr a 
    bcc TestyLoopD
    sta lastycollision
    lda entitiesypos, x 
    and #%11111000
    clc 
    adc #8
    sta entitiesypos, x 
    lda #1
    rts 
  .TestyLoopD
    lda scratch7
    ora scratch8
    sta lastycollision
    lsr a 
    bcc yTestNoCollide
    lda entitiesypos, x 
    and #%11111000
    sta entitiesypos, x
    lda #1
    rts
  .yTestNoCollide
  lda #00 
  sta lastycollision
rts

.CheckForSpecialTileEffect
  lda lastycollision
  bpl NoSpecialBit8
  .NoSpecialBit8
  lsr a ;skip over bit 1 (collision bit)
  lsr a
  bcc NoSpecialBit2
  ;bouncepad
  pha
  ldy #PLAYERSTATEBOUNCING
  jsr PlayerEnterState
  pla
  .NoSpecialBit2
  lsr a
  bcc NoSpecialBit3
  ;Conveyor Belt Right
  pha
  lda entitiesxposlo, x 
  clc 
  adc #CONVEYORBELTSPEED
  sta entitiesxposlo, x 
  lda entitiesxpos, x 
  adc #0
  sta entitiesxpos, x 
  pla
  .NoSpecialBit3
  lsr a
  bcc NoSpecialBit4
  ;conveyor belt left
  pha
  lda entitiesxposlo, x 
  sec 
  sbc #CONVEYORBELTSPEED
  sta entitiesxposlo, x 
  lda entitiesxpos, x 
  sbc #0
  sta entitiesxpos, x 
  pla
  .NoSpecialBit4
  lsr a
  bcc NoSpecialBit5
  .NoSpecialBit5
  lsr a
  bcc NoSpecialBit6
  .NoSpecialBit6
  lsr a
  bcc NoSpecialBit7
  .NoSpecialBit7
rts

.AddyVelocity
; a= velocity lo, y = velocity hi to add
  adc entitiesvylo, x 
  sta entitiesvylo, x 
  tya
  adc entitiesvyhi, x 
  sta entitiesvyhi, x 
rts

.SubyVelocity
    lda entitiesvylo, x 
    sbc variable1
    sta entitiesvylo, x 
    lda entitiesvyhi, x 
    sbc variable2
    sta entitiesvyhi, x 
rts

.ApplyxVelocity
  lda entitiesvxlo, x 
  ora entitiesvxhi, x 
  beq EndApplyxVelocity
  lda #3
  sta entitiesredraw, x 

  lda entitiesvxlo, x 
  adc entitiesxposlo, x 
  sta entitiesxposlo, x 

  lda entitiesxpos, x 
  adc entitiesvxhi, x 
  sta entitiesxpos, x
  .EndApplyxVelocity
rts

.ApplyyVelocity
  lda entitiesvylo, x 
  ora entitiesvyhi, x 
  beq EndApplyyVelocity
  lda #3
  sta entitiesredraw, x 

  lda entitiesvylo, x 
  adc entitiesyposlo, x 
  sta entitiesyposlo, x 

  lda entitiesypos, x 
  adc entitiesvyhi, x 
  sta entitiesypos, x
  .EndApplyyVelocity
rts

.CheckForWallslide
  ; lda entitiesvxhi, x 
  ; beq nowallslide
  lda lastxcollision
  beq nowallslide
  ldy #PLAYERSTATEWALLSLIDING
  jmp PlayerEnterState ;tailcall
  .nowallslide
rts

.ApplyFriction
		; ldy #0
		; jsr SetPalette
    ; ldx currententity
  lda entitiesvxhi, x 
  ora entitiesvxlo, x 
  beq EndApplyFriction
  lda entitiesvxhi, x 
  bmi ApplyFrictionLeft
  .ApplyFrictionRight
  lda #$00
  sta variable2
  jsr SubxVelocity
  lda entitiesvxhi, x 
  bpl EndApplyFriction
  bmi ZeroXVelocity ;always branch
  ;tailcall
  .ApplyFrictionLeft
  lda variable1
  ldy #$00
  jsr AddxVelocity
  lda entitiesvxhi, x 
  bmi EndApplyFriction
  bpl ZeroXVelocity ;always branch
  .EndApplyFriction
		; ldy #1
		; jsr SetPalette
    ; ldx currententity
rts

.ZeroXVelocity
  lda #$00
  sta entitiesvxhi, x 
  sta entitiesvxlo, x 
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
    jmp NoSpeedLimitRight
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
  jsr StoreXYAsVariable
  jsr CalculateDrawOffset
  lda drawaddress
  sta entitiesdrawposlo, x
  lda drawaddress+1
  sta entitiesdrawposhi, x 
rts

.FetchSpriteAddress
  ;x = entity identity
  ;a = sprite number to get
  sta scratch1
  lda entitiesstatic, x 
  bne FetchSpriteAddressStatic
  ldy scratch1
  lda SpritesLo, y 
  sta entitiesspriteaddresslo, x 
  ldy scratch1
  lda SpritesHi, y 
  sta entitiesspriteaddresshi, x
rts

.FetchSpriteAddressStatic
  lda scratch1
  tay 
  lda StaticSpritesLo, y 
  sta entitiesspriteaddresslo, x
  lda StaticSpritesHi,y 
  sta entitiesspriteaddresshi, x
rts

.ActionNoAction
rts

.ActionViewMem
; flip bit that triggers display of low memory to screen
	lda viewmem
	eor #$01
	sta viewmem
rts

.ActionMoveLeft
  inc entitiesfliphorizontally,x
  ;if we aren't moving, init the run animation
  lda entitiesvxhi, x 
  ora entitiesvxlo, x 
  bne dontinitrunanimationleft; if vxhi and vxlo == 0, this is the first frame we're running so we need to init the animation
  lda #PLAYERANIMATIONWALKRIGHT
  jsr InitAnimation
  .dontinitrunanimationleft
  lda #PLAYER_ACCELERATION
  sta variable1
  lda #0
  sta variable2
  ;allow to fall through to sub velocity

.SubxVelocity
    lda entitiesvxlo, x 
    sbc variable1
    sta entitiesvxlo, x 
    lda entitiesvxhi, x 
    sbc variable2
    sta entitiesvxhi, x 
rts


.ActionMoveRight

  ;if we aren't moving, init the run animation
  lda entitiesvxhi, x 
  ora entitiesvxlo, x 
  bne dontinitrunanimationright ; if vxhi and vxlo == 0, this is the first frame we're running so we need to init the animation
  lda #PLAYERANIMATIONWALKRIGHT
  jsr InitAnimation
  .dontinitrunanimationright
  ; add acceleration
  lda #0
  sta entitiesfliphorizontally,x
  tay
  lda #PLAYER_ACCELERATION
  sta variable2
  ;allow to fall through to add vel

.AddxVelocity
  ;vel lo in a, vel hi in y
  adc entitiesvxlo, x 
  sta entitiesvxlo, x 
  tya
  adc entitiesvxhi, x 
  sta entitiesvxhi, x 
rts

.ActionInteract
  ; jsr CollideWithStaticEntities ; return an overlapping static entitiy in y and entitiy type in a
  beq NoInteract
  tay 
  lda StaticEntityInteractionsHi, y 
  pha 
  lda StaticEntityInteractionsLo, y 
  pha 
rts
.NoInteract

; check for ladder
  ; lda lastycollision
  ; bpl noladderinteract
  ; ldy #PLAYERSTATEONLADDER
  ; jsr PlayerEnterState
  ; .noladderinteract
  ; and %01000000
  ; bne noterminalinteract
  ; ldy #GAMESTATEDISPLAYINGTEXT
  ; jmp entergamestate ;tailcall
  ; .noterminalinteract
rts

.InteractionPrintNPC
.InteractionPrintTablet
  ldy #1
  jsr PrintString
    lda bufferflag
    eor #$01
    sta bufferflag
  ldy #3
  sta gamestate
  ldx #$ff
  txs 
  jmp mainloop

rts


.ActionPause

.ActionJump
  lda jumpstrengthhi
  sta entitiesvyhi, x 
  lda jumpstrengthlo
  sta entitiesvylo, x
  lda #INITIALGRAVITYHI
  sta globalgravityhi
  lda #INITIALGRAVITYLO
  sta globalgravitylo
  inc jumpedthisframe
  ldy #ACTIONSETJUMPING
  jsr LoadActionSet
  ldy #PLAYERSTATEFALLING
  jsr PlayerEnterState
  lda #SOUNDJUMP
  sta variable1
  jmp PlaySound
;tailcall

.ActionDoubleJump
  ; lda allowedjumps
  ; beq nodoublejumpallowed
  ; dec allowedjumps
  ; lda jumpstrengthlo
  ; sta entitiesvylo, x 
  ; lda jumpstrengthhi
  ; sta entitiesvyhi, x
  ; lda #01
  ; .nodoublejumpallowed
rts

.ActionWallJump
  inc jumpedthisframe
  ldy #PLAYERSTATEFALLING
  jsr PlayerEnterState
  ldy #ACTIONSETJUMPING
  jsr LoadActionSet
  lda #WALLJUMPYHI
  sta entitiesvyhi, x 
  lda #WALLJUMPYLO
  sta entitiesvylo, x

  lda entitiesfliphorizontally, x 
  beq walljumpleft
  lda #$00
  sta entitiesfliphorizontally, x 
  lda #WALLJUMPRIGHTXLO
  sta entitiesvxlo, x
  lda #WALLJUMPRIGHTXHI
  sta entitiesvxhi, x
  rts
  .walljumpleft
  lda #$01 
  sta entitiesfliphorizontally, x 
  lda #WALLJUMPLEFTXLO
  sta entitiesvxlo, x
  lda #WALLJUMPLEFTXHI
  sta entitiesvxhi, x
rts

.ActionInvertGravity
  ; lda globalgravityhi
  ; eor #$ff
  ; sta globalgravityhi
  ; lda jumpstrengthhi
  ; eor #$ff
  ; sta jumpstrengthhi
rts

.ActionDive
  ldy #PLAYERSTATEDIVING
  jmp PlayerEnterState
;tailcall

.StoreLastFrameData
  ; copy data before its modified by an update
  ; this is used to correctly clear sprites from the last frame
  lda entitiesdrawposlo, x 
  sta entitiesdrawposlolastframe, x 
  lda entitiesdrawposhi, x 
  sta entitiesdrawposhilastframe, x 
  lda entitiesxpos, x 
  sta entitiesxposlastframe, x 
  lda entitiesypos, x 
  sta entitiesyposlastframe, x
rts

.ReloadEntities
  ; clear current entities
  ldy #NUMENTITIES-1
  .ReloadClearEntitiesLoop
  lda entitiestype, y 
  cmp #1 
  beq NextReloadClearEntitiesLoop
  lda #$00
  sta entitiestype, y 
  .NextReloadClearEntitiesLoop
  dey 
  bpl ReloadClearEntitiesLoop
  ; y = ff here
  jsr CalcMapPosIndex 
.FindScreenEntitiesLoop
  iny ; wind y back to zero and save a load
  lda (readpointer), y 
  cmp #$ff
  bne FindScreenEntitiesLoop
  iny 
  lda (readpointer), y 
  .LoadScreenEntitiesLoop
  cmp #$ff
  beq EndLoadScreenEntitiesLoop
  and #%11110000
  ; clc 
  ; adc #8
  sta variable1
  lda (readpointer), y 
  jsr Mult16
  ; clc 
  ; adc #8
  sta variable2
  iny 
  lda (readpointer), y 
  sta variable3
  tya 
  pha 
  lda readpointer
  pha
  lda readpointer+1
  pha
  jsr CreateEntity
  pla 
  sta readpointer+1
  pla 
  sta readpointer
  pla 
  tay 
  iny 
  lda (readpointer), y 
  jmp LoadScreenEntitiesLoop
  .EndLoadScreenEntitiesLoop
rts


.Respawn
  ; jmp PrintDeath
  lda #ETANKDEFAULTLO
  sta ETank
  LDA #ETANKDEFAULTHI
  sta ETank+1
  jsr ZeroXVelocity
  jsr ZeroYVelocity
  lda playerrespawn
  sta mapposx
  lda playerrespawn+1
  sta mapposy
  lda #ENTITYPLAYER
  jsr GetEntity
  lda playerrespawn+2
  sta entitiesxpos, y 
  lda playerrespawn+3
  sta entitiesypos, y 
  jsr ReloadScreen
  jsr ContinueUpdate ; skip to the UI update past any checks to force an update
  ldx #$ff
  txs 
  jmp mainloop

.SetSpawn
  ; lda mapposx
  ; sta playerrespawn
  ; lda mapposy
  ; sta playerrespawn+1
  ; lda staticentitiesxpos, y 
  ; sta playerrespawn+2
  ; lda staticentitiesypos, y 
  ; sta playerrespawn+3
rts

.CheckForMapChange
  lda triggermapchange
  beq nomapchange
    tay 
    lda #$00
    sta triggermapchange
    lda MapChangeFunctionsHi, y 
    pha 
    lda MapChangeFunctionsLo, y 
    pha 
  .nomapchange
rts

.IncWith16OverFlowCheck
  sta scratch1
  inc scratch1
  lda #16
  bit scratch1
  beq No16OverFlow
  lda #00
  rts
  .No16OverFlow
  lda scratch1
rts

.DecWith16UnderFlowCheck
  sta scratch1
  dec scratch1
  bpl No16UnderFlow
  lda #15
  rts
  .No16UnderFlow
  lda scratch1
rts

.MapChangeNone ; never called
.MapChangeLeft
  lda mapposx
  jsr DecWith16UnderFlowCheck
  sta mapposx
  bpl EndMapChange ;always branch
.MapChangeRight
  lda mapposx
  jsr IncWith16OverFlowCheck
  sta mapposx
  bpl EndMapChange ;always branch
.MapChangeUp
  lda mapposy
  jsr DecWith16UnderFlowCheck
  sta mapposy
  bpl EndMapChange ;always branch
.MapChangeDown
  lda mapposy
  jsr IncWith16OverFlowCheck
  sta mapposy
  .EndMapChange
  jmp ReloadScreen
  
;tailcall


.PlayerEnterState ; new state in y
  tya 
  sta entitiesstate, x 
  sta playerstatechanged
  lda PlayerNewStateFunctionsHi, y 
  pha
  lda PlayerNewStateFunctionsLo, y
  pha
rts

.PlayerEnterStateOnFloor
  lda #JUMPSTRENGTHHI
  sta jumpstrengthhi
  lda #JUMPSTRENGTHLO
  sta jumpstrengthlo

  lda #PLAYERANIMATIONWALKRIGHT
  jsr InitAnimation
  ldy #ACTIONSETONFLOOR
  jsr LoadActionSet ; always returns negative
  bmi ZeroYVelocity
;tailcall

.PlayerEnterStateSliding
  lda #PLAYERANIMATIONSLIDING
  jsr InitAnimation
  ldy #ACTIONSETSLIDING
  jsr LoadActionSet ; always returns negative
  bmi ZeroYVelocity
;tailcall

.ZeroYVelocity
  lda #$00
  sta entitiesvyhi, x 
  sta entitiesvylo, x 
rts

.PlayerEnterStateFalling
  ; lda jumpstrengthhi
  ; sta entitiesvyhi, x 
  ; lda jumpstrengthlo
  ; sta entitiesvylo, x
  lda #PLAYERANIMATIONJUMPING
  sta variable1
  jmp InitAnimation
;tailcall

.PlayerEnterStateJumping
  ; lda jumpstrengthhi
  ; sta entitiesvyhi, x 
  ; lda jumpstrengthlo
  ; sta entitiesvylo, x
  ; lda #PLAYERANIMATIONJUMPING
  ; sta variable1
  ; jmp InitAnimation
;tailcall


.PlayerEnterStateBouncing
  lda #SOUNDBOUNCE
  jsr PlaySound
  ldy #ACTIONSETJUMPING
  jsr LoadActionSet
  lda #BOUNCESTRENGTHHI
  sta entitiesvyhi, x 
  lda #BOUNCESTRENGTHLO
  sta entitiesvylo, x
  lda #PLAYERSTATEFALLING
  sta entitiesstate, x 
  rts
  ; lda #PLAYERANIMATIONWALKRIGHT
  ; sta variable1
  ; jmp InitAnimation
;tailcall

.PlayerEnterStateWallSliding
  ldy #ACTIONSETWALLSLIDING
  jsr LoadActionSet
  jsr ZeroXVelocity
  lda #WALLSLIDEINITIALSPEEDHI
  sta entitiesvyhi, x 
  lda #WALLSLIDEINITALSPEEDLO
  sta entitiesvylo, x 
  lda #PLAYERANIMATIONWALLSLIDING
  sta variable1
  jmp InitAnimation
;tailcall

.PlayerEnterStateOnLadder
  lda #$00
  jsr ZeroXVelocity
  jsr ZeroYVelocity
  lda #PLAYERANIMATIONCLIMBLADDER
  sta variable1
  jmp InitAnimation
;tailcall

.ProcessEntityAnimate
  jmp AnimateSprite
  ; jmp EndProcessEntity

.ProcessEntityDoorClosed
  lda uiflags
  bpl NoSwitchToOpenDoor

  lda #ENTITYPLAYER
  jsr GetEntity
  jsr DistanceTo
  cmp #DOOROPENDIST
  bcs NoSwitchToOpenDoor
  ldx currententity
  lda #STATEDOOROPEN
  sta entitiesstate, x 
  lda #ANIMATIONDOOROPEN
  jsr InitAnimation
  lda entitiesxpos, x 
  sta variable1
  lda entitiesypos, x 
  sta variable2
  lda #0
  jsr WriteToCollisionMap
  .NoSwitchToOpenDoor
  jmp AnimateSprite

.ProcessEntityDoorOpen
  lda uiflags
  bpl NoSwitchToClosedDoor

  lda #ENTITYPLAYER
  jsr GetEntity
  jsr DistanceTo
  cmp #DOOROPENDIST
  bcc NoSwitchToClosedDoor
  ldx currententity
  lda #STATEDOORCLOSED
  sta entitiesstate, x 
  lda #ANIMATIONDOORCLOSE
  jsr InitAnimation
  lda entitiesxpos, x 
  sta variable1
  lda entitiesypos, x 
  sta variable2
  lda #1
  jsr WriteToCollisionMap
  .NoSwitchToClosedDoor
  jmp AnimateSprite

.ProcessEntityProjectile
  lda entitiesvxhi, x 
  ora entitiesvxlo, x 
  beq NoProjectileXMovement
  jsr TestMovementX
  .NoProjectileXMovement
  lda entitiesvyhi, x 
  ora entitiesvylo, x 
  beq NoProjectileYMovement
  jsr TestMovementY
  .NoProjectileYMovement
  jsr CollideWithTileMap
  lda scratch5
  ora scratch6
  ora scratch7
  ora scratch8
  beq NoProjectileHit
  lda #$00
  sta entitiestype, x 
  .NoProjectileHit
  jmp AnimateSprite


.ProcessEntityPlatformVisible
  lda jumpedthisframe
  beq NoPlatformShiftToInVisible

  lda entitiesxpos, x 
  sta variable1
  lda entitiesypos, x 
  sta variable2
  lda #1
  jsr WriteToCollisionMap


  lda #13
  sta entitiesstate, x  
  lda #17
  jmp InitAnimation
  .NoPlatformShiftToInVisible
  jmp AnimateSprite

.ProcessEntityPlatformInvisible
  lda jumpedthisframe
  beq NoPlatformShiftToVisible

  lda entitiesxpos, x 
  sta variable1
  lda entitiesypos, x 
  sta variable2
  lda #0
  jsr WriteToCollisionMap

  lda #12
  sta entitiesstate, x  
  lda #16
  jmp InitAnimation
  .NoPlatformShiftToVisible
  jmp AnimateSprite

.ProcessEntitySpikeTrap
  lda #ENTITYPLAYER
  jsr GetEntity
  jsr DistanceTo
  cmp #DOOROPENDIST
  bcc NoSpikeTrapSwitch
  lda #15
  sta entitiesstate, x 
  lda #22
  jsr InitAnimation
  .NoSpikeTrapSwitch
  jmp AnimateSprite

.ProcessEntitySpikeTrapUp
  lda #ENTITYPLAYER
  jsr GetEntity
  jsr DistanceTo
  cmp #DOOROPENDIST
  bcs NoSpikeTrapSwitch2
  lda #14
  sta entitiesstate, x 
  lda #20
  jsr InitAnimation
  .NoSpikeTrapSwitch2
  jmp AnimateSprite

.ProcessEntityProjectileUpInit ;16
  jsr ZeroXVelocity ;returns 0
  sta entitiesvylo, x
  lda #$01
  sta entitiesvyhi, x 
  jmp EndProjectileInit
.ProcessEntityProjectileDownInit ;17
  jsr ZeroXVelocity ;returns 0
  sta entitiesvylo, x
  lda #$ff
  sta entitiesvyhi, x 
  jmp EndProjectileInit
.ProcessEntityProjectileLeftInit ;18
  jsr ZeroYVelocity ;returns 0
  sta entitiesvxlo, x
  lda #$ff
  sta entitiesvxhi, x 
  jmp EndProjectileInit
.ProcessEntityProjectileRightInit ;19
  jsr ZeroYVelocity ;returns 0
  sta entitiesvxlo, x
  lda #$01
  sta entitiesvxhi, x 
  jmp EndProjectileInit 
.EndProjectileInit
  lda #STATEMOVE
  sta entitiesstate, x 
  rts


.PlayerEnterStateDiving
  lda #PLAYERANIMATIONDIVING
  jsr InitAnimation
  ldy #ACTIONSETDIVING
  jsr LoadActionSet

  LDA #JUMPSTRENGTHSLIDINGHI
  sta jumpstrengthhi
  LDA #JUMPSTRENGTHSLIDINGLO
  sta jumpstrengthlo

  jsr ZeroYVelocity

  lda entitiesfliphorizontally, x 
  bne divingnoflip
  lda #DIVEFORCERIGHTLO
  sta entitiesvxlo, x
  lda #DIVEFORCERIGHTHI
  sta entitiesvxhi, x 
  rts
  .divingnoflip
  lda #DIVEFORCELEFTLO
  sta entitiesvxlo,x
  lda #DIVEFORCELEFTHI 
  sta entitiesvxhi, x 
  rts




.CheckForScreenExit
  lda #ENTITYPLAYER
  jsr GetEntity
  bmi EndScreenExitCheckEarly
  tya 
  tax
  lda entitiesxpos, x
  cmp #$f8
  bcc norightexit
    lda #$09
    sta entitiesxpos, x
    lda #1
    bpl EndScreenExitCheck ; always branches
  .norightexit
  cmp #$08
  bcs noleftexit
    lda #$f7
    sta entitiesxpos, x
    lda #$02
    bpl EndScreenExitCheck
  .noleftexit
  lda entitiesypos, x
  cmp #$fb
  bcc nodownexit
    lda #$09
    sta entitiesypos, x
    lda #$03
    bpl EndScreenExitCheck
  .nodownexit
  cmp #$08
  bcs EndScreenExitCheckEarly
    lda #$f7
    sta entitiesypos, x
    lda #$04
  .EndScreenExitCheckEarly
  rts
.EndScreenExitCheck
  sta triggermapchange
rts

.GetEntity ; returns first entity found of a given type
  ; target entity in a.
  ;destroys y, scratch1
  ;returns result in y
  sta scratch1
  ldy #NUMENTITIES-1
  .GetEntityLoop
    lda entitiestype, y
    cmp scratch1
    beq GetEntitySuccess
    dey 
    bpl GetEntityLoop
    ;falling through here means returning y = ff
  .GetEntitySuccess
    ;else entering here returns the entity in y
  rts

.StoreXYAsVariable
  lda entitiesxpos, x 
  sta variable1
  lda entitiesypos, x 
  sta variable2
rts






.LoadActionSet ; new action set in y
  lda ActionSetsLo, y
  sta readpointer
  lda ActionSetsHi, y 
  sta readpointer+1
  ldy #7
  .LoadActionSetLoop
    lda (readpointer), y 
    sta waction, y 
    dey 
    bpl LoadActionSetLoop
rts

.InitAnimation ; x = entity id, a = animation no
  ; initialises the first frame of an ani
  ;use entity type to get the appropriate list of animations for this entity
  tay 
  lda AnimationsLo, y 
  sta readpointer2
  sta entitiesanimationaddresslo, x
  lda AnimationsHi, y 
  sta readpointer2+1
  sta entitiesanimationaddresshi, x
  lda #$01
  sta entitiesanimationtrack, x 
  ldy #00
  lda (readpointer2), y ;load first byte of animation data (timer)
  sta entitiesanimationtimermax, x 
  txa
  adc #1
  sta entitiesanimationtimer, x
  iny 
  lda (readpointer2), y ;load second byte
  jmp FetchSpriteAddress


.AnimateSprite
  ; ticks down the timer for the current animation frame
  ; if 0, either switches to the next frame or processes a control
  dec entitiesanimationtimer, x 
  beq AdvanceAnimation ; if timer == 0, load a new sprite frame
  rts
  .AdvanceAnimation
  ;if animation timer is zero, advance animation
  lda #3
  sta entitiesredraw, x 

  lda entitiesanimationaddresslo, x ; retrieve stored address of our current animation data
  sta readpointer
  lda entitiesanimationaddresshi, x 
  sta readpointer+1 
  ldy entitiesanimationtrack, x ; use stored value to index into animation data 
  lda (readpointer), y ; read animation data at current pos
  .AnimationProcessByte
  bpl NoAnimationControlByte ; if not >127, branch
  ;else process control byte
  and #%01111111 ; -128
  tax
  lda AnimationControlBytesHi, x
  pha 
  lda AnimationControlBytesLo, x 
  pha 
  ldx currententity
  rts
  .NoAnimationControlByte
  ;load next animation frame and timer
  inc entitiesanimationtrack, x 
  lda entitiesanimationtimermax, x 
  sta entitiesanimationtimer, x
  lda (readpointer), y 
  jmp FetchSpriteAddress
.AniLoop
  lda #1 
  sta entitiesanimationtrack, x ;advance track past the first 2 bytes, since we just processed them
  sta entitiesanimationtimer, x 
  tay
  lda (readpointer), y ;load second byte (sprite index)
  jmp FetchSpriteAddress
  ;tailcall
.AniNewAnimation
  iny
  lda (readpointer), y 
  jmp InitAnimation
  ;tailcall

.AniDestroyEntity
  lda #0
  sta entitiestype, x 
  lda #SCREENADDRESS2HI
  sta variable1
  jsr SpriteClearPreparation
  lda #SCREENADDRESS1HI
  sta variable1
  jmp SpriteClearPreparation
  ;tailcall

.AniSetSpeed
  rts

.AniFlip
  inc entitiesanimationtrack, x 
  lda entitiesfliphorizontally, x 
  eor #$01
  sta entitiesfliphorizontally, x   
  jmp AdvanceAnimation

.CleanUp
  lda #$00
  sta jumpedthisframe

  inc framecounter
  lda framecounter
  cmp #50
  bne NoFrameCountReset
  lda #$00
  sta framecounter
  .NoFrameCountReset
rts

