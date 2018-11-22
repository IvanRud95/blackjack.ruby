class Card
  attr_reader :suit, :name

  def initialize(suit,cost)
    @suit = suit
    @name=name
  end
  
        
  SUITS = { Diamond: "\u25C6",
            Spade:   "\u2660",
            Club:    "\u2663",
            Heart:   "\u2665" }.freeze
            
  NAMES = [2, 3, 4, 5, 6, 7, 8, 9,
           'Jack',
           'Queen',
           'Кing',
           'Ace'].freeze

end
