require 'trail/version'

# Trail is a gem that works with Testrail projects
module Trail
  autoload :Config, 'trail/config'
  autoload :Client, 'trail/client'

  class << self
    attr_accessor :config

    def configure
      self.config ||= Trail::Config.new
      yield(config)
    end
  end
end
