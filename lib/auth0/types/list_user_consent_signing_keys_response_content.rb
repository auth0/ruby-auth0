# frozen_string_literal: true

module Auth0
  module Types
    class ListUserConsentSigningKeysResponseContent < Internal::Types::Model
      field :keys, -> { Internal::Types::Array[Auth0::Types::ConsentSigningKey] }, optional: false, nullable: false
    end
  end
end
