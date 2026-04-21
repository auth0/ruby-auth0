# frozen_string_literal: true

module Auth0
  module Flows
    module Vault
      module Connections
        module Types
          class UpdateFlowsVaultConnectionRequestContent < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :name, -> { String }, optional: true, nullable: false
            field :setup, -> { Auth0::Types::UpdateFlowsVaultConnectionSetup }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
