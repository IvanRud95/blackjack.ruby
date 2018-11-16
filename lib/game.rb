require_relative 'desk'
require_relative 'hand'
class Game

  attr_reader :desk, :player, :dealer

  def initialize
    @interface = Interface.new
    @dealer = Dealer.new
  end

  def start_game
    set_name_player
    play
  end

  private

  def play
    @desk = Desk.new
    @items = []
    deal_cards
    player_turn
  end

  def set_name_player
    name = @interface.set_name
    @player = Player.new(name)
  end

  def deal_cards
    reset_hand_players
    2.times {player.get_cards(desk.hit)}
    2.times {dealer.get_cards(desk.hit)}
  end

  def reset_hand_players
    player.reset_hand
    dealer.reset_hand
  end

  def hands_players
    @interface.show_hand_dealer(dealer)
    @interface.show_hand_player(player)
  end

  def player_turn
    check_players_and_cards
    item = @interface.menu_player_turn
    remember_items(items, item)
    case item
    when '1'
      if check_input_item?(items, item)
        @interface.used_turn_title
        player_turn
      else
        dealer_turn
      end
    when '2'
      if check_input_item?(items, item)
        @interface.used_turn_title
        player_turn
      else
        player_take_card
        dealer_turn
        hands_players
      end
    when '3'
      open_cards
    else
      message(:not_item)
    end
  end

  def check_players_and_cards
    check_blackjack_bust_player(dealer)
    check_blackjack_bust_player(player)
    check_numbers_cards_players
    hands_players
  end

  def check_numbers_cards_players
    player_cards = player.count_cards_hand
    dealer_cards = dealer.count_cards_hand
    open_cards if player_cards == MAX_NUMBER_CARDS && dealer_cards == MAX_NUMBER_CARDS
  end

  def dealer_turn
    @interface.dealer_turn_title
    dl_tp = dealer.total_points
    dealer_cards = dealer.count_cards_hand
    player_turn unless dl_tp < MAX_POINTS_DEALER_TAKE_CARD && dealer_cards < MAX_NUMBER_CARDS
    dealer.get_cards(deck.hit)
    player_turn
  end

  def player_take_card
    return unless player.count_cards_hand == NUMBER_CARDS_PLAYER
    player.get_cards(deck.hit)
    player_turn
  end

  def open_cards
    message(:delimiter)
    if draw?(dealer, player)
      @interface.draw_title
      result
    else
      won_dialer_or_player(dealer, player)
    end
  end

  def blackjack(player)
    return unless player.total_points == MAX_POINTS
    @interface.blackjack(player)
    result
  end

  def bust(player)
    return unless player.total_points > MAX_POINTS
    if player.is_a?(Dealer)
      @interface.game_lost_title(dealer)
    else
      @interface.game_lost_title(player)
    end
    result
  end

  def draw?(dealer, player)
    cl_tp = player.total_points
    dl_tp = dealer.total_points
    return true if cl_tp > MAX_POINTS && dl_tp > MAX_POINTS || cl_tp == dl_tp
  end

  def won_dialer_or_player(dealer, player)
    if player.total_points > dealer.total_points
      @interface.game_won_title(player)
    elsif dealer.total_points > player.total_points
      @interface.game_won_title(dealer)
    end
    result
  end

  def result
    items_clear(items)
    message(:delimiter)
    message(:totals)
    @interface.show_hands_players(dealer, player)
    message(:delimiter)
    item = @interface.play_still_title
    exit if item == '2'
    play
  end

  def check_blackjack_bust_player(player)
    blackjack(player)
    bust(player)
  end
end