# frozen_string_literal: true

# a base class for a player.
class Player
  require_relative '../color_sequence'

  attr_reader :name

  def initialize(name)
    @name = name
  end

  # make a sequence and return a ColorSequence object (method for codemaker)
  def create_sequence
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # make a 4-sequence guess and return a ColorSequence object (method for codebreaker)
  def guess(*args)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
