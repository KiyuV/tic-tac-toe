# frozen_string_literal: true

require_relative 'tic_tac_toe'

class Game
  def initialize(player1, player2)
    @tic_tac_toe = TicTacToe.new(player1, player2)
    @current_player = 0
    @players = [@tic_tac_toe.player1, @tic_tac_toe.player2]
  end

  def play
    @tic_tac_toe.to_s
    9.times do
      puts "Your turn, #{@players[@current_player]}!"
      position = gets.chomp.to_i
      # prompts user until the input is a square that is not used
      while position != @tic_tac_toe.board[position - 1].to_i
        puts 'Please enter a valid position:'
        position = gets.chomp.to_i
      end
      @tic_tac_toe.player_input(position)
      # To alternate between the 2 players
      @current_player = @current_player.zero? ? 1 : 0
      exit if @tic_tac_toe.winner?
    end
    puts 'Draw!'
  end
end

# puts 'Welcome to Tic Tac Toe!'
# puts "Please enter Player 1's name"
# player1 = gets.chomp
# puts "Please enter Player 2's name"
# player2 = gets.chomp
#
# game = Game.new(player1, player2)
# game.play
