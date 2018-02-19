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

      FULL_URL = '%{base_url}%{api_path}%{url}'.freeze

      def prepare_full_url(url)
        format(FULL_URL, base_url: Trail.config.base_url,
                         url: url, api_path: Trail.config.api_path)
      end

      def transform_payload_to_get(url, payload)
        payload.reduce("#{url}?") do |result_url, (parameter_name, parameter_value)|
          "#{result_url}#{parameter_name}=#{parameter_value}&"
        end.chomp('&')
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
