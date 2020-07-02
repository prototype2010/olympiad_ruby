require_relative '../db/Model'

class Game < Model

  def initialize(csv_row_hash)
    @year = csv_row_hash["year"]
    @season = csv_row_hash["season"]
    @city = csv_row_hash["city"]
  end

  def to_s
    "INSERT INTO games values (#{@id},#{@year},#{@season},'#{@city}')"
  end

  def hash
    super([@year, @season, @city])
  end

end
