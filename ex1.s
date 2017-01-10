.data
A: .word 19
B: .word 75
C: .word 10

.text
main: lw $8, A
lw $9, B
lw $10, C
add $9, $8, $9
sub $10, $9, $10
ori $10, $10, 3
sw $10, S
exit: j exit 

