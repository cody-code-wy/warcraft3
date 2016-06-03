require_relative 'spec_helper'

# Units that can fight, such as the Footman, have both health points to indicate their health and attack power to indicate how much damage they deal to other units
# As such, they must start off with a certain amount of each

describe Footman do

  before :each do
    @footman = Footman.new
    @building = Barracks.new
  end

  it "has and knows its HP (health points)" do
    expect(@building.health_points).to eq(500)
  end

 it "Footman should do half attack damage against barracks" do
    @footman.attack!(@building)
    expect(@building.health_points).to eq(Barracks.new.health_points-@footman.attack_power/2)
  end

 it "Damage from footmant should be rounded up" do
   expect(@footman).to receive(:attack_power).and_return(5)
   expect(@building).to receive(:damage).with(3)
   @footman.attack!(@building)
 end


end
