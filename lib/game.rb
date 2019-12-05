require_relative "./human.rb"
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
 
 def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"),board = Board.new)
   @player_1 = player_1
   @player_2 = player_2
   @board = board
   @wargame = wargame
   @timer= 1.5
 end
 
  def board
    
  end
  
end