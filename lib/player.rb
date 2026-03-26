# a base class for a player.
class Player
end

# a CPU player chooses 4 random colors when initialized
# When it is the CPU's turn, they judge the colors that human has put in
class CpuPlayer < Player
  require_relative 'color_sequence'

  attr_reader :color_sequence

  # computer is a player that randomly selects 4 colors
  def initialize
    super
    # generate a random color sequence
    @color_sequence = ColorSequence.new
  end
end

class HumanPlayer < Player
  # human guesses 4 colors every turn
end
