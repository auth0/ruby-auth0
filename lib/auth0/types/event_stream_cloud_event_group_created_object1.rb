# frozen_string_literal: true

module Auth0
  module Types
    # Represents an organization group entity.
    class EventStreamCloudEventGroupCreatedObject1 < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :external_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :type, -> { Auth0::Types::EventStreamCloudEventGroupCreatedObject1TypeEnum }, optional: false, nullable: false
      field :organization_id, -> { String }, optional: false, nullable: false
    end
  end
end
