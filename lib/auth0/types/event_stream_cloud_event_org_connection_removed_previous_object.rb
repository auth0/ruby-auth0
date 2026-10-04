# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventOrgConnectionRemovedPreviousObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgConnectionRemovedPreviousObjectOrganization }, optional: false, nullable: false

      field :connection, -> { Auth0::Types::EventStreamCloudEventOrgConnectionRemovedPreviousObjectConnection }, optional: false, nullable: false
    end
  end
end
