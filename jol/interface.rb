class Interface

  def name
    puts "Hello. Lets's play Black Jack game"
    print 'Enter your name:'
    gets.chomp
  end

  def bet
    print 'make your bet: '
    gets.chomp.to_i
  end

  def card
    puts '1 - One more card.'
    puts '0 - Enough.'
    print 'Please, make your choice: '
    gets.chomp.to_i
  end

  def puts_cards(player, points)
    print "#{player.name}'s cards:"
    player.cards.each do |card|
      print " #{card.name}"
    end
    puts "  Total: #{points}"
  end

  def puts_payout(bank)
    puts "Bank for payout: #{bank}"
  end

  def continue
    puts 'Do you want to continue?'
    puts '1 - Yes!'
    puts '0 - No.'
    print 'Please, make your choice: '
    return true if gets.chomp.to_i == 1
    false
  end

  def greeting(user_name)
    puts "Hello, #{user_name}!"
  end

  def show_bets(bank, user_money)
    puts "Your bet: #{bank}; "
    puts "Balance: #{user_money}"
  end

end
