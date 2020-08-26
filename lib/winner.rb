# rubocop:disable Metrics/CyclomaticComplexity
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

  def all_equal(arr, sym)
    return true if arr.uniq.size == 1 && arr.all?(sym)
  end

  def desicion(board, sym)
    player = if sym == 'X'
               1
             else
               2
             end

    if all_equal(board[0..2], sym) ||
       all_equal(board[3..5], sym) ||
       all_equal(board[6..8], sym) ||
       all_equal([board[0], board[3], board[6]], sym) ||
       all_equal([board[1], board[4], board[7]], sym) ||
       all_equal([board[2], board[5], board[8]], sym) ||
       all_equal([board[0], board[4], board[8]], sym) ||
       all_equal([board[2], board[4], board[6]], sym)
      puts "Player #{player} Win !!"
      true
    else false
    end
  end
end

# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/CyclomaticComplexity
