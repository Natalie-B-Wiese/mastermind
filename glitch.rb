require_relative 'lib/color_sequence'

puts 'This sequence has a glitch with grading:'
goal_sequence = ColorSequence.new([1, 2, 6, 2])
guess_sequence = ColorSequence.new([1, 2, 3, 4])
correctness = goal_sequence.compare_to_guess(guess_sequence)
puts goal_sequence
puts guess_sequence
p correctness
puts 'Expected: {black: 2, white: 0, incorrect: 2}'

print "\n"

puts 'This sequence works fine, however:'
goal_sequence = ColorSequence.new([4, 4, 1, 6])
guess_sequence = ColorSequence.new([4, 2, 4, 4])
correctness = goal_sequence.compare_to_guess(guess_sequence)
puts goal_sequence
puts guess_sequence
p correctness
puts 'Expected: {black: 1, white: 1, incorrect: 2}'
