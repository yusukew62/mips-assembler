        .data
N:      .word 10
A:      .word 32
        .word 122
        .word 8
        .word 23
        .word 9
        .word 38
        .word 987
        .word 22
        .word 2
        .word 876

        .text
main:    la $a0, A           # $a0 = &A
         lw $a1, N           # $a1 = N
         jal sort
exit:    j exit

sort:    addi $sp, $sp, -20
         sw $ra, 16($sp)
         sw $s3, 12($sp)
         sw $s2, 8($sp)
         sw $s1, 4($sp)
         sw $s0, 0($sp)
         or $s2, $0, $a0     #move $s2, $a0
         or $s3, $0, $a1     #move $s3, $a1
         or $s0,$0,$0        # $s0(= i) = 0

for1tst: slt $t0,$s0,$s3     # $t0 = (i < N) 1:0
         beq $t0,$0,exit1    # if $t0 == 0 then exit1
         addi $s1, $s0, -1   # j = i - 1

for2tst: slti $t0, $s1, 0    # $t0 = (j < 0) 1:0
         beq $t0, $0, cont   
         j exit2

cont:    or $t1, $s1, $0     # $t1 = j * 4
         add $t1, $t1, $t1  
         add $t1, $t1, $t1
         add $t2, $s2, $t1   # $t2 = &(A[j])
         lw $t3, 0($t2)      # $t3 = A[j]
         lw $t4, 4($t2)      # $t3 = A[j+4]

         slt $t0, $t4, $t3   # $t0 = (A[j]< A[j+1]) 1:0
         beq $t0, $0, exit2  # if $t0 == 0 then exit2
         or $a0, $s2, $0     # $a0 = $s2(&A)
         or $a1, $s1, $0     # $a1 = $s1(j)
         jal swap

         addi $s1, $s1, -1 # j = j - 1
         j for2tst

exit2:   addi $s0, $s0, 1 # i = i + 1
         j for1tst

exit1:   lw $s0, 0($sp)
         lw $s1, 4($sp)
         lw $s2, 8($sp)
         lw $s3, 12($sp)
         lw $ra, 16($sp)
         addi $s0, $s0, 20
         jr $ra

swap:    addi $t1, $a1, 0
         add $t1, $t1, $t1
         add $t1, $t1, $t1
         add $t1, $a0, $t1
         lw $t0, 0($t1)
         lw $t2, 4($t1)
         sw $t2, 0($t1)
         sw $t0, 4($t1)
         jr $31

