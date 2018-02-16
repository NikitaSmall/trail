module Trail
  module Errors
    # Error that occurs when some configuration value wasn't initialized
    class UninitializedError < Trail::Errors::Error
      MESSAGE = 'Field `%{field_name}` was not initialized during setup.'.freeze

      def initialize(field_name)
        super(format(MESSAGE, field_name: field_name))
      end
    end
  end
end
