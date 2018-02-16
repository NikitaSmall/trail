module Trail
  # Auxiliary module that stores main request menthod
  module RequestSender
    def send_request(method, url, payload = nil)
      RestClient::Request.execute(
        method: method, payload: payload, url: url,
        user: Trail.config.username, password: Trail.config.password
      )
    rescue RestClient::Exception => e
      raise Trail::Errors::Error, e
    end
  end
end
