# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventOrgMemberDeletedObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgMemberDeletedObjectOrganization }, optional: false, nullable: false

      field :user, -> { Auth0::Types::EventStreamCloudEventOrgMemberDeletedObjectUser }, optional: false, nullable: false
    end
  end
end
