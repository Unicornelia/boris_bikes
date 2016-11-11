require 'docking_station'

describe DockingStation do

  it 'has a bikes attribute' do
    expect(subject).to respond_to(:bikes)
  end

  it 'has a capacity attribute' do
    expect(subject).to respond_to(:capacity)
  end

  context '#dock' do

    before(:each) do
      @bike = Bike.new
      @another_bike = Bike.new
      subject.dock(@bike)
      subject.dock(@another_bike)
    end

    it 'can dock a bike' do
      expect(subject.bikes.shift).to eq @bike
    end

    it 'can accept more than 1 bike' do
      expect(subject.bikes).to include(@bike, @another_bike)
    end

  end

  context '#release' do

    before(:each) do
      @bike = Bike.new
      subject.dock(@bike)
    end

    it { is_expected.to respond_to(:release_bike) }

    it "gets a bike" do
      expect(subject.release_bike).to be_kind_of(Bike)
    end

    it "gets the bike that was docked before" do
      expect(subject.release_bike).to eq @bike
    end

  end

  describe '#is_full?' do
    it 'returns true if the station is full' do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect(subject.is_full?).to eq true
    end

    it 'returns false if the station is not full' do
      expect(subject.is_full?).to eq false
    end
  end

  describe '#is_empty?' do
    it 'returns true if the station is empty' do
      expect(subject.is_empty?).to eq true
    end

    it 'returns false if the station is not empty' do
      subject.dock(Bike.new)
      expect(subject.is_empty?).to eq false
    end
  end

  context 'capacity' do

    it 'checks a docking station responds to capacity' do
      expect(subject).to respond_to(:capacity)
    end

    it 'allows a user to set capacity' do
      station = DockingStation.new(30)
      expect(station.capacity).to eq 30
    end

    it "checks whether the value of DEFAULT_CAPACITY constant is 20" do
      expect(DockingStation::DEFAULT_CAPACITY).to eq 20
    end

  end

  describe 'error handling' do

    it 'Raises an error if you try to dock a bike in a station that already has 20 bikes in' do
      station = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times {station.dock(Bike.new)}
      expect { station.dock(Bike.new) }.to raise_error('Docking station full')
    end

    it "raises an error when you try to release a bike when there is none there" do
      expect { subject.release_bike }.to raise_error('No bikes available')
    end

  end

end
