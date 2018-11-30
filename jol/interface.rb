class Interface

  def ask_name
    print 'Enter your name, please: '
    gets.to_i
  end

  def hello(name)
    puts "Hello, #{name}! "
  end

  def shuffling
    puts 'Shuffling...'
  end

  def ask_card
    puts '0 - Enough.'
    puts '1 - One more card.'
    print 'Please, make your choice: '
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
    print 'Please, make your choice: '
    return true if gets.chomp.to_i == 1
    false
  end

end