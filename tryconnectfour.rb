
def start
	puts "Welcome to connect four! Please enter player #1's username!" 
	@player_1 = gets.chomp.to_s
	puts "Enter the symbol you would like to use, #{@player_1}"
	@piece_1 = gets.chomp 
	puts "Please enter player #2's username!"
	@player_2 = gets.chomp.to_s
	puts "Enter the symbol you would like to use, #{@player_2}" 
	@piece_2 = gets.chomp
	@board = Array.new(@row = 6){Array.new(@column = 7, 0)}
	@winning_condition = 4

	repeating_placement()
end 

def getting_input
	puts "#{@player_1}, it's your move! Which column should I drop the piece in?" 
	column_1 = (gets.chomp.to_i)

	puts "#{@player_2}, it's your move! Which column should I drop the piece in?" 
	column_2 = (gets.chomp.to_i)

	player_columns = [column_1-1, column_2-1]

	return player_columns
end 

def place_piece(column_1, column_2)
	@player_1_row = @row - 1 
	while (@player_1_row >= 0)
		break if @board[@player_1_row][column_1] == 0 
		@player_1_row -= 1 		
	end

	@board[@player_1_row][column_1] = @piece_1 
 	
 	@player_2_row = @row - 1 
	while (@player_2_row >= 0)
		break if @board[@player_2_row][column_2] == 0 
		@player_2_row -= 1 		
	end

	@board[@player_2_row][column_2] = @piece_2
	
	p @board[0]
	p @board[1]
	p @board[2] 
	p @board[3] 
	p @board[4] 
	p @board[5] 
end


def check_horizontal_1(start, finish, piece) 
	index = start
	counter = 0
	while(start <= finish)
			index += 1 
			if @board[@player_1_row][index] == piece 
				counter += 1 
			else
				return counter
			end   
		end 
end 

def check_horizontal_2(start, finish, piece) 
	index = start
	counter = 0
	while(start <= finish)
			index += 1 
			if @board[@player_2_row][index] == piece 
				counter += 1 
			else
				return counter
			end   
	end 
end 

def winning_case_horizontal(column_1, column_2)
		if(column_1 - @winning_condition >= 0)
			index = column_1 - @winning_condition
		else 
			index = 0
		end

		right_sum_1 = check_horizontal_1(index ,column_1, @piece_1)

		if(column_1 + @winning_condition > @column-1)
			index = column_1 + @winning_condition
		else 
			index = @column-1
		end

		left_sum_1 = check_horizontal_1(column_1, index, @piece_1)

		if(column_2 - @winning_condition >= 0)
			index = column_2 - @winning_condition
		else 
			index = 0
		end

		right_sum_2 = check_horizontal_2(index ,column_2, @piece_2)

		if(column_2 + @winning_condition > @column-1)
			index = column_2 + @winning_condition
		else 
			index = @column-1
		end

		left_sum_2 = check_horizontal_2(column_2, index, @piece_2)
		

		if (right_sum_1 + left_sum_1 >= @winning_condition-1) && (right_sum_2 + left_sum_2 >= @winning_condition-1)
			puts "YOU GUYS TIED! YAY"
			return true
		elsif (right_sum_1 + left_sum_1 >= @winning_condition-1)  
			puts "#{@player_1}, you won! -Horizontally!-"
			return true 
		elsif (right_sum_2 + left_sum_2 >= @winning_condition-1)
			puts "#{@player_2}, you won! -Horizontally!-"
			return true 
		else 
			return false
		end
end 

def winning_case_vertical(column_1, column_2)

	above_1 = @board[@player_1_row-1][column_1] == @piece_1
	above_2 = @board[@player_1_row-2][column_1] == @piece_1
	above_3 = @board[@player_1_row-3][column_1] == @piece_1
	if(above_1 && above_2 && above_3)
		puts "#{@player_1}, you win!!! - VERTICALLY!- "
		return true 
	end
	
	above_1 = @board[@player_2_row-1][column_1] == @piece_1
	above_2 = @board[@player_2_row-2][column_1] == @piece_1
	above_3 = @board[@player_2_row-3][column_1] == @piece_1
	if(above_1 && above_2 && above_3)
		puts "#{@player_2}, you win!!! - VERTICALLY!-"
		return true 
	end 
end

def check_diagonal_bottom_left(row,column, piece)
	left_1 = 1 if @board[row-1][column-1] == piece
	left_2 = 1 if @board[row-2][column-2] == piece
	left_3 = 1 if @board[row-3][column-3] == piece
	return (left_1 + left_2 + left_3)
end
def check_diagonal_top_left(row,column, piece)
	left_1 = 1 if @board[row-1][column+1] == piece
	left_2 = 1 if @board[row-2][column+2] == piece
	left_3 = 1 if @board[row-3][column+3] == piece
	return (left_1 + left_2 + left_3)
end
def check_diagonal_bottom_right(row,column, piece)
	right_1 = 1 if @board[row+1][column+1] == piece
	right_2 = 1 if @board[row+2][column+2] == piece
	right_3 = 1 if @board[row+3][column+3] == piece
	return (right_1 + right_2 + right_3)
end
def check_diagonal_top_right(row,column, piece)
	right_1 = 1 if @board[row+1][column+1] == piece
	right_2 = 1 if @board[row+2][column+2] == piece
	right_3 = 1 if @board[row+3][column+3] == piece
	return (right_1 + right_2 + right_3)
end

def winning_case_diagonal(column_1, column_2)
	
	sum_left = check_diagonal_bottom_right(@player_1_row,column_1, @piece_1) + check_diagonal_top_left(@player_1_row,column_1, @piece_1)
	sum_right = check_diagonal_top_right(@player_1_row,column_1, @piece_1) + check_diagonal_bottom_left(@player_1_row,column_1, @piece_1)
	if(sum_left + sum_right > 3)
		puts "#{@player_1}, you win -DIAGONALLY-!!!-"
	end
 
	sum_left = check_diagonal_bottom_right(@player_2_row,column_2, @piece_2) + check_diagonal_top_left(@player_2_row,column_2, @piece_2)
	sum_right = check_diagonal_top_right(@player_2_row,column_2, @piece_2) + check_diagonal_bottom_left(@player_2_row,column_2, @piece_2)
	if(sum_left + sum_right > 3)
		puts "#{@player_2}, you win -DIAGONALLY- !!!"
	end  

end 


def repeating_placement
	loop do 
		player_columns = getting_input()
		place_piece(player_columns[0], player_columns[1]) 
		if (@board[0][player_columns[0]] != 0 || @board[0][player_columns[1]] != 0) || (winning_case_vertical(player_columns[0], player_columns[1]) || winning_case_horizontal(player_columns[0], player_columns[1]) || winning_case_diagonal(player_columns[0], player_columns[1])) 
			break 
		end
	end 
end  
start() 
