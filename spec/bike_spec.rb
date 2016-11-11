require 'bike'
describe Bike do
  it { is_expected.to respond_to "working?"}

  it "checks it is working" do
    new_bike = Bike.new
    expect(new_bike).to be_working
  end
  
end
