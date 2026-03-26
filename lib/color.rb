# Holds a single color
class Color
  require_relative 'color_options'

  def initialize(color_id)
    @color_id = color_id
    @color_code = ColorOptions.get_color_by_color_id(color_id)
  end

  def to_s
    "#{@color_code} #{@color_id} " + ColorOptions.reset_color
  end
end
