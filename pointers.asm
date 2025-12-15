; align &10
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
  equb <StaticTorch1
  equb <StaticTorch2
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
  equb >StaticTorch1
  equb >StaticTorch2
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
  equb <ActionLongJump-1
  equb <ActionExitCrouch-1
  equb <ActionEnterCrouch-1
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
  equb >ActionLongJump
  equb >ActionExitCrouch
  equb >ActionEnterCrouch
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
  equb >MetaTileDotted;15
  equb >MetaTileBouncePad;16
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
  equb >MetaTileConveyorLeft ;31
  equb >MetaTileConveyorRight ;32
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
  ; align &100
  equb >SpriteKey2;31
.AnimationsLo ;15
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
  equb <AnimationsPlayerFlipClockWise;27
  equb <AnimationsPlayerFlipAnitClockWise;28
  equb <AnimationTorchBig
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
  equb >AnimationsPlayerFlipClockWise;27
  equb >AnimationsPlayerFlipAnitClockWise;28
  equb >AnimationTorchBig
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
.EntityStatesLo
  equb <GenericInit-1;0
  equb <ProcessPlayer-1;1
  equb <ProcessPlayerWallSliding-1;2
  equb <ProcessPlayerCrouching-1;3
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
  equb <ProcessEntityAnimate-1
  equb <ProcessDoorInit-1
.EntityStatesHi
  equb >GenericInit;0
  equb >ProcessPlayer;1
  equb >ProcessPlayerWallSliding;2
  equb >ProcessPlayerCrouching;3
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
  equb >ProcessEntityAnimate
  equb >ProcessDoorInit
.PlayerNewStateFunctionsLo
  equb <EmptyDataEntry-1
  equb <PlayerEnterStateOnFloor-1
  equb <PlayerEnterStateWallSliding-1
  equb <PlayerEnterStateCrouching-1
  equb <PlayerEnterStateFalling-1
  equb <PlayerEnterStateDiving-1
  equb <PlayerEnterStateSliding-1
  equb <PlayerEnterStateOnLadder-1
  equb <PlayerEnterStateCrouching-1
  equb <PlayerEnterStateBouncing-1
.PlayerNewStateFunctionsHi
  equb >EmptyDataEntry
  equb >PlayerEnterStateOnFloor
  equb >PlayerEnterStateWallSliding
  equb >PlayerEnterStateCrouching 
  equb >PlayerEnterStateFalling
  equb >PlayerEnterStateDiving
  equb >PlayerEnterStateSliding
  equb >PlayerEnterStateOnLadder
  equb >PlayerEnterStateCrouching
  equb >PlayerEnterStateBouncing
.CollisionFuncsLo
  equb <SpriteCollideNone-1
  equb <SpriteCollideKillPlayer-1
  equb <SpriteCollideETank-1
  equb <SpriteCollideTeleport-1
  EQUB <SpriteCollideKey-1
  equb <SpriteCollideBounce-1
  equb <SpriteCollideEGradual-1
.CollisionFuncsHi
  equb >SpriteCollideNone
  equb >SpriteCollideKillPlayer
  equb >SpriteCollideETank
  equb >SpriteCollideTeleport
  equb >SpriteCollideKey
  equb >SpriteCollideBounce
  equb >SpriteCollideEGradual
.DictionaryListLo
  equb <DictionaryStringThe
  equb <DictionaryStringYou
  equb <DictionaryStringIt
  equb <DictionaryStringGoodSquaresPress
  equb <DictionaryStringAnd
  equb <DictionaryStringTo
.DictionaryListHi
  equb >DictionaryStringThe
  equb >DictionaryStringYou
  equb >DictionaryStringIt
  equb >DictionaryStringGoodSquaresPress
  equb >DictionaryStringAnd
  equb >DictionaryStringTo
.PaletteListLo
  equb <PaletteDefault
  equb <PaletteInverted
  equb <Palette2
  equb <Palette3
  equb <Palette4
  equb <Palette5
  equb <Palette6
  equb <Palette7
  equb <Palette8
  equb <Palette9
  equb <Palette10
  equb <Palette11
  equb <Palette12
  equb <Palette13
.PaletteListHi
  equb >PaletteDefault
  equb >PaletteInverted
  equb >Palette2
  equb >Palette3
  equb >Palette4
  equb >Palette5
  equb >Palette6
  equb >Palette7
  equb >Palette8
  equb >Palette9
  equb >Palette10
  equb >Palette11
  equb >Palette12
  equb >Palette13
.SoundListLo
  equb <Sound1
  equb <Sound2
  equb <Sound3
.SoundListHi
  equb >Sound1
  equb >Sound2
  equb >Sound3
.DefaultScreenMMTsLo
  equb <DefaultScreenOpenAir
  equb <DefaultScreenClosed
  equb <DefaultScreenBrickVShaft
  equb <DefaultScreenBrickHShaft
  equb <DefaultScreenFilled
  equb <DefaultScreenCorridorH
  equb <DefaultScreenCorridorV
  ; equb <DefaultScreenCorridorHV
.DefaultScreenMMTsHi
  equb >DefaultScreenOpenAir
  equb >DefaultScreenClosed
  equb >DefaultScreenBrickVShaft
  equb >DefaultScreenBrickHShaft
  equb >DefaultScreenFilled
  equb >DefaultScreenCorridorH
  equb >DefaultScreenCorridorV
  ; equb >DefaultScreenCorridorHV

.ActionSetsLo
  equb <ActionSetOnFloor
  equb <ActionSetJumping
  equb <ActionSetWallSliding
  equb <ActionSetDiving
  equb <ActionSetSliding
  equb <ActionSetCrouching
.ActionSetsHi
  equb >ActionSetOnFloor
  equb >ActionSetJumping
  equb >ActionSetWallSliding
  equb >ActionSetDiving
  equb >ActionSetSliding
  equb >ActionSetCrouching

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



.StringListLo
  equb <DeathMessage1
  equb <StringTitle
  equb <StringTutorial1
  equb <StringTutorial2
  equb <StringTutorial3
  equb <StringTutorial4
.StringListHi
  equb >DeathMessage1
  equb >StringTitle
  equb >StringTutorial1
  equb >StringTutorial2
  equb >StringTutorial3
  equb >StringTutorial4
