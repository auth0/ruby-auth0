# frozen_string_literal: true

module Auth0
  module Types
    # The Cross App Access resource app status configuration.
    class ConnectionProfileCrossAppAccessResourceAppStatus < Internal::Types::Model
      field :default_value, -> { Auth0::Types::ConnectionProfileCrossAppAccessResourceAppStatusDefaultValueEnum }, optional: false, nullable: false

      field :allowed_values, -> { Internal::Types::Array[Auth0::Types::ConnectionProfileCrossAppAccessResourceAppStatusValueEnum] }, optional: true, nullable: false
    end
  end
end
