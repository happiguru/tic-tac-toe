# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/PerceivedComplexity

class TicTacToe
  def initialize(board = nil)
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)  #board[index] is not " " or "" or nil because there's an "X" or "O"
    (@board[index] == "X" || @board[index] == "O") || !(@board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|current_player| current_player == "X" || current_player =="O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:" #ask the user input for their move
    user_input = gets.strip #get input
    index = input_to_index(user_input) #converts input into integer/index
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination| #detect returns first element (position_1) & make sure position is taken (that it's either an X or O). position_taken?(index) = position_taken?(win_combination[0])
      # win_combination == [6,7,8]
      # win_combination[0] ==
      @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
    end
  end

  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      winner = @board[won?[0]]
    end
  end

  def play
    #input = gets
    until over? #until the game is over...
      turn #players will keep taking turns
    end
    #plays the first few turns of the game
      if won? #if there's a winner...
      #we check who the winner is...
        puts "Congratulations #{winner}!" #and congratulate them
      elsif draw? #if there's a draw, then print the below strings
        puts "Cat's Game!"
      end
  end

  #input = gets
  #until over?(board) #until the game is over...
  #  turn(board) #players will keep taking turns
  #end
  #plays the first few turns of the game
  #  if won?(board) #if there's a winner...
    #  winner(board) == "X" || winner(board) == "O" #we check who the winner is...
  #      puts "Congratulations #{winner(board)}!" #and congratulate them
  #  elsif draw?(board) #if there's a draw, then print the below strings
    #  puts "Cats Game!"
  #  end

end