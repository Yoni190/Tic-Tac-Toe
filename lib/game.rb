require_relative 'board'
require_relative 'player'

class Game
  @@player_turn = 0
  @@players = []

  def initialize
    @@players = [Player.new, Player.new]
    board = Board.new
    board.display_board

    
  end
  def play_game
    puts "#{players[@@player_turn].name}, mark your mark"
    choice = gets.chomp
    mark = players[@@player_turn].mark
    board.mark_the_board(choice, mark)
    @@player_turn = @@player_turn == 0 ? 1 : 0
  end
end