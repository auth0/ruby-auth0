# frozen_string_literal: true

module Auth0
  module Types
    class RefreshTokenDate < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }
      member -> { Internal::Types::Hash[String, Object] }
    end
  end
end
