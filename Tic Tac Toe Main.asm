# Course Name: CS221 Computer Org. & Assem Lang.
# Term: Summer 2021
# Assignment: Course Final Project
# Title: Tic Tac Toe
# Project Members:
	
	# Akshith Simha Katragada - yd8937
	
	# Brandon Vo - XJ5954
	
	# Kunal Bhutani - Pi9477
	
	# Omkar Chowdary Mandava - bd3824


#______________________________________________________________________________

# Program data
.data
board_values: .byte '1', '2', '3', '4', '5', '6', '7', '8', '9'

# Program logic
.text
.globl main

main:
	# Loading array board_values 1-9 into $k0
	la $k0, board_values
	
	# $s0 is used to tell which players turn now.
	addi $s0, $zero, 1
	
	# To represent character X
	addi $s1, $zero, 88
	
	# T represent character O
	addi $s2, $zero, 79
	
	# Calling function game_begin_point
	jal game_begin_point
	
	# terminate
	li $v0, 10
	syscall
