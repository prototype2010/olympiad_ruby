require_relative './SanitizeConfigResolver'

round_brackets_sanitizer = lambda { |value| value.gsub(/(\(.*\))/, '') }
double_quotes_sanitizer = lambda { |value| value.gsub(/"\(.*\)"/, '') }
team_name_sanitizer = lambda { |value| value.gsub(/-[0-9]*/, '') }
medal_sanitizer = lambda do |value|
  case value
  when '1'
    'gold'
  when '2'
    'silver'
  when '3'
    'bronze'
  else
    'n/a'
  end
end


VALUES_SANITIZER = SanitizeConfigResolver.new({
                                                  name: [round_brackets_sanitizer,
                                                         double_quotes_sanitizer],
                                                  medal: [medal_sanitizer],
                                                  team: [team_name_sanitizer],
                                              })





