require_relative 'board'
require_relative 'player'

class Game
  @@player_turn = 0
  @@players = []
  @@player_choices = {}
  WIN_PATTERNS = ["123", "456", "789"]

  def initialize
    @@players = [Player.new, Player.new]
    board = Board.new
    board.display_board
    @@player_choices[@@players[0].name] = "0"
    @@player_choices[@@players[1].name] = "0"

  end

  def play_game
    player_name = @@players[@@player_turn].name
    puts "#{player_name}, mark your mark"
    choice = gets.chomp
    mark = players[@@player_turn].mark
    board.mark_the_board(choice, mark)
    @@player_choices[player_name] = 
    @@player_turn = @@player_turn == 0 ? 1 : 0
  end
end