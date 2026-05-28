# frozen_string_literal: true

module Auth0
  module Types
    # Information about the context in which the event was produced. This may include things like
    # HTTP request details, client information, connection information, etc.
    #
    # Note: This field may not be present on all events, depending on the event type and the
    # context in which it was generated.
    class EventStreamCloudEventContext < Internal::Types::Model
      field :client, -> { Auth0::Types::EventStreamCloudEventContextClient }, optional: true, nullable: false

      field :connection, -> { Auth0::Types::EventStreamCloudEventContextConnection }, optional: true, nullable: false

      field :request, -> { Auth0::Types::EventStreamCloudEventContextRequest }, optional: true, nullable: false

      field :tenant, -> { Auth0::Types::EventStreamCloudEventContextTenant }, optional: false, nullable: false
    end
  end
end
