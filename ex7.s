        .data
N:      .word 10
FN:     .word 0

.text
main: lw $a0, N # $a0(= N) = 10
jal fact # $v0 = fact($a0)
sw $v0 FN # FN = $v0
exit: j exit

fact: addi $sp, $sp, -8 # $sp = $sp - 8 変更点１
sw $ra, 4($sp)
sw $a0, 0($sp)

slti $t0, $a0, 1 # $t1 = ($a0 < 1) 1:0
beq $t0, $0, L1 # if $t1 = 0 then L1

addi $v0, $0, 1 # $v0 = 1
addi $sp, $sp, 8 # $sp = $sp + 8
jr $ra # return FN = 1

L1: addi $a0, $a0, -1
jal fact # fact($a0 - 1)
lw $a0, 0($sp)
lw $ra, 4($sp)
addi $sp, $sp, 8
jal MUL
jr $ra

MUL: addi $sp, $sp, -4
sw $ra, 0($sp)

loop: slti $s2, $t6, 32
beq $s2, $0, loopend
and $s4, $a1, $s3
beq $s4, $0, shift
add $v0, $v0, $a0 # 積に被乗数を加算

shift: addu $a0, $a0, $a0 # 被乗数を左シフト
addu $s3, $s3, $s3 # maskを左シフト
addi $t6, $t6, 1
j loop

loopend: addi $t5, $t5, 1 # k++
addi $t0, $t0, 4
addi $t1, $t1, 16
add $s5, $s5, $v0
or $t6, $0, $0 # cnt = 0
lw $ra, 0($sp)
jr $ra 

