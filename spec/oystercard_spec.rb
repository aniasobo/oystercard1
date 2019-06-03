require "oystercard"
describe OysterCard do
  it 'confirms its existence'do
    expect(subject).to be
  end
  it 'is initilized with a default balance'do
    oyster = OysterCard.new()
    expect(oyster).to have_attributes(:balance => 10)
  end
  describe '#top_up' do
    it 'can be topped up' do
      expect(subject.top_up(10)).to eq (20)
    end
  end
end
