# frozen_string_literal: true

require_relative 'player'

# a player that is human
class HumanPlayer < Player
  def initialize(name)
    super(name)
  end

  # make a 4-sequence code and return a ColorSequence object (for codemaker)
  def create_sequence
    prompt = "Enter #{ColorSequence::LENGTH}-digit code: "
    valid_color_sequence_from_input(prompt)
  end

  # prompt human to make a valid guess and return the valid sequence human entered
  def guess
    prompt = "Enter #{ColorSequence::LENGTH}-digit guess: "
    valid_color_sequence_from_input(prompt)
  end

  private

  # get a valid ColorSequence object from human's user input in terminal
  def valid_color_sequence_from_input(prompt)
    loop do
      print prompt
      color_id_array = color_id_array_from_answer
      error = check_sequence_validity(color_id_array)
      return ColorSequence.new(color_id_array) unless error

      puts error
    end
  end

  # returns true if all color_id are in the correct range
  def valid_color_ids?(color_id_array)
    color_id_array.each do |color_id|
      return false unless ColorOptions.valid_color_id?(color_id)
    end
    true
  end

  # prompts user to enter a code and returns the code as an array of integers
  def color_id_array_from_answer
    answer = gets.chomp
    answer.split('').map(&:to_i)
  end

  # checks the validity of a sequence. Returns nil if valid, otherwise if non-valid it return an error string
  def check_sequence_validity(color_id_array)
    return 'Invalid length!' if color_id_array.length != ColorSequence::LENGTH
    return "Digits must be between 1 and #{ColorOptions.num_colors}!" unless valid_color_ids?(color_id_array)

    nil
  end
end
