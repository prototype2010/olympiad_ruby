class HashRegister

  attr_reader :set

  def initialize
    @set = Hash.new
  end

  def register(entity)
    if @set.key?("#{entity.hash}")
      @set["#{entity.hash}"]
    else
      @set["#{entity.hash}"] = entity
    end
  end
end
