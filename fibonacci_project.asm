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