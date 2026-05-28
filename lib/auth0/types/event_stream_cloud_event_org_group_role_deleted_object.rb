# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventOrgGroupRoleDeletedObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedObjectOrganization }, optional: false, nullable: false

      field :role, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedObjectRole }, optional: false, nullable: false

      field :group, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedObjectGroup }, optional: false, nullable: false

      field :deleted_at, -> { String }, optional: false, nullable: false
    end
  end
end
