require_relative '../db/model'

class Game < Model

  def initialize(csv_row_hash)
    @year = csv_row_hash["year"]
    @season = csv_row_hash["season"]
    @city = csv_row_hash["city"]
  end

end
