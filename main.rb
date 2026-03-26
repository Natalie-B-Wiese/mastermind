# frozen_string_literal: true

require_relative 'lib/color_options'
require_relative 'lib/player'

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
# Ask user to enter a 4-digit color code to guess
# Show the sequence that user has guessed
# Ask the CPU to grade the sequence that user has guessed
