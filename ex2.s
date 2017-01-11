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
S: .word 0

.text
main: or $8, $0, $0 # i = 0
la $9, A # Aのアドレスを$9に入れる
lw $10, N # Nの値をロード
or $11, $0, $0 # s = 0

loop: beq $8, $10, loopend # i == n なら loopend
lw $12, 0($9) # Aのアドレスをロードする
add $11, $11, $12 # s += A[N]
addi $9, $9, 4 # アドレスを次にすすめる
addi $8, $8, 1 # i++
j loop

loopend: sw $11, S

exit: j exit 

