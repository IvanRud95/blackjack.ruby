require_relative 'card'


class Hand
  attr_accessor :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def points
    @cards.map(&:points).sum
  end
end