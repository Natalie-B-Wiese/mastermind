# frozen_string_literal: true

require_relative 'lib/color_options'

require_relative 'lib/player/cpu_player'
require_relative 'lib/player/human_player'

require_relative 'lib/color_sequence'
require_relative 'lib/grader'

tray_player = CpuPlayer.new('CPU')
guessing_player = HumanPlayer.new('You')

NUM_GUESSES = 12

# for debugging. Show the random sequence that the CPU has chosen
puts 'CPU has randomly chosen this sequence:'
puts tray_player.color_sequence
print "\n"

# show available color options
puts 'Color Options:'
puts ColorOptions

print "\n"

won = false
(1..NUM_GUESSES).each do |guess|
  puts "Guess #{guess}/#{NUM_GUESSES}"

  # get a valid sequence from the user
  sequence_guess = guessing_player.guess

  # Show the sequence that user has guessed
  print sequence_guess

  # grade the sequence
  grade = Grader.new(tray_player.color_sequence, sequence_guess)

  # show the hash results as colored pegs against a white background
  puts " #{grade}"

  next unless grade.won?

  puts "You won after #{guess} guesses!"
  won = true
  break
end

puts "You lost. The sequence was: #{tray_player.color_sequence}" unless won
