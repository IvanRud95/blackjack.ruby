class Card
  attr_reader :suitname, :valuename, :value, :suit

  def initialize (value, suit)
    unless value.between?(1, 13)
      raise 'Bad card value'
    end
    unless suit.between?(1, 4)
      raise 'Bad suit'
    end
    @value = value
    @suit = suit
    @valuename = value_name(value)
    @suitname = suit_name(suit)
  end

  def points
    case
    when @value.between?(1, 10) then @value
    when @value.between?(11, 13) then 10
    else
      raise 'Error in points'
    end
  end

  def name
    "#{@valuename} of #{@suitname}"
  end

  def suit_name(suit)
    case suit
    when 1 then "\u2663" #'Spades'
    when 2 then "\u2665" #'Hearts'
    when 3 then "\u2665" #Clubs'
    when 4 then "\u2666" #'Diamonds'
    else
      raise 'Error in suit name'
    end
  end

  def value_name(value)
    case
    when value == 1 then
      'Ace'
    when value.between?(2, 10) then value
    when value == 11 then
      'Jack'
    when value == 12 then
      'Queen'
    when value == 13 then
      'King'
    else
      raise 'Bad card'
    end
  end
end
