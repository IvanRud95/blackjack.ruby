class Player
 
  attr_reader :hand, :name, :balance

  def initialize(name)
    @name = name
    @hand = []
    @balance = 100
  end
