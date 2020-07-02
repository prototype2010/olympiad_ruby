require_relative '../db/Model'

class Sport < Model

  def initialize(csv_row_hash)
    @name = csv_row_hash["sport"]
  end

  def hash
    super([@name])
  end

  def to_s
    "INSERT INTO sports values (#{@id},'#{@name}')"
  end


end
