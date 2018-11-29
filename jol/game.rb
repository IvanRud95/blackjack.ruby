require_relative 'logic'

class Game
  attr_reader :player, :dealer, :interface, :logic, :gameplay

  def initialize(menu, logic)
    @gameplay = ''
    @menu = menu
    @logic = logic

    @player = ''
    @dealer = Player.new('Dealer')
  end

  def start
    @player = Player.new(interface.ask_name)
    interface.greeting(player.name)
    game
  end

  private

  def game
    gameplay = GamePlay.new(interface, logic, player, dealer)
    gameplay.shuffle_deck
    gameplay.deal_cards
    game if interface.continue?
  end
end