# frozen_string_literal: true

module Auth0
  # Rate limit information parsed from the `x-ratelimit-*` headers Auth0 returns
  # on Management API responses.
  #
  # @see https://auth0.com/docs/troubleshoot/customer-support/operational-policies/rate-limit-policy
  #
  # @!attribute limit
  #   @return [Integer, nil] the maximum number of requests allowed in the current window
  # @!attribute remaining
  #   @return [Integer, nil] the number of requests remaining in the current window
  # @!attribute reset
  #   @return [Time, nil] the UTC time at which the current window resets
  Auth0::RateLimit = Struct.new(:limit, :remaining, :reset) do
    # Build a RateLimit from a response headers hash.
    #
    # Header keys are matched case-insensitively and accept symbol, snake_case
    # string, or dashed string forms (RestClient normalizes them to symbols such
    # as `:x_ratelimit_limit`). Missing headers yield `nil` values.
    #
    # @param headers [Hash, nil] the response headers
    # @return [Auth0::RateLimit]
    def self.from_headers(headers)
      headers ||= {}
      limit = header_value(headers, :x_ratelimit_limit)
      remaining = header_value(headers, :x_ratelimit_remaining)
      reset = header_value(headers, :x_ratelimit_reset)

      new(
        limit&.to_i,
        remaining&.to_i,
        reset.nil? ? nil : Time.at(reset.to_i).utc
      )
    end

    def self.header_value(headers, symbol_key)
      headers[symbol_key] ||
        headers[symbol_key.to_s] ||
        headers[symbol_key.to_s.tr('_', '-')]
    end
    private_class_method :header_value
  end
end
