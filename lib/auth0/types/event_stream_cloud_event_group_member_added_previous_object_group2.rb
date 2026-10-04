# frozen_string_literal: true

module Auth0
  module Types
    # Reference to a tenant group
    class EventStreamCloudEventGroupMemberAddedPreviousObjectGroup2 < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: true, nullable: false

      field :type, -> { Auth0::Types::EventStreamCloudEventGroupMemberAddedPreviousObjectGroup2TypeEnum }, optional: false, nullable: false
    end
  end
end
