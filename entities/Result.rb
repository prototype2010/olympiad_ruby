require_relative '../db/Model'

class Result < Model
  attr_accessor :athlete_id, :game_id, :sport_id, :event_id

  def initialize(csv_row_hash)
    @medal = csv_row_hash["medal"]
    @athlete_id = nil
    @game_id = nil
    @sport_id = nil
    @event_id = nil
  end

  def to_s
    "INSERT INTO results values (#{@id},#{@athlete_id},#{@game_id},#{@sport_id},#{@event_id},#{@medal})"
  end

  def hash
    self.object_id
  end

end
