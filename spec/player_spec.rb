# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/game_board'

describe Player do
  describe '#make_move' do
    let(:new_board) { GameBoard.new }
    subject(:moving_player) { described_class.new('🔴', new_board) }
    context 'when the player places a valid move' do
      it 'returns the position of the array' do
        marker_position = moving_player.make_move(3)
        expect(marker_position).to eq(38)
      end
    end
    context 'when the player places an invalid move' do
      before do
        6.times { moving_player.make_move(3) }
      end
      it 'returns an error' do
        extra_move = moving_player.make_move(3)
        error_message = 'That column is full!'
        expect(extra_move).to eq(error_message)
      end
    end
  end
end