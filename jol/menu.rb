require_relative 'hand'

class Menu
  attr_reader :user, :dealer, :menu, :hand, :game_play

  def initialize(menu, hand)
    @game_play = ''
    @menu = menu
    @hand = hand

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
    game_play = GamePlay.new(menu, hand, user, dealer)
    game_play.preparation
    game_play.taking_bet
    game_play.shuffle_deck
    game_play.deal_cards
    menu.puts_payout(game_play.payout)
    play if menu.continue
  end
end
