require 'docking_station'

describe "Docking Station" do
  it "should produce a new docking station object" do
    expect(DockingStation.new).to be_kind_of(DockingStation)
  end

  it "should call the method release bike on the object" do
    expect(DockingStation.new).to respond_to(:release_bike)
  end
end
