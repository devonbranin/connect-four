require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
  subject(:c4_game) { described_class.new }
  describe '#validate_column' do
    context 'when a player chooses a valid column' do
      it 'returns that column as an integer' do
        response = c4_game.validate_column(3)
        expect(response).to eq(3)
      end
    end
    context 'when a player chooses an invalid columns' do
      it 'returns nil' do
        response = c4_game.validate_column(7)
        expect(response).to eq(nil)
      end
      it 'returns nil' do
        response = c4_game.validate_column(333)
        expect(response).to eq(nil)
      end
    end
  end
  describe '#send_move' do
    let(:current_player) { instance_double('Player')}
    before do
      allow(current_player).to receive(:make_move)
    end
    it 'sends a valid move to player' do
      expect(current_player).to receive(:make_move)
      c4_game.send_move(current_player, 3)
    end
  end
end

