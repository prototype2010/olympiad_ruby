require_relative '../db/Model'

class Athlete < Model

  attr_accessor :team_id

  def initialize(csv_row_hash)
    super()
    @full_name = csv_row_hash["full_name"]
    @sex = csv_row_hash["sex"]
    @year_of_birth = csv_row_hash["year_of_birth"]
    @params = Hash.new
    @team_id = nil
    if csv_row_hash['height']
      @params["height"] = csv_row_hash['height']
    end
    if csv_row_hash['weight']
      @params["weight"] = csv_row_hash['weight']
    end
  end

  def to_s
    "#{@id} #{@full_name}#{@sex}#{@team_id}#{@year_of_birth}#{@params}"
  end

end
