require 'json'
require 'rest_client'

require 'trail/version'

# Trail is a gem that works with Testrail projects
module Trail
  autoload :Config, 'trail/config'
  autoload :Client, 'trail/client'

  autoload :Response,      'trail/response'
  autoload :RequestSender, 'trail/request_sender'

  # General Errors module for Trail gem
  module Errors
    autoload :Error,              'trail/errors/error'
    autoload :UninitializedError, 'trail/errors/uninitialized_error'
  end

  class << self
    attr_accessor :config

    def configure
      self.config ||= Trail::Config.new
      yield(config)
    end
  end
end
