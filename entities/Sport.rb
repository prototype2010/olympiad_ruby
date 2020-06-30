require_relative '../db/model'

class Sport < Model

  def initialize(csv_row_hash)
    @name = csv_row_hash["sport"]
  end

end
