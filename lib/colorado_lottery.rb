class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    contestant.age >= 18 && contestant.game_interests.include?(game.name)
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game) && (game.national_drawing? || !contestant.out_of_state?)
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game)
      if @registered_contestants[game.name].nil?
        @registered_contestants[game.name] = []
      end
      @registered_contestants[game.name] << contestant
    end
  end

  def eligible_contestants(game)
    contestants = @registered_contestants[game.name]

    contestants.find_all do |contestant|
      contestant.spending_money > game.cost
    end
  end

  def charge_contestants(game)
    contestants = eligible_contestants(game)

    contestants.each do |contestant|
      contestant.charge(game)

      if current_contestants[game].nil?
        current_contestants[game] = []
      end

      @current_contestants[game] << contestant.full_name
    end
  end
end
