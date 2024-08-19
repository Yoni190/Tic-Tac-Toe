require_relative 'board'
require_relative 'player'

class Game
  @@player_turn = 0
  @@players = []
  @@visited = []

  WIN_PATTERNS = [[1,2,3],[4,5,6],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  CHOICES = %w(1 2 3 4 5 6 7 8 9 0)

  def initialize
    @@players = [Player.new, Player.new]
    play_game
  end

  def play_game
    board = Board.new
    board.display_board
    @@player_choices = {}
    
    begin
      player_name = @@players[@@player_turn].name
      puts "#{player_name}, mark your mark"
      choice = gets.chomp
      if @@visited.include?(choice)
        puts "Choose from the available only"
      else
        @@visited.push(choice)
        mark = @@players[@@player_turn].mark
        board.mark_the_board(choice, mark)
        @@player_choices[player_name] = @@player_choices[player_name] == nil ? choice : @@player_choices[player_name] + choice
        

        @@player_turn = @@player_turn == 0 ? 1 : 0
        counter = counter == nil ? 1 : counter + 1
        tie = tie?(counter)
        

        win = win?(@@player_choices[player_name])
      end

      
    end while !win && !tie

    if win?(@@player_choices[player_name])
      puts "#{player_name} won!"
      @@players[@@player_turn].increment_score
      puts "Score: #{@@players[0].score} : #{@@players[1].score}"

    else
      puts "It's a tie"
    end
    puts "Continue?[Y/N]"
    response = gets.chomp
    if response.upcase == "Y"
      @@visited = []
      play_game
    end
  
  end

  def win?(choice)
    i = 0
    array_of_integers = change_to_array(choice)
    
    while i < WIN_PATTERNS.length
      list = []
      j = 0
      while j < WIN_PATTERNS[i].length
        list.push(array_of_integers.include?(WIN_PATTERNS[i][j]))
        if list.count(true) == 3
           return true
        end
        j += 1
      end
      i += 1
    end
    return false
  end

  def change_to_array(num)
    array_of_integers = num.split("").map{|num| num.to_i}
    array_of_integers
  end

  def tie?(counter)
    counter == 9 ? true : false
  end

end