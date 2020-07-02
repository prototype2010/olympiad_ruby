require_relative '../db/Model'

class Athlete
  include Model

  attr_accessor :team_id

  def initialize(csv_row_hash)
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

  def create
    Athlete.create(id: @id, full_name: @full_name, year_of_birth: @year_of_birth, sex: @sex, params: @params.to_s, team_id: @team_id)
  end

  def hash
    super([@year_of_birth,@sex, @full_name])
  end
end
