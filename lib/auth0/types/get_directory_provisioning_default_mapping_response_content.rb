# frozen_string_literal: true

module Auth0
  module Types
    class GetDirectoryProvisioningDefaultMappingResponseContent < Internal::Types::Model
      field :mapping, -> { Internal::Types::Array[Auth0::Types::DirectoryProvisioningMappingItem] }, optional: true, nullable: false
    end
  end
end
