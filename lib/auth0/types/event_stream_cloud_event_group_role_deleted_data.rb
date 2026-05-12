# frozen_string_literal: true

module Auth0
  module Types
    # The event payload.
    class EventStreamCloudEventGroupRoleDeletedData < Internal::Types::Model
      field :object, -> { Auth0::Types::EventStreamCloudEventGroupRoleDeletedObject }, optional: false, nullable: false
      field :context, -> { Auth0::Types::EventStreamCloudEventContext }, optional: true, nullable: false
    end
  end
end
