class Player
  attr_accessor :name, :mark

  def initialize
    puts "What is your name?: "
    name = gets.chomp
    puts "What is your mark?: "
    mark = gets.chomp
  end
end