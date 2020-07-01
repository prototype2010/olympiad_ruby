require 'csv'
require_relative './configs/structure_config'
require_relative './configs/values_config'
require_relative './configs/entities_config'

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

def map_rows_to_entities(csv_rows_array, entities_config)
  csv_rows_array
      .map do |csv_row|
    entities_config
        .config
        .map { |entity| entity.new(csv_row) }
  end
end

parsed_file = parse_csv('athlete_events_small.csv')
restructured_file = apply_structure_config(parsed_file, STRUCTURE_CONFIG)
sanitized_values = apply_values_sanitizer(restructured_file, VALUES_SANITIZER)
initialized_entities = map_rows_to_entities(sanitized_values, ENTITIES_CONFIG)

grouped_entities = initialized_entities
                       .flatten
                       .group_by(&:class)
                       .each do |class_name, entities_array|
  entities_array.each_with_index { |entity, index| entity.id = index + 1 }
end

puts grouped_entities





