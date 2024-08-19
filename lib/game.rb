require_relative 'board'
require_relative 'player'

class Game
  @@player_turn = 0
  @@players = []
  #@@player_choices = {}
  WIN_PATTERNS = [123, 456, 789, 147, 258, 369, 159, 357]
  CHOICES = %w(1 2 3 4 5 6 7 8 9 0)

  def initialize
    @@players = [Player.new, Player.new]
    play_game
  end

  def play_game
    board = Board.new
    board.display_board
    @@player_choices = {}
    
    begin
      player_name = @@players[@@player_turn].name
      puts "#{player_name}, mark your mark"
      choice = gets.chomp
      mark = @@players[@@player_turn].mark
      board.mark_the_board(choice, mark)
      @@player_choices[player_name] = @@player_choices[player_name] == nil ? choice : @@player_choices[player_name] + choice
      

      @@player_turn = @@player_turn == 0 ? 1 : 0
      counter = counter == nil ? 1 : counter + 1
      tie = tie?(counter)
      

      win = win?(@@player_choices[player_name])

      
    end while !win && !tie

    if win?(@@player_choices[player_name])
      puts "#{player_name} won!"
      @@players[@@player_turn].score += 1
      puts "Score: #{@@players[0].score} : #{@@players[1].score}"
    else
      puts "It's a tie"
    end
    puts "Continue?[Y/N]"
    if gets.chomp == "Y"
      play_game
    end
  
  end

  def win?(choice)

    WIN_PATTERNS.include?(choice.to_i)
  end

  def tie?(counter)
    counter == 9 ? true : false
  end

end