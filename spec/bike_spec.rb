require 'bike'

describe Bike do

  describe '#working?' do

    it { is_expected.to respond_to "working?"}

    it "returns true if the bike is working" do
      subject.working=(true)
      expect(subject.working?).to eq true
    end

    it 'returns false if the bike is not working' do
      subject.working=(false)
      expect(subject.working?).to eq false
    end

  end

  describe '#report' do

    it 'changes the working status of a bike to "broken"' do
      subject.broken
      expect(subject.working?).to eq false
    end

  end

end
