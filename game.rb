require_relative 'desk'
require_relative 'hand'
class Game

  attr_reader :desk, :player, :dealer, :items
  def initialize
    @interface = Interface.new
    @dealer = Dealer.new
  end

  def start_game
    set_name_player
    play
  end
