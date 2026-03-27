# frozen_string_literal: true

require_relative 'lib/game'

require_relative 'lib/player/cpu_player'
require_relative 'lib/player/human_player'

require_relative 'lib/color_sequence'
require_relative 'lib/grader'

def role_prompt
  loop do
    puts 'Choose role:'
    puts '1: codemaker'
    puts '2: codebreaker'

    role = gets.chomp.to_i
    valid = [1, 2].include?(role)

    return role if valid

    puts 'Invalid role! (Enter 1 or 2)'
  end
end

cpu = CpuPlayer.new('CPU')
human = HumanPlayer.new('You')

codemaker = nil
codebreaker = nil

role = role_prompt
if role == 1
  codemaker = human
  codebreaker = cpu
else
  codemaker = cpu
  codebreaker = human
end

code = codemaker.create_sequence

# for debugging. Show the random sequence that the CPU has chosen
puts code

Game.new(codemaker, codebreaker, code)
