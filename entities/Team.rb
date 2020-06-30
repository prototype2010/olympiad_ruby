require_relative '../db/model'

class Athlete < Model
  def initialize(csv_row_hash)
    @name = csv_row_hash["team"]
    @noc_name = csv_row_hash["noc_name"]
  end
end
