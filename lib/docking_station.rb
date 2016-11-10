require_relative 'bike'

class DockingStation
  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end

  def dock(bike)
    puts "This is a bike!: #{@bike}"
  end

end
