# Program logic
.data
# Game name and player representation with their symbols used to display.
game_name: .asciiz " \n\nWelcome to TIC TAC TOE"
player_symbol: .asciiz "\n\nPlayer 1 - X \nPlayer 2 - O \n"

# Used to design the board.
board_newLine: .asciiz " \n"
board_vertLine: .asciiz " | "
board_horLine: .asciiz "---------\n"

# Used to inform player whose turn is now.
player1_turn: .asciiz "Player 1's turn: "
player2_turn: .asciiz "Player 2's turn: "

# Used to display when user makes a wrong move.
move_error: .asciiz "\nOOPS!!! - INVALID MOVE - REPLAY YOUR TURN: "

# Used to display which player won the match or draw.
player1_win: .asciiz "CONGRATS PLAYER 1(X)"
player2_win: .asciiz "CONGRATS PLAYER 2(O)"
players_draw: .asciiz "OOPS!!! - DRAW GAME"

# Program data
.text

# Three functions are made as globl.
.globl game_begin_point
.globl game_status
.globl board

# starts the game.
game_begin_point:
	jal board	# jumpt to print game board
	lb $t0, 0($k0)	# 1
	lb $t1, 1($k0)	# 2
	lb $t2, 2($k0)	# 3
	lb $t3, 3($k0)	# 4
	lb $t4, 4($k0)	# 5
	lb $t5, 5($k0)	# 6
	lb $t6, 6($k0)	# 7
	lb $t7, 7($k0)	# 8
	lb $t8, 8($k0)	# 9
	# If $s0 is equal to 2 then it will branch to Player2 otherwise Player1 will be executed.
	beq $s0, 2, Player2
	
# This will be executed for player1 turn	
Player1:
	addi $s0, $zero, 2	# Sets $s0 to 2 for Player2 execution in the next round.
	la $a0, player1_turn	# load player 1's turn
	li $v0, 4		# Display player 1's turn
	syscall
	addi $s6, $zero, 88	# Load character X
	j board_move0		# Jumps to the board_move0 label.

# This will be executed for player2 turn
Player2:
	addi $s0, $zero, 1	# Sets $s0 to 1 for Player1 execution in the next round.
	la $a0, player2_turn	# load player 1's turn
	li $v0, 4		# Display player 1's turn
	syscall
	addi $s6, $zero, 79

# Will happen after Player1 or Player2 execution.
board_move0:
	li $v0, 12			# read character
	syscall
	addi $a1, $v0, 0		# set $a1 to 0
	beq $a1, $s1, board_move9	# Branch to board_move9 if $a1 equal to X
	beq $a1, $s2, board_move9	# Branch to board_move9 if $a1 equal to O
	bne $a1, $t0, board_move1	# Branch to board_move1 if $a1 is not equal to $t0
	sb $s6, 0($k0)			# This is to store player char in area
	j board_move10			# Jump to board_move10 to check status and game ending
	
# Series of moves
board_move1:
	bne $a1, $t1, board_move2	# Branch if area not empty
	beq $a1, $s6, board_move9	# Branch to board_move9 if already exist player char
	beq $a1, $s2, board_move9	# Branch to board_move9 if $a1 equal to O
	sb $s6, 1($k0)			# This is to store player char in area
	j board_move10			# Jump to board_move10 to check status and game ending
	
board_move2:
	bne $a1, $t2, board_move3	# Branch if area not empty
	beq $a1, $s6, board_move9	# Branch to board_move9 if already exist player char
	sb $s6, 2($k0)			# This is to store player char in area
	j board_move10			# Jump to board_move10 to check status and game ending
	
board_move3:
	bne $a1, $t3, board_move4	# Branch if area not empty
	beq $a1, $s6, board_move9	# Branch to board_move9 if already exist player char
	beq $a1, $s2, board_move9	# Branch to board_move9 if $a1 equal to O
	sb $s6, 3($k0)			# This is to store player char in area
	j board_move10			# Jump to board_move10 to check status and game ending
	
board_move4:
	bne $a1, $t4, board_move5	# Branch if area not empty
	beq $a1, $s6, board_move9	# Branch to board_move9 if already exist player char
	beq $a1, $s2, board_move9	# Branch to board_move9 if $a1 equal to O
	sb $s6, 4($k0)			# This is to store player char in area
	j board_move10			# Jump to board_move10 to check status and game ending
	
board_move5:
	bne $a1, $t5, board_move6	# Branch if area not empty
	beq $a1, $s6, board_move9	# Branch to board_move9 if already exist player char
	beq $a1, $s2, board_move9	# Branch to board_move9 if $a1 equal to O
	sb $s6, 5($k0)			# This is to store player char in area
	j board_move10			# Jump to board_move10 to check status and game ending
	
board_move6:
	bne $a1, $t6, board_move7	# Branch if area not empty
	beq $a1, $s6, board_move9	# Branch to board_move9 if already exist player char
	beq $a1, $s2, board_move9	# Branch to board_move9 if $a1 equal to O
	sb $s6, 6($k0)			# This is to store player char in area
	j board_move10			# Jump to board_move10 to check status and game ending
	
board_move7:
	bne $a1, $t7, board_move8	# Branch if area not empty
	beq $a1, $s6, board_move9	# Branch to board_move9 if already exist player char
	beq $a1, $s2, board_move9	# Branch to board_move9 if $a1 equal to O
	sb $s6, 7($k0)			# This is to store player char in area
	j board_move10			# Jump to board_move10 to check status and game ending
	
board_move8:
	bne $a1, $t8, board_move9	# Branch to board_move9 if already exist player char
	beq $a1, $s6, board_move9	# Branch to board_move9 if already exist player char
	beq $a1, $s2, board_move9	# Branch to board_move9 if $a1 equal to O
	sb $s6, 8($k0)			# This is to store player char in area
	j board_move10			# Jump to board_move10 to check status and game ending
	
board_move9:
	la $a0, move_error		# Load error message for invalid move
	li $v0, 4			# Displays the error message
	syscall
	j board_move0			# jump back to first move

board_move10:
	jal game_status			# Calling function game_status
	addi $k1, $v0, 0		# -1 = continue, 1 = win game, 0 = draw
	beq $k1, -1, game_begin_point	# branch to game_begin_point if $k1 is equal to -1.
	jal board			# Calling function board
	beq $k1, 0, draw_players	# Branch to draw_players if $k1 is equal to 0
	beq $s0, 1, win_player2        # Branch to win_player2 if $s0 is equal to 1
	
# If player 1 won the game this will be executed	
win_player1:
	la $a0, player1_win	# Display player 1 win message
	li $v0, 4
	syscall
	j exit
	
# If player 2 won the game this will be executed
win_player2:
	la $a0, player2_win	# Display player 2 win message
	li $v0, 4
	syscall
	j exit
	
# If the game is draw this will be executed
draw_players:
	la $a0, players_draw	# Display draw game message
	li $v0, 4
	syscall

# terminate
exit:
	li $v0, 10
	syscall

# This function checks who won the game
game_status:
	lb $t0, 0($k0)			# Load X and O to corresponding $t for checking
	lb $t1, 1($k0)			# Load X and O to corresponding $t for checking
	lb $t2, 2($k0)			# Load X and O to corresponding $t for checking
	lb $t3, 3($k0)			# Load X and O to corresponding $t for checking
	lb $t4, 4($k0)			# Load X and O to corresponding $t for checking
	lb $t5, 5($k0)			# Load X and O to corresponding $t for checking
	lb $t6, 6($k0)			# Load X and O to corresponding $t for checking
	lb $t7, 7($k0)			# Load X and O to corresponding $t for checking
	lb $t8, 8($k0)			# Load X and O to corresponding $t for checking
	bne $t0, $t1, check_step1	# Branch to check_step1 if $t0 is not equal to $t1
	bne $t1, $t2, check_step1	# Branch to check_step1 if $t1 is not equal to $t2
	addi $v0, $zero, 1		# Game won
	jr $ra				# jump back to register
	
# Series of checks
check_step1:
	bne $t3, $t4, check_step2	# branch if corresponding areas not matching
	bne $t4, $t5, check_step2	# branch if corresponding areas not matching
	addi $v0, $zero, 1		# Game won
	jr $ra				# jump back to register
	
check_step2:
	bne $t6, $t7, check_step3	# branch if corresponding areas not matching
	bne $t7, $t8, check_step3	# branch if corresponding areas not matching
	addi $v0, $zero, 1		# Game won
	jr $ra				# jump back to register
check_step3:
	bne $t0, $t3, check_step4	# branch if corresponding areas not matching
	bne $t3, $t6, check_step4	# branch if corresponding areas not matching
	addi $v0, $zero, 1		# Game won
	jr $ra				# jump back to register
	
check_step4:
	bne $t1, $t4, check_step5	# branch if corresponding areas not matching
	bne $t4, $t7, check_step5	# branch if corresponding areas not matching
	addi $v0, $zero, 1		# Game won
	jr $ra				# jump back to register
					# jump back to register
check_step5:
	bne $t2, $t5, check_step6	# branch if corresponding areas not matching
	bne $t5, $t8, check_step6	# branch if corresponding areas not matching
	addi $v0, $zero, 1		# Game won
	jr $ra				# jump back to register
	
check_step6:
	bne $t0, $t4, check_step7	# branch if corresponding areas not matching
	bne $t4, $t8, check_step7	# branch if corresponding areas not matching
	addi $v0, $zero, 1		# Game won
	jr $ra				# jump back to register
	
check_step7:
	bne $t2, $t4, check_step8	# branch if corresponding areas not matching
	bne $t4, $t6, check_step8	# branch if corresponding areas not matching
	addi $v0, $zero, 1		# Game won
	jr $ra				# jump back to register
	
check_step8:
	beq $t0, '1', check_step9	# Checking for any empty area's
	beq $t1, '2', check_step9	# Checking for any empty area's
	beq $t2, '3', check_step9	# Checking for any empty area's
	beq $t3, '4', check_step9	# Checking for any empty area's
	beq $t4, '5', check_step9	# Checking for any empty area's
	beq $t5, '6', check_step9	# Checking for any empty area's
	beq $t6, '7', check_step9	# Checking for any empty area's
	beq $t7, '8', check_step9	# Checking for any empty area's
	beq $t8, '9', check_step9	# Checking for any empty area's
	addi $v0, $zero, 0		# Draw game no winners
	jr $ra				# jump back to register
	
check_step9:
	addi $v0, $zero, -1		# return back to continue game
	jr $ra				# jump back to register

# This function constructs and displays the board of the game.
board:
	lb $t0, 0($k0)	# 1
	lb $t1, 1($k0)	# 2
	lb $t2, 2($k0)	# 3
	lb $t3, 3($k0)	# 4
	lb $t4, 4($k0)	# 5
	lb $t5, 5($k0)	# 6
	lb $t6, 6($k0)	# 7
	lb $t7, 7($k0)	# 8
	lb $t8, 8($k0)	# 9
	
# Displays the name of the game
la $a0, game_name
li $v0, 4
syscall

# Displays player_symbol
la $a0, player_symbol
li $v0, 4
syscall

# Constructs the number '1' on the board (first row & first column)
board_design_val1:
	addi $a0, $t0, 0
	li $v0, 11
	syscall
	# Used board_vertLine to provide space between two numbers in a row.  
	la $a0, board_vertLine
	li $v0, 4
	syscall
	
# Constructs the number '2' on the board (first row & second column)
board_design_val2:
	addi $a0, $t1, 0
	li $v0, 11
	syscall
	# Used board_vertLine to provide space between two numbers in a row.
	la $a0, board_vertLine
	li $v0, 4
	syscall
	
# Constructs the number '3' on the board (first row & third column)
board_design_val3:
	addi $a0, $t2, 0
	li $v0, 11
	syscall
	# Used board_newLine to go to the next line.
	la $a0, board_newLine
	li $v0, 4
	syscall
	# used board_horLine to split two rows.
	la $a0, board_horLine
	syscall
	
# Constructs the number '4' on the board (second row & first column)
board_design_val4:
	addi $a0, $t3, 0
	li $v0, 11
	syscall
	# Used board_vertLine to provide space between two numbers in a row.
	la $a0, board_vertLine
	li $v0, 4
	syscall
	
# Constructs the number '5' on the board (second row & second column)
board_design_val5:
	addi $a0, $t4, 0
	li $v0, 11
	syscall
	# Used board_vertLine to provide space between two numbers in a row.
	la $a0, board_vertLine
	li $v0, 4
	syscall
	
# Constructs the number '6' on the board (second row & third column)
board_design_val6:
	addi $a0, $t5, 0
	li $v0, 11
	syscall
	# Used board_newLine to go to the next line.
	la $a0, board_newLine
	li $v0, 4
	syscall
	# used board_horLine to split two rows.
	la $a0, board_horLine
	syscall
	
# Constructs the number '7' on the board (third row & first column)
board_design_val7:
	addi $a0, $t6, 0
	li $v0, 11
	syscall
	# Used board_vertLine to provide space between two numbers in a row.
	la $a0, board_vertLine
	li $v0, 4
	syscall
	
# Constructs the number '8' on the board (third row & second column)
board_design_val8:
	addi $a0, $t7, 0
	li $v0, 11
	syscall
	# Used board_vertLine to provide space between two numbers in a row.
	la $a0, board_vertLine
	li $v0, 4
	syscall
	
# Constructs the number '9' on the board (third row & third column)
board_design_val9:
	addi $a0, $t8, 0
	li $v0, 11
	syscall
	# Used board_newLine to go to the next line.
	la $a0, board_newLine
	li $v0, 4
	syscall
	jr $ra
