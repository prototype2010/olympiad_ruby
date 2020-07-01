require_relative '../db/Model'

class Team < Model
  def initialize(csv_row_hash)
    super()
    @name = csv_row_hash["team"]
    @noc_name = csv_row_hash["noc_name"]
  end
end
