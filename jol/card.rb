class Card
  attr_reader :name
  attr_accessor :value

  VALUES = {
      '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
      '10': 10, 'J': 10, 'Q': 10, 'K': 10, 'A': 11
  }
  SUITS = ['♦', '♣', '♠', '♥']

  def initialize(name, value)
    @name = name
    @value = value
  end

  private

  def nominal_cost(value)
    case value
    when /^[2-9]{1}$|10$/ then
      value.to_i
    when 'A' then
      11
    else
      10
    end
  end

end