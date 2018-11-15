class Card
  attr_reader :suit, :cost

  def initialize(suit,cost)
    @suit = suit
    @nominal_cost = calculation_cost(cost)
  end

  private

  def calculation_cost(value)
    case value
    when /^[2-9]{1}$|10$/ then value.to_i
    when 'A' then 11
    else
      10
    end
  end

end
