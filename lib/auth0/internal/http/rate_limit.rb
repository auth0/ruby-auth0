# frozen_string_literal: true

module Auth0
  module Internal
    module Http
      # Rate limit information parsed from the `x-ratelimit-*` headers Auth0
      # returns on API responses.
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

        # Build from an object that exposes headers via `#[]` using the HTTP
        # header name (e.g. a `Net::HTTPResponse`, whose `#[]` is
        # case-insensitive). Used by the Management API (RawClient) path.
        #
        # @param response [#[]] responds to `[]` with header access
        # @return [Auth0::Internal::Http::RateLimit]
        def self.from_http_response(response)
          build(
            response["x-ratelimit-limit"],
            response["x-ratelimit-remaining"],
            response["x-ratelimit-reset"]
          )
        end

        # Build from a plain headers hash (e.g. RestClient's, whose keys are
        # symbols like `:x_ratelimit_remaining`). Keys are matched
        # case-insensitively and dash/underscore-agnostically. Used by the
        # Authentication API (HTTPProxy) path.
        #
        # @param headers [Hash, nil]
        # @return [Auth0::Internal::Http::RateLimit]
        def self.from_headers(headers)
          normalized = (headers || {}).each_with_object({}) do |(key, value), acc|
            acc[key.to_s.downcase.tr("-", "_")] = value
          end

          build(
            normalized["x_ratelimit_limit"],
            normalized["x_ratelimit_remaining"],
            normalized["x_ratelimit_reset"]
          )
        end

        # @return [Auth0::Internal::Http::RateLimit]
        def self.build(limit, remaining, reset)
          reset_epoch = to_integer(reset)

          new(
            limit: to_integer(limit),
            remaining: to_integer(remaining),
            reset: reset_epoch.nil? ? nil : Time.at(reset_epoch).utc
          )
        end
        private_class_method :build

        # Parse an integer header value, returning nil for blank or non-numeric
        # input (so a malformed header is never silently reported as 0).
        def self.to_integer(value)
          Integer(value.to_s.strip, exception: false)
        end
        private_class_method :to_integer
      end
    end
  end
end
