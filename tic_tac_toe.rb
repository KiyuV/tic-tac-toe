# frozen_string_literal: true

class TicTacToe
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @board = %w[1 2 3 4 5 6 7 8 9]
    @current_symbol = 'X'
    @players = [player1, player2]
    assign_players
  end

  def to_s
    puts
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '— — — — —'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '— — — — —'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts
  end

  def player_input(number)
    @board[number - 1] = @current_symbol
    @current_symbol = @current_symbol == 'X' ? 'O' : 'X'
    to_s
  end

  private

  def assign_players
    current_player = @players.sample
    @player1 = current_player
    @players.delete(current_player)
    @player2 = @players[0]
  end
end

puts 'Welcome to Tic Tac Toe!'

puts "Please enter Player 1's name"
player1 = gets.chomp
puts "Please enter Player 2's name"
player2 = gets.chomp

game = TicTacToe.new(player1, player2)
game.to_s

current_player = 0
players = [game.player1, game.player2]
9.times do
  puts "Your turn, #{players[current_player]}!"
  game.player_input(gets.chomp.to_i)
  current_player = current_player.zero? ? 1 : 0
  puts
end
