require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bikes available" if empty?
    @bikes.shift
  end

  def dock(bike)
    raise "Docking station full" if full?
    @bikes << bike
  end

  def is_full?
    full?
  end

  def is_empty?
    empty?
  end

  private
    def full?
      @bikes.count >= DEFAULT_CAPACITY
    end

    def empty?
      @bikes.empty?
    end

end
