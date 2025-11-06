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