require_relative './Model'

class Athlete < Model

  attr_writer @team_id

  def initialize(csv_row_hash)
    @full_name = csv_row_hash["full_name"]
    @sex = csv_row_hash["sex"]
    @year_of_birth = csv_row_hash["year_of_birth"]
    @params = Hash.new
    if csv_row_hash['height']
      @params["height"] = csv_row_hash['height']
    end
    if csv_row_hash['weight']
      @params["weight"] = csv_row_hash['weight']
    end
    @team_id = nil
  end
end
