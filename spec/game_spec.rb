require "./lib/game"

RSpec.describe Game do
  it "exists" do
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)

    expect(pick_4).to be_instance_of Game
    expect(mega_millions).to be_instance_of Game
  end

  it "has a name" do
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)

    expect(pick_4.name).to eq('Pick 4')
    expect(mega_millions.name).to eq('Mega Millions')
  end

  it "can be played nationwide" do
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)

    expect(mega_millions.national_drawing?).to be true
    expect(pick_4.national_drawing?).to be false
  end
end
