class Player
  include Constant
  attr_reader :hand, :name

  def initialize(name)
    @name = name
    @hand = []
  end

  def get_cards(card)
    @hand << card
  end

  def total_points
    sum ||= 0
    @hand.each { |card| sum += card.nominal_cost }
    aces = @hand.select { |card| card.suit.match(/^A/) }.count
    aces.times do
      break if sum <= MAX_POINTS
      sum -= 10
    end
    sum
  end

  def show_hand
    @hand.map(&:suit)
  end

  def count_cards_hand
    @hand.size
  end

  def reset_hand
    @hand.clear
  end

end