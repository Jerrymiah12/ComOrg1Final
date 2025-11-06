.data
prompt: .asciiz "Enter an integer N (N >= 22): "
illegal_msg: .asciiz "Illegal Number!\n"
fib_msg: .asciiz "Fibonacci sequence:\n"
space: .asciiz " "

.text
.global main

main:
get_input:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0
    
    blt $t0, 22, illegal
    j compute_fib

illegal:
    li $v0, 4
    la $a0, illegal_msg
    syscall
    j get_input

compute_fib: 
    li $v0, 4
    la $a0, space
    syscall

    li $t1, 0
    li $t2, 1
    li $t3, 2
    move $t4, $t0

    li $v0, 1
    move $a0, $1
    syscall
    li $v0, 4
    la $a0, space
    syscall

    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, space
    syscall

fib loop:
    beq $t3, $t4, done
    add $t5, $t1, $t2

    li $v0, 1
    move $a0, $t5
    syscall
    li $v0, 4