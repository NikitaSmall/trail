module Trail
  # Main configuration class,
  # it holds base configuration required for Testrail integration
  class Config
    CONFIG_FIELDS = %i[base_url username password yaml_file].freeze

    CONFIG_FIELDS.each do |config_field|
      define_method(config_field) do
        field = instance_variable_get("@#{config_field}")
        raise Trail::Errors::UninitializedError, config_field if field.nil?

        field
      end

      define_method("#{config_field}=".to_sym) do |value|
        instance_variable_set("@#{config_field}", value)
      end
    end
  end
end
