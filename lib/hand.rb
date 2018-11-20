require_relative 'card'
class Hand
  def message(key)
    puts MESSAGES[key]
  end

  def input_name
    input = gets.chomp
    raise 'Нет имени, нет игры !!!' if input.empty?
    input
  end

  def input
    input = gets.chomp
    raise 'Вы ничего не ввели !!!' if input.empty?
    input
  rescue RuntimeError
    message(:choose_move)
    print ':'
    retry
  end

  def hide_hund_dealer(player)
    if player.is_a? Dealer
      player.show_hand.fill('*').join
    else
      player.show_hand.join
    end
  end

  def hand_dealer(dealer)
    dealer.show_hand.join
  end

  def hand_player(player)
    player.show_hand.join
  end

  def check_input_item?(items, item)
    return true unless items.count(item) == 1
  end

  def remember_items(items, item)
    items << item
  end

  def items_clear(items)
    items.clear
  end
end