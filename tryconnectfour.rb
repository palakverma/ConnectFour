
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

	repeating_placement()

end 

def getting_input
	puts "#{@player_1}, it's your move! Which column should I drop the piece in?" 
	column_1 = (gets.chomp.to_i)-1

	puts "#{@player_2}, it's your move! Which column should I drop the piece in?" 
	column_2 = (gets.chomp.to_i)-1

	player_columns = [column_1, column_2]

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

# def winning_case_horizontal(column_1, column_2)
# 	if @board[@player_1_row][column_1] == @board[@player_1_row+1][column_1]
# 		if @board[@player_1_row+1][column_1] == @board[@player_1_row+2][column_1]
# 			if @board[@player_1_row+2][column_1] == @board[@player_1_row+3][column_1]
# 				if @board[@player_1_row+3] == @board[@player_1_row+4][column_1]
# 					puts "#{@player_1}, you have won! - horizontally - !"
# 					return true 
# 				end 
# 			end 
# 		end 
# 	end
# 		if @board[@player_2_row][column_2] == @board[@player_2_row-1][column_2]
# 		if @board[@player_2_row-1][column_2] == @board[@player_2_row-2][column_2]
# 			if @board[@player_2_row-2][column_2] == @board[@player_2_row-3][column_2]
# 				if @board[@player_2_row-3] == @board[@player_2_row-4][column_2]
# 					puts "#{@player_2}, you have won! - horizontally - !"
# 					return true 
# 				end 
# 			end 
# 		end 
# 	end 
# 	return false
# end 

def checkHorizontal(start, finish, piece) #returns number of pieces in a row from start 
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

def winning_case_horizontal(column_1, column_2)
		if(column_1 - 4 >= 0)
			index = column_1 - 4
		else 
			index = 0
		end
		left_sum = checkHorizontal(index,column_1, @piece_1)
		if(column_1 + 4 > @column)
			index = column_1 + 4
		else 
			index = @column
		end
		right_sum = checkHorizontal(column_1,index, @piece_1)
		puts "SUM = #{right_sum+left_sum}"
		if(right_sum + left_sum >= 3)
			puts "You won horizontally #{@player_1}!!"
			return true
		else 
			return false
		end

		if(column_2 - 4 >= 0)
			index = column_2 - 4
		else 
			index = 0
		end
		left_sum = checkHorizontal(index,column_2, @piece_2)
		if(column_2 + 4 > @column)
			index = column_2 + 4
		else 
			index = @column
		end
		right_sum = checkHorizontal(column_2,index, @piece_2)
		puts "SUM = #{right_sum+left_sum}"
		if(right_sum + left_sum >= 3)
			puts "You won horizontally #{@player_2}!!"
			return true
		else 
			return false
		end  
end 

# def winning_case_diagonal

# end 

def checkHorizontal(start, finish, piece) #returns number of pieces in a row from start 
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


def winning_case_vertical(column_1, column_2)
		if(column_1 - 4 >= 0)
			index = column_1 - 4
		else 
			index = 0
		end
		left_sum = checkHorizontal(index,column_1, @piece_1)
		if(column_1 + 4 > @column)
			index = column_1 + 4
		else 
			index = @column
		end
		right_sum = checkHorizontal(column_1,index, @piece_1)
		puts "SUM = #{right_sum+left_sum}"
		if(right_sum + left_sum >= 3)
			puts "You won horizontally #{@player_1}!!"
			return true
		else 
			return false
		end

		if(column_1 - 4 >= 0)
			index = column_1 - 4
		else 
			index = 0
		end
		left_sum = checkHorizontal(index,column_1, @piece_2)
		if(column_1 + 4 > @column)
			index = column_1 + 4
		else 
			index = @column
		end
		right_sum = checkHorizontal(column_1,index, @piece_2)
		puts "SUM = #{right_sum+left_sum}"
		if(right_sum + left_sum >= 3)
			puts "You won horizontally #{@player_2}!!"
			return true
		else 
			return false
		end  
end 

# def winning_case_vertical  
# 	start_col = 0
# 	winning_array = Array.new(4)
# 	while(start_col <= @column-1)
# 		start_row = 5 
# 		finish_row = 2
# 		while(start_row >= 0)
# 			vertical_win = Array.new(4)	
# 			vertical_win = @board[start_row..finish_row][start_col]
# 				if vertical_win == winning_array.fill(@piece_1)
# 					puts "#{@player_1}, you have won - vertically - !"
# 					break
# 				end 
# 				if vertical_win == winning_array.fill(@piece_2)
# 					puts "#{@player_2}, you have won - vertically - !"
# 					break
# 				end 
# 			start_row -=1 
# 			finish_row -= 1
# 		end
# 		start_col += 1
# 	end  
#   return false
# end 

# def winning_case_horizontal 
# 	start_col = 0 
# 	winning_array = Array.new(4) 
# 	while(start_col <= @column-1)
# 		start_row = 0
# 		finish_row = 3 
# 		while(start_row <= 3)
# 		 horizontal_win = Array.new(4)
# 		 horizontal_win = @board[start_row..finish_row][start_col]
# 		 horizontal_win = (horizontal_win)
# 		 	if horizontal_win == winning_array.fill(@piece_1)
# 		 		puts "#{@player_1}, you have won - horizontally - !"
# 		 		break 
# 		 	end 
# 		 	if horizontal_win == winning_array.fill(@piece_2) 
# 		 		puts "#{@player_2}, you have won - horizontally - !"
# 		 		break 
# 		 	end 
# 		 start_row += 1
# 		 finish_row += 1
# 		end 
# 		start_col += 1 
# 	end
# 	return false 
# end 

def repeating_placement
	loop do 
		player_columns = getting_input()
		place_piece(player_columns[0], player_columns[1]) 
		if (@board[0][player_columns[0]] != 0 || @board[0][player_columns[1]] != 0) || ( winning_case_vertical || winning_case_horizontal(player_columns[0], player_columns[1])) #|| winning_case_diagonal) 
			break 
		end
	end 
end  
start() 