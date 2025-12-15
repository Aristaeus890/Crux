

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
  .MetaTileConveyorLeft ;31
  equb 51,51,1,1
  equb %00001001,%00001001,1,1
  .MetaTileConveyorRight ;32
  equb 52,52,1,1
  equb %00000101,%00000101,1,1

.StaticEntityInteractionsLo
  ; equb <EmptyDataEntry-1
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




; .StaticTablet1
;   equw TilePatternTablet1
;   equw TilePatternTablet2
;   equw TilePatternTablet3
;   equw TilePatternTablet4

; .StaticTorchBig1
;   equw TilePatternTorchBig1
;   equw TilePatternTorchBig2
;   equw TilePatternTorchBig3
;   equw TilePatternTorchBig4
; .StaticTorchBig2
;   equw TilePatternTorchBig5
;   equw TilePatternTorchBig6
;   equw TilePatternTorchBig7
;   equw TilePatternTorchBig8


.EntityCollisionInitial

  equb COLLISIONNONE ; dummy
  equb COLLISIONNONE ; player
  equb 6 ;crystal
  equb COLLISIONNONE ; door open
  equb COLLISIONNONE ;door closed
  equb COLLISIONNONE ; platform invis
  equb COLLISIONNONE ; platform vis
  equb COLLISIONADDE ; e tank add
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
  equb COLLISIONNONE ; bouncer disabled
  equb COLLISIONNONE ; bouncer disabled
  equb COLLISIONNONE ; bouncer disabled
  equb COLLISIONNONE ; bouncer disabled
  equb COLLISIONNONE ; bouncer disabled



.EntityStatesInitial
  equb 0 ; dummy
  equb 1 ; player
  equb STATEANIMATING ;crystal
  equb STATEDOORINIT ; door open
  equb STATEDOORINIT ;door closed
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
  equb STATEANIMATING
  equb STATEANIMATING
  equb STATEANIMATING
  equb STATEANIMATING
  equb STATEANIMATING

.EntityAnimationInitial
  equb 0
  equb 1
  equb 10
  equb 11
  equb 14
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
  equb 26;crawler 
  equb 26 ; bouncer
  equb 26 ; 19
  equb 0
  equb 29

.KeysToRead
  equb %10100001;w
  equb %11010001;s
  equb %11000001;a
  equb %10110010;d
  equb %11000110;k
  equb %11010110;l
  equb %10110111;p
  equb %11001001;return

; .StaticEntitySpritesNPC
;   equb 1,1
;   equb %00000000,0
;   equw StaticNPC1
;   equw StaticNPC2
; .StaticEntitySpritesCrystal
;   equb 2,2
;   equb %00000010,0 ; collision: lo-hi: destroy player, eject player
;   equw StaticCrystal1
;   equw StaticCrystal2
; .StaticEntitySpritesTablet
;   equb 2,2
;   equb %00000000,0
;   equw StaticTablet1
; .StaticEntityTorchBig
;   equb 2,2
;   equb %00000000,0
;   equw StaticTorchBig1
;   equw StaticTorchBig2

  ;Sound data format:
  ;Channel,Amplitude(on/off on the electron),Pitch,Duration, 2 bytes per parameter
  ; channel: 0 = noise,1 = tone, 
  ;ignore 2/3 for the electron
  ; amplitude: negative = on, 0 = off, 1-16 = select envelope
  ; pitch: msb not used. 
  ;#52 = middle c. Each step is a quarter semitone change. Becomes off pitch > 100
  ;duration. 1 step = 50mS
.Sound1
  equb $10,$00,$01,$00,52,$00,$03,$00
.Sound2
  equb $01,$00,$02,$00,$52,$00,$03,$00
.Sound3
  equb $01,$00,$03,$00,240,00,$05,00


.PaletteDefault
  equb 0,WHITE
.PaletteInverted
  equb WHITE,0
.Palette2
  equb 0,RED
.Palette3
  equb 0,YELLOW
.Palette4
  equb 0,GREEN
.Palette5
  equb 0,BLUE
.Palette6
  equb 0,CYAN
.Palette7
  equb 0,MAGENTA
.Palette8
  equb 0,FLASHINGBLACKWHITE
.Palette9
  equb 0,FLASHINGREDCYAN
.Palette10
  equb 0,FLASHINGGREENMAGENTA
.Palette11
  equb 0,FLASHINGYELLOWBLUE
.Palette12
  equb 0,FLASHINGBLUEYELLOW
.Palette13
  equb 0,FLASHINGMAGENTAGREEN

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
  equb 5,28,ANICONTROLBYTEFLIP,28,ANICONTROLBYTEFLIP,29,ANICONTROLBYTEFLIP,29,ANICONTROLBYTEFLIP,14,ANICONTROLBYTELOOP
.AnimationCrawler
  equb 10,8,9,ANICONTROLBYTELOOP
.AnimationsPlayerFlipClockWise
  equb 4,14,15,ANICONTROLBYTEFLIP,15,14,ANICONTROLBYTEFLIP,14,15,ANICONTROLBYTEFLIP,15,14,ANICONTROLBYTEFLIP,ANICONTROLBYTELOOP
.AnimationsPlayerFlipAnitClockWise
  equb 2,14,15,ANICONTROLBYTEFLIP,15,14,ANICONTROLBYTEFLIP,14,15,ANICONTROLBYTEFLIP,15,ANICONTROLBYTELOOP
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
.AnimationTorchBig
  equb 25,12,13,ANICONTROLBYTELOOP



.DefaultScreenOpenAir
  equb %0000_1111,14
  equb $ff
.DefaultScreenClosed
  equb %0000_0000,MMTSOLIDWALL4
  equb %0011_0000,MMTSOLIDWALL4
  equb %1001_0000,MMTSOLIDWALL4
  equb %1011_0000,MMTSOLIDWALL4
  equb %0000_0000,27
  equb $ff
.DefaultScreenBrickVShaft
  equb %0000_0000,MMTBRICKWALLL
  equb %1111_0000,MMTBRICKWALLR
  equb %0000_0111,MMTEMPTYWALL2
  equb %1111_0111,MMTEMPTYWALL2

  equb $ff
.DefaultScreenBrickHShaft
  equb %0000_0000,24
  equb %0000_1111,25
  equb $ff
.DefaultScreenFilled
  equb %0000_0000,MMTSOLIDFLOOR16
  equb %0000_0001,MMTSOLIDFLOOR16
  equb %0000_0010,MMTSOLIDFLOOR16
  equb %0000_0011,MMTSOLIDFLOOR16
  equb %0000_0100,MMTSOLIDFLOOR16
  equb %0000_0101,MMTSOLIDFLOOR16
  equb %0000_0110,MMTSOLIDFLOOR16
  equb %0000_0111,MMTSOLIDFLOOR16
  equb %0000_1000,MMTSOLIDFLOOR16
  equb %0000_1001,MMTSOLIDFLOOR16
  equb %0000_1010,MMTSOLIDFLOOR16
  equb %0000_1011,MMTSOLIDFLOOR16
  equb %0000_1100,MMTSOLIDFLOOR16
  equb %0000_1101,MMTSOLIDFLOOR16
  equb %0000_1110,MMTSOLIDFLOOR16
  equb %0000_1111,MMTSOLIDFLOOR16
  equb $ff
.DefaultScreenCorridorH
  equb %0000_0000,MMTSOLIDFLOOR16
  equb %0000_0001,MMTSOLIDFLOOR16
  equb %0000_0010,MMTSOLIDFLOOR16
  equb %0000_0011,MMTSOLIDFLOOR16
  equb %0000_0100,MMTSOLIDFLOOR16
  equb %0000_0101,MMTSOLIDFLOOR16
  equb %0000_0110,MMTBRICKCEILING16
  equb %0000_1001,MMTBRICKFLOOR16
  equb %0000_1010,MMTSOLIDFLOOR16
  equb %0000_1011,MMTSOLIDFLOOR16
  equb %0000_1100,MMTSOLIDFLOOR16
  equb %0000_1101,MMTSOLIDFLOOR16
  equb %0000_1110,MMTSOLIDFLOOR16
  equb %0000_1111,MMTSOLIDFLOOR16
  equb $ff
.DefaultScreenCorridorV
  equb %0000_0000,MMTSOLIDWALL16
  equb %0001_0000,MMTSOLIDWALL16
  equb %0010_0000,MMTSOLIDWALL16
  equb %0011_0000,MMTSOLIDWALL16
  equb %0100_0000,MMTSOLIDWALL16
  equb %0101_0000,MMTSOLIDWALL16
  equb %0110_0000,MMTSOLIDWALL16
  equb %1001_0000,MMTSOLIDWALL16
  equb %1010_0000,MMTSOLIDWALL16
  equb %1011_0000,MMTSOLIDWALL16
  equb %1100_0000,MMTSOLIDWALL16
  equb %1101_0000,MMTSOLIDWALL16
  equb %1110_0000,MMTSOLIDWALL16
  equb %1111_0000,MMTSOLIDWALL16
  equb $ff

; Screen data format:
;b1 4msb == palette
;b1 4lsb == basic template type for the walls
;b2 4ms 
;b3-ff

;Screens
  .Screen1_1
    equb PALETTEBLACKWHITE + DEFAULTSCREENCORRIDORH ; palette/defaultlayout
    ; equb 0 + DEFAULTSCREENCORRIDORH
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb $ff
    ;entities
    equb $ff
  .Screen1_2
    equb PALETTEBLACKRED + %0000_0100 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %1000_1000,MMTEMPTYFLOOR8
    equb $ff
    ; entities
    equb $ff

  .Screen1_3
    equb PALETTEBLACKYELLOW + %0000_0100 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0000_1000,MMTEMPTYFLOOR8
    equb $ff
    ; entities
    equb $ff

  .Screen1_4
    equb PALETTEBLACKGREEN + %0000_0100 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0000_1110,MMTEMPTYFLOOR5
    equb %1011_1110,MMTEMPTYFLOOR5
    equb $ff
    ; entities
    equb $ff


  ;transit h1
  .Screen1_5
    equb PALETTEBLACKBLUE + DEFAULTSCREENCORRIDORH ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb $ff
    ;entities
    equb %0100_1000, ENTITYSPIKETRAP
    equb %1011_1000, ENTITYSPIKETRAP
    equb $ff

  .Screen1_6
    equb PALETTEBLACKCYAN + 0 ; palette/defaultlayout
    ; equb %0010_0000
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb $ff
    ;entities
    equb $ff
    ; equb %0000_0100 ; palette/defaultlayout
    ; equb %0000_0000 ; npc string/tabletstring
    ; ;tile structures
    ; equb %0100_1110,19
    ; equb %1000_1110,19
    ; equb $ff
    ; ; entities
    ; equb $ff
  ;transitendright
  .Screen1_7
    equb PALETTEBLACKMAGENTA + %0000_0000 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0110_1111,17
    equb %0100_1110,21
    equb %1010_1110,22
    equb $ff
    ; entities
    equb %0101_1101,ENTITYTORCHLARGE+128
    equb %1010_1101,ENTITYTORCHLARGE+128
    equb $ff
  .Screen1_8
    equb PALETTEBLACKWHITE+%0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    equb $ff
    equb $ff
  .Screen2_1
    equb PALETTEBLACKRED +DEFAULTSCREENCORRIDORH ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0000_0111,MMTEMPTYFLOOR16
    equb %0000_1000,MMTEMPTYFLOOR16
    equb %1000_1001,MMTEMPTYWALL8
    equb %0111_1001,MMTEMPTYWALL8
    equb $ff
    ;entities
    equb $ff
  .Screen2_2
    equb PALETTEBLACKYELLOW+DEFAULTSCREENCORRIDORH ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0010_0101,MMTEMPTYWALL4
    equb %0100_0101,MMTEMPTYWALL4
    equb %0110_0101,MMTEMPTYWALL4
    equb %1000_0101,MMTEMPTYWALL4
    equb %1010_0101,MMTEMPTYWALL4
    equb %1100_0001,MMTEMPTYWALL8
    equb %1110_0001,MMTEMPTYWALL8
    equb %1110_0111,MMTEMPTYWALL8
    equb %0110_1110,MMTEMPTYFLOOR8
    equb %0110_0001,MMTEMPTYFLOOR8
    equb %0111_0000,MMTEMPTYFLOOR4
    equb %0111_1111,MMTEMPTYFLOOR4
    equb $ff
    ; entities
    equb $ff
  .Screen2_3
    equb PALETTEBLACKGREEN+%0000_0010 ; palette/defaultlayout
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
  .Screen2_4
    equb PALETTEBLACKBLUE+DEFAULTSCREENCORRIDORH ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0111_0111,MMTSOLIDFLOOR2
    equb $ff
    ; entities
    equb %1000_1000,128+ENTITYDOORCLOSED
    equb %0101_1000,ENTITYKEY
    equb $ff
  .Screen2_5
    equb PALETTEBLACKCYAN+%0000_0010 ; palette/defaultlayout
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
  .Screen2_6
    equb PALETTEBLACKMAGENTA+%0000_0010 ; palette/defaultlayout
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
  .Screen2_7
    equb PALETTEBLACKWHITE+DEFAULTSCREENCORRIDORH ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0000_0110,MMTEMPTYFLOOR16
    equb %1000_0000,MMTEMPTYWALL16
    equb %0111_0000,MMTEMPTYWALL16
    equb %0001_1001,MMTCONVEYERLEFT4
    equb %0101_1001,MMTCONVEYERLEFT2
    equb %1011_1001,MMTCONVEYERRIGHT4
    equb %1001_1001,MMTCONVEYERRIGHT2
    equb $ff
    ;entities
    ; equb %0011_1000, ENTITYVBOUNCER
    equb %0101_1000, ENTITYVBOUNCER
    ; equb %1011_1000, ENTITYVBOUNCER
    equb %1101_1000, ENTITYVBOUNCER
    equb $ff
  .Screen2_8
    equb PALETTEBLACKRED+%0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0000_1000, MMTEMPTYFLOOR1
    equb %0001_1011, MMTSOLIDFLOOR1
    equb %0001_1100, MMTSOLIDFLOOR2
    equb %0001_1101, MMTSOLIDFLOOR4
    equb %0001_1110, MMTSOLIDFLOOR8    
    equb %0001_1111, MMTBRICKFLOOR16
    equb $ff
    equb $ff
  .Screen3_1
    equb PALETTEBLACKYELLOW+DEFAULTSCREENCORRIDORH ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %1000_0000,MMTEMPTYWALL16
    equb %0111_0000,MMTEMPTYWALL16
    equb $ff
    ;entities
    equb $ff
  .Screen3_2
    equb PALETTEBLACKGREEN+DEFAULTSCREENCORRIDORH ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %1000_0000,MMTEMPTYWALL8
    equb %0111_0000,MMTEMPTYWALL8
    equb %0110_1001,MMTEMPTYWALL4
    equb %1001_1001,MMTEMPTYWALL4
    equb %1000_1100,MMTEMPTYWALL4
    equb %0111_1100,MMTEMPTYWALL4
    equb $ff
    ;entities
    ; entities
    equb %1000_0110,ENTITYHBOUNCER
    ; equb %0101_1011,ENTITYVBOUNCER
    ; equb %1010_1011,ENTITYVBOUNCER
    ; equb %1100_1100,ENTITYVBOUNCER
    equb $ff
  .Screen3_3
    equb %0000_0100 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0000_1110,20
    equb %0110_1011,2
    equb %1001_1011,2

    equb %0100_1100,2
    equb %1011_1100,2
    equb $ff
    ; entities
    equb $ff
  .Screen3_4
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
  .Screen3_5
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
  .Screen3_6
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
  .Screen3_7
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
  .Screen3_8
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
  .Screen4_1
    equb 0+DEFAULTSCREENCORRIDORV; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %1000_1000,MMTEMPTYFLOOR8
    equb %1000_0111,MMTEMPTYFLOOR8
    equb $ff
    ;entities
    equb $ff
  .Screen4_2
    equb %0000_0100 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0111_0000,MMTEMPTYWALL16
    equb %1000_0000,MMTEMPTYWALL16
    equb %0000_1000,MMTEMPTYFLOOR8
    equb %0000_0111,MMTEMPTYFLOOR8
    equb $ff
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen4_3
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
  .Screen4_4
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
  .Screen4_5
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
  .Screen4_6
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
  .Screen4_7
    equb 0+DEFAULTSCREENSHAFTH ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0000_1001,MMTBRICKFLOOR16
    equb %0000_1001,MMTBRICKFLOOR16
    equb %0000_1001,MMTBRICKFLOOR16
    equb %0000_1001,MMTBRICKFLOOR16
    equb %0000_1001,MMTBRICKFLOOR16
    equb $ff
    ; entities
    equb $ff
  .Screen4_8
    equb 0+%0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0001_1010,MMTSOLIDFLOOR2
    equb %1101_1010,MMTSOLIDFLOOR2
    equb %0001_1011,MMTSOLIDFLOOR4
    equb %1011_1011,MMTSOLIDFLOOR4
    equb %0000_1100,MMTBRICKFLOOR16
    equb %0000_1111,MMTBRICKFLOOR16
    equb $ff
    ; entities
    ; equb %0000_1011,128 + ENTITY 
    equb $ff
  .Screen5_1
    equb 0+DEFAULTSCREENCORRIDORV ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0000_1000,MMTEMPTYFLOOR8
    equb %0000_0111,MMTEMPTYFLOOR8

    equb $ff
    ;entities
    equb $ff

  .Screen5_2
    equb %0000_0100 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    ; equb %0000_1110,20
    ; equb %0110_0000,3
    equb %0111_0000,3
    equb %1000_0000,3
    equb %0000_1110,19
  .Screen5_3
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
  .Screen5_4
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
  .Screen5_5
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
  .Screen5_6
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
  .Screen5_7
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
  .Screen5_8
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
  .Screen6_1
    equb 0+DEFAULTSCREENCORRIDORV ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0011_0100,MMTEMPTYFLOOR8
    equb %0110_0111,MMTEMPTYFLOOR4
    equb %0101_1010,MMTEMPTYFLOOR8
    equb %0111_1101,MMTEMPTYFLOOR4
    equb $ff
    ;entities
    equb %1000_0100,ENTITYHBOUNCER
    equb %1000_0111,ENTITYHBOUNCER
    equb %1000_1010,ENTITYHBOUNCER
    equb $ff
  .Screen6_2
    equb %0000_0001 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0000_1001,MMTSOLIDFLOOR4
    equb %1100_1001,MMTSOLIDFLOOR4
    equb $ff
    ; entities
    equb %0110_1001,ENTITYBOUNCER
    equb %1001_1001,ENTITYBOUNCER

    equb $ff
  .Screen6_3
    equb %0000_0010 ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0100_1100,22
    equb %0110_1100,22
    equb $ff
    ; entities
    equb %1001_1110,16
    equb %1010_1110,16
    equb %1011_1110,16
    equb $ff
  .Screen6_4
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
  .Screen6_5
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
  .Screen6_6
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
  .Screen6_7
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
  .Screen6_8
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
  .Screen7_1
    equb 0+DEFAULTSCREENCORRIDORH ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %1000_0000,MMTEMPTYWALL8
    equb %0111_0000,MMTEMPTYWALL8
    equb $ff
    ;entities
    equb $ff
  .Screen7_2
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
  .Screen7_3
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
  .Screen7_4
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
  .Screen7_5
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
  .Screen7_6
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
  .Screen7_7
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
  .Screen7_8
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
  .Screen8_1
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
  .Screen8_2
    equb 0 + DEFAULTSCREENCORRIDORH ; palette/defaultlayout
    equb %0000_0000 ; npc string/tabletstring
    ;tile structures
    equb %0111_0000,MMTEMPTYWALL16
    equb %1000_0000,MMTEMPTYWALL16
    equb %0010_0011,MMTEMPTYFLOOR5
    equb %1001_0011,MMTEMPTYFLOOR5
    equb %0010_1100,MMTEMPTYFLOOR5
    equb %1001_1100,MMTEMPTYFLOOR5
    equb %0010_0011,MMTEMPTYWALL4
    equb %0010_1001,MMTEMPTYWALL4
    equb %1101_0011,MMTEMPTYWALL4
    equb %1101_1001,MMTEMPTYWALL4

    equb $ff
    ; entities
    equb $ff
  .Screen8_3
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
  .Screen8_4
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
  .Screen8_5
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
  .Screen8_6
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
  .Screen8_7
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
  .Screen8_8
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
.ActionSetOnFloor
  ;w a s d k l p RT
  equb NOACTION,ACTIONMOVELEFT,ACTIONENTERCROUCH,ACTIONMOVERIGHT,ACTIONJUMP,ACTIONDIVE,NOACTION,ACTIONVIEWMEM
.ActionSetJumping
  equb NOACTION,ACTIONMOVELEFT,NOACTION,ACTIONMOVERIGHT,NOACTION,ACTIONDIVE,NOACTION,ACTIONVIEWMEM
.ActionSetWallSliding
  equb NOACTION,NOACTION,NOACTION,NOACTION,ACTIONWALLJUMP,NOACTION,NOACTION,ACTIONVIEWMEM
.ActionSetDiving
  equb NOACTION,NOACTION,NOACTION,NOACTION,NOACTION,NOACTION,NOACTION,ACTIONVIEWMEM
.ActionSetSliding 
  equb NOACTION,NOACTION,NOACTION,NOACTION,ACTIONJUMP,NOACTION,NOACTION,ACTIONVIEWMEM
.ActionSetCrouching 
  equb NOACTION,NOACTION,NOACTION,NOACTION,ACTIONLONGJUMP,NOACTION,NOACTION,NOACTION


.Mult8Table
  equb $00,$08,$10,$18,$20,$28,$30,$38,$40,$48,$50,$58,$60,$68,$70,$78,$80,$88,$90,$98,$a0,$a8,$b0,$b8,$c0,$c8,$d0,$d8,$e0,$e8,$f0,$f8
  equb $00,$08,$10,$18,$20,$28,$30,$38,$40,$48,$50,$58,$60,$68,$70,$78,$80,$88,$90,$98,$a0,$a8,$b0,$b8,$c0,$c8,$d0,$d8,$e0,$e8,$f0,$f8

.mmtfBrickWallL
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
.mmtfBrickWallR
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

.mmtfBlankWall1
  equb 1,0
  equb $ff
.mmtfBlankWall2
  equb 1,0
  equb 1,0
  equb $ff
.mmtfBlankWall4
  equb 1,0
  equb 1,0
  equb 1,0
  equb 1,0
  equb $ff
.mmtfBlankWall8
  equb 1,0
  equb 1,0
  equb 1,0
  equb 1,0
  equb 1,0
  equb 1,0
  equb 1,0
  equb 1,0
  equb $ff

.mmtfBlankWall16
  equb 1,0
  equb 1,0 
  equb 1,0
  equb 1,0
  equb 1,0
  equb 1,0 
  equb 1,0
  equb 1,0
  equb 1,0
  equb 1,0 
  equb 1,0
  equb 1,0
  equb 1,0
  equb 1,0 
  equb 1,0
  equb 1,0
  equb $ff

.mmtfFlatWall2
  equb 1,1
  equb 1,1
  equb $ff
.mmtfFlatWall4
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb $ff
.mmtfFlatWall8
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb $ff
.mmtfFlatWall16
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb 1,1
  equb $ff
.mmtfFlatFloor1
  equb 1,1
  equb $ff
.mmtfFlatFloor2
  equb 2,1,1
  equb $ff
.mmtfFlatFloor4
  equb 4,1,1,1,1
  equb $ff
.mmtfFlatFloor8
  equb 8,1,1,1,1,1,1,1,1
  equb $ff
.mmtfFlatFloor16
  equb 16,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  equb $ff
.mmtfBrickFloor16
  equb 16,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27
  equb $ff
.mmtfEarthFloor16
  equb 16,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23
  equb $ff
.mmtfBlankFloor1
  equb 1,0
  equb $ff
.mmtfBlankFloor2
  equb 2,0,0
  equb $ff
.mmtfBlankFloor4
  equb 4,0,0,0,0
  equb $ff
.mmtfBlankFloor5
  equb 5,0,0,0,0,0
  equb $ff
.mmtfBlankFloor8
  equb 8,0,0,0,0,0,0,0,0
  equb $ff
.mmtfBlankFloor16
  equb 16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb $ff
.mmtStepTopL
  equb 2,12,1
  equb $ff
.mmtStepTopR
  equb 2,1,12
  equb $ff
.mmtfConveyerLeft16
  equb 16,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31
  equb $ff
.mmtfConveyerRight16
  equb 16,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
  equb $ff
.mmtfConveyerLeft8
  equb 8,31,31,31,31,31,31,31,31
  equb $ff
.mmtfConveyerRight8
  equb 8,32,32,32,32,32,32,32,32
  equb $ff
.mmtfConveyerLeft4
  equb 4,31,31,31,31
  equb $ff
.mmtfConveyerRight4
  equb 4,32,32,32,32
  equb $ff
.mmtfConveyerLeft2
  equb 2,31,31
  equb $ff
.mmtfConveyerRight2
  equb 2,32,32
  equb $ff
.mmtfBounce1
  equb 1,16
  equb $ff
.mmtfBounce2
  equb 2,16,16
  equb $ff
.mmtfBrickCeiling16
  equb 16,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28
  equb $ff
.MMTFloor16Earth

.ExitPositionslo
  equb $00,$20,$10,$90
.ExitPositionshi
  equb $7c,$7b,$7e,$58

.TextWorldLocations
  equb %00000000

.TextWorldStrings

.DictionaryStringThe
  equs " the "
  equb $00
.DictionaryStringYou
  equs " you "
  equb $00
.DictionaryStringIt
  equs " it "
  equb $00
.DictionaryStringGoodSquaresPress
  equs "Good squares press "
  equb $00
.DictionaryStringAnd
  equs " and "
  equb $00
.DictionaryStringTo
  equs " to "
  equb $00
; be safe, I love you
; I hate you, be safe

.DeathMessage1
  equs "You died"

.StringTutorial1
  equb DICTIONARY_GOODSQUARESPRESS
  equs "K"
  equb DICTIONARY_TO
  equs "JUMP"
  equb $00
.StringTutorial2
  equb DICTIONARY_GOODSQUARESPRESS
  equs "L"
  equb DICTIONARY_TO
  equs "DIVE"
  equb $00
.StringTutorial3
  equb DICTIONARY_GOODSQUARESPRESS
  equs "A"
  equb DICTIONARY_AND
  equs "D"
  equb DICTIONARY_TO
  equs "MOVE"
  equb $00
.StringTutorial4
  equb DICTIONARY_GOODSQUARESPRESS
  equs "S"
  equb DICTIONARY_AND
  equs "K"
  equb DICTIONARY_TO
  equs "LONGJUMP"
  equb $00
.StringTutorial5
  equs "Good circles #$£%"
  equb DICTIONARY_AND
  equb "$#**"
  equb DICTIONARY_TO
  equs "LIVE"
  equb $00
.StringTitle
  equb DICTIONARY_GOODSQUARESPRESS
  equs "K"
  equb DICTIONARY_TO
  equs "Start"
  equb $00



; Good squares press K to JUMP
; Good squares press L to DIVE
; Good squares press S and K to LONGJUMP
; Good squares press A and D to MOVE
; Good Circles #$£% and $#** to LIVE
; 