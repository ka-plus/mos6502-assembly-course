BasicUpstart2(start)

.label POS_X = 180
.label POS_Y = 120

* = $8010
start: 

    // intitialize
    ldx #62
    lda #%01001011
    !:
        sta $02C0, x
        lda #0
        dex
    bpl !-

    lda #11
    sta $0400 + 1024 - 8

    lda #POS_X
    sta $D000
    lda #POS_Y
    sta $D001

    lda #%00000001
    sta $D015
    sta $D01D
    sta $D017

    // roll
    loop:
        // wait one frame
        lda $D012
        cmp #200
        bne loop

        // najstarszty bit do C
        lda $02C0
        and #%10000000
        bne !+
            clc
            jmp !++
        !:
            sec
        !:

        ldx #62
        roll:
            rol $02C0, x
            dex
        bpl roll


    jmp loop


    lda #BLACK
    sta $D021
    rts
