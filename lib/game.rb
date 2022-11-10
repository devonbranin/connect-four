# frozen_string_literal: true

class Game
  def send_move(player, column)
    player.make_move(column)
  end

  def obtain_input
    puts 'Hello Player One! Would you like to be yellow (y) or red (r)?'
    answer = gets.chomp
    validation = validate_color(answer)
    return validation if validation.present?

    puts "Sorry, that's not a valid input. Would you like to be yellow (y) or red (r)?"
    obtain_input
  end

  def validate_color(choice)
    /^[r|y]{1}$/.match(choice.to_s) ? choice.to_i : nil
  end

  def validate_column(column)
    /^[0-6]{1}$/.match(column.to_s) ? column.to_i : nil
  end
end