# frozen_string_literal: true

require_relative 'lib/game'

require_relative 'lib/player/cpu_player'
require_relative 'lib/player/human_player'

require_relative 'lib/color_sequence'
require_relative 'lib/grader'

codemaker = CpuPlayer.new('CPU')
codebreaker = HumanPlayer.new('You')

# for debugging. Show the random sequence that the CPU has chosen
puts 'CPU has randomly chosen this sequence:'
puts codemaker.color_sequence
print "\n"

Game.new(codemaker, codebreaker)
