# frozen_string_literal: true

class Player 
  COLUMNS = 7
  ROWS = 6

  attr_reader :marker, :board
  attr_accessor :move_array

  def initialize(marker, board, move_array = [])
    @marker = marker
    @board = board
    @move_array = move_array
  end

  def make_move(column, marker = @marker, board = @board)
    new_marker = board.update_board(column, marker)
    return 'That column is full!' if new_marker.nil?

    move_array.push(new_marker)
    new_marker
  end

  def win?(array = move_array)
    horizontal_win?(array)
  end

  def horizontal_win?(array = move_array)
    four_piece_combos = all_fours(array)
    horiz_win = four_piece_combos.filter { |combo| all_consecutive?(combo) }
    horiz_win.any? { |combo| all_same_row?(combo) }
  end

  def same_row?(a, b)
    (a / COLUMNS) == (b / COLUMNS)
  end

  def consecutive?(a, b)
    a + b == (a * 2) + 1
  end

  def all_fours(array = move_array)
    holder_array = []
    sorted_array = array.sort
    sorted_array.each_cons(4) { |inner_array| holder_array << inner_array }
    holder_array
  end

  def all_same_row?(my_array)
    i = 0
    while i + 1 < my_array.length
      test = same_row?(my_array[i], my_array[i+1])
      i += 1
      next if test == false
    end

    return false if test == false

    true
  end

  def all_consecutive?(my_array)
    i = 0
    while i + 1 < my_array.length
      test = consecutive?(my_array[i], my_array[i+1])
      i += 1
      next if test == false
    end

    return false if test == false

    true
  end

    # returns true if every number is consecutive to the one after it
end
