require "oystercard"
describe OysterCard do
  it 'confirms its existence'do
    expect(subject).to be
  end
  it 'is initilized with a default balance'do
    oyster = OysterCard.new()
    expect(oyster).to have_attributes(:balance => 10)
  end
end
