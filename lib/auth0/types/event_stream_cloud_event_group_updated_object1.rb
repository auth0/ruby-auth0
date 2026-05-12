# frozen_string_literal: true

module Auth0
  module Types
    # Organization group with updated_at timestamp
    class EventStreamCloudEventGroupUpdatedObject1 < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :external_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :type, -> { Auth0::Types::EventStreamCloudEventGroupUpdatedObject1TypeEnum }, optional: false, nullable: false
      field :organization_id, -> { String }, optional: false, nullable: false
      field :updated_at, -> { String }, optional: false, nullable: false
    end
  end
end
