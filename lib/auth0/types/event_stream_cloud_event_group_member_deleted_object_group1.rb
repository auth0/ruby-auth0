# frozen_string_literal: true

module Auth0
  module Types
    # Reference to an organization group
    class EventStreamCloudEventGroupMemberDeletedObjectGroup1 < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :external_id, -> { String }, optional: true, nullable: false

      field :type, -> { Auth0::Types::EventStreamCloudEventGroupMemberDeletedObjectGroup1TypeEnum }, optional: false, nullable: false

      field :organization_id, -> { String }, optional: false, nullable: false
    end
  end
end
