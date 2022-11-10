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

  def prompt_for_move
    puts 'Which column would you like to place your piece?'
    placement = gets.chomp
    response = make_move(placement)
    prompt_for_move if response == 'That column is full!'
  end

  def win?(array = move_array)
    return true if horizontal_win?(array) == true
    return true if vertical_win?(array) == true
    return true if diagonal_win?(array) == true
    return true if other_diagonal_win?(array) == true

    false
  end

  def horizontal_win?(array = move_array)
    consecutive = ->(a, b) { a + b == (a * 2) + 1 }
    same_row = ->(a, b) { (a / COLUMNS) == (b / COLUMNS) }
    four_piece_combos = all_fours(array)
    horiz_win = four_piece_combos.filter { |combo| validate_combinations(combo, consecutive) }
    horiz_win.any? { |combo| validate_combinations(combo, same_row) }
  end

  def vertical_win?(array = move_array)
    vertical = ->(a, b) { a + b == (a * 2) + COLUMNS }
    four_piece_combos = all_fours(array)
    vert_win = four_piece_combos.filter { |combo| validate_combinations(combo, vertical) }
    vert_win.length.positive?
  end

  def diagonal_win?(array = move_array)
    downward_diagonal = ->(a, b) { a + b == (a * 2) + (COLUMNS + 1) }
    four_piece_combos = all_fours(array)
    diag_win = four_piece_combos.filter { |combo| validate_combinations(combo, downward_diagonal) }
    diag_win.length.positive?
  end

  def other_diagonal_win?(array = move_array)
    upward_diagonal = ->(a, b) { a + b == (a * 2) + (COLUMNS - 1) }
    four_piece_combos = all_fours(array)
    diag_win = four_piece_combos.filter { |combo| validate_combinations(combo, upward_diagonal) }
    diag_win.length.positive?
  end

  def row_number(number)
    number / COLUMNS
  end

  def column_number(number)
    number % COLUMNS
  end

  def all_fours(array = move_array)
    holder_array = []
    sorted_array = array.sort
    sorted_array.each_cons(4) { |inner_array| holder_array << inner_array }
    holder_array
  end

  def validate_combinations(my_array, lamb)
    i = 0
    while i + 1 < my_array.length
      test = lamb.call(my_array[i], my_array[i+1])
      i += 1
      break if test == false
    end

    return false if test == false

    true
  end
end
