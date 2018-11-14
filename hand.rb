require_relative 'card'
require 'active_support'
require 'active_support/core_ext'

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