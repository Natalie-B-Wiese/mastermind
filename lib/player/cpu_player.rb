# frozen_string_literal: true

require_relative 'player'

# a CPU player chooses 4 random colors when initialized
# When it is the CPU's turn, they judge the colors that human has put in
class CpuPlayer < Player
  attr_reader :color_sequence

  # computer is a player that randomly selects 4 colors
  def initialize(name)
    super(name)
    # generate a random color sequence
    @color_sequence = ColorSequence.new
  end

  def guess(*args)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
