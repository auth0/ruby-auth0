# frozen_string_literal: true

module Auth0
  module Types
    class UserGroupsResponseSchema < Internal::Types::Model
      field :membership_created_at, -> { String }, optional: true, nullable: false
    end
  end
end
