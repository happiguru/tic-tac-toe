# rubocop:disable Metrics/PerceivedComplexity

class Game
  attr_reader :board
  attr_writer :board
  def initialize(input)
    @board = input
  end

  def user_input_v(user_input, board)
    if user_input.is_a?(Integer) && (1..9).include?(user_input)
      user_input = Integer(user_input)
      if board.include?(user_input)
        board.delete(user_input)
        true
      else
        puts 'Position given already used!!!!'
        false
      end
    else
      puts 'No valid value!!'
      false
    end
  end

  def user_input(board, npos)
    valid = false
    while valid == false
      puts 'Please enter value between 1-9'
      n = String(npos)
      if n.match(/[0,2,4,6,8]/)
        puts 'Player 1:'
      elsif n.match(/[1,3,5.7]/)
        puts 'Player 2:'
      end
      user_input = gets.chomp
      if user_input.empty?
        puts 'Type Something!!!'
      elsif user_input.match(/[a-z]/).nil?
        user_input = Integer(user_input)
      end
      valid = user_input_v(user_input, board)
    end
    user_input -= 1
    @chosen_index = user_input
    @chosen_index
  end

  def update_board(board, npos = nil)
    unless npos.nil?
      n = String(npos)
      board[@chosen_index] = if n.match(/[0,2,4,6,8]/)
                               'X'
                             else
                               'O'
                             end
    end
    puts "\n"
    puts "  #{board[0]} | #{board[1]} | #{board[2]} "
    puts '------------'
    puts "  #{board[3]} | #{board[4]} | #{board[5]} "
    puts '------------'
    puts "  #{board[6]} | #{board[7]} | #{board[8]} "
    puts "\n"
  end
end

# rubocop:enable Metrics/PerceivedComplexity
