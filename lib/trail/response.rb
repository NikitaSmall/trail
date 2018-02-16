module Trail
  # Wrapper object that stores API response
  class Response
    attr_reader :data

    def initialize(response, json: true)
      @data = json ? JSON.parse(response.body) : response
      @res = response
    end

    def code
      @res.code
    end
  end
end
