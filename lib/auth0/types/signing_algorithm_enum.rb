# frozen_string_literal: true

module Auth0
  module Types
    module SigningAlgorithmEnum
      extend Auth0::Internal::Types::Enum

      HS256 = "HS256"
      RS256 = "RS256"
      RS512 = "RS512"
      PS256 = "PS256"
    end
  end
end
