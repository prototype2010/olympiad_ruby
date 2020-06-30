require_relative './SanitizeConfigResolver'

STRUCTURE_CONFIG = SanitizeConfigResolver.new([
                                                  ->(csv_row) { csv_row.to_hash },
                                                  ->(csv_row) { csv_row.transform_keys(&:downcase) },
                                                  ->(csv_row) do
                                                    csv_row["year_of_birth"] = csv_row["year"].to_i - csv_row["age"].to_i
                                                    csv_row
                                                  end,
                                                  ->(csv_row) do
                                                    csv_row["full_name"] = csv_row["name"]
                                                    csv_row
                                                  end,
                                                  ->(csv_row) do
                                                    csv_row["noc_name"] = csv_row["noc"]
                                                    csv_row
                                                  end
                                              ])

