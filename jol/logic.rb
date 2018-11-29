class Logic

  def count_ace_value(player)
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

  def count_points(player)
    total = 0
    player.cards.each do |card|
      total += card.value
    end
    total
  end

  private

  def change_value(player, aces)
    aces.first.value = 1
  end
end
