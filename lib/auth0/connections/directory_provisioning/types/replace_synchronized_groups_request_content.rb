# frozen_string_literal: true

module Auth0
  module Connections
    module DirectoryProvisioning
      module Types
        class ReplaceSynchronizedGroupsRequestContent < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :groups, -> { Internal::Types::Array[Auth0::Types::SynchronizedGroupPayload] }, optional: false, nullable: false
        end
      end
    end
  end
end
