#require_relative "./players/human.rb"
class Game
  attr_accessor :board, :player_1, :player_2, :timer
  
   WIN_COMBINATIONS = [
    [0,1,2], #Top Row 
    [3,4,5], #Middle Row 
    [6,7,8], #Bottom Row
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
 
 def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),board = Board.new)
   @player_1 = player_1
   @player_2 = player_2
   @board = board
 end
 
 def current_player
  board.turn_count.odd?? player_2 : player_1
 end

 def won?
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end
  
  def draw?
    board.full? && !won?
  end
  
  def over?
    if draw? || won?
      true 
    else
      false 
    end
  end
  
  def winner
    board.cells[won?[0]] if won?
  end
def turn
    puts "Please enter a number 1-9:"
    @user_input = current_player.move(@board)
    if @board.valid_move?(@user_input)
      @board.update(@user_input, current_player)
    else puts "Please enter a number 1-9:"
      @board.display
      turn
    end
    @board.display
  end
  
  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
      elsif draw?
      puts "Cat's Game!"
    end
  end
  
 def start
puts "How many players?(0,1 or 2)"
input = gets.strip
  case input
    when "0"
      Game.new(Player::Computer.new("X"), Player::Computer.new("O")).play
      puts "That was fun! Would you like to play again?"
      loop_around
    when "1"
      Game.new(Player::Human.new("X"), Player::Computer.new("O")).play
      puts "That was fun! Would you like to play again?"
      loop_around
    when "2"
      Game.new(Player::Human.new("X"), Player::Human.new("O")).play
      puts "That was fun! Would you like to play again?"
      loop_around
    when "wargames"
      Game.new(Player::Computer.new("X"), Player::Computer.new("O"), Board.new, true).wargames
      puts "That was fun! Would you like to play again?"
      loop_around
    else
      puts "That is an invalid entry"
      start
  end
end

end