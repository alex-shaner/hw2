.data
x:
        .word   10
y:
        .word   20
z:
        .space   4

.text
.globl main
func:
        addi    sp,sp,-32
        sd      ra,24(sp)
        sd      s0,16(sp)
        addi    s0,sp,32
        fsw     fa0,-20(s0)
        fsw     fa1,-24(s0)
        flw     fa4,-20(s0)
        flw     fa5,-24(s0)
        fmul.s  fa5,fa4,fa5
        fmv.s   fa0,fa5
        ld      ra,24(sp)
        ld      s0,16(sp)
        addi    sp,sp,32
        jr      ra
main:
        addi    sp,sp,-32
        sd      ra,24(sp)
        sd      s0,16(sp)
        addi    s0,sp,32
        lui     a5,%hi(.LC0)
        flw     fa5,%lo(.LC0)(a5)
        fsw     fa5,-20(s0)
        lui     a5,%hi(.LC1)
        flw     fa5,%lo(.LC1)(a5)
        fsw     fa5,-24(s0)
        flw     fa1,-24(s0)
        flw     fa0,-20(s0)
        call    func
        fsw     fa0,-28(s0)
        li      a5,0
        mv      a0,a5
        ld      ra,24(sp)
        ld      s0,16(sp)
        addi    sp,sp,32
        jr      ra
.data
.LC0:
        .word   1073741824
.LC1:
        .word   1082130432
        
 