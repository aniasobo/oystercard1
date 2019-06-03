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
    it 'can be toped up max 90 pounds'do
    num = 81
    expect { subject.top_up(num) }.to raise_error("Value #{num} to high. Cannot top-up to more than #{OysterCard::MAX_VALUE}")
    end
  end
  describe '#deduct' do
    it 'deducts the fare from the balance and returns new balance' do
      oyster = OysterCard.new(50)
      new_balance = oyster.deduct(10)
      expect(new_balance).to eq(40)
    end

  end
end
