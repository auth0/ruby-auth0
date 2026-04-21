# frozen_string_literal: true

module Auth0
  module Types
    class CreateDirectoryProvisioningRequestContent < Internal::Types::Model
      field :mapping, -> { Internal::Types::Array[Auth0::Types::DirectoryProvisioningMappingItem] }, optional: true, nullable: false
      field :synchronize_automatically, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :synchronize_groups, -> { Auth0::Types::SynchronizeGroupsEnum }, optional: true, nullable: false
    end
  end
end
