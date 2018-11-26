class Game
  attr_reader :player, :dealer, :menu, :logic, :game_play

  def initialize(menu, logic)
    @game_play = ''
    @menu = menu
    @logic = logic

    @player = ''
    @dealer = Diller.new('Dealer')
  end

  def start
    @user = User.new(menu.ask_name)
    menu.greeting(player.name)
    game
  end

  private

  def game
    game_play = GamePlay.new(menu, logic, player, dealer)
    game_play.shuffle_deck
    game_play.deal_cards
    game if menu.continue?
  end
end