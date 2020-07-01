require_relative '../db/Model'

class Event < Model

  def initialize(csv_row_hash)
    super()
    @event = csv_row_hash["event"]
  end

  def ==(other)
    if other is_a? Event
      @event == other.event
    else
      false
    end
  end

  def hash
    super([@event])
  end
end
