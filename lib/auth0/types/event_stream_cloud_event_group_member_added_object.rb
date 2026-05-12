# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventGroupMemberAddedObject < Internal::Types::Model
      field :group, -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedObjectGroup }, optional: false, nullable: false
      field :member, -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedObjectMember }, optional: false, nullable: false
    end
  end
end
