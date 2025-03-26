

align &0100

;Used mainly to flip sprites horizontally during sprite draw
;Non LookUp solutions unacceptably slow for how frequently its used (8 times per sprite!)
.ReverseBitsTable
  equb %00000000 ; 00000000
  equb %10000000 ; 00000001
  equb %01000000 ; 00000010
  equb %11000000 ; 00000011
  equb %00100000 ; 00000100
  equb %10100000 ; 00000101
  equb %01100000 ; 00000110
  equb %11100000 ; 00000111
  equb %00010000 ; 00001000
  equb %10010000 ; 00001001
  equb %10100000 ; 00001010
  equb %11010000 ; 00001011
  equb %00110000 ; 00001100
  equb %10110000 ; 00001101
  equb %01110000 ; 00001110
  equb %11110000 ; 00001111

  equb %00001000 ; 00010000
  equb %10001000 ; 00010001
  equb %01001000 ; 00010010
  equb %11001000 ; 00010011
  equb %00101000 ; 00010100
  equb %10101000 ; 00010101
  equb %01101000 ; 00010110
  equb %11101000 ; 00010111
  equb %00011000 ; 00011000
  equb %10011000 ; 00011001
  equb %01011000 ; 00011010
  equb %11011000 ; 00011011
  equb %00111000 ; 00011100
  equb %10111000 ; 00011101
  equb %01111000 ; 00011110
  equb %11111000 ; 00011111

  equb %00000100 ; 00100000
  equb %10000100 ; 00100001
  equb %01000100 ; 00100010
  equb %11000100 ; 00100011
  equb %00100100 ; 00100100
  equb %10100100 ; 00100101
  equb %01100100 ; 00100110
  equb %11100100 ; 00100111
  equb %00010100 ; 00101000
  equb %10010100 ; 00101001
  equb %01010100 ; 00101010
  equb %11010100 ; 00101011
  equb %00110100 ; 00101100
  equb %10110100 ; 00101101
  equb %01110100 ; 00101110
  equb %11110100 ; 00101111

  equb %00001100 ; 00110000
  equb %10001100 ; 00110001
  equb %01001100 ; 00110010
  equb %11001100 ; 00110011
  equb %00110100 ; 00110100
  equb %10101100 ; 00110101
  equb %01101100 ; 00110110
  equb %11101100 ; 00110111
  equb %00011100 ; 00111000
  equb %10011100 ; 00111001
  equb %01011100 ; 00111010
  equb %11011100 ; 00111011
  equb %00111100 ; 00111100
  equb %10111100 ; 00111101
  equb %01111100 ; 00111110
  equb %11111100 ; 00111111

  equb %00000010 ; 01000000
  equb %10000010 ; 01000001
  equb %01000010 ; 01000010
  equb %11000010 ; 01000011
  equb %00100010 ; 01000100
  equb %10100010 ; 01000101
  equb %01100010 ; 01000110
  equb %11100010 ; 01000111
  equb %00010010 ; 01001000
  equb %10010010 ; 01001001
  equb %01010010 ; 01001010
  equb %11010010 ; 01001011
  equb %00110010 ; 01001100
  equb %10110010 ; 01001101
  equb %01110010 ; 01001110
  equb %11110010 ; 01001111

  equb %00001010 ; 01010000
  equb %10001010 ; 01010001
  equb %01001010 ; 01010010
  equb %11001010 ; 01010011
  equb %00101010 ; 01010100
  equb %10101010 ; 01010101
  equb %01101010 ; 01010110
  equb %11101010 ; 01010111
  equb %00011010 ; 01011000
  equb %10011010 ; 01011001
  equb %01011010 ; 01011010
  equb %11011010 ; 01011011
  equb %00111010 ; 01011100
  equb %10111010 ; 01011101
  equb %01111010 ; 01011110
  equb %11111010 ; 01011111

  equb %00000110 ; 01100000
  equb %10000110 ; 01100001
  equb %01000110 ; 01100010
  equb %11000110 ; 01100011
  equb %00100110 ; 01100100
  equb %10100110 ; 01100101
  equb %01100110 ; 01100110
  equb %11100110 ; 01100111
  equb %00010110 ; 01101000
  equb %10010110 ; 01101001
  equb %10100110 ; 01101010
  equb %11010110 ; 01101011
  equb %00110110 ; 01101100
  equb %10110110 ; 01101101
  equb %01110110 ; 01101110
  equb %11110110 ; 01101111

  equb %00001110 ; 01110000
  equb %10001110 ; 01110001
  equb %01001110 ; 01110010
  equb %11001110 ; 01110011
  equb %00101110 ; 01110100
  equb %10101110 ; 01110101
  equb %01101110 ; 01110110
  equb %11101110 ; 01110111
  equb %00011110 ; 01111000
  equb %10011110 ; 01111001
  equb %01011110 ; 01111010
  equb %11011110 ; 01111011
  equb %00111110 ; 01111100
  equb %10111110 ; 01111101
  equb %01111110 ; 01111110
  equb %11111110 ; 01111111

  equb %10000001 ; 10000000
  equb %10000001 ; 10000001
  equb %01000001 ; 10000010
  equb %11000001 ; 10000011
  equb %00100001 ; 10000100
  equb %10100001 ; 10000101
  equb %01100001 ; 10000110
  equb %11100001 ; 10000111
  equb %00010001 ; 10001000
  equb %10010001 ; 10001001
  equb %01010001 ; 10001010
  equb %11010001 ; 10001011
  equb %00110001 ; 10001100
  equb %10110001 ; 10001101
  equb %01110001 ; 10001110
  equb %11110001 ; 10001111

  equb %00001001 ; 10010000
  equb %10001001 ; 10010001
  equb %01001001 ; 10010010
  equb %11001001 ; 10010011
  equb %00101001 ; 10010100
  equb %10101001 ; 10010101
  equb %01101001 ; 10010110
  equb %11101001 ; 10010111
  equb %00011001 ; 10011000
  equb %10011001 ; 10011001
  equb %01011001 ; 10011010
  equb %11011001 ; 10011011
  equb %00111001 ; 10011100
  equb %10111001 ; 10011101
  equb %01111001 ; 10011110
  equb %11111001 ; 10011111

  equb %00000101 ; 10100000
  equb %10000101 ; 10100001
  equb %01000101 ; 10100010
  equb %00100011 ; 10100011
  equb %00100101 ; 10100100
  equb %00100101 ; 10100101
  equb %01100101 ; 10100110
  equb %11100101 ; 10100111
  equb %00010101 ; 10101000
  equb %10010101 ; 10101001
  equb %01010101 ; 10101010
  equb %11010101 ; 10101011
  equb %00110101 ; 10101100
  equb %10110101 ; 10101101
  equb %01110101 ; 10101110
  equb %11110101 ; 10101111

  equb %00001101 ; 10110000
  equb %10001101 ; 10110001
  equb %01001101 ; 10110010
  equb %11001101 ; 10110011
  equb %00110101 ; 10110100
  equb %10101101 ; 10110101
  equb %01101101 ; 10110110
  equb %11101101 ; 10110111
  equb %00011101 ; 10111000
  equb %10011101 ; 10111001
  equb %01011101 ; 10111010
  equb %11011101 ; 10111011
  equb %00111101 ; 10111100
  equb %10111101 ; 10111101
  equb %01111101 ; 10111110
  equb %11111101 ; 10111111

  equb %00000011 ; 11000000
  equb %10000011 ; 11000001
  equb %01000011 ; 11000010
  equb %11000011 ; 11000011
  equb %00100011 ; 11000100
  equb %10100011 ; 11000101
  equb %01100011 ; 11000110
  equb %11100011 ; 11000111
  equb %00010011 ; 11001000
  equb %10010011 ; 11001001
  equb %01010011 ; 11001010
  equb %11010011 ; 11001011
  equb %00110011 ; 11001100
  equb %10110011 ; 11001101
  equb %01110011 ; 11001110
  equb %11110011 ; 11001111

  equb %00001011 ; 11010000
  equb %10001011 ; 11010001
  equb %01001011 ; 11010010
  equb %11001011 ; 11010011
  equb %00101011 ; 11010100
  equb %10101011 ; 11010101
  equb %01101011 ; 11010110
  equb %11101011 ; 11010111
  equb %00011011 ; 11011000
  equb %10011011 ; 11011001
  equb %01011011 ; 11011010
  equb %11011011 ; 11011011
  equb %00111011 ; 11011100
  equb %10111011 ; 11011101
  equb %01111011 ; 11011110
  equb %11111011 ; 11011111

  equb %00000111 ; 11100000
  equb %10000111 ; 11100001
  equb %01000111 ; 11100010
  equb %11000111 ; 11100011
  equb %00100111 ; 11100100
  equb %10100111 ; 11100101
  equb %01100111 ; 11100110
  equb %11100111 ; 11100111
  equb %00010111 ; 11101000
  equb %10010111 ; 11101001
  equb %10100111 ; 11101010
  equb %11010111 ; 11101011
  equb %00110111 ; 11101100
  equb %10110111 ; 11101101
  equb %01110111 ; 11101110
  equb %11110111 ; 11101111

  equb %00001111 ; 01110000
  equb %10001111 ; 01110001
  equb %01001111 ; 01110010
  equb %11001111 ; 01110011
  equb %00101111 ; 01110100
  equb %10101111 ; 01110101
  equb %01101111 ; 01110110
  equb %11101111 ; 01110111
  equb %00011111 ; 01111000
  equb %10011111 ; 01111001
  equb %01011111 ; 01111010
  equb %11011111 ; 01111011
  equb %00111111 ; 01111100
  equb %10111111 ; 01111101
  equb %01111111 ; 01111110
  equb %11111111 ; 01111111

.f7

; .StaticTileListLo
;   equb <StaticTileListEmpty
;   equb <StaticTileListComputerPanel

; .StaticTileListHi
;   equb >StaticTileListEmpty
;   equb >StaticTileListComputerPanel

; .StaticTileEmpty
; .StaticTileListComputerPanel
;   equw StaticTileComputerPanel1
;   equw StaticTileComputerPanel2

; .StaticEntityDataLo 
;   equb <NoData
;   ; equb 

.StaticEntityAnimationListLo
  equb <NoStaticAnimation
  equb <StaticAnimation1

.StaticEntityAnimationListHi
  equb >NoStaticAnimation
  equb >StaticAnimation1

.NoStaticAnimation
.StaticAnimation1
  equb 10,0,10,1,10,2,10,3,10,4,10,5,10,6,10,7,255

.StaticEntitySpriteListLo
  equb <NoStaticSprite
  equb <StaticEntitySpritesComputer
.StaticEntitySpriteListHi
  equb >NoStaticSprite
  equb >StaticEntitySpritesComputer

.NoStaticSprite
.StaticEntitySpritesComputer
  equw StaticEntityDataComputer1
  equw StaticEntityDataComputer2
  equw StaticEntityDataComputer3
  equw StaticEntityDataComputer4
  equw StaticEntityDataComputer5
  equw StaticEntityDataComputer6
  equw StaticEntityDataComputer7
  equw StaticEntityDataComputer8

.StaticEntityDataComputer1
  equw Window1_1 ; 8x8 tile
  equw Window1_2
  equw Window5_1
  equw Window5_2

.StaticEntityDataComputer2
  equw Window2_1 ; 8x8 tile
  equw Window2_2
  equw Window6_1
  equw Window6_2

.StaticEntityDataComputer3
  equw Window3_1 ; 8x8 tile
  equw Window3_2
  equw Window7_1
  equw Window7_2

.StaticEntityDataComputer4
  equw Window4_1 ; 8x8 tile
  equw Window4_2
  equw Window8_1
  equw Window8_2

.StaticEntityDataComputer5
  equw Window5_1 ; 8x8 tile
  equw Window5_2
  equw Window1_1
  equw Window1_2

.StaticEntityDataComputer6
  equw Window6_1 ; 8x8 tile
  equw Window6_2
  equw Window2_1
  equw Window2_2

.StaticEntityDataComputer7
  equw Window7_1 ; 8x8 tile
  equw Window7_2
  equw Window3_1
  equw Window3_2

.StaticEntityDataComputer8
  equw Window8_1 ; 8x8 tile
  equw Window8_2
  equw Window4_1
  equw Window4_2

.oswrchinitvals
  equb 22,4 ;screenmode 4
  equb 23,1,0,0,0,0,0,0,0,0 ;disable cursor

.MetaColumnListLo
  equb <MetaColumnFloorOnly;0
  equb <MetaColumnFloorCeiling;1
  equb <MetaColumnFullWall;2
  equb <MetaColumnStep1;3
  equb <MetaColumnStep2;4
  equb <MetaColumnStep3;5
  equb <MetaColumnStep4;6
  equb <MetaColumnStep5;7
  equb <MetaColumnStep6;8
  equb <MetaColumnStep7;9
.MetaColumnListHi
  equb >MetaColumnFloorOnly
  equb >MetaColumnFloorCeiling
  equb >MetaColumnFullWall
  equb >MetaColumnStep1
  equb >MetaColumnStep2
  equb >MetaColumnStep3
  equb >MetaColumnStep4
  equb >MetaColumnStep5
  equb >MetaColumnStep6
  equb >MetaColumnStep7

.MetaColumnFloorOnly
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 1

.MetaColumnFloorCeiling
  equb 1
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 0
  equb 1

 .MetaColumnFullWall
  equb 1
  equb 1
  equb 1
  equb 1
  equb 1
  equb 1
  equb 1
  equb 1
  equb 1
  equb 1
  equb 1
  equb 1
  equb 1
  equb 1
  equb 1
  equb 1

.MetaColumnStep1
  equb 1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1
.MetaColumnStep2
  equb 1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1
.MetaColumnStep3
  equb 1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1
.MetaColumnStep4
  equb 1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1
.MetaColumnStep5
  equb 1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1
.MetaColumnStep6
  equb 1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1
.MetaColumnStep7
  equb 1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1


.MetaColumnMap
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

.GameStatesLo
  equb <GameStatePlaying
  equb <GameStateTitle
  equb <GameStatePaused

.GameStatesHi
  equb >GameStatePlaying
  equb >GameStateTitle
  equb >GameStatePaused

.InitGameStatesLo
  equb <InitGameStatePlaying
  equb <InitGameStateTitle
  equb <InitGameStatePaused

.InitGameStatesHi
  equb >InitGameStatePlaying
  equb >InitGameStateTitle
  equb >InitGameStatePaused

.InputActionsLo
  equb <ActionNoAction
  equb <ActionMoveLeft
  equb <ActionMoveRight
  equb <ActionJump
  equb <ActionDoubleJump
  equb <ActionWallJump
  equb <ActionInvertGravity

.InputActionsHi
  equb >ActionNoAction
  equb >ActionMoveLeft
  equb >ActionMoveRight
  equb >ActionJump
  equb >ActionDoubleJump
  equb >ActionWallJump
  equb >ActionInvertGravity

.MapChangeFunctionsLo
  equb <MapChangeNone
  equb <MapChangeRight
  equb <MapChangeLeft
  equb <MapChangeDown
  equb <MapChangeUp

.MapChangeFunctionsHi
  equb >MapChangeNone
  equb >MapChangeRight
  equb >MapChangeLeft
  equb >MapChangeDown
  equb >MapChangeUp

.MetaTileListLo
  equb <MetaTileEmpty ;0
  equb <MetaTileSolid;1
  equb <MetaTileBorderLeft;2
  equb <MetaTileBorderRight;3
  equb <MetaTileBorderTop;4
  equb <MetaTileBorderBottom;5
  equb <MetaTileHalfTop;6
  equb <MetaTilePillar;7
  equb <MetaTileLadder;8
  equb <MetaTileCorner1;9
  equb <MetaTileCorner2;a
  equb <MetaTileCorner3;b
  equb <MetaTileCorner4;c
  equb <OutLineTop;d
  equb <OutLineDown;e
  equb <OutLineLeft;f
  equb <OutLineRight;10
  equb <MetaTileWindow ;11


.MetaTileListHi
  equb >MetaTileEmpty ;0
  equb >MetaTileSolid ;1
  equb >MetaTileBorderLeft ;2
  equb >MetaTileBorderRight ;3
  equb >MetaTileBorderTop;4
  equb >MetaTileBorderBottom ;5
  equb >MetaTileHalfTop ;6
  equb >MetaTilePillar;7
  equb >MetaTileLadder;8
  equb >MetaTileCorner1;9
  equb >MetaTileCorner2;0a
  equb >MetaTileCorner3;0b
  equb >MetaTileCorner4;0c
  equb >OutLineTop;0d
  equb >OutLineDown;0e
  equb >OutLineLeft;0f
  equb >OutLineRight;10
  equb >MetaTileWindow
.MapListLo
  equb <ScreenStart
  equb <Screen1
  equb <Screen2
  equb <Screen3
  equb <Screen4
  equb <Screen5
  equb <Screen6
  equb <Screen7

  equb <Screen8
  equb <Screen9
  equb <Screen10
  equb <Screen11
  equb <Screen12
  equb <Screen13
  equb <Screen14
  equb <Screen15

  equb <Screen16
  equb <Screen17
  equb <Screen18
  equb <Screen19
  equb <Screen20
  equb <Screen21
  equb <Screen22
  equb <Screen23

  equb <Screen24
  equb <Screen25
  equb <Screen26
  equb <Screen27
  equb <Screen28
  equb <Screen29
  equb <Screen30
  equb <Screen31



.MapListHi
  equb >ScreenStart
  equb >Screen1
  equb >Screen2
  equb >Screen3
  equb >Screen4
  equb >Screen5
  equb >Screen6
  equb >Screen7

  equb >Screen8
  equb >Screen9
  equb >Screen10
  equb >Screen11
  equb >Screen12
  equb >Screen13
  equb >Screen14
  equb >Screen15

  equb >Screen16
  equb >Screen17
  equb >Screen18
  equb >Screen19
  equb >Screen20
  equb >Screen21
  equb >Screen22
  equb >Screen23

  equb >Screen24
  equb >Screen25
  equb >Screen26
  equb >Screen27
  equb >Screen28
  equb >Screen29
  equb >Screen30
  equb >Screen31


.ScreenStart
  equb $01,$01,$01,$01,$03,$04,$05,$06,$07,$08,$09,$01,$01,$01,$01,$01,$01

.Screen1
  equb $00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00

.Screen2
  equb 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2

.Screen3
  ; equb 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

.Screen4
  ; equb 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
.Screen5
  ; equb 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
.Screen6
  ; equb 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
.Screen7
.Screen8
.Screen9
.Screen10
.Screen11
.Screen12
.Screen13
.Screen14
.Screen15

.Screen16
.Screen17
.Screen18
.Screen19
.Screen20
.Screen21
.Screen22
.Screen23
.Screen24

.Screen25

.Screen26
  ; equb 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

.Screen27

.Screen28

.Screen29

.Screen30

.Screen31

.Screen32

.Screen33

.Screen34

.Screen35

.Screen36

.Screen37

.Screen38

.Screen39

.MetaTileEmpty
  equb 0,0,0,0
  equb %00000000
.MetaTileSolid
  equb 1,1,1,1 ; tile indices
  equb %00001111 ; special data <4 = collision for 4 internal tiles
.MetaTileBorderLeft
  equb 1,2,1,2
  equb %00001111
.MetaTileBorderRight
  equb 3,1,3,1
  equb %00001111
.MetaTileBorderBottom
  equb 4,4,1,1
  equb %00001111
.MetaTileBorderTop
  equb 1,1,5,5
  equb %00001111
.MetaTileHalfTop
  equb 0,0,1,1
  equb %00001111
.MetaTilePillar
  equb 7,9,8,10
  equb %00000000
.MetaTileLadder
  equb $0b,$0c,$0b,$0c
  equb %00000000
.MetaTileCorner1
  equb $09,$0d,$0d,$0d
  equb %00001111
.MetaTileCorner2
  equb $0d,$0d,$0d,$0a
  equb %00001111
.MetaTileCorner3
  equb $0d,$0d,$0d,$0b
  equb %00001111
.MetaTileCorner4
  equb $0c,$0d,$0d,$0d
  equb %00001111
.OutLineTop
  equb $00,$00,$0d,$0d
  equb %00001111
.OutLineDown
  equb $10,$10,$00,$00
  equb %00001111
.OutLineLeft
  equb $00,$0e,$00,$0e
  equb %00001111
.OutLineRight
  equb $0f,$00,$0f,$00
  equb %00001111
.MetaTileWindow
  equb $15,$17,$16,$18
  equb %00001111

.TilePatternsLo
  equb <TilePatternEmpty ;00
  equb <TilePatternSolid;01
  equb <TilePatternLeftBorder;02
  equb <TilePatternRightBorder;03
  equb <TilePatternTopBorder;04
  equb <TilePatternBottomBorder;05
  equb <TilePatternBox;06
  equb <TilePatternPillar1;07
  equb <TilePatternPillar2;08
  equb <TilePatternPillar3;09
  equb <TilePatternPillar4;0a
  equb <TilePatternLadderL;0b
  equb <TilePatternLadderR;0c
  equb <TileOutlineTop;0d
  equb <TileOutlineLeft;0e
  equb <TileOutlineRight;0f
  equb <TileOutlineDown;10
  equb <TileOutlineCorner1;11
  equb <TileOutlineCorner2;12
  equb <TileOutlineCorner3;13
  equb <TileOutlineCorner4;14
  equb <TileWindow1;15
  equb <TileWindow2;16
  equb <TileWindow3;17
  equb <TileWindow4;18
  equb <Computer1
  equb <Computer2
  equb <Computer3
  equb <Computer4
  equb <Window1_1
  equb <Window1_2
  equb <Window2_1
  equb <Window2_2
  equb <Window3_1
  equb <Window3_2
  equb <Window4_1
  equb <Window4_2
  equb <Window5_1
  equb <Window5_2
  equb <Window6_1
  equb <Window6_2
  equb <Window7_1
  equb <Window7_2
  equb <Window8_1
  equb <Window8_2

.TilePatternsHi
  equb >TilePatternEmpty
  equb >TilePatternSolid
  equb >TilePatternLeftBorder
  equb >TilePatternRightBorder
  equb >TilePatternTopBorder
  equb >TilePatternBottomBorder
  equb >TilePatternBox
  equb >TilePatternPillar1
  equb >TilePatternPillar2
  equb >TilePatternPillar3
  equb >TilePatternPillar4
  equb >TilePatternLadderL
  equb >TilePatternLadderR
  equb >TileOutlineTop
  equb >TileOutlineLeft
  equb >TileOutlineRight
  equb >TileOutlineDown
  equb >TileOutlineCorner1
  equb >TileOutlineCorner2
  equb >TileOutlineCorner3
  equb >TileOutlineCorner4
  equb >TileWindow1;15
  equb >TileWindow2;16
  equb >TileWindow3;17
  equb >TileWindow4;18
  equb >Computer1
  equb >Computer2
  equb >Computer3
  equb >Computer4
  equb >Window1_1
  equb >Window1_2
  equb >Window2_1
  equb >Window2_2
  equb >Window3_1
  equb >Window3_2
  equb >Window4_1
  equb >Window4_2
  equb >Window5_1
  equb >Window5_2
  equb >Window6_1
  equb >Window6_2
  equb >Window7_1
  equb >Window7_2
  equb >Window8_1
  equb >Window8_2

.TilePatternSolid
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111

.TilePatternEmpty
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000

.TilePatternLeftBorder
  equb %11111101
  equb %11111101
  equb %11111101
  equb %11111101
  equb %11111101
  equb %11111101
  equb %11111101
  equb %11111101

.TilePatternRightBorder
  equb %10111111
  equb %10111111
  equb %10111111
  equb %10111111
  equb %10111111
  equb %10111111
  equb %10111111
  equb %10111111

.TilePatternTopBorder
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %00000000
  equb %11111111

.TilePatternBottomBorder
  equb %11111111
  equb %00000000
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111

.TilePatternBox
  equb %11111111
  equb %10000001
  equb %10000001
  equb %10000001
  equb %10000001
  equb %10000001
  equb %10000001
  equb %11111111

.TilePatternPillar1
  equb %11111111
  equb %11100000
  equb %00011111
  equb %11111111
  equb %11100000
  equb %00011111
  equb %11111111
  equb %11100000

.TilePatternPillar2
  equb %00011111
  equb %11111111
  equb %11100000
  equb %00011111
  equb %11100000
  equb %00011111
  equb %11111111

.TilePatternPillar3
  equb %00000111
  equb %11111111
  equb %11111000
  equb %00000111
  equb %11111111
  equb %11111000
  equb %00000111
  equb %11111111

.TilePatternPillar4
  equb %11111000
  equb %00000111
  equb %11111111
  equb %11111000
  equb %00000111
  equb %11111111
  equb %11111000
  equb %00000111
.TilePatternLadderL
  equb %00001111
  equb %00101000
  equb %00111111
  equb %00001000
  equb %00001111
  equb %00001000
  equb %00001111
  equb %00001000
.TilePatternLadderR
  equb %11110000
  equb %00010100
  equb %11111100
  equb %00010000
  equb %11110000
  equb %00010000
  equb %11110000
  equb %00010000
.TileOutlineTop
  equb %11111111
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
.TileOutlineLeft
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
.TileOutlineRight
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
.TileOutlineDown
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %11111111
.TileOutlineCorner1
  equb %11111111
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
.TileOutlineCorner2
  equb %11111111
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
.TileOutlineCorner3
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %11111111
.TileOutlineCorner4
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %11111111
.TileWindow1
  equb %00000000
  equb %11111111
  equb %10001100
  equb %10010000
  equb %10100000
  equb %10100000
  equb %11000000
  equb %11000000 
.TileWindow2
  equb %11000000
  equb %11000000
  equb %10100000
  equb %10100000
  equb %10010000 
  equb %10001100
  equb %11111111
  equb %00000000
.TileWindow3
  equb %00000000
  equb %11111111
  equb %00110001
  equb %00001001
  equb %00000101
  equb %00000101
  equb %00000011
  equb %00000011
.TileWindow4
  equb %00000011
  equb %00000011
  equb %00000101
  equb %00000101
  equb %00001001
  equb %00110001
  equb %11111111
  equb %00000000
.Computer1
  equb %11111111
  equb %10000001
  equb %10100001
  equb %10101001
  equb %10111001
  equb %10111101
  equb %10000001
  equb %11111111
.Computer2
  equb %11111111
  equb %10000001
  equb %10000001
  equb %10110001
  equb %10111101
  equb %10111101
  equb %10000001
  equb %11111111
.Computer3
  equb %11111111
  equb %10000001
  equb %10010001
  equb %10010101
  equb %10110101
  equb %10111101
  equb %10000001
  equb %11111111
.Computer4
  equb %11111111
  equb %10000001
  equb %10001101
  equb %10001101
  equb %10001101
  equb %10111101
  equb %10000001
  equb %11111111
.Window1_1
  equb %01111111
  equb %10110000
  equb %11000000
  equb %10000000
  equb %10000000
  equb %11000100
  equb %10100000
  equb %01111111
.Window1_2
  equb %11111110
  equb %00000101
  equb %00100011
  equb %00000001
  equb %00000101
  equb %00000011
  equb %00000101
  equb %11111110
.Window2_1
  equb %01111111
  equb %10100000
  equb %11000000
  equb %10000000
  equb %10000000
  equb %11010000
  equb %10100000
  equb %01111111
.Window2_2
  equb %11111110
  equb %00000101
  equb %10000011
  equb %00000001
  equb %00010001
  equb %00000011
  equb %00000101
  equb %11111110
.Window3_1
  equb %01111111
  equb %10100000
  equb %11000010
  equb %10000000
  equb %10000000
  equb %11000000
  equb %10100000
  equb %01111111
.Window3_2
  equb %11111110
  equb %00000101
  equb %00000011
  equb %00000001
  equb %01000001
  equb %00000011
  equb %00000101
  equb %11111110
.Window4_1
  equb %01111111
  equb %10100000
  equb %11001000
  equb %10000000
  equb %10000001
  equb %11000000
  equb %10100000
  equb %01111111
.Window4_2
  equb %11111110
  equb %00000101
  equb %00000011
  equb %00000001
  equb %00000001
  equb %00000011
  equb %00000101
  equb %11111110
.Window5_1
  equb %01111111
  equb %10100000
  equb %11100000
  equb %10000000
  equb %10000100
  equb %11000000
  equb %10100000
  equb %01111111
.Window5_2
  equb %11111110
  equb %00010101
  equb %00000011
  equb %00000001
  equb %00000001
  equb %00000111
  equb %00000101
  equb %11111110
.Window6_1
  equb %01111111
  equb %10100000
  equb %11000000
  equb %10000000
  equb %10010000
  equb %11000000
  equb %10100000
  equb %01111111
.Window6_2
  equb %11111110
  equb %10000101
  equb %00000011
  equb %00000001
  equb %00000001
  equb %00010011
  equb %00000101
  equb %11111110
.Window7_1
  equb %01111111
  equb %10100001
  equb %11000000
  equb %10000000
  equb %11000000
  equb %11000000
  equb %10100000
  equb %01111111
.Window7_2
  equb %11111110
  equb %00000101
  equb %00000011
  equb %00000001
  equb %00000001
  equb %01000011
  equb %00000101
  equb %11111110
.Window8_1
  equb %01111111
  equb %10100100
  equb %11000000
  equb %10000000
  equb %10000000
  equb %11000001
  equb %10100000
  equb %01111111
.Window8_2
  equb %11111110
  equb %00000101
  equb %00001011
  equb %00000001
  equb %00000001
  equb %00000011
  equb %00000101
  equb %11111110

.CalcM64lo
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0

.CalcM64hi
  equb $00,$00,$00,$00
  equb $01,$01,$01,$01
  equb $02,$02,$02,$02
  equb $03,$03,$03,$03
  equb $04,$04,$04,$04
  equb $05,$05,$05,$05
  equb $06,$06,$06,$06
  equb $07,$07,$07,$07

.SpriteListLo
  equb <SpritesNone
  equb <SpritesPlayer
  equb <SpritesFlameBracket
  equb <SpritesSparkWire

.SpriteListHi
  equb >SpritesNone
  equb >SpritesPlayer
  equb >SpritesFlameBracket
  equb >SpritesSparkWire

.SpritesNone
.SpritesPlayer
  equw SpritePlayerRightRun1
  equw SpritePlayerRightRun2
  equw SpritePlayerRightRun3
  equw SpritePlayerIdle1
  equw SpritePlayerIdle2
  equw SpritePlayerLadder1
  equw SpritePlayerLadder2
.SpritesFlameBracket
  equw SpriteFlameBracket1
  equw SpriteFlameBracket2
  equw SpriteFlameBracket3
.SpritesSparkWire
  equw SpriteSparkWire1
  equw SpriteSparkWire2
  equw SpriteSparkWire3
  equw SpriteSparkWire4
  equw SpriteSparkWire5
  equw SpriteSparkWire6
  equw SpriteSparkWire7
  equw SpriteSparkWire8

align &08

.SpritePlayerRightRun1
  equb %00000000
  equb %00001000
  equb %00000000
  equb %00001000
  equb %00001000
  equb %00011000
  equb %00001100
  equb %00010000
.SpritePlayerRightRun2
  equb %00001000
  equb %00000000
  equb %00001000
  equb %00001000
  equb %00001000
  equb %00001000
  equb %00000000
  equb %00001000
.SpritePlayerRightRun3
  equb %00000000
  equb %00001000
  equb %00000000
  equb %00001000
  equb %00001100
  equb %00001000
  equb %00011000
  equb %00000100

.SpritePlayerIdle1
  equb %00000000
  equb %00011000
  equb %00011000
  equb %00000000
  equb %00111100
  equb %01011010
  equb %00011000
  equb %00100100
.SpritePlayerIdle2
  equb %00011000
  equb %00011000
  equb %00000000
  equb %00111100
  equb %01011010
  equb %00011000
  equb %00100100
  equb %00100100
.SpritePlayerLadder1
  equb %00011000
  equb %00011000
  equb %00100000
  equb %00111100
  equb %00011010
  equb %00011100
  equb %00100100
  equb %00100000
.SpritePlayerLadder2
  equb %00011000
  equb %00011000
  equb %00000100
  equb %00111100
  equb %01011000
  equb %00111000
  equb %00100100
  equb %00100000
.SpriteFlameBracket1
  equb %00000000
  equb %00000100
  equb %00100000
  equb %00000000
  equb %00011000
  equb %10111101
  equb %01000010
  equb %00111100
.SpriteFlameBracket2
  equb %00000100
  equb %00100000
  equb %00000000
  equb %00001000
  equb %00011100
  equb %10111101
  equb %01000010
  equb %00111100
.SpriteFlameBracket3
  equb %00100000
  equb %00001010
  equb %00011000
  equb %00010100
  equb %00111000
  equb %10111101
  equb %01000010
  equb %00111100
.SpriteSparkWire1
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00100000
  equb %00111000
  equb %00010000
.SpriteSparkWire2
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00010000
  equb %00111000
  equb %00111000
  equb %00010000
.SpriteSparkWire3
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00001000
  equb %00011000
  equb %00100000
  equb %00111000
  equb %00010000
.SpriteSparkWire4
  equb %00000000
  equb %00000000
  equb %00100000
  equb %00010100
  equb %00001000
  equb %00100000
  equb %00111000
  equb %00010000
.SpriteSparkWire5
  equb %00000000
  equb %00000000
  equb %01000000
  equb %00100110
  equb %00000000
  equb %00100000
  equb %00111000
  equb %00010000
.SpriteSparkWire6
  equb %00000000
  equb %00000000
  equb %01000000
  equb %10000010
  equb %00000001
  equb %00100000
  equb %00111000
  equb %00010000
.SpriteSparkWire7
  equb %00000000
  equb %00000000
  equb %00000000
  equb %10000000
  equb %10000001
  equb %00100001
  equb %00111000
  equb %00010000
.SpriteSparkWire8
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %10000000
  equb %10100001
  equb %00111001
  equb %00010000

.AnimationListLo
  equb <NoAnimations
  equb <PlayerAnimations
  equb <FlameBracketAnimations
  equb <SparkWireAnimations
.AnimationListHi
  equb >NoAnimations
  equb >PlayerAnimations
  equb >FlameBracketAnimations
  equb >SparkWireAnimations

.NoAnimations
.PlayerAnimations
  equw AnimationPlayerIdle
  equw AnimationPlayerWalkRight
  equw AnimationPlayerJumpRight
  equw AnimationPlayerLandRight
  equw AnimationPlayerClimbLadder
.FlameBracketAnimations
  equw AnimationFlameBracket1

.SparkWireAnimations
  equw AnimationSparkWire1

.AnimationPlayerWalkRight
  equb 0,5,1,5,2,5,1,5,255
.AnimationPlayerJumpRight
.AnimationPlayerLandRight
.AnimationPlayerClimbLadder
  equb 5,4,6,4,255
.AnimationPlayerIdle
  equb 3,20,4,20,255
.AnimationFlameBracket1
  equb 0,4,1,4,2,4,255
.AnimationSparkWire1
  equb 3,80,4,1,5,1,6,1,7,1,8,1,9,1,10,1,255

; entity functions
.EntityStateMachineshi
  equb >StateMachineNoEntity
  equb >StateMachinePlayer
  equb >StateMachineFlameBracket
  equb >StateMachineSparkWire
.EntityStateMachineslo
  equb <StateMachineNoEntity
  equb <StateMachinePlayer
  equb <StateMachineFlameBracket
  equb <StateMachineSparkWire

.StateMachineNoEntity ; this is never used and needs no data
.StateMachinePlayer
  equw GenericInit
  equw ProcessPlayer
  equw ProcessPlayerWallSliding
.StateMachineFlameBracket
  equw GenericInit
  equw ProcessStaticSprite
.StateMachineSparkWire
  equw GenericInit
  equw ProcessStaticSprite



.Mult20
  equb 0,16,32,48,64,80,96,112,128,144,160,176,192,208,224,240,255
