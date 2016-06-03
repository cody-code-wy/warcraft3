require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it 'Should have and know its own lumber ammount' do
    expect(@barracks.lumber).to be(500)
  end

  describe "#train_siege_engine" do

    it 'costs 200 gold' do
      @barracks.train_siege_engine
      expect(@barracks.gold).to eq(800)
    end

    it 'costs 3 food' do
      @barracks.train_siege_engine
      expect(@barracks.food).to eq(77)
    end

    it 'costs 60 lumber' do
      @barracks.train_siege_engine
      expect(@barracks.lumber).to eq(440)
    end

    it 'returns siege engine' do
      expect(@barracks.train_siege_engine).to be_a(SiegeEngine)
    end

  end

  describe '#can_train_siege_engine?' do

    it 'returns true if there is enough resources to train siege engine' do
      expect(@barracks.can_train_siege_engine?).to be_truthy
    end

    it 'returns false if there is not enough gold' do
      expect(@barracks).to receive(:gold) { 1 }
      expect(@barracks.can_train_siege_engine?).to be_falsy
    end

    it 'returns false if there is not enough food' do
      expect(@barracks).to receive(:food) { 1 }
      expect(@barracks.can_train_siege_engine?).to be_falsy
    end

    it 'returns false if there is not enough lumber' do
      expect(@barracks).to receive(:lumber) { 1 }
      expect(@barracks.can_train_siege_engine?).to be_falsy
    end

  end
end
