

;This code is stored at $3000
;Since we use 3000-8000 for vram, this space will be overwritten once the program starts drawing
;It has
; -Initialisation Code that we only ever call at the start of the program
; -Data that will be relocated into lower memory once the electron has booted and its safe to do so


org &3000
guard &5800

; .MetaColumnMapReloc2
;   equb %000000_00,%0000_0000,%00_000000

.MetaColumnMapReloc
  equb $05,$06,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$07,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$07,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $39,$1f,$01,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $30,$11,$0b,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$39,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
  equb $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10

align &100
.SpritePage1
.SpritePlayerRightRun1Reloc
  equb %00000000
  equb %00001000
  equb %00000000
  equb %00001000
  equb %00001000
  equb %00011000
  equb %00001100
  equb %00010000
.SpritePlayerRightRun2Reloc
  equb %00001000
  equb %00000000
  equb %00001000
  equb %00001000
  equb %00001000
  equb %00001000
  equb %00000000
  equb %00001000
.SpritePlayerRightRun3Reloc
  equb %00000000
  equb %00001000
  equb %00000000
  equb %00001000
  equb %00001100
  equb %00001000
  equb %00011000
  equb %00000100
.SpritePlayerIdle1Reloc
  equb %00000000
  equb %00011000
  equb %00011000
  equb %00000000
  equb %00111100
  equb %01011010
  equb %00011000
  equb %00100100
.SpritePlayerIdle2Reloc
  equb %00011000
  equb %00011000
  equb %00000000
  equb %00111100
  equb %01011010
  equb %00011000
  equb %00100100
  equb %00100100
.SpritePlayerLadder1Reloc
  equb %00001100
  equb %00001100
  equb %00100000
  equb %00111100
  equb %00011010
  equb %00011100
  equb %00100100
  equb %00000100
.SpritePlayerLadder2Reloc
  equb %00110000
  equb %00110000
  equb %00000100
  equb %00111100
  equb %01011000
  equb %00111000
  equb %00100100
  equb %00100000
.SpritePlayerJumping1Reloc
  equb %00011000
  equb %01011010
  equb %01000010
  equb %00111100
  equb %00011000
  equb %00111100
  equb %00100100
  equb %00000000
.SpritePlayerJumping2Reloc
  equb %11000011
  equb %10011001
  equb %00100100
  equb %01011010
  equb %01011010
  equb %00100100
  equb %10011001
  equb %11000011
.SpritePlayerFalling1Reloc
  equb %00000000
  equb %01111110
  equb %01100110
  equb %01011010
  equb %01011010
  equb %01100110
  equb %01111110
  equb %00000000
.SpritePlayerFalling2Reloc
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00101000
  equb %00011110
.SpritePlayerWallSlidingReloc
  equb %00000000
  equb %00000010
  equb %00000000
  equb %00000011
  equb %00000101
  equb %00000001
  equb %00000000
  equb %00000001
.SpritePlayerDivingReloc
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000010
  equb %01111100
  equb %00000100
  equb %00000000
  equb %00000000
.SpritePlayerSlidingReloc
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000010
  equb %00000100
  equb %00111010
  equb %00000000
.SPProjectileRight1Reloc
  equb %00000000
  equb %00100000
  equb %00010000
  equb %00011000
  equb %00011000
  equb %00001000
  equb %00000100
  equb %00000000
.SPProjectileRight2Reloc
  equb %00000000
  equb %00000000
  equb %00000000
  equb %01111000
  equb %00011110
  equb %00000000
  equb %00000000
  equb %00000000
.SPProjectileUp1Reloc
  equb %00000000
  equb %00011000
  equb %00100100
  equb %01000010
  equb %01000010
  equb %00100100
  equb %00011000
  equb %00000000
.SPProjectileUp2Reloc
  equb %00111100
  equb %01000010
  equb %10000001
  equb %10000001
  equb %10000001
  equb %10000001
  equb %01000010
  equb %00111100
.SPFluid1Reloc
  equb %00010100
  equb %00111110
  equb %01100011
  equb %01000001
  equb %01000001
  equb %01100011
  equb %00111110
  equb %00010100
.SPFluid2Reloc
  equb %00010100
  equb %00111110
  equb %00110110
  equb %00100010
  equb %00100010
  equb %00110110
  equb %00111110
  equb %00010100
.SPFluid3Reloc
  equb %00010100
  equb %00011100
  equb %00011100
  equb %00010100
  equb %00010100
  equb %00011100
  equb %00011100
  equb %00010100
.SPFluid4Reloc
  equb %00001000
  equb %00001000
  equb %00001000
  equb %00001000
  equb %00001000
  equb %00001000
  equb %00001000
  equb %00001000
.SPSpikeTrapReloc1
  equb %00000000
  equb %00011000
  equb %00010111
  equb %11101000
  equb %00011000
  equb %00010111
  equb %11101000
  equb %00011000
.SPSpikeTrapReloc2
  equb %00000000
  equb %00011000
  equb %00010110
  equb %01101000
  equb %00011000
  equb %00010110
  equb %01101000
  equb %00011000
.SPSpikeTrapReloc3
  equb %00000000
  equb %00011000
  equb %00010100
  equb %00101000
  equb %00011000
  equb %00010100
  equb %00101000
  equb %00011000
.SPSpikeTrapReloc4
  equb %00000000
  equb %00011000
  equb %00011000
  equb %00011000
  equb %00011000
  equb %00011000
  equb %00011000
  equb %00011000
.SPSpikeTrapReloc5
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00011000
  equb %00011000
  equb %00011000
  equb %00011000

.SPSpikeTrapReloc6
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00011000
.SPTeleportal1Reloc
  equb %00001100
  equb %00000010
  equb %10011001
  equb %10100101
  equb %10100101
  equb %10011001
  equb %01000010
  equb %00111100
.SPTeleportal2Reloc
  equb %00111100
  equb %01000010
  equb %10000001
  equb %10011001
  equb %10011001
  equb %10000001
  equb %01000000
  equb %00110000
.SPKey1Reloc
  equb %00111100
  equb %00100100
  equb %00111100
  equb %00001000
  equb %00001000
  equb %00111000
  equb %00001000
  equb %00111000
.SPKey2Reloc
  equb %00011100
  equb %00010100
  equb %00011100
  equb %00001000
  equb %00001000
  equb %00011000
  equb %00001000
  equb %00011000

;;;sprite page 2
.SpritePage2
  ; dummy sprite to stop draw underflow bug
  equb %00000000
  equb %00001000
  equb %00000000
  equb %00001000
  equb %00001000
  equb %00011000
  equb %00001100
  equb %00010000

.MapListLoReloc ;64 bytes
  equb <Screen1_1;$00
  equb <Screen1_2;$01
  equb <Screen1_3;$02
  equb <Screen1_4;$03
  equb <Screen1_5;$04
  equb <Screen1_6;$05
  equb <Screen1_7;$06
  equb <Screen1_8;$07
  equb <Screen2_1;$08
  equb <Screen2_2 ;$09
  equb <Screen2_3 ;$0a
  equb <Screen2_4 ;$0b
  equb <Screen2_5 ;$0c
  equb <Screen2_6 ;$0d
  equb <Screen2_7;$0e
  equb <Screen2_8;$0f

  equb <Screen3_1 ;10
  equb <Screen3_2 ;11
  equb <Screen3_3 ;12
  equb <Screen3_4 ;13
  equb <Screen3_5 ;14
  equb <Screen3_6 ;15
  equb <Screen3_7 ;16
  equb <Screen3_8 ;17
  equb <Screen4_1 ;18
  equb <Screen4_2 ;19
  equb <Screen4_3 ;1a
  equb <Screen4_4 ;1b
  equb <Screen4_5 ;1c
  equb <Screen4_6 ;1d
  equb <Screen4_7 ;1e
  equb <Screen4_8 ;1f

  equb <Screen5_1 ;20
  equb <Screen5_2 ;21
  equb <Screen5_3 ;22
  equb <Screen5_4 ;23
  equb <Screen5_5 ;24
  equb <Screen5_6 ;25
  equb <Screen5_7 ;26
  equb <Screen5_8 ;27
  equb <Screen6_1 ;28
  equb <Screen6_2 ;29
  equb <Screen6_3 ;2a
  equb <Screen6_4 ;2b
  equb <Screen6_5 ;2c
  equb <Screen6_6 ;2d
  equb <Screen6_7 ;2e
  equb <Screen6_8 ;2f

  equb <Screen7_1
  equb <Screen7_2
  equb <Screen7_3
  equb <Screen7_4
  equb <Screen7_5
  equb <Screen7_6
  equb <Screen7_7
  equb <Screen7_8
  equb <Screen8_1
  equb <Screen8_2
  equb <Screen8_3
  equb <Screen8_4
  equb <Screen8_5
  equb <Screen8_6
  equb <Screen8_7
  equb <Screen8_8

.MapListHiReloc ;64 bytes
  equb >Screen1_1;$00
  equb >Screen1_2;$01
  equb >Screen1_3;$02
  equb >Screen1_4;$03
  equb >Screen1_5;$04
  equb >Screen1_6;$05
  equb >Screen1_7;$06
  equb >Screen1_8;$07
  equb >Screen2_1;$08
  equb >Screen2_2 ;$09
  equb >Screen2_3 ;$0a
  equb >Screen2_4 ;$0b
  equb >Screen2_5 ;$0c
  equb >Screen2_6 ;$0d
  equb >Screen2_7;$0e
  equb >Screen2_8;$0f

  equb >Screen3_1
  equb >Screen3_2
  equb >Screen3_3
  equb >Screen3_4
  equb >Screen3_5
  equb >Screen3_6
  equb >Screen3_7
  equb >Screen3_8
  equb >Screen4_1
  equb >Screen4_2
  equb >Screen4_3
  equb >Screen4_4
  equb >Screen4_5
  equb >Screen4_6
  equb >Screen4_7
  equb >Screen4_8

  equb >Screen5_1
  equb >Screen5_2
  equb >Screen5_3
  equb >Screen5_4
  equb >Screen5_5
  equb >Screen5_6
  equb >Screen5_7
  equb >Screen5_8
  equb >Screen6_1
  equb >Screen6_2
  equb >Screen6_3
  equb >Screen6_4
  equb >Screen6_5
  equb >Screen6_6
  equb >Screen6_7
  equb >Screen6_8

  equb >Screen7_1
  equb >Screen7_2
  equb >Screen7_3
  equb >Screen7_4
  equb >Screen7_5
  equb >Screen7_6
  equb >Screen7_7
  equb >Screen7_8
  equb >Screen8_1
  equb >Screen8_2
  equb >Screen8_3
  equb >Screen8_4
  equb >Screen8_5
  equb >Screen8_6
  equb >Screen8_7
  equb >Screen8_8




.StaticCrystal1Reloc
  equw TilePatternCrystal1,TilePatternCrystal2
  equw TilePatternCrystal3,TilePatternCrystal4
.StaticCrystal2Reloc
  equw TilePatternCrystal5,TilePatternCrystal6
  equw TilePatternCrystal7,TilePatternCrystal8
.StaticDoor1Reloc
  equw TilePatternDoor1,TilePatternDoor1
  equw TilePatternDoor1,TilePatternDoor1
.StaticDoor2Reloc
  equw TilePatternDoor1,TilePatternDoor1
  equw TilePatternDoor2,TilePatternDoor2
.StaticDoor3Reloc
  equw TilePatternDoor1,TilePatternDoor1
  equw TilePatternDoor3,TilePatternDoor3
.StaticDoor4Reloc
  equw TilePatternDoor1,TilePatternDoor1
  equw TilePatternDoor4,TilePatternDoor4
.StaticDoor5Reloc
  equw TilePatternDoor2,TilePatternDoor2
  equw TilePatternEmpty,TilePatternEmpty
.StaticDoor6Reloc
  equw TilePatternDoor3,TilePatternDoor3
  equw TilePatternEmpty,TilePatternEmpty
.StaticDoor7Reloc
  equw TilePatternDoor4,TilePatternDoor4
  equw TilePatternEmpty,TilePatternEmpty
.StaticDoor8Reloc
  equw TilePatternDoor1,TilePatternDoor1
  equw TilePatternEmpty,TilePatternEmpty
.InvisPlatformReloc
  equw TilePatternDottedEdge1, TilePatternDottedEdge2
  equw TilePatternDottedEdge4, TilePatternDottedEdge3
.VisPlatformReloc
  equw TilePatternSolidEdge1, TilePatternSolidEdge2
  equw TilePatternSolidEdge3, TilePatternSolidEdge4
.StaticTorch1Reloc
  equw TilePatternTorchBig1
  equw TilePatternTorchBig2
  equw TilePatternTorchBig3
  equw TilePatternTorchBig4
.StaticTorch2Reloc
  equw TilePatternTorchBig5
  equw TilePatternTorchBig6
  equw TilePatternTorchBig7
  equw TilePatternTorchBig8
  equb 0,0,0,0,0,0


;;;;
;TILE PATTERNS TO RELOCATE
;;;;
.TilePatternsReloc
.TilePatternRelocEmpty
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
.TilePatternRelocSolid
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
.TilePatternRelocSolidEdge1
  equb %11111111
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
.TilePatternRelocSolidEdge2
  equb %11111111
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
.TilePatternRelocSolidEdge3
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %00000001
  equb %11111111
.TilePatternRelocSolidEdge4
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %10000000
  equb %11111111
.TilePatternRelocDottedEdge1
  equb %10101010
  equb %00000000
  equb %10000000
  equb %00000000
  equb %10000000
  equb %00000000
  equb %10000000
  equb %00000000
.TilePatternRelocDottedEdge2
  equb %01010101
  equb %00000000
  equb %00000001
  equb %00000000
  equb %00000001
  equb %00000000
  equb %00000001
  equb %00000000
.TilePatternRelocDottedEdge3
  equb %00000000
  equb %00000001
  equb %00000000
  equb %00000001
  equb %00000000
  equb %00000001
  equb %00000000
  equb %01010101
.TilePatternRelocDottedEdge4
  equb %00000000
  equb %10000000
  equb %00000000
  equb %10000000
  equb %00000000
  equb %10000000
  equb %00000000
  equb %10101010
 .TilePatternRelocCrystal1
  equb %00000000
  equb %00000000
  equb %00000001
  equb %00000001
  equb %00000011
  equb %00000111
  equb %00000111
  equb %00000111
 .TilePatternRelocCrystal2
  equb %00000000
  equb %00000000
  equb %10000000
  equb %11000000
  equb %11000000
  equb %11000000
  equb %11000000
  equb %11100000
 .TilePatternRelocCrystal3
  equb %00000111
  equb %00000111
  equb %00000111
  equb %00000011
  equb %00000001
  equb %00000000
  equb %00011111
  equb %00111111
 .TilePatternRelocCrystal4
  equb %11100000
  equb %11100000
  equb %11100000
  equb %11000000
  equb %10000000
  equb %00000000
  equb %11111000
  equb %11111100
 .TilePatternRelocCrystal5
  equb %00000011
  equb %00000100
  equb %00000101
  equb %00001001
  equb %00010011
  equb %00010111
  equb %00010111
  equb %00010111
 .TilePatternRelocCrystal6
  equb %11000000
  equb %00100000
  equb %10010000
  equb %11010000
  equb %11010000
  equb %11010000
  equb %11010000
  equb %11101000
 .TilePatternRelocCrystal7
  equb %00010111
  equb %00010111
  equb %00010111
  equb %00010011
  equb %00001001
  equb %00000100
  equb %00011111
  equb %00111111
 .TilePatternRelocCrystal8
  equb %11101000
  equb %11101000
  equb %11101000
  equb %11001000
  equb %10010000
  equb %00100000
  equb %11111000
  equb %11111100
.TilePatternRelocTablet1
  equb %00000000
  equb %00000111
  equb %00001000
  equb %00010000
  equb %00100100
  equb %01000101
  equb %01000000
  equb %01001011
.TilePatternRelocTablet2
  equb %00000000
  equb %11100000
  equb %00010000
  equb %00001000
  equb %10100100
  equb %10110010
  equb %00000010
  equb %10010010
.TilePatternRelocTablet3
  equb %01011010
  equb %01000000
  equb %01001010
  equb %01001110
  equb %00100000
  equb %00010000
  equb %00001111
  equb %01111111
.TilePatternRelocTablet4
  equb %00111010
  equb %00000010
  equb %10010010
  equb %11010010
  equb %00000100
  equb %11001000
  equb %11110000
  equb %11111110
.TilePatternRelocLadderL
  equb %00001111
  equb %00101000
  equb %00111111
  equb %00001000
  equb %00001111
  equb %00001000
  equb %00001111
  equb %00001000
.TilePatternRelocLadderR
  equb %11110000
  equb %00010100
  equb %11111100
  equb %00010000
  equb %11110000
  equb %00010000
  equb %11110000
  equb %00010000
.TilePatternRelocBouncePad
  equb %10011001
  equb %11111111  
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11111111
.TilePatternRelocArch1
  equb %11111111
  equb %11111000
  equb %11100000
  equb %11000000
  equb %11000000
  equb %11000000
  equb %10000000
  equb %10000000
.TilePatternRelocArch2
  equb %11111111
  equb %00011111
  equb %00000111
  equb %00000011
  equb %00000011
  equb %00000011
  equb %00000001
  equb %00000001
.TilePatternRelocArch3
  equb %10000000
  equb %10000000
  equb %11000000
  equb %11000000
  equb %11000000
  equb %11100000
  equb %11111000
  equb %11111111
.TilePatternRelocArch4
  equb %00000001
  equb %00000001
  equb %00000011
  equb %00000011
  equb %00000011
  equb %00000111
  equb %00011111
  equb %11111111
.TilePatternRelocTorch1
  equb %00000101
  equb %00001010
  equb %00010101
  equb %00101000
  equb %01010011
  equb %00100100
  equb %01001100
  equb %00101001
.TilePatternRelocTorch2
  equb %10100000
  equb %01010000
  equb %10101000
  equb %00010100
  equb %11001010
  equb %00100100
  equb %00110010
  equb %10010100
.TilePatternRelocTorch3
  equb %01001001
  equb %00101001
  equb %01001011
  equb %00101011
  equb %01001000
  equb %00100011
  equb %00010001
  equb %00001011

.TilePatternsPage2
.TilePatternRelocTorch4
  equb %10010010
  equb %10010100
  equb %11010010
  equb %11010100
  equb %00010010
  equb %11000100
  equb %10001000
  equb %11010000
.TilePatternRelocTorch5
  equb %00000000
  equb %00000010
  equb %00000000
  equb %00001010
  equb %00000000
  equb %00101011
  equb %00000010
  equb %00100100
.TilePatternRelocTorch6
  equb %00000000
  equb %01000000
  equb %00000000
  equb %01010000
  equb %00000000
  equb %11010100
  equb %01000000
  equb %00100100
.TilePatternRelocTorch7
  equb %00010100
  equb %00100100
  equb %00000101
  equb %00000101
  equb %00000000
  equb %00000011
  equb %00000001
  equb %00000011
.TilePatternRelocTorch8
  equb %10101000
  equb %10100100
  equb %10100000
  equb %10100000
  equb %00000000
  equb %11000000
  equb %10000000
  equb %11000000
.TilePatternRelocEarth1
  equb %11111111
  equb %11111111
  equb %11111111
  equb %11110101
  equb %11111010
  equb %11100100
  equb %11110000
  equb %11101000
.TilePatternRelocEarth2
  equb %11111111
  equb %11111111
  equb %11111111
  equb %01011111
  equb %10101111
  equb %00010111
  equb %00001111
  equb %00010111
.TilePatternRelocEarth3
  equb %11110000
  equb %11101000
  equb %11110100
  equb %11111010
  equb %11111101
  equb %11111111
  equb %11111111
  equb %11111111
.TilePatternRelocEarth4
  equb %00001111
  equb %00100111
  equb %00010111
  equb %10101111
  equb %01011111
  equb %11111111
  equb %11111111
  equb %11111111
.TilePatternRelocEarth5
  equb %11111111
  equb %11111111
  equb %11111111
  equb %01010101
  equb %10101010
  equb %00000000
  equb %00000000
  equb %00000000
.TilePatternRelocEarth6
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %01010101
  equb %10101010
  equb %11111111
  equb %11111111
.TilePatternRelocEarth7
  equb %11111111
  equb %11111111
  equb %11011101
  equb %11111111
  equb %01010101
  equb %10111011
  equb %01010101
  equb %11101010
.TilePatternRelocEarth8
  equb %00010101
  equb %10101010
  equb %01000100
  equb %10101010
  equb %00000000
  equb %00100010
  equb %00000000
  equb %00000000
.TilePatternRelocEarth9
  equb %00000000
  equb %00000000
  equb %00100010
  equb %00000000
  equb %10101010
  equb %01000100
  equb %10101010
  equb %00010101

.TilePatternRelocEarth10
  equb %11101010
  equb %01010101
  equb %10111011
  equb %01010101
  equb %11111111
  equb %11011101
  equb %11111111
  equb %11111111


.TilePatternRelocEarth11
  equb %00001010
  equb %00000100
  equb %00101010
  equb %00000001
  equb %00001010
  equb %00000101
  equb %00101010
  equb %00000001
.TilePatternRelocEarth12
  equb %10101111
  equb %11011111
  equb %10101011
  equb %01111111
  equb %10101111
  equb %01011111
  equb %10101011
  equb %01111111
.TilePatternRelocEarth13
  equb %11110101
  equb %11111011
  equb %11010101
  equb %11111110
  equb %11110101
  equb %11111010
  equb %11010101
  equb %11111110
.TilePatternRelocEarth14
  equb %01010000
  equb %00100000
  equb %01010100
  equb %10000000
  equb %01010000
  equb %10100000
  equb %01010100
  equb %10000000

.TilePatternRelocChain1
  equb %10011001
  equb %11111111
  equb %11101111
  equb %11001111
  equb %10000001
  equb %10000001
  equb %11001111
  equb %11101111
.TilePatternRelocChain2
  equb %10011001
  equb %11111111
  equb %11110111
  equb %11110011
  equb %10000001
  equb %10000001
  equb %11110011
  equb %11110111
.TilePatternRelocChain3
  equb %00100000
  equb %01010000
  equb %01010000
  equb %00100000
  equb %01010000
  equb %01010000
  equb %00100000
  equb %01010000
.TilePatternRelocDoor1
  equb %00111100
  equb %00011000
  equb %00111100
  equb %00011000
  equb %00111100
  equb %00011000
  equb %00111100
  equb %00011000
.TilePatternRelocDoor2
  equb %00111100
  equb %00011000
  equb %00111100
  equb %00011000
  equb %00111100
  equb %00011000
  equb %00000000
  equb %00000000
.TilePatternRelocDoor3
  equb %00111100
  equb %00011000
  equb %00111100
  equb %00011000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
.TilePatternRelocDoor4
  equb %00111100
  equb %00011000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00000000
.TilePatternRelocBrick1
  equb %11111111
  equb %00000000
  equb %11011101
  equb %11011101
  equb %00000000
  equb %11110111
  equb %11110111
  equb %00000000
.TilePatternRelocBrick2
  equb %11011101
  equb %11011101
  equb %00000000
  equb %11110111
  equb %11110111
  equb %00000000
  equb %11011101
  equb %11011101
.TilePatternRelocBrick3
  equb %00000000
  equb %11110111
  equb %11110111
  equb %00000000
  equb %11011011
  equb %11011011
  equb %00000000
  equb %11111111
.TilePatternRelocBrick4
  equb %11011011
  equb %11011011
  equb %00011000
  equb %11011011
  equb %11000011
  equb %11011011
  equb %00011000
  equb %11011011
.TilePatternRelocBrick5
  equb %01101101
  equb %01101101
  equb %01100001
  equb %01101101
  equb %00001101
  equb %01101101
  equb %01100001
  equb %01101101
.TilePatternRelocBrick6
  equb %10110110
  equb %10000110
  equb %10110110
  equb %10110000
  equb %10110110
  equb %10000110
  equb %10110110
  equb %10110110

  equb %11001100
  equb %00110011
  equb %11001100
  equb %00110011
  equb %11001100
  equb %00110011
  equb %11001100
  equb %00110011

;;;END TILE PATTERNS

.MapChangeFunctionsLoReloc
  equb <MapChangeNone-1
  equb <MapChangeRight-1
  equb <MapChangeLeft-1
  equb <MapChangeDown-1
  equb <MapChangeUp-1

.MapChangeFunctionsHiReloc
  equb >MapChangeNone
  equb >MapChangeRight
  equb >MapChangeLeft
  equb >MapChangeDown
  equb >MapChangeUp
.CalcM64loReloc
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
.CalcM64hiReloc
  equb $00,$00,$00,$00
  equb $01,$01,$01,$01
  equb $02,$02,$02,$02
  equb $03,$03,$03,$03
  equb $04,$04,$04,$04
  equb $05,$05,$05,$05
  equb $06,$06,$06,$06
  equb $07,$07,$07,$07

.MetaMetaTileListLoReloc
  equb <mmtfBrickWallL;0
  equb <mmtfBrickWallR;1
  equb <mmtfBlankWall1;2
  equb <mmtfBlankWall16;3
  equb <mmtfFlatWall2;4
  equb <mmtfFlatWall4;5
  equb <mmtfFlatWall8;6
  equb <mmtfFlatWall16;7
  equb <mmtfFlatFloor1;8
  equb <mmtfFlatFloor2;9
  equb <mmtfFlatFloor4;10
  equb <mmtfFlatFloor8;11
  equb <mmtfFlatFloor16 ;12
  equb <mmtfBrickFloor16;13
  equb <mmtfEarthFloor16;14
  equb <mmtfBlankFloor1;15
  equb <mmtfBlankFloor2;16
  equb <mmtfBlankFloor4;17
  equb <mmtfBlankFloor5;18
  equb <mmtfBlankFloor8;19
  equb <mmtfBlankFloor16;20
  equb <mmtStepTopL;21
  equb <mmtStepTopR;22
  equb <mmtfConveyerLeft16;23
  equb <mmtfConveyerRight16;24
  equb <mmtfConveyerLeft8;25
  equb <mmtfConveyerRight8;26
  equb <mmtfConveyerLeft4;27
  equb <mmtfConveyerRight4;28
  equb <mmtfConveyerLeft2;29
  equb <mmtfConveyerRight2;30
  equb <mmtfBounce1;31

  equb <mmtfBounce2;32
  equb <mmtfBlankWall2 ;33
  equb <mmtfBlankWall4 ;34
  equb <mmtfBlankWall8 ;35
  equb <mmtfBrickCeiling16 ;36
  equb <MMTFloor16Earth ;37
  equb <MMTFloor16Earth ;38
  equb <MMTFloor16Earth ;39
  equb <MMTFloor16Earth ;40
  equb <MMTFloor16Earth ;41
  equb <MMTFloor16Earth ;42
  equb <MMTFloor16Earth ;43
  equb <MMTFloor16Earth ;44
  equb <MMTFloor16Earth ;45
  equb <MMTFloor16Earth ;46
  equb <MMTFloor16Earth ;47
  equb <MMTFloor16Earth ;48
  equb <MMTFloor16Earth ;49
  equb <MMTFloor16Earth ;50
  equb <MMTFloor16Earth ;51
  equb <MMTFloor16Earth ;52
  equb <MMTFloor16Earth ;53
  equb <MMTFloor16Earth ;54
  equb <MMTFloor16Earth ;55
  equb <MMTFloor16Earth ;56
  equb <MMTFloor16Earth ;57
  equb <MMTFloor16Earth ;58
  equb <MMTFloor16Earth ;59
  equb <MMTFloor16Earth ;60
  equb <MMTFloor16Earth ;61
  equb <MMTFloor16Earth ;62
  equb <MMTFloor16Earth ;63

.MetaMetaTileListHiReloc
  equb >mmtfBrickWallL;0
  equb >mmtfBrickWallR;1
  equb >mmtfBlankWall1;2
  equb >mmtfBlankWall16;3
  equb >mmtfFlatWall2;4
  equb >mmtfFlatWall4;5
  equb >mmtfFlatWall8;6
  equb >mmtfFlatWall16;7
  equb >mmtfFlatFloor1;8
  equb >mmtfFlatFloor2;9
  equb >mmtfFlatFloor4;10
  equb >mmtfFlatFloor8;11
  equb >mmtfFlatFloor16 ;12
  equb >mmtfBrickFloor16;13
  equb >mmtfEarthFloor16;14
  equb >mmtfBlankFloor1;15
  equb >mmtfBlankFloor2;16
  equb >mmtfBlankFloor4;17
  equb >mmtfBlankFloor5;18
  equb >mmtfBlankFloor8;19
  equb >mmtfBlankFloor16;20
  equb >mmtStepTopL;21
  equb >mmtStepTopR;22
  equb >mmtfConveyerLeft16;23
  equb >mmtfConveyerRight16;24
  equb >mmtfConveyerLeft8;25
  equb >mmtfConveyerRight8;26
  equb >mmtfConveyerLeft4;27
  equb >mmtfConveyerRight4;28
  equb >mmtfConveyerLeft2;29
  equb >mmtfConveyerRight2;30
  equb >mmtfBounce1;31

  equb >mmtfBounce2;32
  equb >mmtfBlankWall2 ;33
  equb >mmtfBlankWall4 ;34
  equb >mmtfBlankWall8 ;35
  equb >mmtfBrickCeiling16 ;36
  equb >MMTFloor16Earth ;37
  equb >MMTFloor16Earth ;38
  equb >MMTFloor16Earth ;39
  equb >MMTFloor16Earth ;40
  equb >MMTFloor16Earth ;41
  equb >MMTFloor16Earth ;42
  equb >MMTFloor16Earth ;43
  equb >MMTFloor16Earth ;44
  equb >MMTFloor16Earth ;45
  equb >MMTFloor16Earth ;46
  equb >MMTFloor16Earth ;47
  equb >MMTFloor16Earth ;48
  equb >MMTFloor16Earth ;49
  equb >MMTFloor16Earth ;50
  equb >MMTFloor16Earth ;51
  equb >MMTFloor16Earth ;52
  equb >MMTFloor16Earth ;53
  equb >MMTFloor16Earth ;54
  equb >MMTFloor16Earth ;55
  equb >MMTFloor16Earth ;56
  equb >MMTFloor16Earth ;57
  equb >MMTFloor16Earth ;58
  equb >MMTFloor16Earth ;59
  equb >MMTFloor16Earth ;60
  equb >MMTFloor16Earth ;61
  equb >MMTFloor16Earth ;62
  equb >MMTFloor16Earth ;63


.ScreenExitsReloc ;128 bytes
  ;each byte is 2 rooms l->r. Each 4 bits is u/d/l/r indicating blocking an exit
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_1000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000

  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000
  equb %0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000,%0000_0000


.Mult20Reloc
  equb 0,16,32,48,64,80,96,112,128,144,160,176,192,208,224,240,255

.DefineEnvelopes
  ldx #0
  .DefineEnvelopeLoop
  stx temp
  lda EnvelopeListLo, x 
  sta scratch1
  lda EnvelopeListHi, x 
  sta scratch2
  ldx scratch1
  ldy scratch2
  lda #OSWORDENVELOPE
  jsr osword
  ldx temp
  inx 
  cpx #NUMENVELOPES
  bne DefineEnvelopeLoop
rts

.Relocate
    ldx #$00
    .RelocateLoopMap
    lda MetaColumnMapReloc, x 
    sta MetaColumnMap, x 
    inx 
    bne RelocateLoopMap

    ldx #0

    .RelocateSprites1
    lda SpritePage1, x 
    sta SPRITEPAGE1, x 
    inx 
    bne RelocateSprites1

    ldx #0

    .RelocateSprites2
    lda SpritePage2, x 
    sta SPRITEPAGE2, x 
    inx 
    bne RelocateSprites2

    .RelocateTilePatterns
    lda TilePatternsReloc, x 
    sta TILEPAGE1, x 
    inx 
    bne RelocateTilePatterns

    .RelocateTilePatterns2
    lda TilePatternsPage2, x 
    sta TILEPAGE2, x 
    inx 
    bne RelocateTilePatterns2

    ldx #$00
    .RelocateMMTPointersandMapExit
    lda MetaMetaTileListLoReloc, x 
    sta MetaMetaTileListLo, x 
    inx
    bne RelocateMMTPointersandMapExit

    ldx #$00
    .RelocateBTD
    lda BinaryToDecimalLoReloc, x 
    sta BinaryToDecimalLo, x 
    inx 
    cpx #64
    bne RelocateBTD

    ldx #$00
    .RelocateMult
    lda CalcM64loReloc, x 
    sta CalcM64lo, x 
    inx 
    cpx #64
    bne RelocateMult

    ldx #$00
    .RelocateMult20Loop
    lda Mult20Reloc, x 
    sta Mult20, x 
    inx 
    cpx #17
    bne RelocateMult20Loop

    ldx #$00
    .RelocateMCFuncs
    lda MapChangeFunctionsLoReloc, x 
    sta MapChangeFunctionsLo, x 
    inx 
    cpx #11
    bne RelocateMCFuncs

rts

.InitOverWrite
  sei ;disable interrupts
  cld ;clear decimal mode

  lda #0
  tax 
  tay
  lda #$b2
  jsr osbyte

  ;disable +1 so we can use $000d
  lda #$a3
  ldx #128
  ldy #1
  jsr osbyte
  lda #$d6 
  sta $0212
  lda #$f1
  sta $0213
  lda #$00
  sta $02ac


  ;Init Stack
  ldx #$ff
  txs 


  ldy #00
  .setoswrchvals
  lda oswrchinitvals, y 
  jsr oswrch
  iny 
  cpy #$0c
  bne setoswrchvals
  ; clear mem
  lda #$00
  tax
  .ClearMemoryLoop
      sta $0000, x
      inx
      cpx #$90
      bne ClearMemoryLoop
  .ClearMemoryLoop2
      lda #$00
      sta $400, x 
      sta $500, x 
      lda #$ff
      sta $600, x
      lda #$00
      sta $700, x
      inx 
      bne ClearMemoryLoop2


  lda #$80
  sta seed+1
  asl a
  sta seed


  lda #ETANKDEFAULTLO
  sta ETank
  LDA #ETANKDEFAULTHI
  sta ETank+1

  lda #%00000011
  sta uiflags

  lda #INITIALGRAVITYHI
  sta globalgravityhi
  lda #INITIALGRAVITYLO
  sta globalgravitylo
  lda #JUMPSTRENGTHHI
  sta jumpstrengthhi
  lda #JUMPSTRENGTHLO
  sta jumpstrengthlo

  ;init drawbuffers
  lda SCREENADDRESS2HI
  sta currentbuffer+1
  lda #$00
  sta currentbuffer
  lda #$01
  sta bufferflag


  ; ; create player
  lda #$30
  sta variable1
  lda #$70
  sta variable2
  lda #$01
  sta variable3
  lda #00
  sta variable4
  jsr CreateEntity

  lda #$00
  sta playerrespawn
  sta playerrespawn+1
  lda #$20
  sta playerrespawn+2
  lda #$70
  sta playerrespawn+3

  jsr DefineEnvelopes
  jsr Relocate
  lda #FLASHREPEATTIME
  sta &252
  lda #FLASHREPEATTIME
  sta &253  

  lda #PLAYERSTARTX
  sta mapposx
  lda #PLAYERSTARTY
  sta mapposy

  jmp endinit
  
.BinaryToDecimalLoReloc
  equb $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$31,$31,$31,$31,$31,$31
.BinaryToDecimalHiReloc
  equb $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$30,$31,$32,$33,$34,$35

; initialisation data that will not be relocated and will be overwritten, and so cannot be used after the game has fully loaded

.oswrchinitvals
  equb 22,4 ;screenmode 4
  equb 23,1,0,0,0,0,0,0,0,0 ;disable cursor



.EnvelopeListLo
  equb <Envelope1
  equb <Envelope2
  equb <Envelope3
  equb <Envelope4

.EnvelopeListHi 
  equb >Envelope1
  equb >Envelope2
  equb >Envelope3
  equb >Envelope4

;envelope format:
;0:envelope number
;1:duration of each pitch change
;2:Stage 1 pitch change, -128 to 127
;3:Stage 2 pitch change, -128 to 127
;4:Stage 3 pitch change, -128 to 127
;5:Stage 1 number of pitch changes, 0-255
;6:Stage 2 number of pitch changes, 0-255
;7:Stage 3 number of pitch changes, 0-255
;8-13: Unused on the electron. If targeting cross compatibility with micro, make 126,0,0,-126,126,126
.Envelope1
  equb 1,1,-1,10,10,10,20,10,0,0,0,0,0,0
.Envelope2
  equb 2,1,1,2,3,10,20,10,0,0,0,0,0,0
.Envelope3
  equb 3,10,-8,4,-8,8,30,8,0,0,0,0,0,0
.Envelope4
  equb 4,1,-1,10,10,10,20,10,0,0,0,0,0,0
