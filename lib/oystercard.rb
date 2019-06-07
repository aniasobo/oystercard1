require 'journey'

class OysterCard
  attr_reader :balance
  attr_reader :history
  attr_reader :journey
  MAX_VALUE = 90
  MINIMIM_FARE = 1

  def initialize(balance = 10)
    @balance = balance
    @journey = nil
    @history = []
  end

  def top_up(num)
    raise "Value #{num} to high. Cannot top-up to more than #{MAX_VALUE}" if @balance + num > MAX_VALUE

    @balance += num
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station)
    raise 'Card already in use' if in_journey?
    raise 'Not enough for a fare.' unless enough_money?

    @journey = Journey.new(station)
    nil
  end

  def touch_out(station)
    raise 'You already touched out.' unless in_journey?

    deduct(MINIMIM_FARE)
    @journey.add_exit(station)
    save_journey
  end

  def save_journey
    @history << @journey
    @journey = nil
  end

  def display_balance
    @balance
  end

  private

  def in_journey?
    @journey != nil
  end

  def enough_money?
    @balance >= MINIMIM_FARE
  end
end
