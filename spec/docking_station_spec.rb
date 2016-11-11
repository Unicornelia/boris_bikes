require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }

  it 'can accept bikes' do
    expect(subject).to respond_to(:bike)
  end

it 'can dock a bike' do
  new_bike = Bike.new
  subject.dock(new_bike)
  expect(subject.bike).to eq new_bike
end

  it "gets a bike" do
    new_bike = Bike.new
    subject.dock(new_bike)
    expect(subject.release_bike).to be_kind_of(Bike)
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

  it "raises an error when you try to release a bike when there is none there" do
    expect { subject.release_bike }.to raise_error('No bikes available')
  end

  it 'raises an error if you try to dock a bike in a station that already has a bike in' do
    bike = Bike.new
    subject.dock(bike)
    expect { subject.dock(Bike.new) }.to raise_error('Docking station full')
  end

end
