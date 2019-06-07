class Journey
  attr_reader :entry_station
  attr_reader :exit_station
  
  def initialize(station)
    @entry_station = station
  end

  def add_exit(exit_station)
    @exit_station = exit_station
  end
end
