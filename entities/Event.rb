require_relative '../db/model'

class Event < Model

  def initialize(csv_row_hash)
    @event = csv_row_hash["event"]
  end
end
