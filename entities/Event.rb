require_relative '../db/Model'

class Event
  include Model

  def initialize(csv_row_hash)
    @event = csv_row_hash["event"]
  end

  def ==(other)
    if other is_a? Event
      @event == other.event
    else
      false
    end
  end

  def create
    Event.create(id: @id, name: @event)
  end

  def hash
    super([@event])
  end
end
