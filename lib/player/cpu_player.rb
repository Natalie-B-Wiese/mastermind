# frozen_string_literal: true

require_relative 'player'
require_relative '../color_sequence'

# a CPU player chooses 4 random colors when initialized
# When it is the CPU's turn, they judge the colors that human has put in
class CpuPlayer < Player
  # computer is a player that randomly selects 4 colors
  def initialize(name)
    super(name)

    # this is only used when CPU is the codebreaker
    @guesses = []
  end

  # generate a random color sequence and return a ColorSequence object (method for codemaker)
  def create_sequence
    puts "#{@name} has chosen a sequence"
    ColorSequence.new
  end

  def guess
    @previous_guess = possibility_to_sequence(@possibilities.shift)
  end

  # removes invalid possibilities from @possibilities
  def respond_to_grade(grade)
    # the previous guess as a string array of digits
    guess_digits = @previous_guess.to_i_array

    # the number of correct digits
    num_keepers = grade[:black] + grade[:white]

    # if the number of digits they share equals num_keepers then it is valid
    invalid_possibilities = @possibilities.reject do |possibility|
      guess_possibility_similarness(guess_digits, possibility) == num_keepers
    end

    # remove invalid possibilities from possibilities
    @possibilities -= invalid_possibilities
  end

  # this is only used when CPU is a codebreaker and is called only at the begining of a game
  def setup_guesses
    @possibilities = all_sequence_combinations
    @previous_guess = nil
  end

  private

  # gets the number of digits that are shared between the guess and a possibility
  def guess_possibility_similarness(guess_digits_i, possibility)
    # the number of digits that are shared between this possibility and the guess
    similarness = 0

    # reset guess_digits after every possibility
    guess_digits_s = guess_digits_i.map(&:to_s)

    # if there is a matching digit increase similarness
    possibility.to_s.chars.each do |possibility_digit_s|
      next unless guess_digits_s.include?(possibility_digit_s)

      similarness += 1

      # prevent duplicate counts
      guess_digits_s.delete_at(guess_digits_s.index(possibility_digit_s))
    end

    similarness
  end

  # returns an array of numbers. Each index is a possibility. All numbers have same number of digits
  def all_sequence_combinations
    arr = []

    # If length of sequence is 4, start_combination is 1111
    start_combination = (1.to_s * ColorSequence::LENGTH).to_i

    # The biggest sequence combination (eg 6666)
    final_combination = (ColorOptions.num_colors.to_s * ColorSequence::LENGTH).to_i

    (start_combination..final_combination).each do |combination|
      arr.push(combination) unless combination.to_s.include?('0')
    end

    arr
  end

  def possibility_to_sequence(possibility)
    ColorSequence.new(possibility.to_s.chars.map(&:to_i))
  end
end
