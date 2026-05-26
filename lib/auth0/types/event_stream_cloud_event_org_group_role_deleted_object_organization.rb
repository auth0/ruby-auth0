# frozen_string_literal: true

module Auth0
  module Types
    # The organization the group role is removed from.
    class EventStreamCloudEventOrgGroupRoleDeletedObjectOrganization < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
