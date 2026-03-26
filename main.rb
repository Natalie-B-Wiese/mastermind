require_relative 'lib/color_options'
require_relative 'lib/player'

tray_player = CpuPlayer.new
guessing_player = HumanPlayer.new

tray_player.color_sequence.colors.each do |color|
  print color
end
print "\n"
