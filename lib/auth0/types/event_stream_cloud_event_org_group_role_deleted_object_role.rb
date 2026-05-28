# frozen_string_literal: true

module Auth0
  module Types
    # The role removed from the group.
    class EventStreamCloudEventOrgGroupRoleDeletedObjectRole < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
