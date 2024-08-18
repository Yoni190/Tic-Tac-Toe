require_relative 'board'
require_relative 'player'

class Game
  @@player_turn = 0

  def initialize
    players = [Player.new, Player.new]
    board = Board.new
    board.display_board

    puts "#{players[@@player_turn].name}, mark your mark"
    choice = gets.chomp
    mark = players[@@player_turn].mark
    board.mark_the_board(choice, mark)
  end
end