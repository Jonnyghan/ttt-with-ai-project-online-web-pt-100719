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
    if draw?
      true 
    else
      false 
    end
  end
  
end