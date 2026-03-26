# a color sequence is made up of 4 colors
class ColorSequence
  require_relative 'color'
  require_relative 'color_options'

  # the number of colors in a sequence
  LENGTH = 4

  attr_reader :colors

  # creates a new sequence from an array of color_id
  # if color_id_array isn't specified, then it generates a random sequence
  def initialize(color_id_array = nil)
    @colors = Array.new(LENGTH)
    if color_id_array
      set_sequence(color_id_array)
    else
      randomize
    end
  end

  private

  # Randomize all the colors in this sequence
  def randomize
    @colors.map! { choose_random_color }
  end

  # Replaces all colors in this sequence to the colors created from color_id_array.
  # color_id_array should be same length as LENGTH
  def set_sequence(color_id_array)
    @colors.map!.with_index do |_, index|
      Color.new(color_id_array[index])
    end
  end

  # chooses a random color from 1 to the number of colors and returns that color
  def choose_random_color
    # generate a random integer from 1 (inclusive) to the number of choosable colors
    color_id = rand(1..ColorOptions.num_colors)
    Color.new(color_id)
  end
end
