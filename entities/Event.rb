require_relative '../db/Model'

class Event < Model

  def initialize(csv_row_hash)
    @event = csv_row_hash["event"]
  end

  def table_name
    'events'
  end

  def ==(other)
    if other is_a? Event
      @event == other.event
    else
      false
    end
  end

  def values
    "(#{@id},#{@event})"
  end

  def to_s
    "INSERT INTO #{table_name} values #{values};"
  end


  def hash
    super([@event])
  end
end
