

class Pawn
  attr_reader :symbol, :placement

  MOVES = [1,0]
  def initialize(location)
    @symbol = "\u2659" #White pawn
    @placement = location
  end

  def update_placement(location)
    @placement = location
  end
end