require_relative 'logic'

class Game
  attr_reader :player, :dealer, :logic, :gameplay, :interface

  def initialize(interface, logic)
    @gameplay = ''
    @interface = interface
    @logic = logic

    @user = ''
    @dealer = Player.new('Dealer')
  end

  def start
    @user = User.new(interface.ask_name)
    interface.hello(name)
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