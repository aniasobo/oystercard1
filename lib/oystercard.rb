class OysterCard

  attr_reader :balance 
  attr_accessor :station
  MAX_VALUE = 90
  MINIMIM_FARE = 1

  def initialize(balance = 10, station = nil)
    @balance = balance
    @station = station
  end

  def top_up(num)
    raise "Value #{num} to high. Cannot top-up to more than #{MAX_VALUE}" if @balance + num > MAX_VALUE

    @balance += num
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station)
    raise "Card already in use" if in_journey?
    raise 'Not enough for a fare.' unless enough_money?

    @station = station
  end

  def display_balance
    @balance
  end

  def touch_out
    raise "You already touched out." unless in_journey?

    self.deduct(MINIMIM_FARE)
    @station = nil
  end

  private

  def in_journey?
    @station != nil
  end

  def enough_money?
    @balance >= MINIMIM_FARE
  end
end
