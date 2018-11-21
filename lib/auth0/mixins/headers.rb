require 'json'

module Auth0
  module Mixins
    # Module to provide necessary headers for API requests.
    module Headers
      def telemetry
        telemetry_hash = {
          name: 'ruby-auth0',
          version: Auth0::VERSION,
          env: {
            ruby: RUBY_VERSION
          }
        }

        if Gem.loaded_specs['rails'].respond_to? :version
          telemetry_hash[:env][:rails] = Gem.loaded_specs['rails'].version.to_s
        end

        telemetry_hash
      end

      def telemetry_encoded
        Base64.urlsafe_encode64(JSON.dump(telemetry))
      end

      def client_headers
        {
          'Content-Type' => 'application/json',
          'Auth0-Client' => telemetry_encoded
        }
      end
    end
  end
end
