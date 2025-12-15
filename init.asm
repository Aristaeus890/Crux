include "constants.asm"



;zeropage 00-8f (rest of zeropage reserved by OS)
;page 1 Stack
;page2 OS
;page3 vdu
;pages4-7, user allocated
;page 8 sound
;page 9 sound
;page a cassette
;page b keybuffer
;pagce c font
;page 4 paged rom
;oshwm to himem freely usable (depends on mode)

;zeropage
; 00-96 = freely available
; 97-9f = econet (can use if econet not installed/running?)
; a0-a7 current nmi owner (see paged roms 15.3.2)
;a8-af = os commands
;bo-bf = filing system scratch (should be usable)
;c0-cf = filing system. Should be usable if we aren't paging roms
;d0-e1 = vdu driver - unclear
;e2-eb = cassette - usable



org &0000
guard &a0
.entitiesvxlo skip 10
.entitiesvxhi skip 10
.entitiesvyhi skip 10
.entitiesvylo skip 10
.entitiesxpos skip 10
.entitiesypos skip 10
.entitiesstate skip 10
.entitiestype skip 10
.seed skip 2
.drawaddress skip 2
.drawaddress2 skip 2
.jumppointer skip 2
.currentbuffer skip 2 
.readpointer skip 2
.readpointer2 skip 2
.jumpstrengthhi skip 1
.jumpstrengthlo skip 1
.currententity skip 1
.temp skip 1 
.targetbuffer skip 1
.bufferflag skip 1
.extraloopcounter1 skip 1
.extraloopcounter2 skip 1
.lastxcollision skip 1
.lastycollision skip 1
.drawoffset skip 2
.drawoffsetlastframe skip 2

.scratch1 skip 1
.scratch2 skip 1
.scratch3 skip 1
.scratch4 skip 1
.scratch5 skip 1
.scratch6 skip 1
.scratch7 skip 1
.scratch8 skip 1
.scratch9 skip 1
.scratch10 skip 1
.variable1 skip 1 
.variable2 skip 1 ; 59
.variable3 skip 1 ;5a
.variable4 skip 1;5b
.variable5 skip 1;5c
.variable6 skip 1;5d
.mapposx skip 1  ;5e
.mapposy skip 1;5f
.triggermapchange skip 1;60
.uiflags skip 1
.ETank skip 4
.framecounter skip 1
.operatingxpos skip 1
.operatingypos skip 1
.keyslastframe skip 1
.keysthisframe skip 1 ;117

;;;;;;
;page 3
;;;;;
org $300
org $380 ;380-3df = cassette filing
.CalcM64lo skip 32 ;-39f
.CalcM64hi skip 32 ;-3bf
.BinaryToDecimalLo skip 16 ;-3cf 
.BinaryToDecimalHi skip 16 ;-3df
ORG $400
;entity data
.entitiesspecial skip 10
.entitiesfliphorizontally skip 10;
.entitiesspriteaddresslo skip 10
.entitiesspriteaddresshi skip 10
.entitiesanimationtrack skip 10
.entitiesanimationaddresslo skip 10
.entitiesanimationaddresshi skip 10
.entitiesanimationtimermax skip 10
.entitiesanimationtimer skip 10
.entitiesxposlo skip 10
.entitiesyposlo skip 10
.entitiesxposlastframe skip 10;
.entitiesyposlastframe skip 10;
.entitiesdrawposlo skip 10
.entitiesdrawposhi skip 10
;500
.entitiesdrawposlolastframe skip 10;
.entitiesdrawposhilastframe skip 10;

.entitieswidth skip 10 
.entitiesheight skip 10 
; .entitiescollision skip 10
.entitiesredraw skip 10
.entitiesstatic skip 10
.MapChangeFunctionsLo skip 5
.MapChangeFunctionsHi skip 5
.currentterminal skip 1

; .allowedjumps skip 1
.gamestate skip 1

.waction skip 1 
.aaction skip 1 
.saction skip 1  
.daction skip 1 
.kaction skip 1 
.laction skip 1
.paction skip 1 
.returnaction skip 1

.jumpedthisframe skip 1

.playerrespawn skip 4 ;pagex/y, pixel x/y
.playerstatechanged skip 1
.paletteblock skip 5
.Mult20 skip 17
org $500
org $600
.collisionmap skip 256
org $700
.MetaMetaTileListLo skip 64
.MetaMetaTileListHi skip 64
.ScreenExitData skip 128
;;;;;
;;page 8: Sound
;;;;;
org $800
.viewmem skip 1
.globalgravityhi skip 1
.globalgravitylo skip 1

org $839

org $83f

;;;;;
;Page9: Tile Page1
;;;;;
org $900 ; tile page 1
  .TilePatternEmpty skip 8
  .TilePatternSolid skip 8
  .TilePatternSolidEdge1 skip 8
  .TilePatternSolidEdge2 skip 8
  .TilePatternSolidEdge4 skip 8
  .TilePatternSolidEdge3 skip 8
  .TilePatternDottedEdge1 skip 8
  .TilePatternDottedEdge2 skip 8
  .TilePatternDottedEdge3 skip 8
  .TilePatternDottedEdge4 skip 8
  .TilePatternCrystal1 skip 8
  .TilePatternCrystal2 skip 8
  .TilePatternCrystal3 skip 8
  .TilePatternCrystal4 skip 8
  .TilePatternCrystal5 skip 8
  .TilePatternCrystal6 skip 8
  .TilePatternCrystal7 skip 8
  .TilePatternCrystal8 skip 8
  .TilePatternTablet1 skip 8
  .TilePatternTablet2 skip 8
  .TilePatternTablet3 skip 8
  .TilePatternTablet4 skip 8
  .TilePatternLadderL skip 8
  .TilePatternLadderR skip 8
  .TilePatternBouncePad skip 8
  .TilePatternArch1 skip 8
  .TilePatternArch2 skip 8
  .TilePatternArch3 skip 8
  .TilePatternArch4 skip 8
  .TilePatternTorchBig1 skip 8
  .TilePatternTorchBig2 skip 8
  .TilePatternTorchBig3 skip 8
org $0a00 ; tile page 2
  .TilePatternTorchBig4 skip 8
  .TilePatternTorchBig5 skip 8
  .TilePatternTorchBig6 skip 8
  .TilePatternTorchBig7 skip 8
  .TilePatternTorchBig8 skip 8
  .TilePatternEarth1 skip 8
  .TilePatternEarth2 skip 8
  .TilePatternEarth3 skip 8
  .TilePatternEarth4 skip 8
  .TilePatternEarth5 skip 8
  .TilePatternEarth6 skip 8
  .TilePatternEarth7 skip 8
  .TilePatternEarth8 skip 8
  .TilePatternEarth9 skip 8
  .TilePatternEarth10 skip 8
  .TilePatternEarth11 skip 8
  .TilePatternEarth12 skip 8
  .TilePatternEarth13 skip 8
  .TilePatternEarth14 skip 8
  .TilePatternChain1 skip 8
  .TilePatternChain2 skip 8
  .TilePatternChain3 skip 8
  .TilePatternDoor1 skip 8
  .TilePatternDoor2 skip 8
  .TilePatternDoor3 skip 8
  .TilePatternDoor4 skip 8
  .TilePatternBrick1 skip 8
  .TilePatternBrick2 skip 8
  .TilePatternBrick3 skip 8
  .TilePatternBrick4 skip 8
  .TilePatternBrick5 skip 8
  .TilePatternBrick6 skip 8
org $0b00
.MetaColumnMap skip 256
org $0c00 ; sprites p1
  .SpritePlayerRightRun1 skip 8
  .SpritePlayerRightRun2 skip 8
  .SpritePlayerRightRun3 skip 8
  .SpritePlayerIdle1 skip 8
  .SpritePlayerIdle2 skip 8
  .SpritePlayerLadder1 skip 8
  .SpritePlayerLadder2 skip 8
  .SpritePlayerJumping1 skip 8
  .SpritePlayerJumping2 skip 8
  .SpritePlayerFalling1 skip 8
  .SpritePlayerFalling2 skip 8
  .SpritePlayerWallSliding skip 8
  .SpritePlayerDiving skip 8
  .SpritePlayerSliding skip 8
  .SPProjectile1 skip 8
  .SPProjectile2 skip 8
  .SPProjectile3 skip 8
  .SPProjectile4 skip 8
  .SpriteFluid1 skip 8
  .SpriteFluid2 skip 8
  .SpriteFluid3 skip 8
  .SpriteFluid4 skip 8
  .SpriteSpike1 skip 8
  .SpriteSpike2 skip 8
  .SpriteSpike3 skip 8
  .SpriteSpike4 skip 8
  .SpriteSpike5 skip 8
  .SpriteSpike6 skip 8
  .SpriteTeleportal1 skip 8
  .SpriteTeleportal2 skip 8
  .SpriteKey1 skip 8
  .SpriteKey2 skip 8
org $0d00 ; 1 sprite, rest pointer lists
  .DummySpriteToStopBug skip 8
  .MapListLo skip 64 
  .MapListHi skip 64
  .StaticCrystal1 skip 8
  .StaticCrystal2 skip 8
  .StaticDoor1 skip 8
  .StaticDoor2 skip 8
  .StaticDoor3 skip 8
  .StaticDoor4 skip 8
  .StaticDoor5 skip 8
  .StaticDoor6 skip 8
  .StaticDoor7 skip 8
  .StaticDoor8 skip 8
  .InvisPlatform skip 8
  .VisPlatform skip 8
  .StaticTorch1 skip 8
  .StaticTorch2 skip 8
guard $2fff
ORG &e00  ; we don't use basic so we can overwrite all memory from her to oshwm
.init
include "data.asm"
include "pointers.asm"
include "main.asm"
include "entities.asm"
include "draw.asm"
include "input.asm"
include "genericroutines.asm"
include "sound.asm"
include "text.asm"
include "collision.asm"
include "relocate.asm"



; include "title.asm"

.end
;save name, start position, end position (program counter), program launch address
save "game", init, *,InitOverWrite

