class Interface

  def start_message
    puts 'Hello! This is BlackJack '
  end

  def no_item
    puts 'Wrong number'
  end

  def quit_message
    puts 'Press 0 to go back menu'
    gets.to_i
  end

  def continue_or_quit
    puts 'Enter 777 if your play BlackJack game'
    gets.to_i
  end

  def show_hand_dealer(dealer)
    puts "#{dealer.name}, карты: #{hide_hund_dealer(dealer)}"
  end

  def show_hand_player(player)
    puts "#{player.name}, карты: #{hand_player(player)}, "
    "очки: #{player.total_points}"
  end

  def show_hands_players(dealer, player)
    puts "#{dealer.name}, карты: #{hand_dealer(dealer)}, очки: #{dealer.total_points}"
    puts "#{player.name}, карты: #{hand_dealer(player)}, очки: #{player.total_points}"
  end

  def set_name
    puts 'Put your name'
    input_name
  end

  def menu_player_turn
    puts '1.Skip'
    puts '2.Take'
    puts '3.Open'
    puts "Your turn: "
    input
  end

  def menu_player_turn_missed_one
    puts "2.Взять карту"
    puts "3.Открыть карты"
    puts "Ваш ход: "
    input
  end

  def dealer_turn_title
    message(:delimiter)
    puts "Дилер сделал свой ход !!!"
  end

  def game_won_title(player)
    puts "Победил, #{player.name} !!!"
  end

  def game_lost_title(player)
    message(:delimiter)
    puts "Проиграл, #{player.name}, перебор!!!"
  end

  def play_still_title
    puts "Сыграем еще ?"
    puts "1.Да / 2.Нет"
    input
  end

  def draw_title
    puts "Ничья !!!"
  end

  def blackjack(player)
    message(:delimiter)
    puts "#{player.name}, у вас БлэкДжек !!!"
  end

  def end_game(message)
    puts message.to_s
    puts "End of the game"
  end

  def used_turn_title
    puts "Вы уже использовали этот ход !!!"
    message(:delimiter)
  end
end