require 'active_record'

module Model
  attr_accessor :id

  def initialize(id = nil)
    @id=id
  end

  def hash(values_array)
    values_array
        .reduce(17) { |current, next_value| current+37*next_value.hash }
  end

end
