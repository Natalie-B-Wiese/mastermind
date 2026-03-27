# frozen_string_literal: true

require_relative 'player'

# a CPU player chooses 4 random colors when initialized
# When it is the CPU's turn, they judge the colors that human has put in
class CpuPlayer < Player
  # computer is a player that randomly selects 4 colors
  def initialize(name)
    super(name)
  end

  # generate a random color sequence and return a ColorSequence object (method for codemaker)
  def create_sequence
    puts "#{@name} has chosen a sequence"
    ColorSequence.new
  end

  def guess(*args)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
