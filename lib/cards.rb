class Cards
  attr_reader :suit, :nominal_cost

  def initialize(suit, nominal_cost)
    @suit = suit
    @nominal_cost = calculation_nominal_cost(nominal_cost)
  end

  private

  def calculation_nominal_cost(value)
    case value
    when /^[2-9]{1}$|10$/ then value.to_i
    when 'A' then 11
    else
      10
    end
  end
end
