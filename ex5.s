.data
A: .word 0
.word 0
.word 1
.word 0
.word 0
.word 0
.word 0
.word 2
.word 3
.word 0
.word 0
.word 0
.word 0
.word 4
.word 0
.word 0

B: .word 1
.word 2
.word 3
.word 4
.word 5
.word 6
.word 7
.word 8
.word 9
.word 10
.word 11
.word 12
.word 13
.word 14
.word 15
.word 16

C: .space 64
L: .word 32
N: .word 4
S: .word 0

.text
main: or $8, $0, $0 # i=0
or $9, $0, $0 # j=0
or $10, $0, $0 # k=0
or $11, $0, $0 # cnt=0
or $12, $0, $0 # 1つの要素 P=0
la $13, A # Aのアドレス
la $14, B # Bのアドレス
la $15, C # Cのアドレス
lw $17, 0($13) # A
lw $18, 0($14) # B
lw $19, 0($15) # C
lw $20, S # かけ算の結果 S=0
lw $21, N # 4
lw $22, L # 32

loop1: beq $8, $21, loop1end # i < 4の時
addi $8, $8, 1

loop2: beq $9, $21, loop2end # j < 4の時
addi $9, $9, 1
or $20, $0, $0 # かけ算の結果のSの初期化

loop3: beq $10, $21, loop3end # k < 4の時
addi $10, $10, 1
lw $17, 0($13) # Aを読み込む
lw $18, 0($14) # Bを読み込む
addi $16, $0, 1 # mask

#かけ算
loop: beq $11, $22, end # 32回
and $23, $18, $16 # 1ビット取り出す
beq $23, $0, skip
add $20, $20, $17 # 被乗数に積を加える かけ算の答え=S

skip: add $17, $17, $17 # 被乗数レジスタを1ビット左シフト
add $16, $16, $16 # maskを1ビット左シフト
addi $11, $11, 1 # cnt++
j loop

# かけ算終了
# 次の要素に進める
end: add $12, $12, $20 # １つの要素 P += S
#addi $10, $10, 1 # k++
or $11, $0, $0 # cnt=0に初期化
addi $13, $13, 4 # Aを進める
addi $14, $14, 16 # Bを進める
j loop3

loop3end: sw $12, 0($15) # Cに格納
or $12, $0, $0 # P=0に初期化
or $10, $0, $0 # k=0に初期化
#addi $9, $9, 1 # j++
addi $13, $13, -16 # Aを最初の行に戻す
addi $14, $14, -60 # Bを次の列に移す
addi $15, $15, 4 # Cを進める
j loop2

loop2end: addi $13, $13, 16 # Aを次の行に進める
la $14, B
#addi $8, $8, 1 # i++
or $9, $0, $0 # j=0に初期化
j loop1

loop1end: j exit

exit: j exit

