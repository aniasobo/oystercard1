require 'oystercard'

describe OysterCard do

  it 'is initilized with a default balance and state not_in_journey' do
    oyster = OysterCard.new
    expect(oyster).to have_attributes(:balance => 10, :state => 'not in journey')
  end

  it 'returns false if state not_in_journey' do
    state = double('state')
    allow(state).to receive(:in_journey?).and_return(false)
    oyster = OysterCard.new(state: state)
    expect(oyster.in_journey?).to be(false)
  end 

  describe '#top_up' do

    it 'can be topped up' do
      expect(subject.top_up(10)).to eq 20
    end
    
    it 'can be toped up max 90 pounds' do
      num = 81
      expect { subject.top_up(num) }.to raise_error("Value #{num} to high. Cannot top-up to more than #{OysterCard::MAX_VALUE}")
    end
  end

  describe '#deduct' do
    it 'deducts the fare from the balance and returns new balance' do
      oyster = OysterCard.new(50)
      expect(oyster.deduct(10)).to eq(40)
    end
  end

  describe '#touch_in and #touch_out' do
    before(:each) do
      @oyster = OysterCard.new(1)
    end

    it 'changes state from in journey to not in journey with touch_out' do
      @oyster.touch_in
      expect(@oyster.touch_out).to eq('not in journey')
    end

    it 'raises error if touched in while in journey' do
      @oyster.touch_in
      expect { @oyster.touch_in }.to raise_error('Card already in journey')
    end

    it 'raises error if touched out while not in journey' do
      expect { @oyster.touch_out }.to raise_error('Card already not in journey')
    end

    it 'checks if the card has enough balance for a fare' do
      @oyster.deduct(1)
      expect { @oyster.touch_in }.to raise_error('Not enough for a fare.')
    end

    it 'deducts minimum fare on touch out' do
      @oyster.deduct(1)
      expect(@oyster.display_balance).to eq 0
    end

    it 'raises error if trying to touch in with insufficient funds' do
      allow(@oyster).to receive(:enough_money?).and_return(false)
      expect { @oyster.touch_in }.to raise_error('Not enough for a fare.')
    end
  end
end
