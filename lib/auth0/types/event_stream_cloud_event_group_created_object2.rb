# frozen_string_literal: true

module Auth0
  module Types
    # Represents a tenant group entity.
    class EventStreamCloudEventGroupCreatedObject2 < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :external_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :type, -> { Auth0::Types::EventStreamCloudEventGroupCreatedObject2TypeEnum }, optional: false, nullable: false
    end
  end
end
