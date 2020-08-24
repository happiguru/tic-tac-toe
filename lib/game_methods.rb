class Game
  def initialize(_board = nil)
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ].freeze

  def display_board
    # display the board
    puts "\n"
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '----------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '----------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "\n"
  end

  def user_input_to_index(user_input)
    # convert user input to integer and match the position in the array
    user_input.to_i - 1
  end

  def make_a_move(chosen_index, current_player)
    # will make move of position
    @board[chosen_index] = current_player
  end

  def position_taken?(chosen_index)
    # will check if a certain position is occupied or not
    (@board[chosen_index] == 'X') || (@board[chosen_index] == 'O') || !(@board[chosen_index] == " ")
  end

  def valid_move?(chosen_index)
    # will check to validate user input is within the range
    chosen_index.between?(0, 8) && !position_taken?(chosen_index)
  end

  def turn_count
    # will check the count of the current player
    @board.count{|current_player| current_player == 'X' || current_player == 'O'}
  end

  def current_player
    # will check current player turn
    turn_count % 2 == 0 ? 'X' : 'O'
  end

  def turn
    # will keep asking for players to keep play as long as there is no winner or if the list is not yet full
    puts 'Please enter value between 1-9'
    user_input = gets.chomp
    chosen_index = user_input_to_index(user_input)
    if valid_move?(chosen_index) == true
      make_a_move(chosen_index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    # will check for the winning combination
    WIN_COMBINATIONS.detect do |win_combination|
    end
  end

  def full?
    # will check if the board is full or not
  end

  def draw?
    # will check when there is a draw or not
  end

  def over?
    # will check if game is over
  end

  def winner
    # will check winner if it is "X" or "O"
  end

  def play
    turn until over?
    if won?
      # we check who the winner is
      puts "Congratulations #{winner}!"
    elsif draw?
      # if there is a draw or tie
      puts 'It was a draw game!'
    end
  end

  # until the game is over..
  # player will keep taking turns of the game
  # plays the first few turns of the game
  # if there is a winner..
  # we will check who is the winner
  # and congratulate them
  # if there is a draw/tie, then print message it is a draw
end
