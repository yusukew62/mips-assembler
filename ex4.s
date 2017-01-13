.data
A: .word 23
B: .word 47
C: .word 0
D: .word 32

.text
main: or $8, $0, $0 # i=0
lw $9, A # 被乗数
lw $10, B # 乗数
lw $11, C
lw $12, D
addi $13, $0, 1 # mask

loop: beq $8, $12, loopend # ３２回繰り返す
and $14, $10, $13 # １ビット取り出す
beq $14, $0, skip # 乗数０の値を判定
add $11, $11,$9 # 被乗数を積に加える

skip: addu $9, $9, $9 # 被乗数レジスタを１ビット左シフト
addu $13, $13, $13
addi $8, $8, 1 # i++
j loop

loopend: sw $11, C

exit: j exit 

