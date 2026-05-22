# frozen_string_literal: true

module Auth0
  module Types
    # The organization the member belongs to.
    class EventStreamCloudEventOrgMemberDeletedObjectOrganization < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
