# frozen_string_literal: true

module Auth0
  module Internal
    module Http
      # Rate limit information parsed from the `x-ratelimit-*` headers Auth0
      # returns on Management API responses.
      #
      # @see https://auth0.com/docs/troubleshoot/customer-support/operational-policies/rate-limit-policy
      class RateLimit
        # @return [Integer, nil] the maximum number of requests allowed in the current window
        attr_reader :limit
        # @return [Integer, nil] the number of requests remaining in the current window
        attr_reader :remaining
        # @return [Time, nil] the UTC time at which the current window resets
        attr_reader :reset

        # @param limit [Integer, nil]
        # @param remaining [Integer, nil]
        # @param reset [Time, nil]
        def initialize(limit:, remaining:, reset:)
          @limit = limit
          @remaining = remaining
          @reset = reset
        end

        # Build a RateLimit from an HTTP response. Header lookups are
        # case-insensitive (delegated to the response), and missing or
        # non-numeric values become nil rather than a misleading 0.
        #
        # @param response [Net::HTTPResponse] anything responding to `[]` with header access
        # @return [Auth0::Internal::Http::RateLimit]
        def self.from_response(response)
          reset = to_integer(response["x-ratelimit-reset"])

          new(
            limit: to_integer(response["x-ratelimit-limit"]),
            remaining: to_integer(response["x-ratelimit-remaining"]),
            reset: reset.nil? ? nil : Time.at(reset).utc
          )
        end

        def self.to_integer(value)
          Integer(value.to_s.strip, exception: false)
        end
        private_class_method :to_integer
      end
    end
  end
end
