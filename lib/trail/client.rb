module Trail
  # Client class sends requests to the Testrail API
  class Client
    class << self
      def get(url, payload)
        res = send_request(:get, transform_payload_to_get(prepare_full_url(url), payload))
        Trail::Response.new(res)
      end

      def post(url, payload)
        res = send_request(:post, prepare_full_url(url), payload)
        Trail::Response.new(res)
      end

      private

      FULL_URL = '%{base_url}%{url}'.freeze

      def prepare_full_url(url)
        format(FULL_URL, base_url: Trail.config.base_url, url: url)
      end

      def transform_payload_to_get(url, payload)
        payload.reduce("#{url}?") do |result_url, parameter|
          "#{result_url}#{parameter[0]}=#{parameter[1]}&"
        end[0...-1]
      end

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
end
