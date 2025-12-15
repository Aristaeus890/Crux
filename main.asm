
;entry point after all initialisation is done
.endinit
cli
ldy #0
jsr entergamestate
.mainloop
	;use gamestate to index into a jump table
	lda #>mainloop
	pha 
	lda #<mainloop-1
	pha

	ldy gamestate
	lda GameStatesHi, y
	pha 
	lda GameStatesLo, y 
	pha
rts




.GameStatePlaying
	;start here, with buffer1 ($5800) displayed on the screen
	;clear buffer 2
	;draw to buffer 2
	;flip display buffer to buffer 2 ($3000)
	;clear buffer 1
	;draw to buffer 1
	;flip display to buffer 1
	;repeat
	; ldy #5
	; jsr SetPalette
	; lda framecounter
	; cmp #10
	; bne nocycle
	; lda #$00
	; sta framecounter
	; jsr cyclepal
	; .nocycle
	jsr ReadKeyboard
	jsr ClearBuffer1 ; clear all sprites from $5800 buffer
	jsr DefaultGameBehaviour
	jsr DrawToBuffer1 ; draw all entities to $5800 buffer
	; ldy #0
	; jsr SetPalette
	lda #19:jsr osbyte ; wait for vsync
	jsr FlipScreenBuffer ; swap from $5800 buffer to $3000

	; ldy #5
	; jsr SetPalette
	jsr ReadKeyboard
	jsr ClearBuffer2
	jsr DefaultGameBehaviour
	jsr DrawToBuffer2
	; ldy #0
	; jsr SetPalette
	lda #19:jsr osbyte ; wait for vsync
	jsr FlipScreenBuffer
	jmp GameStatePlaying
;tailcall

.GameStateDisplayingText
	; If return pressed:
	;	Redraw Screen
	;	Reset Stack and gamestate 
	lda #KEYRETURN
	jsr CheckKeyPressed
	beq notextexit
	jsr DrawMetaMetaTiles
	jsr CopyBufferToBuffer
	ldx #$ff
	txs
	lda #>mainloop
	pha
	lda #<mainloop-1
	pha 
	ldy #1
	bpl entergamestate;tailcall
	.notextexit
rts

.entergamestate ; new state in y 
	sty gamestate
	lda InitGameStatesHi, y 
	pha
	lda InitGameStatesLo, y 
	pha
	rts

.GameStateTitle
	inc seed
	jsr prng 
	sta seed+1
	jsr ReadKeyboard
	lda #KEYL
	jsr CheckKeyPressed
	beq NoTitleK
	ldy #GAMESTATEPLAYING
	bpl entergamestate ;always branch
	.NoTitleK
rts



.GameStatePaused

rts

.InitGameStatePlaying
	jmp ReloadScreen
;tailcall
.InitGameStateTitle
	ldy #5
	jmp PrintString
;tailcall
.InitGameStatePaused

rts

.InitGameStateDisplayingText
rts

.DefaultGameBehaviour
		; ldy #1
		; jsr SetPalette
	jsr HandleEtank
		; ldy #2
		; jsr SetPalette
	jsr UpdateUi
		; ldy #4
		; jsr SetPalette
	jsr ProcessEntities
		; ldy #5
		; jsr SetPalette
	; rts
	jsr CheckForScreenExit
		; ldy #3
		; jsr SetPalette
	; jsr CheckForMapChange
	jmp CleanUp
;tailcall

.HandleEtank
rts
	lda framecounter
	bne NoEtanDec
	lda ETank
	sec 
	sbc #1
	sta ETank
	lda ETank+1
	sbc #0
	sta ETank+1
	.NoEtanDec

	ldx #1
	.TimerUnderFlowLoop
		lda ETank, x 
		bpl NoTimerUnderflow
		lda #9
		sta ETank, x 
		.NoTimerUnderflow
		dex 
		bpl TimerUnderFlowLoop
	;check for e-death 
	lda ETank
	ora ETank+1
	bne NoEDeath
	jmp Respawn
	.NoEDeath
rts