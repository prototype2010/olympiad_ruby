require_relative '../db/model'

class Result < Model

  attr_accessor @athlete_id, @game_id, @sport_id, @event_id

  def initialize(csv_row_hash)
    @medal=csv_row_hash["medal"]
    @athlete_id=nil
    @game_id=nil
    @sport_id=nil
    @event_id=nil
  end
end
