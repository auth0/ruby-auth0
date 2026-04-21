# frozen_string_literal: true

module Auth0
  module Types
    class UpdateDirectoryProvisioningResponseContent < Internal::Types::Model
      field :connection_id, -> { String }, optional: false, nullable: false
      field :connection_name, -> { String }, optional: false, nullable: false
      field :strategy, -> { String }, optional: false, nullable: false
      field :mapping, -> { Internal::Types::Array[Auth0::Types::DirectoryProvisioningMappingItem] }, optional: false, nullable: false
      field :synchronize_automatically, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :synchronize_groups, -> { Auth0::Types::SynchronizeGroupsEnum }, optional: true, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :updated_at, -> { String }, optional: false, nullable: false
      field :last_synchronization_at, -> { String }, optional: true, nullable: false
      field :last_synchronization_status, -> { String }, optional: true, nullable: false
      field :last_synchronization_error, -> { String }, optional: true, nullable: false
    end
  end
end
