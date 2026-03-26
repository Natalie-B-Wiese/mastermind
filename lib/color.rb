# frozen_string_literal: true

# Holds a single color
class Color
  require_relative 'color_options'

  # this attr_reader is only read in this script. It should perhaps be marked as protected somehow
  attr_reader :color_id

  def initialize(color_id)
    @color_id = color_id
    @color_code = ColorOptions.get_color_by_color_id(color_id)
  end

  def to_s
    "#{@color_code} #{@color_id} " + ColorOptions.reset_color
  end

  def equals(other)
    @color_id == other.color_id
  end
end
