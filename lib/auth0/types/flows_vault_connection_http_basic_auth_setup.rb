# frozen_string_literal: true

module Auth0
  module Types
    class FlowsVaultConnectionHTTPBasicAuthSetup < Internal::Types::Model
      field :type, -> { Auth0::Types::FlowsVaultConnectionSetupTypeBasicAuthEnum }, optional: false, nullable: false
      field :username, -> { String }, optional: false, nullable: false
      field :password, -> { String }, optional: true, nullable: false
    end
  end
end
