# frozen_string_literal: true

module Auth0
  module Types
    # Reference to a tenant group
    class EventStreamCloudEventGroupRoleDeletedPreviousObjectGroup2 < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: true, nullable: false

      field :type, -> { Auth0::Types::EventStreamCloudEventGroupRoleDeletedPreviousObjectGroup2TypeEnum }, optional: false, nullable: false
    end
  end
end
