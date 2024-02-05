*= $0801 "Basic Upstart"
BasicUpstart(start)

*= $0810 "Program"
start: 

ldx #0
loop:
    txa
    sta $400, x
    sta $D800, x
    inx
    cpx #0
    bne loop
    rts