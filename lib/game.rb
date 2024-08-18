require_relative 'board'

class Game
  @@player_turn = 0

  def initialize
    players = [Player.new, Player.new]
    Board.new
    puts "#{players[@@player_turn].name}, mark your mark"
  end
end