class OysterCard
  attr_reader :balance
  attr_reader :history
  attr_accessor :entry_station
  attr_accessor :exit_station
  attr_accessor :journey
  MAX_VALUE = 90
  MINIMIM_FARE = 1

  def initialize(balance = 10)
    @balance = balance
    @entry_station = nil
    @exit_station = nil
    @journey = {}
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

    @entry_station = station
  end

  def touch_out(station)
    raise 'You already touched out.' unless in_journey?

    deduct(MINIMIM_FARE)
    @exit_station = station
    save_journey
  end

  def save_journey
    @journey[:started] = @entry_station
    @journey[:ended] = @exit_station
    @history << @journey
    @journey = {}
    @entry_station = nil
    @exit_station = nil
  end

  def display_balance
    @balance
  end

  private

  def in_journey?
    @entry_station != nil
  end

  def enough_money?
    @balance >= MINIMIM_FARE
  end
end
