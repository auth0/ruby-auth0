# frozen_string_literal: true

module Auth0
  module Keys
    module CustomSigning
      module Types
        class SetCustomSigningKeysRequestContent < Internal::Types::Model
          field :keys, -> { Internal::Types::Array[Auth0::Types::CustomSigningKeyJwk] }, optional: false, nullable: false
        end
      end
    end
  end
end
