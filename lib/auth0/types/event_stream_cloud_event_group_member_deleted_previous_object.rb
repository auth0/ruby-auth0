# frozen_string_literal: true

module Auth0
  module Types
    # The event content as it was prior to the change described by this event, when applicable.
    class EventStreamCloudEventGroupMemberDeletedPreviousObject < Internal::Types::Model
      field :group, -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedPreviousObjectGroup }, optional: false, nullable: false

      field :member, -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedPreviousObjectMember }, optional: false, nullable: false
    end
  end
end
