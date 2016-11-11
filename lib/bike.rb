class Bike

  def initialize
    @working = true
  end

  def working=(boolean)
    @working = boolean
  end

  def working?
    @working
  end

  def broken
    self.working=(false)
  end

end
