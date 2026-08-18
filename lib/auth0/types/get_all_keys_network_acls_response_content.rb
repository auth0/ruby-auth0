# frozen_string_literal: true

module Auth0
  module Types
    class GetAllKeysNetworkACLsResponseContent < Internal::Types::Model
      field :keys, -> { Internal::Types::Array[Auth0::Types::NetworkACLKey] }, optional: false, nullable: false
    end
  end
end
