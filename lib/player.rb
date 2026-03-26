# a base class for a player.
class Player
end

# a CPU player chooses 4 random colors when initialized
class CpuPlayer < Player
  require_relative 'color_options'
  require_relative 'color'

  attr_reader :colors

  # computer is a player that randomly selects 4 colors
  # When it is the CPU's turn, they judge the colors that human has put in
  def initialize
    super
    @colors = []

    # generate 4 random colors
    for i in 0...4
      @colors[i] = choose_random_color
    end
  end

  private

  # chooses a random color from 1 to the number of colors and returns that color
  def choose_random_color
    # generate a random integer from 1 (inclusive) to the number of choosable colors
    color_id = rand(1..ColorOptions.num_colors)
    Color.new(color_id)
  end
end

class HumanPlayer < Player
  # human guesses 4 colors every turn
end
