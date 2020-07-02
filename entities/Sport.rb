require_relative '../db/Model'

class Sport
  include Model

  def initialize(csv_row_hash)
    @name = csv_row_hash["sport"]
  end

  def hash
    super([@name])
  end

  def create
    Sport.create(id: @id, name: @name)
  end

end
