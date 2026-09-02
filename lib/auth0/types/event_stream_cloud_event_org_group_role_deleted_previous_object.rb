# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventOrgGroupRoleDeletedPreviousObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedPreviousObjectOrganization }, optional: false, nullable: false

      field :role, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedPreviousObjectRole }, optional: false, nullable: false

      field :group, -> { Auth0::Types::EventStreamCloudEventOrgGroupRoleDeletedPreviousObjectGroup }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false
    end
  end
end
