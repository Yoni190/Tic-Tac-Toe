require_relative 'board'
require_relative 'player'

class Game
  @@player_turn = 0
  @@players = []
  @@player_choices = {}
  WIN_PATTERNS = ["0123", "0456", "0789"]
  CHOICES = %w(1 2 3 4 5 6 7 8 9 0)
  counter = 0

  def initialize
    @@players = [Player.new, Player.new]
    @@player_choices[@@players[0].name] = "0"
    @@player_choices[@@players[1].name] = "0"
    play_game
  end

  def play_game
    board = Board.new
    board.display_board
    begin
      player_name = @@players[@@player_turn].name
      puts "#{player_name}, mark your mark"
      choice = gets.chomp
      mark = @@players[@@player_turn].mark
      board.mark_the_board(choice, mark)
      @@player_choices[player_name] += choice
      
      #win = @@player_choices.values.map{|pattern| WIN_PATTERNS.include?(pattern)}.include?(true)

      @@player_turn = @@player_turn == 0 ? 1 : 0
      counter += 1
      
    end while !win?(@@player_choices) || counter != 9
    if win?(@@player_choices)
      puts "#{player_name} won!"
    else
      puts "It's a tie"
    end
  
  end

  def win?(choices)
    choices.values.map{|pattern| WIN_PATTERNS.include?(pattern)}.include?(true)
  end
end