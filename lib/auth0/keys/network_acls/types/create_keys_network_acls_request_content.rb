# frozen_string_literal: true

module Auth0
  module Keys
    module NetworkACLs
      module Types
        class CreateKeysNetworkACLsRequestContent < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false

          field :alg, -> { Auth0::Types::NetworkACLKeyAlgorithmEnum }, optional: false, nullable: false

          field :value, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
