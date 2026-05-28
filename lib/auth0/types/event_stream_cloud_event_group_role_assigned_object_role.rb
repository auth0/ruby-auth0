# frozen_string_literal: true

module Auth0
  module Types
    # The role assigned to the group.
    class EventStreamCloudEventGroupRoleAssignedObjectRole < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
