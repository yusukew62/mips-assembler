        .data
N:      .word 5
FN:     .word 0

.text
main:   lw $a0, N         # $a0(= N) = 10
        jal fact          # $v0 = fact($a0)
        sw $v0 FN         # FN = $v0

exit: j exit

fact:   addi $sp, $sp, -8 # $sp = $sp - 8
        sw $ra, 4($sp)
        sw $a0, 0($sp)

        slti $t0, $a0,1   # $t1 = ($a0 < 1) 1:0
        beq $t0, $0, L1   # if $t1 = 0 then L1

        addi $v0,$0,1     # $v0 = 1
        addi $sp,$sp,8    # $sp = $sp + 8
        jr $ra            # return FN = 1

L1:     addi $a0,$a0,-1
        jal fact          # fact($a0 - 1)
        lw $a0, 0($sp)
        lw $ra, 4($sp)
        addi $sp,$sp,8
        mul $v0,$a0,$v0
        jr $ra 

