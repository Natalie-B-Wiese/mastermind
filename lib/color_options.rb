# frozen_string_literal: true

# Contains options for the 6 possible colors in-game. Color 0 is reset color
module ColorOptions
  RESET = "\e[39;49m"
  RED = "\e[41m"
  GREEN = "\e[42m"
  BLUE = "\e[44m"
  YELLOW = "\e[43m"
  WHITE = "\e[30;107m"
  BLACK = "\e[97;40m"

  COLORS = [RESET, RED, GREEN, BLUE, YELLOW, WHITE, BLACK].freeze

  # gets the color by an id. When id=0 then it is a reset color
  def self.get_color_by_color_id(id)
    COLORS[id]
  end

  def self.reset_color
    RESET
  end

  # returns the number of choosable colors
  def self.num_colors
    COLORS.length - 1
  end
end
