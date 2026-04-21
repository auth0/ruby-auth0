# frozen_string_literal: true

module Auth0
  module Types
    class OrganizationMember < Internal::Types::Model
      field :user_id, -> { String }, optional: true, nullable: false
      field :picture, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :roles, -> { Internal::Types::Array[Auth0::Types::OrganizationMemberRole] }, optional: true, nullable: false
    end
  end
end
