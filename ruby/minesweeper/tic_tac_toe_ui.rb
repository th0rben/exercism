require_relative './tic_tac_toe.rb'

puts "Welcome to Tic Tac Toe"
puts "Do you want enter the 2-Player mode (y/n)"
two_player_mode = gets.chomp
game = TicTacToe.new(true) if two_player_mode.downcase.include?('y')
game = TicTacToe.new(false) if two_player_mode.downcase.include?('n')
while game.running
  puts "Player #{game.actual_player} make your guess"
  guess = gets.chomp
  game.guess(guess.to_i)
end

puts "See You"