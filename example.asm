  \ define some constants
  RUN_ADDR=$0400              ; binary will execute at this address
  LOAD_ADDR=$2000             ; binary will load at this address
  OFFSET=LOAD_ADDR-RUN_ADDR   ; displacement between main program and relocator

  \ define zeropage variables
  org 0                       ; start assembling at address $0000 (default)
.zp skip 256
  \ main program
  org RUN_ADDR                ; continue assembling at address 'RUN_ADDR'
.main                         ; named label 'main': start of main program
    ldx #$ff
    lda #00
    .
    txa
    sta zp, X
    dex
    bne -

rts                         ; return to caller
.end                          ; end of main program

  \ relocator stub that moves main program from 'LOAD_ADDR' to 'RUN_ADDR'
  org *, *+OFFSET             ; continue assembling at current PC (*)
                              ; also set logical PC (@) to where relocator will execute
.entry                        ; program entry (execution starts here)
  ldx #end-main               ; number of bytes to copy (size of main program)
.                             ; anonymous (unnamed) label
  lda LOAD_ADDR-1,x           ; copy byte from 'LOAD_ADDR' area
  sta RUN_ADDR-1,x            ;           to 'RUN_ADDR' area
  dex                         ; point register X to next byte
  bne -                       ; branch to previously defined anonymous label
  jmp main                    ; finally, execute main program at 'RUN_ADDR'

  ; save the final binary named "CODE" from label 'main' to current PC (*)
  ; also save its accompanying .inf file
  ; set execution address to 'entry' (the $FF0000 signifies a host address)
  ; set load address to 'LOAD_ADDR' (again, the $FF0000 signifies a host address)
  save "CODE", main, *, $FF0000|entry, $FF0000|LOAD_ADDR