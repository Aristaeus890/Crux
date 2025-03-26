
.mainloop
	;use gamestate to index into a jump table
	ldy gamestate
	lda GameStatesLo, y 
	sta jumppointer
	lda GameStatesHi, y 
	sta jumppointer+1
	jsr JumpToPointerRoutine
jmp mainloop ;repeat mainloop

.entergamestate ; new state in y 
	sty gamestate
	lda InitGameStatesLo, y 
	sta jumppointer
	lda InitGameStatesHi, y 
	sta jumppointer+1
	jsr JumpToPointerRoutine
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
	jsr ClearBuffer1 ; clear all sprites from $5800 buffer
	jsr ReadKeyboard ; load all keyboard input this frame
	jsr ProcessEntities ; go to entity loop
	jsr DrawToBuffer1 ; draw all entities to $5800 buffer
	jsr ProcessStaticEntities
	jsr CheckForMapChange ; check if we need to load a new screen
	lda #19:jsr osbyte ; wait for vsync
	jsr FlipScreenBuffer ; swap from $5800 buffer to $3000

	jsr ClearBuffer2
	jsr ReadKeyboard
	jsr ProcessEntities
	jsr ProcessStaticEntities
	jsr DrawToBuffer2
	jsr CheckForMapChange
	lda #19:jsr osbyte ; wait for vsync
	jsr FlipScreenBuffer
	
rts
.GameStateTitle
rts
.GameStatePaused
rts
.InitGameStatePlaying

rts
.InitGameStateTitle

rts
.InitGameStatePaused

rts
