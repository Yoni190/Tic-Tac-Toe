# This class contains the data relevant to a player of Tic-Tac-Toe.
class Player
  attr_reader :name, :mark, :score

  def initialize
    puts "What is your name?: "
    self.name = gets.chomp
    puts "What is your mark?: "
    self.mark = gets.chomp
    self.score = 0
  end

  def increment_score
    self.score += 1
  end

  private

  attr_writer :name, :mark, :score
end
