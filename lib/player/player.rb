# frozen_string_literal: true

# a base class for a player.
class Player
  require_relative '../color_sequence'

  def initialize(name)
    @name = name
  end

  # make a 4-sequence guess and return a ColorSequence object
  def guess(*args)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
