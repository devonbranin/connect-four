# frozen_string_literal: true
require_relative '../lib/game_board'

describe GameBoard do
  describe '#generate_placements' do
    subject(:game_array) { described_class.new }
    it 'creates an array with a length of columns times rows' do
      columns = 7
      rows = 6
      expect(game_array.generate_placements.length).to eq(columns * rows)
    end
    
    it 'creates an array containing only box icons' do
      expect(game_array.generate_placements.uniq).to eq(['🔳'])
    end
  end

  describe '#print_board' do
    subject(:game_array) { described_class.new }
    context 'when the board is empty' do
      it 'returns a string of boxes with line numbers and column numbers' do
        expect(game_array.print_board).to eq(" 0 1 2 3 4 5 6\n" +
        "🔳🔳🔳🔳🔳🔳🔳 0\n"+                                                 
        "🔳🔳🔳🔳🔳🔳🔳 1\n" +                                                
        "🔳🔳🔳🔳🔳🔳🔳 2\n" +                                                
        "🔳🔳🔳🔳🔳🔳🔳 3\n" +                                               
        "🔳🔳🔳🔳🔳🔳🔳 4\n" +                                               
        "🔳🔳🔳🔳🔳🔳🔳 5\n")
      end
    end
    context 'when the board is not empty' do
      it 'returns a string of boxes with a move placed in the proper place' do
        result = game_array.print_board(%w[
          🔳 🔳 🔳 🔳 🔳 🔳 🔳
          🔳 🔳 🔳 🔳 🔳 🔳 🔳
          🔳 🔳 🔳 🔳 🔳 🔳 🔳
          🔳 🔳 🔳 🔳 🔳 🔳 🔳
          🔳 🔳 🔳 🔳 🔳 🔳 🔳
          🔳 🔳 🔳 🔴 🔳 🔳 🔳])
        expect(result).to eq(" 0 1 2 3 4 5 6\n" +
        "🔳🔳🔳🔳🔳🔳🔳 0\n"+                                                 
        "🔳🔳🔳🔳🔳🔳🔳 1\n" +                                                
        "🔳🔳🔳🔳🔳🔳🔳 2\n" +                                                
        "🔳🔳🔳🔳🔳🔳🔳 3\n" +                                               
        "🔳🔳🔳🔳🔳🔳🔳 4\n" +                                               
        "🔳🔳🔳🔴🔳🔳🔳 5\n")
      end
    end
  end

  describe '#update_board' do
    context 'when the first piece is placed in the third column' do
      subject(:game_board) { described_class.new }
      it 'returns its position' do
        first_piece = game_board.update_board(3, '🔴')
        expect(first_piece).to eq(38)
      end
    end
    context 'when the first piece is placed in the fifth column' do
      subject(:game_board) { described_class.new }
      it 'returns its position' do
        first_piece = game_board.update_board(5, '🔴')
        expect(first_piece).to eq(40)
      end
    end
    context 'when there is already a piece in the third column' do
      subject(:game_board) { described_class.new(["🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔴","🔳","🔳","🔳"]) }
      it 'returns its position' do
        first_piece = game_board.update_board(3, '🔴')
        expect(first_piece).to eq(31)
      end
    end
    context 'when adding several pieces in a row' do
      subject(:game_board) { described_class.new }
      before do
        game_board.update_board(3, '🔴')
        game_board.update_board(2, '🟡')
        game_board.update_board(3, '🔴')
      end
      it 'displays all of the pieces' do
        fourth_piece = game_board.update_board(3, '🔴')
        expect(fourth_piece).to eq(24)
      end
    end
    context 'when adding a piece would overflow the board' do
      subject(:game_board) { described_class.new }
      before do
        game_board.update_board(3, '🔴')
        game_board.update_board(3, '🔴')
        game_board.update_board(3, '🔴')
        game_board.update_board(3, '🔴')
        game_board.update_board(3, '🔴')
        game_board.update_board(3, '🔴')
      end
      it 'returns nil' do
        overflow_piece = game_board.update_board(3, '🔴')
        expect(overflow_piece).to eql(nil)
      end
    end
  end
end
