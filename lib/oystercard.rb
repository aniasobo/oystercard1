class OysterCard

  attr_reader :balance 
  attr_reader :state
  MAX_VALUE = 90
  MINIMIM_FARE = 1

  def initialize(balance = 10, state = 'not in journey')
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

  def touch_in
    raise "Card already #{@state}" if in_journey?
    raise 'Not enough for a fare.' unless enough_money?

    @state = 'in journey'
  end

  def touch_out
    raise "Card already #{@state}" unless in_journey?

    @state = 'not in journey'
  end

  def in_journey?
    @state == 'in journey'
  end

  def enough_money?
    @balance >= MINIMIM_FARE
  end
end
