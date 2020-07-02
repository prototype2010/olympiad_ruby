require_relative '../db/Model'

class Team < Model

  def initialize(csv_row_hash)
    @name = csv_row_hash["team"]
    @noc_name = csv_row_hash["noc_name"]
  end

  def to_s
    "INSERT INTO teams values (#{@id},'#{@name}','#{@noc_name}')"
  end

  def hash
    super([@name, @noc_name])
  end

end
