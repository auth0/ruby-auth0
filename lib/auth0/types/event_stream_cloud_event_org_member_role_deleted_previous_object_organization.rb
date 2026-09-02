# frozen_string_literal: true

module Auth0
  module Types
    # The organization the member belongs to.
    class EventStreamCloudEventOrgMemberRoleDeletedPreviousObjectOrganization < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
