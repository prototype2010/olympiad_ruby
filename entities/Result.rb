require_relative '../db/Model'

class Result < ActiveRecord::Base
  include Model
  attr_accessor :athlete_id, :game_id, :sport_id, :event_id

  def initialize(csv_row_hash)
    @medal = csv_row_hash["medal"]
    @athlete_id = nil
    @game_id = nil
    @sport_id = nil
    @event_id = nil
  end

  def create
    Result.create(id: @id, athlete_id: @athlete_id, game_id: @game_id, sport_id: @sport_id, event_id: @event_id, medal: @medal)
  end

  def hash
    self.object_id
  end

end
