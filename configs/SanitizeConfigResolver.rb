class SanitizeConfigResolver

  def initialize(config)
    @config = config
  end

  attr_reader :config

  def [](prop_name)
    if (@config.has_key?(prop_name.to_sym)) then
      @config[prop_name]
    else
      []
    end
  end
end



