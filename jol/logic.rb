class Logic

  def conversion_ace_value(player)
    points = count_points(player)
    aces = player.cards.select { |card| card.value == 11 }
    if aces.size == 1 && points > 21
      change_value(player, aces)
      return count_points(player)
    elsif aces.size > 1
      change_value(player, aces)
      return count_points(player)
    end
    points
  end

  def count_payout(user, dealer, bank)
    if user.points > 21
      0
    elsif user.points == dealer.points
      user.deposit(bank)
    elsif user.points == 21
      user.deposit((bank * 2.5).to_i)
    elsif user.points > dealer.points || dealer.points > 21
      user.deposit((bank * 2).to_i)
    else
      0
    end
  end

  def count_points(player)
    total = 0
    player.cards.each do |card|
      total += card.value
    end
    total
  end

  private

  def change_value(person, aces)
    aces.first.value = 1
  end
end
