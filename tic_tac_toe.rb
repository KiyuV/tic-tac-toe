# frozen_string_literal: true

class TicTacToe
  attr_reader :player1, :player2, :board

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

  def winner?
    lines = []
    # horizontal lines
    lines.push(@board[0..2].join(''))
    lines.push(@board[3..5].join(''))
    lines.push(@board[6..8].join(''))
    # vertical lines
    lines.push([@board[0], @board[3], @board[6]].join(''))
    lines.push([@board[1], @board[4], @board[7]].join(''))
    lines.push([@board[2], @board[5], @board[8]].join(''))
    # diagonal lines
    lines.push([@board[0], @board[4], @board[8]].join(''))
    lines.push([@board[2], @board[4], @board[6]].join(''))

    if lines.include?('XXX')
      puts "#{@player1} Wins!"
      true
    elsif lines.include?('OOO')
      puts "#{@player2} Wins!"
      true
    else
      false
    end
  end

  private

  def assign_players
    current_player = @players.sample
    @player1 = current_player
    @players.delete(current_player)
    @player2 = @players[0]
  end
end

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

puts 'Welcome to Tic Tac Toe!'
puts "Please enter Player 1's name"
player1 = gets.chomp
puts "Please enter Player 2's name"
player2 = gets.chomp

game = Game.new(player1, player2)
game.play
