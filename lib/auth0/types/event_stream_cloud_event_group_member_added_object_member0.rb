# frozen_string_literal: true

module Auth0
  module Types
    # A group member of member_type user
    class EventStreamCloudEventGroupMemberAddedObjectMember0 < Internal::Types::Model
      field :member_type, -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedObjectMember0MemberTypeEnum }, optional: false, nullable: false

      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
