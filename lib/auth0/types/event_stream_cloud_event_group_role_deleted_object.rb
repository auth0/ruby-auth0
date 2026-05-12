# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventGroupRoleDeletedObject < Internal::Types::Model
      field :group, -> { Auth0::Types::EventStreamCloudEventGroupRoleDeletedObjectGroup }, optional: false, nullable: false
      field :role, -> { Auth0::Types::EventStreamCloudEventGroupRoleDeletedObjectRole }, optional: false, nullable: false
      field :deleted_at, -> { String }, optional: false, nullable: false
    end
  end
end
