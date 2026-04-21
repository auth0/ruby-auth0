# frozen_string_literal: true

module Auth0
  module Types
    class FlowsVaultConnectioSetupToken < Internal::Types::Model
      field :type, -> { Auth0::Types::FlowsVaultConnectioSetupTypeTokenEnum }, optional: false, nullable: false
      field :token, -> { String }, optional: false, nullable: false
    end
  end
end
