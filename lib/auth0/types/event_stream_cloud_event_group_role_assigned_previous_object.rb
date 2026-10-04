# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventGroupRoleAssignedPreviousObject < Internal::Types::Model
      field :group, -> { Auth0::Types::EventStreamCloudEventGroupRoleAssignedPreviousObjectGroup }, optional: false, nullable: false

      field :role, -> { Auth0::Types::EventStreamCloudEventGroupRoleAssignedPreviousObjectRole }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false
    end
  end
end
