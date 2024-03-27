class Player
  attr_reader :lives

  def initialize 
    @lives = 3
  end

  def decrement_lives
    @lives -= 1
  end
end