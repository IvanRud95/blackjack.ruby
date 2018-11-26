class GamePlay
  attr_accessor :bank
  attr_reader :menu, :logic, :user, :dealer, :deck

  def initialize(menu, logic, user, dealer)
    @user = user
    @dealer = dealer
    @menu = menu
    @logic = logic

    @bank = 0
    @deck = Deck.new
    user.points = 0
    user.remove_cards
    dealer.points = 0
    dealer.remove_cards
  end

  def shuffle_deck
    menu.shuffling
    deck.shuffle
  end

  def deal_cards
    first_deal
    user_get_cards
    dealer_get_cards
  end

  private


  def first_deal
    2.times do
      cards_points(player)
      cards_points(dealer)
    end
    interface.give_cards(player, operations.count_points(player))
    interface.give_cards(dealer, logic.count_points(dealer))
  end

  def user_get_cards
    loop do
      choise = menu.ask_card
      break if choise == 0
      cards_points(user) if choise == 1
      interface.give_cards(user, logic.count_points(player))
      break if user.points > 21
    end
  end

  def dealer_get_cards
    loop do
      break if dealer.points > player.points || player.points > 21 || dealer.points > 20
      cards_points(dealer)
      interface.give_cards(dealer, operations.count_points(dealer))
    end
  end

  def cards_points(person)
    person.get_card(@deck.take_card)
    person.points = logic.conversion_ace_value(person)
  end
end