# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new('John', 'George') }
  let(:tic_tac_toe) { instance_double(TicTacToe, board: %w[1 2 3 4 5 6 7 8 9]) }

  describe '#play' do
    before do
      game.instance_variable_set(:@tic_tac_toe, tic_tac_toe)
      allow(tic_tac_toe).to receive(:player_input)
      allow(tic_tac_toe).to receive(:winner?)

      allow(game).to receive(:puts)
      allow(game).to receive(:gets).and_return('1', '2', '3', '4', '5', '6', '7', '8', '9')
    end

    context 'when #play is invoked' do
      it 'sends at least 1 position to TicTacToe' do
        game.play
        expect(tic_tac_toe).to have_received(:player_input).at_least(1)
      end
    end
  end
end
