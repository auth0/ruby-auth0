# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventOrgMemberDeletedPreviousObject < Internal::Types::Model
      field :organization, -> { Auth0::Types::EventStreamCloudEventOrgMemberDeletedPreviousObjectOrganization }, optional: false, nullable: false

      field :user, -> { Auth0::Types::EventStreamCloudEventOrgMemberDeletedPreviousObjectUser }, optional: false, nullable: false
    end
  end
end
