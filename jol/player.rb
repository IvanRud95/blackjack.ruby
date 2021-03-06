class Player
  attr_accessor :points
  attr_reader :name, :money, :cards

  def initialize(name)
    @name = name
    @cards = []
    @points = 0
    @hand = Hand.new
  end

  def get_card(card)
    cards << card
  end

  def remove_cards
    @cards = []
  end
end
