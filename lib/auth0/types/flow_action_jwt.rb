# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionJwt < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionJwtDecodeJwt }
      member -> { Auth0::Types::FlowActionJwtSignJwt }
      member -> { Auth0::Types::FlowActionJwtVerifyJwt }
    end
  end
end
