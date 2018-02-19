module Trail
  # Main configuration class,
  # it holds base configuration required for Testrail integration
  class Config
    CONFIG_FIELDS = %i[base_url api_path username password yaml_file].freeze

    CONFIG_FIELDS.each do |config_field|
      define_method(config_field) do
        instance_variable_get("@#{config_field}").tap do |field|
          raise Trail::Errors::UninitializedError, config_field if field.nil?
        end
      end

      define_method("#{config_field}=".to_sym) do |value|
        instance_variable_set("@#{config_field}", value)
      end
    end

    def initialize
      @api_path = '/index.php?/api/v2'
    end
  end
end
