# frozen_string_literal: true

# A class that can grade how correct a sequence is
class Grader
  BLACK_CIRCLE = ' ● '
  WHITE_CIRCLE = ' ◯ '

  attr_reader :result

  # Create a Grader that compares how close guess_sequence is to goal_sequence
  def initialize(goal_sequence, guess_sequence)
    # contains indices of guess that perfectly match goal. Prevents double counting
    correct_indices = fully_correct_indices(goal_sequence.colors, guess_sequence.colors)
    num_correct = correct_indices.length

    num_semi = num_semicorrect(goal_sequence.colors, guess_sequence.colors, correct_indices)

    # A hash of integers with key ':black' (fully correct) and ':white' (correct color wrong spot)
    @result = {
      black: num_correct,
      white: num_semi
    }
  end

  # is true when guess_sequence matches goal_sequence
  def won?
    @result[:black] == ColorSequence::LENGTH
  end

  # The results as colored pegs against a white background
  def to_s
    pegs = BLACK_CIRCLE * @result[:black] + WHITE_CIRCLE * @result[:white]
    ColorOptions::WHITE + pegs + ColorOptions::RESET
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
        next if ignore_indices.include?(guess_index) || guess_white_indices.include?(guess_index)

        if guess_color.equals(goal_color)
          guess_white_indices.push(guess_index)
          # go back to colors.each loop since there
          break
        end
      end
    end
    guess_white_indices.length
  end
end
