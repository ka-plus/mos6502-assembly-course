*= $0801 "Basic Upstart"
BasicUpstart(start)

*= $0810 "Program"
start: 
    lda $d021
    sta $d020
    rts
