require_relative 'card'

class Desk
  attr_accessor :cards

  def initialize
    @cards = []
    create_cards
    shuffle
  end

def shuffle
    1000.times do
      i1 = (rand * 52).floor
      i2 = (rand * 52).floor
      c1 = @cards[i1]
      c2 = @cards[i2]
      @cards[i1] = c2
      @cards[i2] = c1
    end
  end

  def hit
    @cards.delete_at(0)
  end

  def count_cards
    @cards.size
  end

end
