# frozen_string_literal: true

# a game object that can be played
class Game
  require_relative 'color_options'

  NUM_GUESSES = 12

  # a boolean that is true when codebreaker guessed correct sequence
  attr_reader :won

  # codemaker and codebreaker are each Player objects. One is a CPU and the other is a Human
  # Create a Game object and play that game
  def initialize(codemaker, codebreaker)
    @codemaker = codemaker
    @codebreaker = codebreaker

    # show available color options
    puts 'Color Options:'
    puts ColorOptions
    print "\n"

    @won = play
  end

  private

  # plays the game until there is a winner or out of guesses. Returns whether codebreaker won
  def play
    won = false
    (1..NUM_GUESSES).each do |num_guesses|
      puts "Guess #{num_guesses}/#{NUM_GUESSES}"

      guess = guess_sequence

      grade = grade_sequence(guess)

      won = grade.won?

      break if won
    end

    print_end_game_message(won)
    won
  end

  # prints a win or lose message depending on value of won
  def print_end_game_message(won)
    if won
      puts 'You won!'
    else
      puts "You lost. The sequence was: #{@codemaker.color_sequence}"
    end
  end

  # makes codebreaker guess a sequence, prints the sequence, then returns the sequence
  def guess_sequence
    # make a player guess the sequence
    sequence_guess = @codebreaker.guess

    # Show the sequence that player guessed
    print sequence_guess

    sequence_guess
  end

  # Grades the passed in sequence, prints the grade, and returns the grade
  def grade_sequence(guess)
    # grade the sequence
    grade = Grader.new(@codemaker.color_sequence, guess)

    # show the hash results as colored pegs against a white background
    puts " #{grade}"

    grade
  end
end
