# frozen_string_literal: true

module Auth0
  module Types
    # A group member of member_type group
    class EventStreamCloudEventGroupMemberAddedObjectMember1 < Internal::Types::Model
      field :member_type, -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedObjectMember1MemberTypeEnum }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :connection_id, -> { String }, optional: false, nullable: false
    end
  end
end
