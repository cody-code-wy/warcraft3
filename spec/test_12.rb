require_relative 'spec_helper'

# Units that can fight, such as the Footman, have both health points to indicate their health and attack power to indicate how much damage they deal to other units
# As such, they must start off with a certain amount of each

describe Unit do

  before :each do
    @unit = Unit.new(10,10)
  end

  describe "#dead?" do

   it "New unit should be alive" do
     expect(@unit.dead?).to be_falsy
   end

   it "Units with more than 0 health should be alive" do
     expect(@unit).to receive(:health_points) { 1 }
     expect(@unit.dead?).to be_falsy
   end

   it "Units with 0 health shoud be dead" do
     expect(@unit).to receive(:health_points) { 0 }
     expect(@unit.dead?).to be_truthy
   end

   it "Units with less than 0 health should be dead" do
     expect(@unit).to receive(:health_points) { -500 }
     expect(@unit.dead?).to be_truthy
   end

  end

   describe "#attack!" do

     before :each do
       @dead = Unit.new(0,0)
     end

     it "dead units should not attack" do
       expect(@unit).to_not receive(:damage)
       @dead.attack!(@unit)
     end

     it "units should not attack dead units" do
       expect(@dead).to_not receive(:damage)
       @unit.attack!(@dead)
     end

   end

end

describe Footman do

  before :each do
    @dead_unit = Unit.new(0,0)
    @unit = Unit.new(10,10)
    @footman = Footman.new
    @dead_footman = Footman.new
    @dead_footman.damage(60)
  end

  describe "#dead?" do

    it 'Footman should be alive' do
      expect(@footman.dead?).to be_falsy
    end

    it 'Footman should be dead after taking damage' do
      expect(@dead_footman.dead?).to be_truthy
    end

  end

  describe "#attack!" do

    it 'Dead footman should not attack' do
      expect(@unit).to_not receive(:damage)
      @dead_footman.attack!(@unit)
    end

    it 'footman should not attack dead units' do
      expect(@dead_unit).to_not receive(:damage)
      @footman.attack!(@unit)
    end

    it 'footman should not attack dead footman' do
      expect(@dead_footman).to_not receive(:damage)
      @footman.attack!(@dead_footman)
    end

    it 'dead footman should not attack footman' do
      expect(@footman).to_not receive(:damage)
      @dead_footman.attack!(@footman)
    end

  end

end
