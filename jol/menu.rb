require_relative 'logic'

class Menu
  attr_reader :user, :dealer, :menu, :logic, :game_play

  def initialize(menu, logic)
    @game_play = ''
    @menu = menu
    @logic = logic

    @user = ''
    @dealer = Player.new('Dealer')
  end

  def start
    @user = User.new(menu.name)
    menu.greeting(user.name)
    play
  end

  private

  def play
    game_play = GamePlay.new(menu, logic, user, dealer)
    game_play.preparation
    game_play.taking_bet
    game_play.shuffle_deck
    game_play.deal_cards
    menu.puts_payout(game_play.payout)
    play if menu.continue
  end
end
