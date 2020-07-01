require_relative '../db/Model'

class Result < Model

  attr_accessor :athlete_id, :game_id, :sport_id, :event_id

  def initialize(csv_row_hash)
    super()
    @medal = csv_row_hash["medal"]
    @athlete_id = nil
    @game_id = nil
    @sport_id = nil
    @event_id = nil
  end

  def ==(other)
    if other is_a? Game
      @medal == other.medal &&
          @athlete_id == other.athlete_id &&
          @game_id == other.game_id &&
          @sport_id == other.sport_id &&
          @event_id == other.event_id
    else
      false
    end
  end
end
