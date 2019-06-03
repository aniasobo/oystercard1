class OysterCard
  attr_reader :balance # the presence of attr_reader :balance allows rspec and others to see @balance
  def initialize(balance=10)
    @balance = balance
  end
end
