# frozen_string_literal: true

module Auth0
  module Types
    # Configuration for token exchange.
    class ClientTokenExchangeConfigurationOrNull < Internal::Types::Model
      field :allow_any_profile_of_type, -> { Internal::Types::Array[Auth0::Types::ClientTokenExchangeTypeEnum] }, optional: true, nullable: false
    end
  end
end
