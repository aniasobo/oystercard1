class OysterCard
  attr_reader :balance # the presence of attr_reader :balance allows rspec and others to see @balance
  attr_reader :state
  MAX_VALUE = 90

  def initialize(balance=10, state="not_in_journey")
    @balance = balance
    @state = state
  end

  def top_up(num)
    raise "Value #{num} to high. Cannot top-up to more than #{MAX_VALUE}" if @balance + num > MAX_VALUE
    @balance += num
  end

  def deduct(amount)
    @balance -= amount
  end
end
