*= $0801 "Basic Upstart"
BasicUpstart(start)

*= $0810 "Program"
start: 

loop:
    inc $D020
    jmp loop
