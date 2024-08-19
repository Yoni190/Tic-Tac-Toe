class Player
  attr_accessor :name, :mark, :score

  def initialize
    puts "What is your name?: "
    self.name = gets.chomp
    puts "What is your mark?: "
    self.mark = gets.chomp
    self.score = 0
  end
end