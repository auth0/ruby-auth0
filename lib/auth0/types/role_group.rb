# frozen_string_literal: true

module Auth0
  module Types
    # A group assigned to a role in the context of an organization.
    class RoleGroup < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: true, nullable: false

      field :connection_id, -> { String }, optional: true, nullable: false

      field :organization_id, -> { String }, optional: true, nullable: false

      field :tenant_name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
