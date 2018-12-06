require_relative 'interface'
require_relative 'card'

class Deck

  VALUES = {
      '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
      '10': 10, 'J': 10, 'Q': 10, 'K': 10, 'A': 11
  }
  SUITS = ['♦', '♣', '♠', '♥']

  attr_accessor :cards

  def initialize
    @cards = []
    deal
  end

  def shuffle
    rand(5..10).times { @cards.shuffle! }
  end

  def take_card
    cards.shift
  end

  private

  def deal
    SUITS.each do |suit|
      VALUES.each do |name, value|
        @cards << Card.new("#{name}#{suit.to_s}", value)
      end
    end
  end
end
