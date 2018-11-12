class Deck
  attr_reader :cards

  def initialize
    @cards = []
    create_card
    shuffle_cards
  end

  def create_card
    suits = ["\u2663", "\u2665", "\u2660", "\u2666"]
    cards = %w[2 3 4 5 6 7 8 9 10 J Q K A]
    cards.each do |card|
      suits.each do |suit|
        @cards << Card.new(card + suit, card)
      end
    end
  end
