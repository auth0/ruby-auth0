# frozen_string_literal: true

module Auth0
  module Types
    class ConnectionUpstreamAdditionalProperties < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::ConnectionUpstreamAlias }
      member -> { Auth0::Types::ConnectionUpstreamValue }
    end
  end
end
