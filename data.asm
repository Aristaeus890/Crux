

align &0100
;THESE META TILES MUST BE PAGE ALIGNED OR DRAWING TILES WILL NOT WORK.
.MetaTileEmpty
  equb 0,0,0,0
  equb 0,0,0,0
.MetaTileSolid
  equb 1,1,1,1 ; tile indices
  equb %00000001,%00000001,%00000001,%00000001
.MetaTileCorner1
  equb $09,$0d,$0d,$0d
  equb 1,1,1,1
.MetaTileCorner2
  equb $0d,$0d,$0d,$0a
  equb 1,1,1,1
.MetaTileCorner3
  equb $0d,$0d,$0d,$0b
  equb 1,1,1,1
.MetaTileCorner4
  equb $0c,$0d,$0d,$0d
  equb 1,1,1,1
.MetaTileDottedCorner1
  equb 6,7,8,9
  equb 1,1,1,1
.MetaTileDottedCorner2
  equb 6,7,8,9
  equb 1,1,1,1
.MetaTileDottedCorner3
  equb 6,7,8,9
  equb 1,1,1,1
.MetaTileDottedCorner4
  equb 6,7,8,9
  equb 1,1,1,1
.MetaTileCrystal1
  equb 10,11,12,13
  equb 0,0,0,0
.MetaTileCrystal2
  equb 14,15,16,17
  equb 0,0,0,0
.MetaTileHalfTop
  equb 0,0,1,1
  equb 0,0,1,1
.MetaTileHalfBottom
  equb 1,1,0,0
  equb 1,1,0,0
.MetaTileLadder
  equb $07,$08,$07,$08
  equb %10000000,%10000000,%10000000,%10000000
.MetaTileDotted
  equb 6,7,8,9
  equb 1,1,1,1
.MetaTileBouncePad
  equb 24,24,1,1
  equb %00000011,%00000011,1,1
.MetaTileBridgeLeft
  equb 1,1,1,25
  equb 1,1,1,1
.MetaTileBridgeRight
  equb 1,1,26,1
  equb 1,1,1,1
.MetaTileEarth
  equb 37,38,39,40
  equb 1,1,1,1
.MetaTileEarthLeft
  equb 37,41,39,42
  equb 1,1,1,1
.MetaTileEarthRight 
  equb 41,38,42,40
  equb 1,1,1,1
.MetaTileEarthCentre
  equb 41,41,42,42
  equb 1,1,1,1
.MetaTileEarthFadeOut1
  equb 43,43,44,44
  equb 1,1,1,1
.MetaTileEarthFadeOut2
  equb 45,45,46,46
  equb 1,1,1,1
.MetaTileEarthFadeOut3
  equb 47,48,47,48
  equb 1,1,1,1
.MetaTileEarthFadeOut4
  equb 49,50,49,50
  equb 1,1,1,1
  .MetaTileBrick1 ;27
  equb 58,58,59,59
  equb 1,1,1,1
  .MetaTileBrick2 ;28
  equb 59,59,60,60
  equb 1,1,1,1
  .MetaTileBrick3 ;29
  equb 61,62,61,62
  equb 1,1,1,1
  .MetaTileBrick4 ;30
  equb 63,61,63,61
  equb 1,1,1,1

.EmptyDataEntry

.StaticSpritesLo
  equb <StaticCrystal1
  equb <StaticCrystal2
  equb <StaticDoor1
  equb <StaticDoor2
  equb <StaticDoor3
  equb <StaticDoor4
  equb <StaticDoor5
  equb <StaticDoor6
  equb <StaticDoor7
  equb <StaticDoor8
  equb <InvisPlatform
  equb <VisPlatform
.StaticSpritesHi
  equb >StaticCrystal1;0
  equb >StaticCrystal2;1
  equb >StaticDoor1;2
  equb >StaticDoor2;3
  equb >StaticDoor3;4
  equb >StaticDoor4;5
  equb >StaticDoor5;6
  equb >StaticDoor6;7
  equb >StaticDoor7;8
  equb >StaticDoor8;9
  equb >InvisPlatform;10
  equb >VisPlatform;11

.StaticEntityInteractionsLo
  ; equb <EmptyDataEntry-1
  ; equb <InteractionPrintTablet-1
  ; equb <InteractionPrintTablet-1
  ; equb <InteractionPrintTablet-1
  ; equb <InteractionPrintTablet-1
  ; equb <InteractionPrintTablet-1
  ; equb <InteractionPrintTablet-1
  ; equb <InteractionPrintTablet-1
  ; equb <InteractionPrintTablet-1
.StaticEntityInteractionsHi
  ; equb >EmptyDataEntry
  ; equb >InteractionPrintTablet
  ; equb >InteractionPrintTablet
  ; equb >InteractionPrintTablet
  ; equb >InteractionPrintTablet
  ; equb >InteractionPrintTablet
  ; equb >InteractionPrintTablet
  ; equb >InteractionPrintTablet
  ; equb >InteractionPrintTablet

.NoStaticSprite


.StaticNPC1
  equw SpritePlayerIdle1
.StaticNPC2
  equw SpritePlayerIdle2




.StaticTablet1
  equw TilePatternTablet1
  equw TilePatternTablet2
  equw TilePatternTablet3
  equw TilePatternTablet4

.StaticTorchBig1
  equw TilePatternTorchBig1
  equw TilePatternTorchBig2
  equw TilePatternTorchBig3
  equw TilePatternTorchBig4
.StaticTorchBig2
  equw TilePatternTorchBig5
  equw TilePatternTorchBig6
  equw TilePatternTorchBig7
  equw TilePatternTorchBig8

.GameStatesLo
  equb <GameStateTitle-1
  equb <GameStatePlaying-1
  equb <GameStatePaused-1
  equb <GameStateDisplayingText-1

.GameStatesHi
  equb >GameStateTitle
  equb >GameStatePlaying
  equb >GameStatePaused
  equb >GameStateDisplayingText

.InitGameStatesLo
  equb <InitGameStateTitle-1
  equb <InitGameStatePlaying-1
  equb <InitGameStatePaused-1
  equb <InitGameStateDisplayingText-1


.InitGameStatesHi
  equb >InitGameStateTitle 
  equb >InitGameStatePlaying
  equb >InitGameStatePaused
  equb >InitGameStateDisplayingText

.InputActionsLo
  equb <ActionNoAction-1
  equb <ActionMoveLeft-1
  equb <ActionMoveRight-1
  equb <ActionJump-1
  equb <ActionDoubleJump-1
  equb <ActionWallJump-1
  equb <ActionInvertGravity-1
  equb <ActionDive-1
  equb <ActionInteract-1
  equb <ActionViewMem-1

.InputActionsHi
  equb >ActionNoAction
  equb >ActionMoveLeft
  equb >ActionMoveRight
  equb >ActionJump
  equb >ActionDoubleJump
  equb >ActionWallJump
  equb >ActionInvertGravity
  equb >ActionDive
  equb >ActionInteract
  equb >ActionViewMem



.MetaTileListHi
  equb >MetaTileEmpty ;0
  equb >MetaTileSolid;1
  equb >MetaTileCorner1;2
  equb >MetaTileCorner2;3
  equb >MetaTileCorner3;4
  equb >MetaTileCorner4;5
  equb >MetaTileDottedCorner1;6
  equb >MetaTileDottedCorner2;7
  equb >MetaTileDottedCorner3;8
  equb >MetaTileDottedCorner4;9
  equb >MetaTileCrystal1;10
  equb >MetaTileCrystal2;11
  equb >MetaTileHalfTop;12
  equb >MetaTileHalfBottom;13
  equb >MetaTileLadder;14
  equb >MetaTileDotted
  equb >MetaTileBouncePad
  equb >MetaTileBridgeLeft;17
  equb >MetaTileBridgeRight;18
  equb >MetaTileEarth ;19
  equb >MetaTileEarthLeft ;20
  equb >MetaTileEarthRight ;21
  equb >MetaTileEarthCentre;22
  equb >MetaTileEarthFadeOut1;23
  equb >MetaTileEarthFadeOut2;24
  equb >MetaTileEarthFadeOut3;25
  equb >MetaTileEarthFadeOut4;26
  equb >MetaTileBrick1 ;27
  equb >MetaTileBrick2 ;28
  equb >MetaTileBrick3 ;29
  equb >MetaTileBrick4 ;30

.TilePatternsHi
  equb >TilePatternEmpty ;00
  equb >TilePatternSolid;01
  equb >TilePatternSolidEdge1;02
  equb >TilePatternSolidEdge2;03
  equb >TilePatternSolidEdge3;04
  equb >TilePatternSolidEdge4;05
  equb >TilePatternDottedEdge1;06
  equb >TilePatternDottedEdge2;07
  equb >TilePatternDottedEdge3;08
  equb >TilePatternDottedEdge4;09
  equb >TilePatternCrystal1;10
  equb >TilePatternCrystal2;11
  equb >TilePatternCrystal3;12
  equb >TilePatternCrystal4;13
  equb >TilePatternCrystal5;14
  equb >TilePatternCrystal6;15
  equb >TilePatternCrystal7;16
  equb >TilePatternCrystal8;17
  equb >TilePatternTablet1;18
  equb >TilePatternTablet2;19
  equb >TilePatternTablet3;20
  equb >TilePatternTablet4;21
  equb >TilePatternLadderL;22
  equb >TilePatternLadderR;23
  equb >TilePatternBouncePad;24
  equb >TilePatternArch1;25
  equb >TilePatternArch2;26
  equb >TilePatternArch3;27
  equb >TilePatternArch4;28
  equb >TilePatternTorchBig1;29
  equb >TilePatternTorchBig2;30
  equb >TilePatternTorchBig3;31
  equb >TilePatternTorchBig4;32
  equb >TilePatternTorchBig5;33
  equb >TilePatternTorchBig6;34
  equb >TilePatternTorchBig7;35
  equb >TilePatternTorchBig8;36
  equb >TilePatternEarth1;37
  equb >TilePatternEarth2;38
  equb >TilePatternEarth3;39
  equb >TilePatternEarth4;40
  equb >TilePatternEarth5;41
  equb >TilePatternEarth6;42
  equb >TilePatternEarth7;43
  equb >TilePatternEarth8;44
  equb >TilePatternEarth9;45
  equb >TilePatternEarth10;46
  equb >TilePatternEarth11;47
  equb >TilePatternEarth12;48
  equb >TilePatternEarth13;49
  equb >TilePatternEarth14;50
  equb >TilePatternChain1;51
  equb >TilePatternChain2;52
  equb >TilePatternChain3;53
  equb >TilePatternDoor1;54
  equb >TilePatternDoor2;55
  equb >TilePatternDoor3;56
  equb >TilePatternDoor4;57
  equb >TilePatternBrick1;58
  equb >TilePatternBrick2;59
  equb >TilePatternBrick3;60
  equb >TilePatternBrick4;61
  equb >TilePatternBrick5;62
  equb >TilePatternBrick6;63

.SpritesLo
  equb <SpritePlayerRightRun1;0
  equb <SpritePlayerRightRun2;1
  equb <SpritePlayerRightRun3;2
  equb <SpritePlayerIdle1;3
  equb <SpritePlayerIdle2;4
  equb <SpritePlayerLadder1;5
  equb <SpritePlayerLadder2;6
  equb <SpritePlayerJumping1;7
  equb <SpritePlayerJumping2;8
  equb <SpritePlayerFalling1;9
  equb <SpritePlayerFalling2;0a/10
  equb <SpritePlayerWallSliding ;0b/11
  equb <SpritePlayerDiving;0c/12
  equb <SpritePlayerSliding;0d/13
  equb <SPProjectile1;14
  equb <SPProjectile2 ;15
  equb <SPProjectile3;16
  equb <SPProjectile4;17
  equb <SpriteFluid1;;18
  equb <SpriteFluid2;19
  equb <SpriteFluid3;20
  equb <SpriteFluid4;21
  equb <SpriteSpike1;22
  equb <SpriteSpike2;22
  equb <SpriteSpike3;22
  equb <SpriteSpike4;22
  equb <SpriteSpike5;22
  equb <SpriteSpike6;22
  equb <SpriteTeleportal1
  equb <SpriteTeleportal2
  equb <SpriteKey1
  equb <SpriteKey2

.SpritesHi
  equb >SpritePlayerRightRun1;0
  equb >SpritePlayerRightRun2;1
  equb >SpritePlayerRightRun3;2
  equb >SpritePlayerIdle1;3
  equb >SpritePlayerIdle2;4
  equb >SpritePlayerLadder1;5
  equb >SpritePlayerLadder2;6
  equb >SpritePlayerJumping1;7
  equb >SpritePlayerJumping2;8
  equb >SpritePlayerFalling1;9
  equb >SpritePlayerFalling2;0a/10
  equb >SpritePlayerWallSliding ;0b/11
  equb >SpritePlayerDiving;0c/12
  equb >SpritePlayerSliding;0d/13
  equb >SPProjectile1;14
  equb >SPProjectile2 ;15
  equb >SPProjectile3;16
  equb >SPProjectile4;17
  equb >SpriteFluid1;;18
  equb >SpriteFluid2;19
  equb >SpriteFluid3;20
  equb >SpriteFluid4;21
  equb >SpriteSpike1;22
  equb >SpriteSpike2;23
  equb >SpriteSpike3;24
  equb >SpriteSpike4;25
  equb >SpriteSpike5;26
  equb >SpriteSpike6;27
  equb >SpriteTeleportal1;28
  equb >SpriteTeleportal2;29
  equb >SpriteKey1;30
  equb >SpriteKey2;31
.AnimationsLo
  equb <AnimationPlayerIdle;0
  equb <AnimationPlayerWalkRight;1
  equb <AnimationPlayerJumpRight;2
  equb <AnimationPlayerLandRight;3
  equb <AnimationPlayerClimbLadder;4
  equb <AnimationPlayerJumping;5
  equb <AnimationPlayerFalling;6
  equb <AnimationPlayerWallSliding;7
  equb <AnimationDiving;8
  equb <AnimationSliding;9
  equb <AnimationCrystal2;10
  equb <AnimationDoorOpen;11
  equb <AnimationDoorClose;12
  equb <AnimationDoorIdleOpen;13
  equb <AnimationDoorIdleClosed;14
  equb <AnimationInvisPlatform ;15
  equb <AnimationInvisPlatform ;16
  equb <AnimationVisPlatform;17
  equb <AnimationFluid;18
  equb <AnimationSpikeIdle;19
  equb <AnimationSpikeRaise;20
  equb <AnimationSpikeRotate;21
  equb <AnimationSpikeLower ;22
  equb <AnimationProjectile ;23
  equb <AnimationKey ;24
  equb <AnimationTeleportal;25
  equb <AnimationCrawler;26

.AnimationsHi
  equb >AnimationPlayerIdle;0
  equb >AnimationPlayerWalkRight;1
  equb >AnimationPlayerJumpRight;2
  equb >AnimationPlayerLandRight;3
  equb >AnimationPlayerClimbLadder;4
  equb >AnimationPlayerJumping;5
  equb >AnimationPlayerFalling;6
  equb >AnimationPlayerWallSliding;7
  equb >AnimationDiving;8
  equb >AnimationSliding;9
  equb >AnimationCrystal2;10
  equb >AnimationDoorOpen;11
  equb >AnimationDoorClose;12
  equb >AnimationDoorIdleOpen ;13
  equb >AnimationDoorIdleClosed ;14 
  equb >AnimationInvisPlatform ;15
  equb >AnimationInvisPlatform ;16 
  equb >AnimationVisPlatform;17
  equb >AnimationFluid;18
  equb >AnimationSpikeIdle;19
  equb >AnimationSpikeRaise;20
  equb >AnimationSpikeRotate;20
  equb >AnimationSpikeLower ;22
  equb >AnimationProjectile ;23
  equb >AnimationKey
  equb >AnimationTeleportal;25
  equb >AnimationCrawler;26

.DrawFunctionListLo
  equb <DrawAlignedSprite
  equb <DrawUnAlignedSpriteX
  equb <DrawUnAlignedSpriteY
  equb <DrawUnAlignedSpriteXY
.DrawFunctionListHi
  equb >DrawAlignedSprite
  equb >DrawUnAlignedSpriteX
  equb >DrawUnAlignedSpriteY
  equb >DrawUnAlignedSpriteXY
  

.EntityCollisionInitial

  equb COLLISIONNONE ; dummy
  equb COLLISIONNONE ; player
  equb COLLISIONNONE ;crystal
  equb COLLISIONNONE ; door open
  equb COLLISIONNONE ;door closed
  equb COLLISIONNONE ; platform invis
  equb COLLISIONNONE ; platform vis
  equb COLLISIONADDE ; fluid vial
  equb COLLISIONKILL ; spike trap
  equb COLLISIONKILL ;proj u
  equb COLLISIONKILL;proj d
  equb COLLISIONKILL;proj l
  equb COLLISIONKILL;proj r 12
  equb COLLISIONTP ; telporter
  equb COLLISIONADDKEY ; key
  equb COLLISIONKILL ; hbouncer 
  equb COLLISIONKILL ; vbouncer ;16
  equb COLLISIONKILL ; crawler
  equb COLLISIONBOUNCE ; BOUNCER
  equb COLLISIONNONE ; bouncer disabled

.EntityStatesInitial
  equb 0 ; dummy
  equb 1 ; player
  equb STATEANIMATING ;crystal
  equb STATEDOOROPEN ; door open
  equb STATEDOORCLOSED ;door closed
  equb STATEJUMPPLATFORMINVIS ; platform invis
  equb STATEJUMPPLATFORMVIS ; platform vis
  equb STATEANIMATING ; fluid vial
  equb STATEPROXIMITYTRAP ; spike trap
  equb 16 ;proj u
  equb 17;proj d
  equb 18;proj l
  equb 19;proj r 12
  equb STATEANIMATING ; teleportal
  equb STATEANIMATING ; key ;14
  equb 20 ; hbouncer
  equb 21 ; vbouncer ;16
  equb 22 ; crawler
  equb 24 ; Bouncer
  equb 25 ; bouncer disabled

.EntityAnimationInitial
  equb 0
  equb 1
  equb 10
  equb 11
  equb 15
  equb 16
  equb 17
  equb 18
  equb 19 ;sp trap
  equb 23
  equb 23
  equb 23
  equb 23
  equb 25 ; teleportal
  equb 24;key
  equb 18 ; hbounce
  equb 18 ; vbounce
  equb 26;crawler 16
  equb 26 ; bouncer
  equb 26

.EntityStatesLo
  equb <GenericInit-1;0
  equb <ProcessPlayer-1;1
  equb <ProcessPlayerWallSliding-1;2
  equb <ProcessPlayerJumping-1;3
  equb <ProcessPlayerFalling-1;4
  equb <ProcessPlayerDiving-1;5
  equb <ProcessPlayerSliding-1;6
  equb <ProcessPlayerOnLadder-1;7
  equb <ProcessEntityAnimate-1;8
  equb <ProcessEntityDoorOpen-1;9
  equb <ProcessEntityDoorClosed-1;10
  equb <ProcessEntityProjectile-1;11
  equb <ProcessEntityPlatformVisible-1;12
  equb <ProcessEntityPlatformInvisible-1;13
  equb <ProcessEntitySpikeTrap-1 ;14
  equb <ProcessEntitySpikeTrapUp-1 ;15
  equb <ProcessEntityProjectileUpInit-1 ;16
  equb <ProcessEntityProjectileDownInit-1 ;17
  equb <ProcessEntityProjectileLeftInit-1 ;18
  equb <ProcessEntityProjectileRightInit-1 ;19
  equb <ProcessHBouncer-1;20
  equb <ProcessVBouncer-1;21
  equb <ProcessCrawlerRight-1;22
  equb <ProcessCrawlerDown-1;23
  equb <ProcessBouncerEnabled-1;24
  equb <ProcessBouncerDisabled-1;25

.EntityStatesHi
  equb >GenericInit;0
  equb >ProcessPlayer;1
  equb >ProcessPlayerWallSliding;2
  equb >ProcessPlayerJumping;3
  equb >ProcessPlayerFalling;4
  equb >ProcessPlayerDiving;5
  equb >ProcessPlayerSliding;6
  equb >ProcessPlayerOnLadder;7
  equb >ProcessEntityAnimate;8
  equb >ProcessEntityDoorOpen;9
  equb >ProcessEntityDoorClosed;10
  equb >ProcessEntityProjectile;11
  equb >ProcessEntityPlatformVisible;12
  equb >ProcessEntityPlatformInvisible;13
  equb >ProcessEntitySpikeTrap;14
  equb >ProcessEntitySpikeTrapUp ;15
  equb >ProcessEntityProjectileUpInit ;16
  equb >ProcessEntityProjectileDownInit ;17
  equb >ProcessEntityProjectileLeftInit ;18
  equb >ProcessEntityProjectileRightInit ;19
  equb >ProcessHBouncer;20
  equb >ProcessVBouncer;21
  equb >ProcessCrawlerRight;22
  equb >ProcessCrawlerDown;23
  equb >ProcessBouncerEnabled;24
  equb >ProcessBouncerDisabled ;25

.PlayerNewStateFunctionsLo
  equb <EmptyDataEntry-1
  equb <PlayerEnterStateOnFloor-1
  equb <PlayerEnterStateWallSliding-1
  equb <PlayerEnterStateJumping-1
  equb <PlayerEnterStateFalling-1
  equb <PlayerEnterStateDiving-1
  equb <PlayerEnterStateSliding-1
  equb <PlayerEnterStateOnLadder-1
  equb <PlayerEnterStateBouncing-1
.PlayerNewStateFunctionsHi
  equb >EmptyDataEntry
  equb >PlayerEnterStateOnFloor
  equb >PlayerEnterStateWallSliding
  equb >PlayerEnterStateJumping 
  equb >PlayerEnterStateFalling
  equb >PlayerEnterStateDiving
  equb >PlayerEnterStateSliding
  equb >PlayerEnterStateOnLadder
  equb >PlayerEnterStateBouncing

.CollisionFuncsLo
  equb <SpriteCollideNone-1
  equb <SpriteCollideKillPlayer-1
  equb <SpriteCollideETank-1
  equb <SpriteCollideTeleport-1
  EQUB <SpriteCollideKey-1
  equb <SpriteCollideBounce-1
.CollisionFuncsHi
  equb >SpriteCollideNone
  equb >SpriteCollideKillPlayer
  equb >SpriteCollideETank
  equb >SpriteCollideTeleport
  EQUB >SpriteCollideKey
  equb >SpriteCollideBounce

.DictionaryListLo
  equb <DictionaryStringThe
  equb <DictionaryStringYou
  equb <DictionaryStringIt

.DictionaryListHi
  equb >DictionaryStringThe
  equb >DictionaryStringYou
  equb >DictionaryStringIt

.PaletteListLo
  equb <PaletteDefault
  equb <PaletteInverted
  equb <Palette2
  equb <Palette3
  equb <Palette4
  equb <Palette5
  equb <Palette6
  equb <Palette7
.PaletteListHi
  equb >PaletteDefault
  equb >PaletteInverted
  equb >Palette2
  equb >Palette3
  equb >Palette4
  equb >Palette5
  equb >Palette6
  equb >Palette7
;sound
.SoundListLo
  equb <Sound1
  equb <Sound2
  equb <Sound3
.SoundListHi
  equb >Sound1
  equb >Sound2
  equb >Sound3


.StaticEntitySpritesNPC
  equb 1,1
  equb %00000000,0
  equw StaticNPC1
  equw StaticNPC2
.StaticEntitySpritesCrystal
  equb 2,2
  equb %00000010,0 ; collision: lo-hi: destroy player, eject player
  equw StaticCrystal1
  equw StaticCrystal2
.StaticEntitySpritesTablet
  equb 2,2
  equb %00000000,0
  equw StaticTablet1
.StaticEntityTorchBig
  equb 2,2
  equb %00000000,0
  equw StaticTorchBig1
  equw StaticTorchBig2

  ;Sound data format:
  ;Channel,Amplitude(on/off on the electron),Pitch,Duration, 2 bytes per parameter
  ;channel: 0 = noise,1 = tone, ignore 2/3 for the electron
  ;amplitude: negative = on, 0 = off, 1-16 = select envelope
  ;pitch: msb not used. #52 = middle c. Each step is a quarter semitone change. Becomes off pitch > 100
  ;duration. 1 step = 50mS
.Sound1
  equb $01,$00,$01,$00,52,$00,$03,$00
.Sound2
  equb $01,$00,$02,$00,$52,$00,$03,$00
.Sound3
  equb $01,$00,$03,$00,240,00,$05,00


.PaletteDefault
  equb 0,WHITE
.PaletteInverted
  equb 1,WHITE
.Palette2
  equb 2,WHITE
.Palette3
  equb 3,WHITE
.Palette4
  equb 4,WHITE
.Palette5
  equb 5,WHITE
.Palette6
  equb 6,WHITE
.Palette7
  equb 7,WHITE
.AnimationCrystal
  equb 5,0,1,ANICONTROLBYTELOOP
.AnimationCrystal2
  equb 25,0,1,ANICONTROLBYTELOOP
.AnimationDoorOpen
  equb 5,2,3,4,5,6,7,ANICONTROLBYTENEWANIMATION,13
.AnimationDoorClose
  equb 5,7,6,5,4,3,2,ANICONTROLBYTENEWANIMATION,14
.AnimationDoorIdleOpen
  equb 120,7,ANICONTROLBYTELOOP
.AnimationDoorIdleClosed
  equb 120,2,ANICONTROLBYTELOOP
.AnimationInvisPlatform
  equb 120,10,ANICONTROLBYTELOOP
.AnimationVisPlatform
  equb 120,11,ANICONTROLBYTELOOP
.AnimationFluid
  equb 3,18,19,20,21,20,19,18,ANICONTROLBYTELOOP
.AnimationSpikeIdle
  equb 120,27,ANICONTROLBYTELOOP
.AnimationSpikeRaise
  equb 7,27,26,25,ANICONTROLBYTENEWANIMATION,21
.AnimationSpikeRotate
  equb 3,25,ANICONTROLBYTEFLIP,24,23,22,23,24,ANICONTROLBYTELOOP
.AnimationSpikeLower
  equb 20,25,26,27,ANICONTROLBYTENEWANIMATION,19
.AnimationProjectile ;23
  equb 5,14,15,16,17,16,15,ANICONTROLBYTELOOP
.AnimationKey
  equb 10,30,31,21,ANICONTROLBYTEFLIP,31,ANICONTROLBYTELOOP
.AnimationTeleportal
  equb 5,28,ANICONTROLBYTEFLIP,28,ANICONTROLBYTEFLIP,29,ANICONTROLBYTEFLIP,29,ANICONTROLBYTEFLIP,ANICONTROLBYTELOOP
.AnimationCrawler
  equb 10,8,9,ANICONTROLBYTELOOP
.AnimationTablet
  equb 120,0,ANICONTROLBYTELOOP

.AnimationPlayerJumpRight
.AnimationPlayerLandRight
.AnimationPlayerWalkRight
  equb 5,0,1,2,1,ANICONTROLBYTELOOP
.AnimationPlayerClimbLadder
  equb 10,5,6,ANICONTROLBYTELOOP
.AnimationPlayerIdle
  equb 20,3,4,ANICONTROLBYTELOOP
.AnimationPlayerJumping
  equb 120,2,ANICONTROLBYTELOOP
.AnimationPlayerFalling
  equb 120,2,ANICONTROLBYTELOOP
.AnimationPlayerWallSliding
  equb 120,11
.AnimationDiving
  equb 120,12,ANICONTROLBYTELOOP
.AnimationSliding
  equb 120,13,ANICONTROLBYTELOOP
.AnimationLadderClimbing
  equb 4,5,6,ANICONTROLBYTELOOP

.DefaultScreenMMTsLo
  equb <DefaultScreenOpenAir
  equb <DefaultScreenBrickClosed
  equb <DefaultScreenBrickVShaft
  equb <DefaultScreenBrickHShaft
.DefaultScreenMMTsHi
  equb >DefaultScreenOpenAir
  equb >DefaultScreenBrickClosed
  equb >DefaultScreenBrickVShaft
  equb >DefaultScreenBrickHShaft

.DefaultScreenOpenAir
  equb %0000_1111,0
  equb $ff
.DefaultScreenBrickClosed
  equb %0000_0000,24
  equb %0000_1111,25
  equb %1111_0000,26
  equb %0000_0000,27
  equb $ff
.DefaultScreenBrickVShaft
  equb %1111_0000,26
  equb %0000_0000,27
  equb $ff
.DefaultScreenBrickHShaft
  equb %0000_0000,24
  equb %0000_1111,25
  equb $ff
; Screen data format:
;b1 4msb == palette
;b1 4lsb == basic template type for the walls
;b2 4ms 
;b3-ff

align $08
  equb $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
;Screens
  .Screen0
    equb %0000_0000 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1011_1100,22
    equb $ff
    ; entities
    equb %0011_1011,18
    ; equb %0111_0011,18
    equb %1011_1011,14
    equb %0000_1110,3+128
    equb %1111_1110,3+128
    equb $ff

  .Screen1
    equb %0000_0011 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %0000_1110,3+128
    equb %1111_1110,3+128
    equb $ff


  .Screen2
    equb %0000_0011 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen3
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen4
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen5
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen6
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen7
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen8
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen9
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen10
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen11
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen12
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen13
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen14
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen15
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen16
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen17
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen18  
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen19
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen20
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen21
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen22
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen23
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen24
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen25
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen26
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen27
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen28
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen29
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen30
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen31
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen32
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen33
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen34
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen35
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen36
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen37
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen38
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen39
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen40
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen41
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen42
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen43
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen44
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen45
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen46
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen47
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen48
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen49
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen50
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen51
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen52
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen53
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen54
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen55
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen56
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen57
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen58
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen59
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen60
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen61
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen62
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen63
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_1100,22
    equb %1010_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff

align $08
  equb $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

.MetaTileDrawOffsetsLo
  equb $08,$38,$08

.MetaTileDrawOffsetsHi
  equb $00,$01,$00
.ActionSetsLo
  equb <ActionSetOnFloor
  equb <ActionSetJumping
  equb <ActionSetWallSliding
  equb <ActionSetDiving
  equb <ActionSetSliding
.ActionSetsHi
  equb >ActionSetOnFloor
  equb >ActionSetJumping
  equb >ActionSetWallSliding
  equb >ActionSetDiving
  equb >ActionSetSliding

.ActionSetOnFloor
  ;w a s d k l p RT
  equb 8,ACTIONMOVELEFT,NOACTION,ACTIONMOVERIGHT,ACTIONJUMP,NOACTION,NOACTION,ACTIONVIEWMEM
.ActionSetJumping
  equb 8,ACTIONMOVELEFT,NOACTION,ACTIONMOVERIGHT,ACTIONDIVE,NOACTION,NOACTION,ACTIONVIEWMEM
.ActionSetWallSliding
  equb 8,NOACTION,NOACTION,NOACTION,ACTIONWALLJUMP,NOACTION,NOACTION,ACTIONVIEWMEM
.ActionSetDiving
  equb 8,NOACTION,NOACTION,NOACTION,NOACTION,NOACTION,NOACTION,ACTIONVIEWMEM
.ActionSetSliding 
  equb 8,NOACTION,NOACTION,NOACTION,ACTIONJUMP,NOACTION,NOACTION,ACTIONVIEWMEM


.AnimationControlBytesLo
  equb <AniLoop-1
  equb <AniNewAnimation-1
  equb <AniDestroyEntity-1
  equb <AniSetSpeed-1
  equb <AniFlip-1

.AnimationControlBytesHi
  equb >AniLoop
  equb >AniNewAnimation
  equb >AniDestroyEntity
  equb >AniSetSpeed
  equb >AniFlip

.Mult8Table
  equb $00,$08,$10,$18,$20,$28,$30,$38,$40,$48,$50,$58,$60,$68,$70,$78,$80,$88,$90,$98,$a0,$a8,$b0,$b8,$c0,$c8,$d0,$d8,$e0,$e8,$f0,$f8
  equb $00,$08,$10,$18,$20,$28,$30,$38,$40,$48,$50,$58,$60,$68,$70,$78,$80,$88,$90,$98,$a0,$a8,$b0,$b8,$c0,$c8,$d0,$d8,$e0,$e8,$f0,$f8








  .StringListLo
  equb <DeathMessage1
  equb <DeathMessage2
  equb <DeathMessage3
  equb <DeathMessage4
  equb <DeathMessage5
  equb <DeathMessage6
  equb <DeathMessage7
  equb <DeathMessage8
  equb <StringTitle
  equb <StringNPC1
.StringListHi
  equb >DeathMessage1
  equb >DeathMessage2
  equb >DeathMessage3
  equb >DeathMessage4
  equb >DeathMessage5
  equb >DeathMessage6
  equb >DeathMessage7
  equb >DeathMessage8
  equb >StringTitle


.MMTFloor16Earth
  equb 16,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23
  equb $ff
.MMTFloor16Solid
  equb 16,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  equb $ff
.MMTFloor14Earth
  equb 14,23,23,23,23,23,23,23,23,23,23,23,23,23,23
  equb $ff
.MMTFloor14Solid
  equb 14,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  equb $ff
.MMTFloor12Earth
  equb 12,23,23,23,23,23,23,23,23,23,23,23,23
  equb $ff
.MMTFloor12Solid
  equb 12,1,1,1,1,1,1,1,1,1,1,1,1
  equb $ff
.MMTFloor10Earth
  equb 10,23,23,23,23,23,23,23,23,23,23
  equb $ff
.MMTFloor10Solid
  equb 10,1,1,1,1,1,1,1,1,1,1
  equb $ff
.MMTFloor8Earth
  equb 8,23,23,23,23,23,23,23,23
  equb $ff
.MMTFloor8Solid
  equb 8,1,1,1,1,1,1,1,1
  equb $ff
.MMTFloor6Earth
  equb 6,23,23,23,23,23,23
  equb $ff
.MMTFloor6Solid
  equb 6,1,1,1,1,1,1
  equb $ff
.MMTFloor4Earth
  equb 4,23,23,23,23
  equb $ff
.MMTFloor4Solid
  equb 4,1,1,1,1
  equb $ff
.MMTFloor2Earth
  equb 2,23,23
  equb $ff
.MMTFloor2Solid
  equb 2,1,1
  equb $ff
.MMTFWallSolid16
  equb 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
.MMTFWallEarthLeft16
  equb 1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25
  equb $ff
.MMTFWallEarthRight16
  equb 1,26,1,26,1,26,1,26,1,26,1,26,1,26,1,26,1,26,1,26,1,26,1,26,1,26,1,26,1,26,1,26
  equb $ff
.MMTFCeilingEarth16
  equb 16,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24
  equb $ff

.MMTSolid1x1
  equb 1,1
  equb $ff
.MMTRounded1x1
  equb 1,19
  equb $ff
.MMTRounded1x3
  equb 3,20,22,21
  equb $ff
.MMTHPlatforms
  equb 12,0,0,1,0,0,1,1,0,0,1,0,0
  equb $ff
.MMTBrickDownFace1x16
  equb 16,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28
  equb $ff
.MMTBrickUpFace1x16
  equb 16,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27
  equb $ff
.MMTBrickRightFace1x16
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb 1,29
  equb $ff
.MMTBrickLeftFace1x16
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb 1,30
  equb $ff

; .MMTFloor16
;   equb 16,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23
;   equb $ff
; .MMTFloor14
;   equb 14,1,1,1,1,1,1,1,1,1,1,1,1,1,1
;   equb $ff
; .MMTFloor12
;   equb 12,1,1,1,1,1,1,1,1,1,1,1,1
;   equb $ff
; .MMTFloor10
;   equb 10,1,1,1,1,1,1,1,1,1,1
;   equb $ff
; .MMTFloor8
;   equb 8,1,1,1,1,1,1,1,1
;   equb $ff
; .MMTFloor6
;   equb 6,1,1,1,1,1,1
;   equb $ff
; .MMTFloor4
;   equb 4,1,1,1,1
;   equb $ff
; .MMTFloor3
;   equb 3,1,1,1
;   equb $ff
; .MMTFloor2  
;   equb 2,1,1
;   equb $ff
; .MMTFloor1
;   equb 1,1
;   equb $ff
; .MMTWall16
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb 1,25
;   equb $ff
; .MMTWall14
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb $ff
; .MMTWall12
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb $ff
; .MMTWall10
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb $ff
; .MMTWall8
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb $ff
; .MMTWall6
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb $ff
; .MMTWall4
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb $ff
; .MMTWall3
;   equb 1,1
;   equb 1,1
;   equb 1,1
;   equb $ff
; .MMTWall2
;   equb 1,1
;   equb 1,1
;   equb $ff

; .MMTHalfFloor1_1
;   equb 1,12
;   equb $ff
; .MMTHalfFloor1_2
;   equb 2,12,12
;   equb $ff
; .MMTHalfFloor1_3
;   equb 3,12,12,12
;   equb $ff
; .MMTHalfFloor1_4
;   equb 4,12,12,12,12
;   equb $ff

; .MMTHalfFloor2_1
;   equb 1,13
;   equb $ff
; .MMTHalfFloor2_2
;   equb 2,13,13
;   equb $ff
; .MMTHalfFloor2_3
;   equb 3,13,13,13
;   equb $ff
; .MMTHalfFloor2_4
;   equb 4,13,13,13,13
;   equb $ff
; .MMTBouncePad
;   equb 2,16,16
;   equb $ff
; .MMTBridge
;   equb 4,17,13,13,18
;   equb $ff
; .MMTBridge2
;   equb 5,17,13,13,13,18
;   equb $ff
; .MMTBridge3
;   equb 6,17,13,13,13,13,18
;   equb $ff


.DictionaryStringThe
  equs " the "
  equb $00
.DictionaryStringYou
  equs " you "
  equb $00
.DictionaryStringIt
  equs " it "
  equb $00

.DeathMessage1
  equs "Loser"
  equb $00
.DeathMessage2
  equs "T*****"
  equb $00
.DeathMessage3
  equs "T******"
  equb $00
.DeathMessage4
  equs "Failure"
  equb $00
.DeathMessage5
  equs "F*****"
  equb $00
.DeathMessage6
  equs "#$*#"
  equb $00
.DeathMessage7
  equs "C***"
  equb $00
.DeathMessage8
  equs "Pathetic"
  equb $00
.StringTitle
  equs "Title Screen: Press K to Start :)"
  equb $00


.StringNPC1
  equs "I wished, I begged in that moment, that someone would take my hand, ease those fears from the recesses of my darkling mind. Yet I remained alone, diminished, afraid."
  equb $00
.StringNPC2
  equs "Why am I here? Why the same reason as you I imagine. To find myself, or perhaps... to be found. Hehehe."