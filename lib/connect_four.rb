# frozen_string_literal: true

class GameBoard
  COLUMNS = 7
  ROWS = 6

  def initialize(array = generate_placements)
    @placements = array
  end

  def generate_placements
    placeholder_array = []
    placeholder_array.push("🔳") while placeholder_array.length < (COLUMNS * ROWS)
    placeholder_array
  end

  def print_board(array = @placements)
    base_position = 0
    row_number = 0
    base_string = ''.dup
    until row_number == ROWS
      base_string.concat(" 0 1 2 3 4 5 6\n") if row_number.zero?
      base_string.concat("#{array[base_position, COLUMNS].join} #{row_number}\n")
      row_number += 1
      base_position += COLUMNS
    end
    base_string
  end

  def update_board(column, marker, array = @placements)
    update_index = check_column(column, array)
    array[update_index] = marker
    array
  end

  private

  def check_column(column, array)
    tried_position = initial_column_index(column, array)

    while tried_position.positive?
      break if array[tried_position] == '🔳'

      tried_position -= COLUMNS
    end
    return nil if tried_position.negative?

    tried_position
  end

  def initial_column_index(column, array)
    array.length - (COLUMNS - column)
  end
end
