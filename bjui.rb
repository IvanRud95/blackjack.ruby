class Bjui

  def initialize
    @gm = Game.new
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


end