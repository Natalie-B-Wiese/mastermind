# frozen_string_literal: true

# a color sequence is made up of 4 colors
class ColorSequence
  require_relative 'color'
  require_relative 'color_options'

  # the number of colors in a sequence
  LENGTH = 4

  # an array of Color objects
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

  def to_s
    string = ''
    @colors.each do |color|
      string += color.to_s
    end
    string
  end

  # compares this sequence (aka goal sequence) to the guess.
  # Returns a hash of ':black' (fully correct), ':white' (correct color wrong spot), and ':incorrect'
  def compare_to_guess(guess)
    result = {
      black: 0,
      white: 0,
      incorrect: 0
    }

    # contains indices of guess that perfectly match goal. Prevents double counting
    correct_indices = fully_correct_indices(@colors, guess.colors)
    num_correct = correct_indices.length
    result[:black] = num_correct

    num_semi = num_semicorrect(@colors, guess.colors, correct_indices)
    result[:white] = num_semi

    num_incorrect = LENGTH - (num_correct + num_semi)
    result[:incorrect] = num_incorrect

    result
  end

  private

  # Returns an array of indices where goal and guess are identical
  def fully_correct_indices(goal_colors, guess_colors)
    correct_indices = []

    goal_colors.each_with_index do |goal_color, index|
      correct_indices.push(index) if guess_colors[index].equals(goal_color)
    end

    correct_indices
  end

  # get the number of matches where color is right but in the wrong spot, exlude indices that appear in ignore_indices
  def num_semicorrect(goal_colors, guess_colors, ignore_indices)
    # contains indices of guess that are included on goal. Prevents double counting
    guess_white_indices = []

    # check for semi-correct matches excluding matches already found
    goal_colors.each.with_index do |goal_color, goal_index|
      next if ignore_indices.include?(goal_index)

      guess_colors.each.with_index do |guess_color, guess_index|
        # skip over this color if it has already been counted
        next if guess_white_indices.include?(guess_index)

        if guess_color.equals(goal_color)
          guess_white_indices.push(guess_index)
          # break out of this loop and continue on the colors.each loop
          break
        end
      end
    end
    guess_white_indices.length
  end

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
