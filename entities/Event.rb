require_relative '../db/Model'

class Event < Model

  def initialize(csv_row_hash)
    super()
    @event = csv_row_hash["event"]
  end
end
