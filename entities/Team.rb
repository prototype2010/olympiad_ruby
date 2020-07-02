require_relative '../db/Model'

class Team
  include Model

  def initialize(csv_row_hash)
    @name = csv_row_hash["team"]
    @noc_name = csv_row_hash["noc_name"]
  end

  def create
    Sport.create(id: @id, name: @name, noc_name: @noc_name)
  end

  def hash
    super([@name, @noc_name])
  end

end
