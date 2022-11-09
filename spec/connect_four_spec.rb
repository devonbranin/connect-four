# frozen_string_literal: true
require_relative '../lib/connect_four'

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
    context 'when a move is placed' do
      it 'returns a string of boxes with a move placed in the proper place' do
        result = game_array.print_board(["🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔳","🔴","🔳","🔳","🔳"])
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
end