# frozen_string_literal: true

class GameBoard
  COLUMNS = 7
  ROWS = 6

  def generate_placements
    placeholder_array = []
    placeholder_array.push("🔳") while placeholder_array.length < (COLUMNS * ROWS)
    placeholder_array
  end

  def print_board(array = generate_placements)
    base_position = 0
    row_number = 0
    base_string = ''.dup
    until row_number == ROWS
      p array
      base_string.concat(" 0 1 2 3 4 5 6\n") if row_number.zero?
      base_string.concat("#{array[base_position, COLUMNS].join} #{row_number}\n")
      row_number += 1
      base_position += COLUMNS
    end
    base_string
  end
end
