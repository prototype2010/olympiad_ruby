require_relative './SanitizeConfigResolver'


escape_sanitizer = lambda { |value| value.dump }
round_brackets_sanitizer = lambda { |value| value.gsub(/(\(.*\))/, '') }
double_quotes_sanitizer = lambda { |value| value.gsub(/".*"/, '') }
useless_double_quotes = lambda { |value| value.gsub(/"/, '\'') }
team_name_sanitizer = lambda { |value| value.gsub(/-[0-9]*/, '') }
medal_sanitizer = lambda do |value|
  case value
  when 'gold'
    1
  when 'silver'
    2
  when 'bronze'
    3
  else
    0
  end
end
season_sanitizer = lambda { |value| value.downcase == 'summer' ? 0 : 1 }
sex_sanitizer = lambda { |value| value.downcase == 'M' ? 0 : 1 }

VALUES_SANITIZER = SanitizeConfigResolver.new({
                                                  full_name: [round_brackets_sanitizer,
                                                              useless_double_quotes,
                                                              double_quotes_sanitizer,
                                                              escape_sanitizer],
                                                  medal: [medal_sanitizer],
                                                  team: [team_name_sanitizer, escape_sanitizer],
                                                  season: [season_sanitizer],
                                                  sex: [sex_sanitizer],
                                                  event: [escape_sanitizer],
                                                  city: [escape_sanitizer],
                                                  country: [escape_sanitizer],
                                                  sport: [escape_sanitizer],
                                                  noc_name: [escape_sanitizer],
                                              })





