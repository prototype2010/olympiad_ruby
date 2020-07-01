require_relative './SanitizeConfigResolver'
require_relative '../entities/Athlete'
require_relative '../entities/Event'
require_relative '../entities/Game'
require_relative '../entities/Result'
require_relative '../entities/Sport'
require_relative '../entities/Team'

ENTITIES_CONFIG = SanitizeConfigResolver.new([Athlete, Event, Game, Result, Sport, Team])
