require_relative 'bike'

class DockingStation

  attr_reader :bike

  def initialize
    @bike
  end

  def release_bike
    raise "No bikes available" if @bike == nil
    @bike
  end

  def dock(bike)
    raise "Docking station full" if @bike
    @bike = bike
  end

end
