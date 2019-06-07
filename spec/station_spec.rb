require 'spec_helper'
require 'station'

describe Station do
  it 'is initialized with two attributes' do
    station = Station.new('some station')
    expect(station).to have_attributes(:name => 'some station', :zone => nil)
  end
end
