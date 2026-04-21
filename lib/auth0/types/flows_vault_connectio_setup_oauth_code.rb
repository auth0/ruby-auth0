# frozen_string_literal: true

module Auth0
  module Types
    class FlowsVaultConnectioSetupOauthCode < Internal::Types::Model
      field :type, -> { Auth0::Types::FlowsVaultConnectioSetupTypeOauthCodeEnum }, optional: true, nullable: false
      field :code, -> { String }, optional: true, nullable: false
    end
  end
end
