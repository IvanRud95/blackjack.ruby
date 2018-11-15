require_relative 'card'

class Desk
  attr_accessor :cards

  def initialize
    suits = ["\u2663", "\u2665", "\u2660", "\u2666"]
    @cards = []
    cards = %w[2 3 4 5 6 7 8 9 10 J Q K A]
    cards.each do |card|
      suits.each do |suit|
        @cards << Card.new(card + suit, card)
      end
    end
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

  def take
    @cards.delete_at(0)
  end

  def count_cards
    @cards.size
  end

end