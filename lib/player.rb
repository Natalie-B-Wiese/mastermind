# a base class for a player.
class Player
end

class CpuPlayer < Player
  # computer is a player that randomly selects 4 colors
  # When it is the CPU's turn, they judge the colors that human has put in
end

class HumanPlayer < Player
  # human guesses 4 colors every turn
end
