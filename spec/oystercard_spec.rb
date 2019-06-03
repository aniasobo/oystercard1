require "oystercard"

describe OysterCard do

  it 'confirms its existence'do
    expect(subject).to be
  end

  it 'is initilized with a default balance and state not_in_journey'do
    oyster = OysterCard.new()
    expect(oyster).to have_attributes(:balance => 10, :state => "not in journey")
  end

  it "returns false if state not_in_journey" do
    state = double('state')
    allow(state).to receive(:in_journey?).and_return(false)
    oyster = OysterCard.new(state: state)
    expect(oyster.in_journey?).to be(false)
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

  describe '#touch_in and #touch_out' do

    it 'changes state from in journey to not in journey with touch_out' do
      oyster = OysterCard.new
      oyster.touch_in
      expect(oyster.touch_out).to eq('not in journey')
    end

    it 'raises error if touched in while in journey' do
      oyster = OysterCard.new
      oyster.touch_in
      expect { oyster.touch_in }.to raise_error("Card already in journey")
    end

    it 'raisees error if touched out while not in journey' do
      oyster = OysterCard.new
      expect { oyster.touch_out }.to raise_error("Card already not in journey")
    end
  end

end
