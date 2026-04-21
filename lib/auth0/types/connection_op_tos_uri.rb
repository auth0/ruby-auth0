# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionOpTosURI
      # ConnectionOpTosURI is an alias for ConnectionHttpsUrlWithHttpFallback255

      # @option str [String]
      #
      # @return [untyped]
      def self.load(str)
        ::JSON.parse(str)
      end

      # @option value [untyped]
      #
      # @return [String]
      def self.dump(value)
        ::JSON.generate(value)
      end
    end
  end
end
