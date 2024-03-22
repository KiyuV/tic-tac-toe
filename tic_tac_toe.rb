class TicTacToe
  attr_reader :player_1, :player_2
  
  def initialize(player_1, player_2)
    @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    @current_symbol = "X"
    @players = [player_1, player_2]
    self.assign_players
  end

  def to_s
    puts
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "— — — — —"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "— — — — —"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts
  end

  def player_input(number)
    @board[number - 1] = @current_symbol
    @current_symbol == "X" ? @current_symbol = "O" : @current_symbol = "X"
    self.to_s
  end

  private

  def assign_players
    current_player = @players.sample
    @player_1 = current_player
    @players.delete(current_player)
    @player_2 = @players[0]
  end
end

puts "Welcome to Tic Tac Toe!"

puts "Please enter Player 1's name"
player_1 = gets.chomp
puts "Please enter Player 2's name"
player_2 = gets.chomp


game = TicTacToe.new(player_1, player_2``)
game.to_s

current_player = 0
players = [game.player_1, game.player_2]
9.times do 
  puts "Your turn, #{players[current_player]}!"
  game.player_input(gets.chomp.to_i)
  current_player == 0 ? current_player = 1 : current_player = 0
  puts
end
