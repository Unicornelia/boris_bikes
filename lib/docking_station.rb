require_relative 'bike'

class DockingStation

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
      @bikes.count >= 20
    end

    def empty?
      @bikes.empty?
    end

end
