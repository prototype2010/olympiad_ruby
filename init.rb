require_relative './configs/structure_config'
require_relative './configs/values_config'
require 'csv'


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

parsed_file = parse_csv('athlete_events_small.csv')
restructured_file = apply_structure_config(parsed_file, STRUCTURE_CONFIG)
sanitized_values = apply_values_sanitizer(restructured_file, VALUES_SANITIZER)

puts sanitized_values





