# frozen_string_literal: true

module Auth0
  module Types
    class FlowsVaultConnectionHttpApiKeySetup < Internal::Types::Model
      field :type, -> { Auth0::Types::FlowsVaultConnectionSetupTypeAPIKeyEnum }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
      field :in_, -> { Auth0::Types::FlowsVaultConnectionHttpApiKeySetupInEnum }, optional: false, nullable: false, api_name: "in"
    end
  end
end
