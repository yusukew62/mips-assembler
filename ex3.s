.data
N: .word 10 # The length of Array
A: .word 8 # A[0] = 8
.word 4 # A[1] = 4
.word 7
.word 12
.word 13
.word 19
.word 23
.word 43
.word 56 # A[8] = 56
.word 32 # A[9] = 32
B: .space 40 # 配列B の格納先　大きさは40バイト

.text
main: or $8, $0, $0 # i == 0
lw $9, N # Nの値をロード
la $10, A # Aのアドレスを$10に入れる
la $11, B # Bのアドレスを$11に入れる

loop: beq $8, $9, exit # i == Nならexit
lw $12, 0($10) # Aのアドレスをロードする
sw $12, 0($11) # Bにストアする
addi $10, $10, 4 # アドレスを次にすすめる
addi $11, $11, 4 # アドレスを次にすすめる
addi $8, $8, 1 # i++
j loop

exit: j exit

