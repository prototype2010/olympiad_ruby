require 'csv'

rows_array = CSV.parse(File.read('athlete_events_small.csv'), headers: :first_row).map do |csvRow|
  csv_row_hash = csvRow.to_hash

  down_case_keys = Hash.new

  csv_row_hash.each_key do |key|
    down_case_keys[key.downcase] = csv_row_hash[key];
  end

  down_case_keys
end

rows_array
