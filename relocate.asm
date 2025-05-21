

;This code is stored at $3000
;Since we use 3000-8000 for vram, this space will be overwritten once the program starts drawing
;It has
; -Initialisation Code that we only ever call at the start of the program
; -Data that will be relocated into lower memory once the electron has booted and its safe to do so


org &3000
guard &5800

.MetaColumnMapReloc
  equb $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f
  equb $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1a,$1b,$1c,$1d,$1e,$1f
  equb $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2f
  equb $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f
  equb $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f
  equb $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1a,$1b,$1c,$1d,$1e,$1f
  equb $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2f
  equb $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f
  equb $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f
  equb $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1a,$1b,$1c,$1d,$1e,$1f
  equb $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2f
  equb $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f
  equb $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f
  equb $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1a,$1b,$1c,$1d,$1e,$1f
  equb $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2f
  equb $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f

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
  equb %00011000
  equb %00011000
  equb %00000000
  equb %01111110
  equb %00011000
  equb %00111100
  equb %00100100
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
;;;
.SPProjectileRight1Reloc
  equb %00000000
  equb %00000000
  equb %00000000
  equb %00011000
  equb %00011000
  equb %00000000
  equb %00000000
  equb %00000000
.SPProjectileRight2Reloc
  equb %00000000
  equb %00000000
  equb %00011000
  equb %00100100
  equb %00100100
  equb %00011000
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
  equb <Screen0;$00
  equb <Screen1;$01
  equb <Screen2;$02
  equb <Screen3;$03
  equb <Screen4;$04
  equb <Screen5;$05
  equb <Screen6;$06
  equb <Screen7;$07
  equb <Screen8;$08
  equb <Screen9;$09
  equb <Screen10;$0a
  equb <Screen11;$0b
  equb <Screen12;$0c
  equb <Screen13;$0d
  equb <Screen14;$0e
  equb <Screen15;$0f

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

  equb <Screen32
  equb <Screen33
  equb <Screen34
  equb <Screen35
  equb <Screen36
  equb <Screen37
  equb <Screen38
  equb <Screen39
  equb <Screen40
  equb <Screen41
  equb <Screen42
  equb <Screen43
  equb <Screen44
  equb <Screen45
  equb <Screen46
  equb <Screen47

  equb <Screen48
  equb <Screen49
  equb <Screen50
  equb <Screen51
  equb <Screen52
  equb <Screen53
  equb <Screen54
  equb <Screen55
  equb <Screen56
  equb <Screen57
  equb <Screen58
  equb <Screen59
  equb <Screen60
  equb <Screen61
  equb <Screen62
  equb <Screen63

.MapListHiReloc ;64 bytes
  equb >Screen0
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

  equb >Screen32
  equb >Screen33
  equb >Screen34
  equb >Screen35
  equb >Screen36
  equb >Screen37
  equb >Screen38
  equb >Screen39
  equb >Screen40
  equb >Screen41
  equb >Screen42
  equb >Screen43
  equb >Screen44
  equb >Screen45
  equb >Screen46
  equb >Screen47

  equb >Screen48
  equb >Screen49
  equb >Screen50
  equb >Screen51
  equb >Screen52
  equb >Screen53
  equb >Screen54
  equb >Screen55
  equb >Screen56
  equb >Screen57
  equb >Screen58
  equb >Screen59
  equb >Screen60
  equb >Screen61
  equb >Screen62
  equb >Screen63
;128

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
  
  equb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
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
  equb %00100010
  equb %01010101
  equb %01010101
  equb %00100010
  equb %01010101
  equb %01010101
  equb %00100010
  equb %01010000
.TilePatternRelocChain2
  equb %01010000
  equb %00100000
  equb %01010000
  equb %01010000
  equb %00100000
  equb %01010000
  equb %01010000
  equb %00100000
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



;likely can be eliminated with some slower maths
.CalcM64loReloc
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
  equb $00,$40,$80,$c0
;likely can be eliminated with some slower maths
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
  equb <MMTFloor16Earth;0
  equb <MMTFloor16Solid;1
  equb <MMTFloor14Earth;2
  equb <MMTFloor14Solid;3
  equb <MMTFloor12Earth;4
  equb <MMTFloor12Solid;5
  equb <MMTFloor10Earth;6
  equb <MMTFloor10Solid;7
  equb <MMTFloor8Earth ;8
  equb <MMTFloor8Solid;9
  equb <MMTFloor6Earth;10
  equb <MMTFloor6Solid;11
  equb <MMTFloor4Earth;12
  equb <MMTFloor4Solid;13
  equb <MMTFloor2Earth;14
  equb <MMTFloor2Solid;15
  equb <MMTFWallEarthLeft16;16
  equb <MMTFWallEarthRight16;17
  equb <MMTFWallSolid16;18
  equb <MMTFCeilingEarth16;19
  equb <MMTSolid1x1;20
  equb <MMTRounded1x1;21
  equb <MMTRounded1x3;22
  equb <MMTHPlatforms;23
  equb <MMTBrickDownFace1x16;24
  equb <MMTBrickUpFace1x16;25
  equb <MMTBrickLeftFace1x16;26
  equb <MMTBrickRightFace1x16;27
  equb <MMTFloor16Earth;28
  equb <MMTFloor16Earth;29
  equb <MMTFloor16Earth;30
  equb <MMTFloor16Earth;31

  equb <MMTFloor16Earth ;32
  equb <MMTFloor16Earth ;33
  equb <MMTFloor16Earth ;34
  equb <MMTFloor16Earth ;35
  equb <MMTFloor16Earth ;36
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


  equb <MMTFloor16Earth ;64
  equb <MMTFloor16Earth ;65
  equb <MMTFloor16Earth ;6
  equb <MMTFloor16Earth ;67
  equb <MMTFloor16Earth ;68
  equb <MMTFloor16Earth ;669
  equb <MMTFloor16Earth ;70
  equb <MMTFloor16Earth ;71
  equb <MMTFloor16Earth ;72
  equb <MMTFloor16Earth ;73
  equb <MMTFloor16Earth ;74
  equb <MMTFloor16Earth ;75
  equb <MMTFloor16Earth ;76
  equb <MMTFloor16Earth ;77
  equb <MMTFloor16Earth ;78
  equb <MMTFloor16Earth ;79
  equb <MMTFloor16Earth ;80
  equb <MMTFloor16Earth ;81
  equb <MMTFloor16Earth ;82
  equb <MMTFloor16Earth ;83
  equb <MMTFloor16Earth ;84
  equb <MMTFloor16Earth ;85
  equb <MMTFloor16Earth ;86
  equb <MMTFloor16Earth ;87
  equb <MMTFloor16Earth ;88
  equb <MMTFloor16Earth ;89
  equb <MMTFloor16Earth ;90
  equb <MMTFloor16Earth ;91
  equb <MMTFloor16Earth ;91
  equb <MMTFloor16Earth ;93
  equb <MMTFloor16Earth ;94
  equb <MMTFloor16Earth ;95


  equb <MMTFloor16Earth ;96
  equb <MMTFloor16Earth ;97
  equb <MMTFloor16Earth ;98
  equb <MMTFloor16Earth ;99
  equb <MMTFloor16Earth ;100
  equb <MMTFloor16Earth ;101
  equb <MMTFloor16Earth ;102
  equb <MMTFloor16Earth ;103
  equb <MMTFloor16Earth ;104
  equb <MMTFloor16Earth ;105
  equb <MMTFloor16Earth ;106
  equb <MMTFloor16Earth ;107
  equb <MMTFloor16Earth ;108
  equb <MMTFloor16Earth ;109
  equb <MMTFloor16Earth ;110
  equb <MMTFloor16Earth ;111
  equb <MMTFloor16Earth ;112
  equb <MMTFloor16Earth ;112
  equb <MMTFloor16Earth ;114
  equb <MMTFloor16Earth ;115
  equb <MMTFloor16Earth ;116
  equb <MMTFloor16Earth ;117
  equb <MMTFloor16Earth ;118
  equb <MMTFloor16Earth ;119
  equb <MMTFloor16Earth ;120
  equb <MMTFloor16Earth ;121
  equb <MMTFloor16Earth ;122
  equb <MMTFloor16Earth ;123
  equb <MMTFloor16Earth ;124
  equb <MMTFloor16Earth ;125
  equb <MMTFloor16Earth ;126
  equb <MMTFloor16Earth ;127



.MetaMetaTileListHiReloc
  equb >MMTFloor16Earth;0
  equb >MMTFloor16Solid;1
  equb >MMTFloor14Earth;2
  equb >MMTFloor14Solid;3
  equb >MMTFloor12Earth;4
  equb >MMTFloor12Solid;5
  equb >MMTFloor10Earth;6
  equb >MMTFloor10Solid;7
  equb >MMTFloor8Earth ;8
  equb >MMTFloor8Solid;9
  equb >MMTFloor6Earth;10
  equb >MMTFloor6Solid;11
  equb >MMTFloor4Earth;12
  equb >MMTFloor4Solid;13
  equb >MMTFloor2Earth;14
  equb >MMTFloor2Solid;15
  equb >MMTFWallEarthLeft16;16
  equb >MMTFWallEarthRight16;17
  equb >MMTFWallSolid16;18
  equb >MMTFCeilingEarth16;19
  equb >MMTSolid1x1;20
  equb >MMTRounded1x1;21
  equb >MMTRounded1x3;22
  equb >MMTHPlatforms;23
  equb >MMTBrickDownFace1x16;24
  equb >MMTBrickUpFace1x16;25
  equb >MMTBrickLeftFace1x16;26
  equb >MMTBrickRightFace1x16;27
  equb >MMTFloor16Earth;28
  equb >MMTFloor16Earth;29
  equb >MMTFloor16Earth;30
  equb >MMTFloor16Earth;31

  equb >MMTFloor16Earth ;32
  equb >MMTFloor16Earth ;33
  equb >MMTFloor16Earth ;34
  equb >MMTFloor16Earth ;35
  equb >MMTFloor16Earth ;36
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


  equb >MMTFloor16Earth ;64
  equb >MMTFloor16Earth ;65
  equb >MMTFloor16Earth ;6
  equb >MMTFloor16Earth ;67
  equb >MMTFloor16Earth ;68
  equb >MMTFloor16Earth ;669
  equb >MMTFloor16Earth ;70
  equb >MMTFloor16Earth ;71
  equb >MMTFloor16Earth ;72
  equb >MMTFloor16Earth ;73
  equb >MMTFloor16Earth ;74
  equb >MMTFloor16Earth ;75
  equb >MMTFloor16Earth ;76
  equb >MMTFloor16Earth ;77
  equb >MMTFloor16Earth ;78
  equb >MMTFloor16Earth ;79
  equb >MMTFloor16Earth ;80
  equb >MMTFloor16Earth ;81
  equb >MMTFloor16Earth ;82
  equb >MMTFloor16Earth ;83
  equb >MMTFloor16Earth ;84
  equb >MMTFloor16Earth ;85
  equb >MMTFloor16Earth ;86
  equb >MMTFloor16Earth ;87
  equb >MMTFloor16Earth ;88
  equb >MMTFloor16Earth ;89
  equb >MMTFloor16Earth ;90
  equb >MMTFloor16Earth ;91
  equb >MMTFloor16Earth ;91
  equb >MMTFloor16Earth ;93
  equb >MMTFloor16Earth ;94
  equb >MMTFloor16Earth ;95


  equb >MMTFloor16Earth ;96
  equb >MMTFloor16Earth ;97
  equb >MMTFloor16Earth ;98
  equb >MMTFloor16Earth ;99
  equb >MMTFloor16Earth ;100
  equb >MMTFloor16Earth ;101
  equb >MMTFloor16Earth ;102
  equb >MMTFloor16Earth ;103
  equb >MMTFloor16Earth ;104
  equb >MMTFloor16Earth ;105
  equb >MMTFloor16Earth ;106
  equb >MMTFloor16Earth ;107
  equb >MMTFloor16Earth ;108
  equb >MMTFloor16Earth ;109
  equb >MMTFloor16Earth ;110
  equb >MMTFloor16Earth ;111
  equb >MMTFloor16Earth ;112
  equb >MMTFloor16Earth ;112
  equb >MMTFloor16Earth ;114
  equb >MMTFloor16Earth ;115
  equb >MMTFloor16Earth ;116
  equb >MMTFloor16Earth ;117
  equb >MMTFloor16Earth ;118
  equb >MMTFloor16Earth ;119
  equb >MMTFloor16Earth ;120
  equb >MMTFloor16Earth ;121
  equb >MMTFloor16Earth ;122
  equb >MMTFloor16Earth ;123
  equb >MMTFloor16Earth ;124
  equb >MMTFloor16Earth ;125
  equb >MMTFloor16Earth ;126
  equb >MMTFloor16Earth ;127
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

    .RelocateMMTPointers
    lda MetaMetaTileListLoReloc, x 
    sta MetaMetaTileListLo, x 
    inx 
    bne RelocateMMTPointers

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


; create player
lda #$e0
sta variable1
lda #$a0
sta variable2
lda #$01
sta variable3
lda #00
sta variable4
jsr CreateEntity

lda #$00
sta playerrespawn
sta playerrespawn+1
lda #$80
sta playerrespawn+2
lda #$e8
sta playerrespawn+3

jsr DefineEnvelopes
jsr Relocate
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
