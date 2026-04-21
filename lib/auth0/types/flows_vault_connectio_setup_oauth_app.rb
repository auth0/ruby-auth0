# frozen_string_literal: true

module Auth0
  module Types
    class FlowsVaultConnectioSetupOauthApp < Internal::Types::Model
      field :type, -> { Auth0::Types::FlowsVaultConnectioSetupTypeOauthAppEnum }, optional: false, nullable: false
      field :client_id, -> { String }, optional: false, nullable: false
      field :client_secret, -> { String }, optional: false, nullable: false
      field :domain, -> { String }, optional: false, nullable: false
      field :audience, -> { String }, optional: true, nullable: false
    end
  end
end
