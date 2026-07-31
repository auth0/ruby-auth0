# frozen_string_literal: true

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
  # Header names are matched case-insensitively and accept symbol, snake_case
  # string, or dashed string forms (RestClient normalizes them to symbols such
  # as `:x_ratelimit_limit`). Missing or non-numeric header values yield `nil`.
  #
  # @param headers [Hash, nil] the response headers
  # @return [Auth0::RateLimit]
  def self.from_headers(headers)
    normalized = normalize_keys(headers || {})

    new(
      to_integer(normalized['x_ratelimit_limit']),
      to_integer(normalized['x_ratelimit_remaining']),
      to_reset(normalized['x_ratelimit_reset'])
    )
  end

  # Normalize header keys to lower-case, underscore-separated strings so lookups
  # are case-insensitive and agnostic to symbol/string and dash/underscore forms.
  def self.normalize_keys(headers)
    headers.each_with_object({}) do |(key, value), acc|
      acc[key.to_s.downcase.tr('-', '_')] = value
    end
  end
  private_class_method :normalize_keys

  # Parse an integer header value, returning nil for blank or non-numeric input
  # (so a malformed header is never silently reported as 0).
  def self.to_integer(value)
    Integer(value.to_s.strip, exception: false)
  end
  private_class_method :to_integer

  def self.to_reset(value)
    epoch = to_integer(value)
    epoch.nil? ? nil : Time.at(epoch).utc
  end
  private_class_method :to_reset
end
