require 'spec_helper'
require 'oystercard'

describe OysterCard do
  it 'is initilized with a default balance, nil station and empty history' do
    oyster = OysterCard.new
    expect(oyster).to have_attributes(:balance => 10, :entry_station => nil, :history => [], :exit_station => nil, :journey => {})
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
    it 'can be assigned a station on touch in' do
      oyster = OysterCard.new
      expect(oyster.touch_in('Camden')).to eq 'Camden'
    end

    context 'testing station assignment' do
      before(:each) do
        @oyster = OysterCard.new
        @oyster.touch_in('Camden')
      end

      it 'changes statation to nil with touch_out' do
        expect(@oyster.touch_out('Euston')).to be_nil
      end

      it 'adds exit station to journey' do
        @oyster.touch_out('Euston')
        expect(@oyster.save_journey).to be_nil
      end

      it 'raises error if touched in while in journey' do
        expect { @oyster.touch_in('Euston') }.to raise_error('Card already in use')
      end
    end

    context 'tests minimum fare' do
      before(:each) do
        @oyster = OysterCard.new(1)
      end

      it 'checks if the card has enough balance for a fare' do
        @oyster.deduct(1)
        expect { @oyster.touch_in('Euston') }.to raise_error('Not enough for a fare.')
      end

      it 'raises error if touched out while not in journey' do
        expect { @oyster.touch_out('Aldgate') }.to raise_error('You already touched out.')
      end

      it 'deducts minimum fare on touch out' do
        @oyster.deduct(1)
        expect(@oyster.display_balance).to eq 0
      end
    end
  end
end
