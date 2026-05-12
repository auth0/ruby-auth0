# frozen_string_literal: true

module Auth0
  module Types
    # A group member of member_type user
    class EventStreamCloudEventGroupMemberDeletedObjectMember0 < Internal::Types::Model
      field :member_type, -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedObjectMember0MemberTypeEnum }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
