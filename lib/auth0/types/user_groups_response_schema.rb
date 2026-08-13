# frozen_string_literal: true

module Auth0
  module Types
    class UserGroupsResponseSchema < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :external_id, -> { String }, optional: true, nullable: false

      field :connection_id, -> { String }, optional: true, nullable: false

      field :tenant_name, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false

      field :membership_created_at, -> { String }, optional: true, nullable: false
    end
  end
end
