#!/usr/bin/env ruby
require_relative '../config/environment'
require_relative '../lib/board.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/players/computer.rb'
require_relative '../lib/players/human.rb'

puts "Welcome to Tic Tac Toe"

def loop_around
  puts "Please input y or n"
  answer = gets.strip
  case answer
    when "y"
      start
    when "n"
      puts "Goodbye!"
    else
      loop_around
  end
end

start