# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventOrgMemberAddedObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgMemberAddedObjectOrganization }, optional: false, nullable: false
      field :user, -> { Auth0::Types::EventStreamCloudEventOrgMemberAddedObjectUser }, optional: false, nullable: false
    end
  end
end
