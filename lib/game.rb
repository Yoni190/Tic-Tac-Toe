require_relative 'board'
require_relative 'player'

class Game
  @@player_turn = 0
  @@players = []
  @@player_choices = {}
  WIN_PATTERNS = ["0123", "0456", "0789"]

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
      
      win = @@player_choices.values.map{|pattern| WIN_PATTERNS.include?(pattern)}.include?(true)

      @@player_turn = @@player_turn == 0 ? 1 : 0
      
    end while !win
    puts "#{player_name} won!"
  end
end