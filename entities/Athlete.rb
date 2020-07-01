require_relative '../db/Model'

class Athlete < Model
  alias eql? ==

  attr_accessor :team_id

  def initialize(csv_row_hash)
    super()
    @full_name = csv_row_hash["full_name"]
    @sex = csv_row_hash["sex"]
    @year_of_birth = csv_row_hash["year_of_birth"]
    @params = Hash.new
    @team_id = nil
    if csv_row_hash['height']
      @params["height"] = csv_row_hash['height']
    end
    if csv_row_hash['weight']
      @params["weight"] = csv_row_hash['weight']
    end
  end

  def to_s
    "#{@id} #{@full_name}#{@sex}#{@team_id}#{@year_of_birth}#{@params}"
  end

  def <=>(other)
    if other is_a? Athlete
      @year_of_birth == other.year_of_birth &&
          @sex == other.sex &&
          @full_name == other.full_name
    else
      nil
    end
  end

  def ==(other)
    if other is_a? Athlete
      @year_of_birth == other.year_of_birth &&
          @sex == other.sex &&
          @full_name == other.full_name
    else
      nil
    end
  end

  def hash
    code = 17
    code = 37*code + @year_of_birth.hash
    code = 37*code + @sex.hash

    h=37*code + @full_name.hash
    puts h
    h
  end

end
