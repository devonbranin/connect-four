# frozen_string_literal: true

class Player 
  attr_reader :marker, :board

  def initialize(marker, board)
    @marker = marker
    @board = board
  end

  def make_move(column, marker = @marker, board = @board)
    updated_array = board.update_board(column, marker)
    return 'That column is full!' if updated_array.nil?

    updated_array
  end
end