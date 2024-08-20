# This class displayes the tic-tac-toe board and updates it when the players mark a place.player_choices[player_name]
class Board
  def initialize
    self.board = "\t\t\s1 | 2 | 3\n
                 ---+---+---\n
                 4 | 5 | 6\n
                 ---+---+---\n
                 7 | 8 | 9"
  end

  def display_board
    puts board
  end

  def mark_the_board(choice, mark)
    board.sub!(choice, mark)
    puts board
  end

  private

  attr_accessor :board
end
