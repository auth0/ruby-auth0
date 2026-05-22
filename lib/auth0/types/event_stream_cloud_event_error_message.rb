# frozen_string_literal: true

module Auth0
  module Types
    # An error message delivered via the SSE stream. The stream closes after this message.
    class EventStreamCloudEventErrorMessage < Internal::Types::Model
      field :error, -> { Auth0::Types::EventStreamCloudEventErrorDetail }, optional: false, nullable: false
    end
  end
end
