# frozen_string_literal: true

module Auth0
  module Internal
    module Http
      # Thin wrapper around the underlying HTTP response that adds rate limit
      # information while delegating everything else (e.g. `#code`, `#body`,
      # header access via `#[]`) to the wrapped response. Existing callers that
      # use `.code`/`.body` are unaffected.
      class RawResponse
        # @return [Auth0::Internal::Http::RateLimit] rate limit parsed from the response headers
        attr_reader :rate_limit

        # @param response [Net::HTTPResponse] the wrapped response
        def initialize(response)
          @response = response
          @rate_limit = RateLimit.from_response(response)
        end

        # @return [String] the HTTP status code
        def code
          @response.code
        end

        # @return [String, nil] the response body
        def body
          @response.body
        end

        # @return [String, nil] header access, delegated to the wrapped response
        def [](name)
          @response[name]
        end

        # Delegate anything else to the wrapped response.
        def method_missing(name, *, &)
          return @response.send(name, *, &) if @response.respond_to?(name)

          super
        end

        def respond_to_missing?(name, include_private = false)
          @response.respond_to?(name, include_private) || super
        end
      end
    end
  end
end
