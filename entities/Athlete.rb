require_relative '../db/model'

class Athlete < Model

  attr_accessor @team_id

  def initialize(csv_row_hash)
    @id=csv_row_hash["id"]
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
end
