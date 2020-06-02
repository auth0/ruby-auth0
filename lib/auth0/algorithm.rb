require 'zache'

class Zache
  def last(key)
    @hash[key]
  end
end

module Auth0
  module Algorithm
    class RS256
      include Auth0::Mixins::HTTPProxy

      @@cache = Zache.new.freeze

      class << self
        private :new

        def jwks_url(url)
          new url
        end
      end

      def initialize(jwks_url)
        raise Auth0::InvalidParameter, 'Must supply a valid jwks_url' if jwks_url.to_s.empty?

        @jwks_url = jwks_url
      end

      def jwks
        lifetime = 10 * 60 # 10 minutes
        previous_value = @@cache.last(:jwks)[:value] unless @@cache.last(:jwks).nil?

        @@cache.get(:jwks, lifetime: lifetime) do
          result = get(@jwks_url)
          result.is_a?(Hash) && result.key?('keys') ? result : previous_value
        end
      end
    end

    class HS256
      class << self
        private :new

        def secret(secret)
          new secret
        end
      end

      attr_accessor :secret

      def initialize(secret)
        raise Auth0::InvalidParameter, 'Must supply a valid secret' if secret.to_s.empty?

        @secret = secret
      end
    end
  end
end

# TODO: Extract the common parts to a mixin
