require_relative '../db/Model'

class Sport < Model

  def initialize(csv_row_hash)
    @name = csv_row_hash["sport"]
  end

  def table_name
    'sports'
  end

  def hash
    super([@name])
  end

  def values
    "(#{@id},#{@name})"
  end

  def to_s
    "INSERT INTO sports values #{values};"
  end


end
