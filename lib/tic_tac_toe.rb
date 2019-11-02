class TicTacToe 

  def initialize(board = nil) 
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
	  user_input.to_i - 1
  end

  def move(location, character)
    @board[location] = character
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      true
    else
      false
    end 
  end

  def valid_move?(index)
	  if position_taken?(index) == false && index.between?(0,8) == true
		  return true
	  elsif position_taken?(index) == true
	  	return false
  	elsif index.between?(0, 8) == false 
	  	return false
  	end
  end

  def turn
	  puts "Please enter 1-9:"
	  user_input = gets.chomp
	  index = input_to_index(user_input)
  	if valid_move?(index) == true && current_player == "X"
			move(index, value = "X")
			puts display_board
  	elsif valid_move?(index) == true && current_player == "O"
			move(index, value = "O")
			puts display_board
  	elsif valid_move?(index) == false
	  	puts "Please enter 1-9:"
		  input = gets.chomp
  	else 
	  	puts "Please enter 1-9:"
	  	input = gets.chomp
  	end
  end
  
  def turn_count
    counter = 0
    @board.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end



  def won?

    board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else 
      WIN_COMBINATIONS.each do |combo| 
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
      end
      return false
  end
end

  def full?
    @board.all? { |i| i =="X" || i == "O"}
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    won? || draw? || full? ? true : false
  end

  def winner 
    WIN_COMBINATIONS.detect do |combo| 
          if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
            return "X"
          elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
            return "O"
          else 
            nil
          end
    end
  end

  def play
    while over? == false
    	turn
    end

    if draw?
    	puts "Cat's Game!"
    elsif winner == "X" 
    	puts "Congratulations X!"
    elsif winner == "O"
    	puts "Congratulations O!"
    end

    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end 