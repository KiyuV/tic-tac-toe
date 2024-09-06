# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

describe TicTacToe do
  subject(:game_over) { described_class.new('John', 'George') }

  describe '#winner?' do
    context 'when there are three symbols in any of the lines' do
      before do
        game_over.instance_variable_set(:@board, %w[X X X O O 6 7 8 9])
      end

      it 'results in a win' do
        expect(game_over.winner?).to be true
      end
    end
  end
end
