
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
.drawaddress skip 2
.drawaddress2 skip 2
.seed skip 2
.readpointer skip 2
.readpointer2 skip 2
.keyboardspace skip 1
.keys skip 1
.keysflag
.pixelindexx skip 1 
.pixelindexy skip 1
.pixeloffset skip 1
.currentpixel skip 1
.jumppointer skip 2
.p skip 1
.currentbuffer skip 2 
.targetbuffer skip 1
.bufferflag skip 1
.extraloopcounter1 skip 1
.extraloopcounter2 skip 1

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


mainram = &400

ORG mainram
.entitiesfliphorizontally skip 8
.entitiesspriteaddresslo skip 8
.entitiesspriteaddresshi skip 8
.entitiesanimationtimer skip 8
.entitiesanimationtrack skip 8
.entitiesanimationaddresslo skip 8
.entitiesanimationaddresshi skip 8
.entitiestype skip 8
.entitiesxpos skip 8
.entitiesxposlo skip 8
.entitiesypos skip 8
.entitiesyposlo skip 8
.entitiesvxlo skip 8
.entitiesvxhi skip 8
.entitiesvyhi skip 8
.entitiesvylo skip 8
.entitiesxposlastframe skip 8
.entitiesyposlastframe skip 8
.entitiesdrawposlo skip 8
.entitiesdrawposhi skip 8
.entitiesdrawposlolastframe skip 8
.entitiesdrawposhilastframe skip 8
.entitiesstate skip 8
.entitiesdatalocationlo skip 8
.entitiesdatalocationhi skip 8

.currentbasedrawaddress skip 2
.currententity skip 1
.variable1 skip 1 
.variable2 skip 1
.variable3 skip 1 
.variable4 skip 1
.variable5 skip 1
.variable6 skip 1

.nextwalljumpdirection skip 1

.spriteyreadoffset skip 1
.temp skip 1 ;204
.allowedjumps skip 1
.playeronground skip 1
.gamestate skip 1

.waction skip 1 
.aaction skip 1 
.saction skip 1  
.daction skip 1 


.mapposx skip 1  
.mapposy skip 1

.triggermapchange skip 1

.globalgravityhi skip 1
.globalgravitylo skip 1
.jumpstrengthlo skip 1 
.jumpstrengthhi skip 1

.playeronfloor skip 1

.staticentitiesdrawposhi skip 8 ;address to draw at e.g. 5800
.staticentitiesdrawposlo skip 8

.staticentitiescurrentspritehi skip 8 ; points to the list of sprites to be drawn every frame
.staticentitiescurrentspritelo skip 8

.staticentitiescurrentanimationhi skip 8 ; points to the animation data for this entity
.staticentitiescurrentanimationlo skip 8

.staticentitieswidth skip 8 
.staticentitiesheight skip 8

.staticentitiestimer skip 8 ; used to advance along the animation track
.staticentitiestype skip 8
.staticentitiesanimationtrack skip 8; shows where we are in the current animation

org $700
.collisionmap skip 256

; org &1080
ORG &0e00  ; we don't use basic so we can overwrite all memory from her to oshwm
.init
sei
cld ;clear decimal mode



;Init Stack
ldx #$ff
txs 

lda #1
sta seed+1

ldy #00
.setoswrchvals
lda oswrchinitvals, y 
jsr oswrch
iny 
cpy #$0c
bne setoswrchvals

; clear mem
lda #$00
ldx #$00
.ClearMemoryLoop
    sta $0000, x
    inx
    cpx #$90
    bne ClearMemoryLoop

ldx #$00
lda #$00
clc
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


lda #$00
sta globalgravityhi
lda #$80
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

; jsr LoadCollisionData
; jsr LoadMetaTileMap
jsr DrawMetaColumns
jsr LoadCollisionData


lda #$20
sta variable1
lda #$20
sta variable2
lda #$01
sta variable3
jsr CreateEntity

lda #$20
sta variable1
lda #$20
sta variable2
lda #$01
sta variable3
jsr CreateStaticEntity

lda #$20
sta variable1
lda #$40
sta variable2
lda #$01
sta variable3
jsr CreateStaticEntity

lda #$20
sta variable1
lda #$60
sta variable2
lda #$01
sta variable3
jsr CreateStaticEntity


lda #$20
sta variable1
lda #$80
sta variable2
lda #$01
sta variable3
jsr CreateStaticEntity


lda #$20
sta variable1
lda #$a0
sta variable2
lda #$01
sta variable3
jsr CreateStaticEntity


jsr InitKeys
cli

jmp mainloop ; jump to the mainloop of the game

include "data.asm"
include "main.asm"
include "entities.asm"
include "draw.asm"
include "input.asm"
include "genericroutines.asm"
include "collision.asm"
.end

SAVE "Cleo", init, end