# frozen_string_literal: true

require_relative 'lib/color_options'
require_relative 'lib/player'
require_relative 'lib/color_sequence'

# asks the human player for a 4-digit sequence and returns a valid ColorSequence object
def ask_user_sequence
  valid = false
  color_id_array = []

  until valid
    puts 'Enter 4-digit guess: '
    answer = gets.chomp

    if answer.length != 4
      puts 'Invalid length!'
    else
      color_id_array = answer.split('').map(&:to_i)
      valid = true
      color_id_array.each do |color_id|
        valid = false unless ColorOptions.valid_color_id?(color_id)
      end

      puts "Digits must be between 1 and #{ColorOptions.num_colors}!" unless valid
    end
  end

  # once it is valid, then create the sequence that user has entered
  ColorSequence.new(color_id_array)
end

tray_player = CpuPlayer.new
guessing_player = HumanPlayer.new

# for debugging. Show the random sequence that the CPU has chosen
puts 'CPU has randomly chosen this sequence:'
puts tray_player.color_sequence
print "\n"

# show available color options
puts 'Color Options:'
puts ColorOptions

print "\n"

# get a valid sequence from the user
sequence_guess = ask_user_sequence

# Show the sequence that user has guessed
puts sequence_guess

# Ask the CPU to grade the sequence that user has guessed
