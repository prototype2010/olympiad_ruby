require 'csv'
require_relative './configs/structure_config'
require_relative './configs/values_config'
require_relative './configs/entities_config'
require_relative './utils/HashRegister'
require_relative './db/db_connection'
require_relative './entities/Sport'

def parse_csv(filename)
  CSV.parse(File.read(filename), headers: :first_row)
end

def apply_structure_config(csv_hash_array, structure_config)
  structure_config
      .config
      .inject(csv_hash_array) { |csv_rows, sanitize_lambda| csv_rows.map &sanitize_lambda }
end

def apply_values_sanitizer(csv_hash_array, values_config)
  csv_hash_array
      .map do |csv_row_hash|
    csv_row_hash
        .each do |key, value|
      csv_row_hash[key] = values_config[key.to_sym]
                              .inject(value) { |current_value, value_sanitizer| value_sanitizer.call(current_value) }
    end
  end
end

def map_rows_to_entities(csv_rows_array, entities_config, hash_register = HashRegister.new)
  entities_mapped_to_rows = csv_rows_array
                                .map do |csv_row|
    entities_config
        .config
        .map { |entity| hash_register.register(entity.new(csv_row)) }
  end

  [entities_mapped_to_rows, hash_register]
end

def set_ids_to_entities(hash_register)
  hash_register
      .set
      .values
      .each_with_index { |entity, index| entity.id = index + 1 }
end

def link_entities_ids(csv_rows_entities)
  csv_rows_entities
      .each do |athlete, event, game, sport, team, result|

    athlete.team_id = team.id

    result.athlete_id = athlete.id
    result.game_id = game.id
    result.sport_id = sport.id
    result.event_id = event.id
  end
end

def split_to_groups(csv_rows_entities)
  csv_rows_entities
      .group_by(&:class)
end

#parsed_file = parse_csv('athlete_events_small.csv')
parsed_file = parse_csv('athlete_events.csv')
restructured_file = apply_structure_config(parsed_file, STRUCTURE_CONFIG)
sanitized_values = apply_values_sanitizer(restructured_file, VALUES_SANITIZER)

entities_mapped_to_rows, hash_register = map_rows_to_entities(sanitized_values, ENTITIES_CONFIG)

set_ids_to_entities(hash_register)

link_entities_ids(entities_mapped_to_rows)


ActiveRecord::Base.connection.tables.each do |table_name|
  #puts table_name
  #ActiveRecord::Base.connection.columns(table_name).each do |c|
  #  puts "- #{c.name}: #{c.type} #{c.limit}"
  #end
  #
  ActiveRecord::Base.connection.truncate(table_name)
end

entities_mapped_to_rows
    .flatten
    .group_by(&:table_name)
    .each do |table_name, entities_array|
  entities_array
      .uniq { |entity| entity.hash }
      .each_slice(100) do |entities_slice_array|
    begin
      ActiveRecord::Base.connection.execute("INSERT INTO #{table_name} VALUES #{entities_slice_array.map(&:values).join(',')}")
    rescue
      puts "INSERT INTO #{table_name} VALUES #{entities_slice_array.map(&:values).join(',')}"
    end
  end
end

#puts ActiveRecord::Base.connection.execute('SELECT * FROM athletes')
