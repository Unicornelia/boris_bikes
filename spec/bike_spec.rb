require 'bike.rb'

describe "Bike" do

  it "should respond to the working? method" do
    expect(Bike.new).to respond_to(:working?)
  end

end
