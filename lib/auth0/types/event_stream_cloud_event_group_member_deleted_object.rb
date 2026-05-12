# frozen_string_literal: true

module Auth0
  module Types
    # The event content.
    class EventStreamCloudEventGroupMemberDeletedObject < Internal::Types::Model
      field :group, -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedObjectGroup }, optional: false, nullable: false
      field :member, -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedObjectMember }, optional: false, nullable: false
    end
  end
end
