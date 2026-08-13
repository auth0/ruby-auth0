# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventGroupRoleAssignedObject < Internal::Types::Model
      field :group, -> { Auth0::Types::EventStreamCloudEventGroupRoleAssignedObjectGroup }, optional: false, nullable: false

      field :role, -> { Auth0::Types::EventStreamCloudEventGroupRoleAssignedObjectRole }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false
    end
  end
end
