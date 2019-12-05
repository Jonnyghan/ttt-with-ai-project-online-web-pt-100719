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
  WIN_COMBINATIONS.find do 
    |win_combo|
    if (board.cells[win_combo[0]]) == "X" && (board.cells[win_combo[1]]) == "X" && (board.cells[win_combo[2]]) == "X"
      return win_combo
    elsif (board.cells[win_combo[0]]) == "O" && (board.cells[win_combo[1]]) == "O" && board.cells[win_combo[2]]) == "O"
      return win_combo
    end
      false
    end
  end
  
end