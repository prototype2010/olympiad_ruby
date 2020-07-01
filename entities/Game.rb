require_relative '../db/Model'

class Game < Model

  def initialize(csv_row_hash)
    super()
    @year = csv_row_hash["year"]
    @season = csv_row_hash["season"]
    @city = csv_row_hash["city"]
  end

  def ==(other)
    if other is_a? Game
      @year == other.year &&
          @season == other.season &&
          @city == other.city
    else
      false
    end
  end
end
