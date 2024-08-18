class Board
  attr_accessor :board

  def initialize 
  self.board =  "1 | 2 | 3\n" +
        "---+---+---\n" +
         "4 | 5 | 6\n" +
        "---+---+---\n" +
         "7 | 8 | 9"
  end

  def display_board
    puts board
  end

  def mark_the_board(choice, mark)
    board.sub!(choice, mark)
    puts board
  end
end