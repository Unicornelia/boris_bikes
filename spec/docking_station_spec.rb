require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }

  it 'can accept bikes' do
    expect(subject).to respond_to(:bikes)
  end

  it 'can dock a bike' do
    new_bike = Bike.new
    subject.dock(new_bike)
    expect(subject.bikes.pop).to eq new_bike
  end

  it "gets a bike" do
    new_bike = Bike.new
    subject.dock(new_bike)
    expect(subject.release_bike).to be_kind_of(Bike)
  end


  it 'can accept more than 1 bike' do
    new_bike = Bike.new
    subject.dock(new_bike)
    new_bike2 = Bike.new
    subject.dock(new_bike2)
    expect(subject.bikes).to include(new_bike, new_bike2)
  end


  it "gets the bike that was docked before" do
    new_bike = Bike.new
    subject.dock(new_bike)
    expect(subject.release_bike).to eq new_bike
  end

  it "checks it is working" do
    new_bike = Bike.new
    expect(new_bike).to be_working
  end

  it "checks whether the value of DEFAULT_CAPACITY constant is 20" do
    expect(DockingStation::DEFAULT_CAPACITY).to eq 20
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

  end

  it "raises an error when you try to release a bike when there is none there" do
    expect { subject.release_bike }.to raise_error('No bikes available')
  end

  it 'Raises an error if you try to dock a bike in a station that already has 20 bikes in' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
    expect { subject.dock(Bike.new) }.to raise_error('Docking station full')
  end

end
