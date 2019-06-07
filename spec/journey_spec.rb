require 'spec_helper'
require 'journey'

describe Journey do
  before(:each) do
    @journey = Journey.new('Camden')
  end
  it 'is initialized with one argument' do
    expect(@journey).to have_attributes(:entry_station => 'Camden', :exit_station => nil)
  end

  it 'takes exit station and assigns it to an instace variable' do
    expect(@journey.add_exit('Aldgate')).to eq 'Aldgate'
  end

end