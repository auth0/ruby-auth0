require 'zache'

module Auth0
  module Algorithm
    class RS256
      class << self
        protected :new

        def jwks_path(path = '/.well-known/jwks.json')
          new path
        end
      end

      def initialize(jwks_path)
        raise Auth0::InvalidParameter, 'Must supply a valid jwks_path' if jwks_path.to_s.empty?

        @jwks_path = jwks_path
      end

      def jwks
        lifetime = 10 * 60 # 10 minutes
        previous_value = @@cache.hash[:jwks][:value]

        @@cache.get(:jwks, lifetime: lifetime) do
          result = get(jwks_path)
          result.is_a?(Hash) && result.key?('keys') ? result : previous_value
        end
      end

      private

      @@cache = Zache.new

      attr_accessor :jwks_path
    end

    class HS256
      class << self
        protected :new

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