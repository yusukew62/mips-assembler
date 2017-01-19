         .data
n:       .word 15
s:       .word 0

         .text
main:    or   $8, $0, $0       # i = 0
         lw   $9, n            # nの値をロード
         or   $10, $0, $0      # s = 0

loop:    beq  $8, $9, loopend  # i == n なら loopend へ
         addi $8, $8, 1        # i++
         add  $10, $10, $8     # s += i
         j    loop

loopend: sw   $10, s           # sの値をストア

exit:    j    exit 

