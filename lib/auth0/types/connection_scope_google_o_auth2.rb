# frozen_string_literal: true

module Auth0
  module Types
    module ConnectionScopeGoogleOAuth2
      # ConnectionScopeGoogleOAuth2 is an alias for ConnectionScopeArray

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
