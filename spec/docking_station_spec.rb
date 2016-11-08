require 'docking_station'

describe "Docking Station" do
  it "should produce a new docking station object" do
    expect(DockingStation.new).to be_kind_of(DockingStation)
  end

  it { is_expected.to respond_to(:release_bike) }

end
