require_relative 'desk'
require_relative 'hand'
class Game

  attr_reader :desk, :ph, :dh

  def initialize
    @desk = Desk.new
    @ph = Hand.new('Player')
    @dh = Hand.new('Dealer')
    @isstay = false
    deal
  end

  def deal
    @ph.cards.clear
    @dh.cards.clear
    @ph.cards << take_safe
    @ph.cards << take_safe
    @dh.cards << take_safe
    @dh.cards << take_safe
    @isstay = false
  end

  def take_safe
    if @desk.cards.empty? then
      @desk = Desk.new
    end
    return @desk.take
  end

  def hit
    @ph.cards << take_safe
  end

  def stay
    while @dh.points < 17 do
      @dh.cards << take_safe
      @isstay = true
    end
  end

  def over
    if @isstay || (@ph.points >= 21) then
      true
    else
      false
    end
  end
end