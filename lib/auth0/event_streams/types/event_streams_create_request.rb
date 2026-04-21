# frozen_string_literal: true

module Auth0
  module EventStreams
    module Types
      class EventStreamsCreateRequest < Internal::Types::Model
        extend Auth0::Internal::Types::Union

        member -> { Auth0::Types::CreateEventStreamWebHookRequestContent }
        member -> { Auth0::Types::CreateEventStreamEventBridgeRequestContent }
        member -> { Auth0::Types::CreateEventStreamActionRequestContent }
      end
    end
  end
end
