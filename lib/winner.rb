# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/PerceivedComplexity

class Winner
  attr_reader :user_input
  attr_writer :user_input
  attr_reader :win
  def initialize(user_input, win)
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

  def desicion(board)
    p1 = @win[0]
    p2 = @win[1]
    if p1 == [board[0], board[1], board[2]]
      puts 'Player 1 win !!!'
      true
    elsif p1 == [board[3], board[4], board[5]]
      puts 'Player 1 win !!!'
      true
    elsif p1 == [board[6], board[7], board[8]]
      puts 'Player 1 win !!!'
      true
    elsif p1 == [board[0], board[3], board[6]]
      puts 'Player 1 win !!!'
      true
    elsif p1 == [board[1], board[4], board[7]]
      puts 'Player 1 win !!!'
      true
    elsif p1 == [board[2], board[5], board[8]]
      puts 'Player 1 win !!!'
      true
    elsif p1 == [board[0], board[4], board[8]]
      puts 'Player 1 win !!!'
      true
    elsif p1 == [board[2], board[4], board[6]]
      puts 'Player 1 win !!!'
      true
    elsif p2 == [board[0], board[1], board[2]]
      puts 'Player 2 win !!!'
      true
    elsif p2 == [board[3], board[4], board[5]]
      puts 'Player 2 win !!!'
      true
    elsif p2 == [board[6], board[7], board[8]]
      puts 'Player 2 win !!!'
      true
    elsif p2 == [board[0], board[3], board[6]]
      puts 'Player 2 win !!!'
      true
    elsif p2 == [board[1], board[4], board[7]]
      puts 'Player 2 win !!!'
      true
    elsif p2 == [board[2], board[5], board[8]]
      puts 'Player 2 win !!!'
      true
    elsif p2 == [board[0], board[4], board[8]]
      puts 'Player 2 win !!!'
      true
    elsif p2 == [board[2], board[4], board[6]]
      puts 'Player 2 win !!!'
      true
    else false
    end
  end
end

# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
