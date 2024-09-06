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
