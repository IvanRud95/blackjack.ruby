require_relative 'game'
class Bjui

  def initialize
    @interface = Interface.new
    @dealer = Dealer.new
  end

  def hands
    hand_ui(@gm.ph)
    hand_ui(@gm.dh)
  end

  def hand_ui(hand)
    puts hand.name
    hand.cards.each {|e| puts e.name}
    puts "#{hand.points} points"
  end


  def menu
    puts '1.Deal'
    puts '2.Hit'
    puts '3.Stay'
    gets.to_i
  end

  def main
    loop do
      item = menu
      break if item.zero?
      if @gm.over then puts 'Game over'
      end
      hands
      main_menu(item)
    end
  end

  def main_menu(item)
    case item
    when 1 then
      @gm.deal
    when 2 then
      @gm.hit
    when 3 then
      @gm.stay
    else
      puts 'Incorrect number'
    end
  end
end