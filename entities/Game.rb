require_relative '../db/Model'

class Game
  include Model

  def initialize(csv_row_hash)
    @year = csv_row_hash["year"]
    @season = csv_row_hash["season"]
    @city = csv_row_hash["city"]
  end

  def create
    Game.create(id: @id, year: @year, season: @season, city: @city)
  end

  def hash
    super([@year, @season, @city])
  end

end
