class User < Player
  def initialize(name)
    super
    @money = 100
  end

  def bet(value)
    withdraw(value)
    value
  end

  def deposit(value)
    @money += value
    value
  end

  def money?
    money > 0
  end

  private

  def withdraw(value)
    raise ArgumentError, 'Money is not enough' if value > money
    @money -= value
  end
end
