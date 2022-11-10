# frozen_string_literal: true

class Prompts
  def game_start
    puts 'Welcome to Connect 4!'
  end

  def messages(message)
    {
      'choose_color' => 'Player one, would you like to be red (r) or yellow (y)?',
      'choose_column' => "Pick the column where you'd like to make your next move (0 - 6).",
      'column_full' => 'Sorry, that column is full. Choose another column.',
      'winner' => "Four in a row! That's a win for team marker.",
      'board_full' => "Looks like this one's a draw.",
      'play_again' => 'Would you like to play again? (y/n)',
      'invalid_input' => "Sorry, I didn't understand that."
    }[message]
  end
end

