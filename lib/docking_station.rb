require_relative 'bike'

class DockingStation

  attr_reader :bike

  def initialize
    @bike
  end

  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end

  # def dock(bike)
  #   puts "This is a bike!: #{@bike}"
  # end

end
