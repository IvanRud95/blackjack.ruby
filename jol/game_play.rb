class GamePlay
  attr_accessor :bank
  attr_reader :menu, :logic, :user, :dealer, :deck

  def initialize(menu, logic, user, dealer)
    @user = user
    @dealer = dealer
    @menu = menu
    @logic = logic

    @bank = Bank.new(0)
    @deck = Deck.new
    user.points = 0
    user.remove_cards
    dealer.points = 0
    dealer.remove_cards
  end

  def preparation
    menu.show_bets(bank,@user.bank)
  end

  def taking_bet
    begin
      @bank = bank.add_money(@player.bank.bet, @dealer.bank.bet)
    rescue ArgumentError => e
      p e.message
      retry
    end
    menu.show_bets(user.bank, dealer.bank)
  end

  def shuffle_deck
    deck.shuffle
  end

  def deal_cards
    first_deal
    user_cards
    dealer_cards
  end

  def payout
    logic.count_payout(user, dealer, bank)
  end

  private

  def validation_money!
    raise ArgumentError, 'You have no money!' unless bank.money?
  rescue ArgumentError => e
    abort e.message
  end

  def first_deal
    2.times do
      cards_points(user)
      cards_points(dealer)
    end
    menu.puts_cards(user, logic.count_points(user))
    menu.puts_cards(dealer, logic.count_points(dealer))
  end

  def user_cards
    loop do
      choice = menu.card
      break if choice == 0
      cards_points(user) if choice == 1
      menu.puts_cards(user, logic.count_points(user))
      break if user.points > 21
    end
  end

  def dealer_cards
    loop do
      break if dealer.points > user.points || user.points > 21 || dealer.points > 20
      cards_points(dealer)
      menu.puts_cards(dealer, logic.count_points(dealer))
    end
  end

  def cards_points(player)
    player.get_card(@deck.take_card)
    player.points = logic.conversion_ace_value(player)
  end
end
