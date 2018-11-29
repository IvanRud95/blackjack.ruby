class Game
  attr_reader :player, :dealer, :menu, :logic, :gameplay

  def initialize(menu, logic)
    @gameplay = ''
    @menu = menu
    @logic = logic

    @player = ''
    @dealer = Dealer.new('Dealer')
  end

  def start
    @player = Player.new(menu.ask_name)
    interface.greeting(player.name)
    game
  end

  private

  def game
    gameplay = GamePlay.new(menu, logic, player, dealer)
    gameplay.shuffle_deck
    gameplay.deal_cards
    game if menu.continue?
  end
end