# frozen_string_literal: true

module Auth0
  module Types
    # Represents the metadata of a group membership.
    class GroupMember < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :member_type, -> { Auth0::Types::GroupMemberTypeEnum }, optional: true, nullable: false
      field :type, -> { Auth0::Types::GroupTypeEnum }, optional: true, nullable: false
      field :connection_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
