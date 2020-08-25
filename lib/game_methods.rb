# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/PerceivedComplexity

class Game
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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

  def user_input(board, npos)
    valid = false
    while valid == false
      puts 'Please enter value between 1-9'
      n = String(npos)
      if n.match(/[0,2,4,6,9]/)
        puts 'Player 1:'
      else
        puts 'Player 2:'
      end
      user_input = gets.chomp
      user_input = Integer(user_input) if user_input.match(/[a-z]/).nil?
      if user_input.is_a?(Integer) && (1..9).include?(user_input)
        valid = true
        user_input = Integer(user_input)
        if board.include?(user_input)
          board.delete(user_input)
          user_input -= 1
          valid = true
        else
          puts 'Position givn already used!!!!'
          valid = false
        end
      else
        valid = false
        puts 'No valid value!!'
      end
    end
    @chosen_index = user_input
    @chosen_index
  end

  def update_board(board, npos)
    n = String(npos)
    board[@chosen_index] = if n.match(/[0,2,4,6,9]/)
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
  def initialize(user_input)
    @input = user_input
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
