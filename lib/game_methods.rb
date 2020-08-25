# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/PerceivedComplexity

class Game
  attr_reader :board
  attr_writer :board
  def initialize(input)
    @board = input
  end

  def display_board
    puts "\n"
    puts "  #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '------------'
    puts "  #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '------------'
    puts "  #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "\n"
  end

  def user_input_v(user_input,board)
    if user_input.is_a?(Integer) && (1..9).include?(user_input)
      valid = true
      user_input = Integer(user_input)
      if board.include?(user_input)
        board.delete(user_input)
        return valid = true
      else
        puts 'Position givn already used!!!!'
        return valid = false
      end
    else
      return valid = false
      puts 'No valid value!!'
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
      user_input = Integer(user_input) if user_input.match(/[a-z]/).nil?
      valid = user_input_v(user_input,board)
    end
    user_input -= 1
    @chosen_index = user_input
    @chosen_index
  end

  def update_board(board, npos)
    n = String(npos)
    board[@chosen_index] = if n.match(/[0,2,4,6,8]/)
                             'X'
                           else
                             'O'
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

class Winner
    attr_reader :user_input
    attr_writer :user_input
    attr_reader :win
  def initialize(user_input,win)
    @input = user_input
    @win = win
  end

  def board(npos, p1c, p2c)
    n = String(npos)
    if n.match(/[0,2,4,6,9]/)
      p1c.push(@input)
    else
      p2c.push(@input)
    end
    [p1c, p2c]
  end
end


# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
