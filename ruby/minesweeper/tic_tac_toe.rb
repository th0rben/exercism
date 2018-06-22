class TicTacToe
  def initialize(two_player_mode)
    @two_player_mode = two_player_mode
    @game = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @previous_player_was_player_one = false
    @game_running = true
  end

  def guess(pos)
    win
    raise ArgumentError, "Feld ist nicht frei" unless @game[pos] == pos.to_s
    @game[pos] = "X" if @previous_player_was_player_one
    @game[pos] = "O" unless @previous_player_was_player_one
    @previous_player_was_player_one = !@previous_player_was_player_one
    puts self
    comp_guess
  end

  def comp_guess
    if (@previous_player_was_player_one && !@two_player_mode)
      guessed = false
      while !guessed
      random_index = Random.rand(0..8)
      if @game[random_index] == random_index.to_s
        puts "Computer guess: #{random_index}"
        guess(random_index)
        guessed = true
        @previous_player_was_player_one = !@previous_player_was_player_one
      end
    end
    end
  end

  def win
    if check_win("XXX")
      puts "Player 2 wins"
      @game_running = !@game_running
    elsif(check_win("OOO"))
      puts "Player 1 wins"
      @game_running = !@game_running
    end
  end

  def check_win(player_sign)
    win = case
    when player_sign == (@game[0] + @game[1] + @game[2]) then true
    when player_sign == (@game[3] + @game[4] + @game[5]) then true
    when player_sign == (@game[6] + @game[7] + @game[8]) then true
    when player_sign == (@game[0] + @game[3] + @game[6]) then true
    when player_sign == (@game[1] + @game[4] + @game[7]) then true
    when player_sign == (@game[0] + @game[4] + @game[8]) then true
    when player_sign == (@game[6] + @game[4] + @game[2]) then true
    else false
    end
    win
  end

  def running
    @game_running
  end

  def actual_player
    return 1 unless @previous_player_was_player_one
    2
  end

  def to_s
    str = "-----\n"
    for i in 0..8
      str += @game[i]
      if (i==2||i==5)
        str += "\n"
      else
        str += "|" unless i==8
      end
    end
    str += "\n-----\n"
    str
  end
end
