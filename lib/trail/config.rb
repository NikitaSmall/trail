module Trail
  # Main configuration class,
  # it holds base configuration required for Testrail integration
  class Config
    attr_accessor :base_url, :username, :password, :yaml_file
  end
end
