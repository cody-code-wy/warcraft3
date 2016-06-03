require_relative 'spec_helper'

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  it 'should be a unit' do
    expect(@siege_engine).to be_a(Unit)
  end

  it 'should have and know its own healht' do
    expect(@siege_engine.health_points).to be(400)
  end

  it 'should have and know its own attack points' do
    expect(@siege_engine.attack_power).to be(50)
  end

  describe '#attack' do

    before :each do
      @unit = Footman.new
      @siege_enemy = SiegeEngine.new
      @barracks = Barracks.new
    end

    it 'should not damage other units' do
      expect(@unit).to receive(:damage).with(0)
      @siege_engine.attack!(@unit)
    end

    it 'should damage siege untis' do
      expect(@siege_enemy).to receive(:damage).with(50)
      @siege_engine.attack!(@siege_enemy)
    end

    it 'should do 2x damage to barracks' do
      expect(@barracks).to receive(:damage).with(100)
      @siege_engine.attack!(@barracks)
    end

  end

end
