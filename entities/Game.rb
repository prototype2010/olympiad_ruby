require_relative '../db/Model'

class Game < Model

  def initialize(csv_row_hash)
    super()
    @year = csv_row_hash["year"]
    @season = csv_row_hash["season"]
    @city = csv_row_hash["city"]
  end

  def hash
    super([@year, @season, @city])
  end

end
