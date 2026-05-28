# frozen_string_literal: true

module Auth0
  module Types
    class OrganizationMemberEffectiveRole < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :sources, -> { Internal::Types::Array[Auth0::Types::OrganizationMemberEffectiveRoleSource] }, optional: false, nullable: false
    end
  end
end
