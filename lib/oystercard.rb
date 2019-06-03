class OysterCard
  attr_reader :balance # the presence of attr_reader :balance allows rspec and others to see @balance
  MAX_VALUE = 90

  def initialize(balance=10)
    @balance = balance
  end

  def top_up(num)
    raise "Value #{num} to high. Cannot top-up to more than #{MAX_VALUE}" if @balance + num > MAX_VALUE
    @balance += num
  end
end
