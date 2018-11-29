class Interface

  def ask_name
    print 'Enter your name, please: '
    gets.chomp
  end

  def greeting(player_name)
    puts "Hello, #{player_name}! "
  end

  def shuffling
    puts 'Shuffling...'
  end

  def ask_card
    puts '1 - One more card.'
    puts '0 - Enough.'
    print 'Please, make your choise: '
    gets.chomp.to_i
  end

  def give_cards(player, points)
    print "#{player.name}'s cards:"
    player.cards.each do |card|
      print " #{card.name}"
    end
    puts "  Total: #{points}"
  end

  def continue?
    puts 'Do you want to continue the game?'
    puts '1 - Yes!'
    puts '0 - No.'
    print 'Please, make your choise: '
    return true if gets.chomp.to_i == 1
    false
  end

end