require_relative '../db/Model'

class Sport < Model

  def initialize(csv_row_hash)
    super()
    @name = csv_row_hash["sport"]
  end

end
