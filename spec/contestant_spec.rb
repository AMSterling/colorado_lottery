require "./lib/contestant"
require "./lib/game"

RSpec.describe Contestant do
  before do
    @alexander = Contestant.new({ first_name: 'Alexander',
                                  last_name: 'Aigiades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10 })
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  it "is an instace of Contestant" do

    expect(@alexander).to be_instance_of Contestant
  end

  it "has a full name" do

    expect(@alexander.full_name).to eq('Alexander Aigiades')
  end

  it "has an age" do

    expect(@alexander.age).to eq(28)
  end

  it "tracks state residence" do

    expect(@alexander.state_of_residence).to eq('CO')
  end

  it "has spending money" do

    expect(@alexander.spending_money).to eq(10)
  end

  it "asks if a contestant is out of state" do

    expect(@alexander.out_of_state?).to be false
  end

  it "has interest in specific games" do

    expect(@alexander.game_interests).to eq([])

    @alexander.add_game_interest('Mega Millions')
    @alexander.add_game_interest('Pick 4')

    expect(@alexander.game_interests).to eq(["Mega Millions", "Pick 4"])
  end
end
