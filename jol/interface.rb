class Menu

  def ask_name
    print 'Enter your name, please: '
    gets.chomp
  end

  def greeting(user_name)
    p "Hello, #{user_name}! Let's play Black Jack!"
  end

  def shuffling
    p 'Shuffling...'
  end

  def ask_card
    p '1 - One more card.'
    p '0 - Enough.'
    print 'Please, make your choise: '
    gets.chomp.to_i
  end

  def give_cards(player, points)
    print "#{player.name}'s cards:"
    player.cards.each do |card|
      print " #{card.name}"
    end
    p "  Total: #{points}"
  end

  def continue?
    p 'Do you want to continue the game?'
    p '1 - Yes!'
    p '0 - No.'
    print 'Please, make your choise: '
    return true if gets.chomp.to_i == 1
    false
  end

end