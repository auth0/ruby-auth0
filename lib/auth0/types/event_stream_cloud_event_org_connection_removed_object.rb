# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventOrgConnectionRemovedObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgConnectionRemovedObjectOrganization }, optional: false, nullable: false
      field :connection, -> { Auth0::Types::EventStreamCloudEventOrgConnectionRemovedObjectConnection }, optional: false, nullable: false
    end
  end
end
