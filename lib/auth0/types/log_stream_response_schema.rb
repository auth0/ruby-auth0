# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamResponseSchema < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::LogStreamHTTPResponseSchema }
      member -> { Auth0::Types::LogStreamEventBridgeResponseSchema }
      member -> { Auth0::Types::LogStreamEventGridResponseSchema }
      member -> { Auth0::Types::LogStreamDatadogResponseSchema }
      member -> { Auth0::Types::LogStreamSplunkResponseSchema }
      member -> { Auth0::Types::LogStreamSumoResponseSchema }
      member -> { Auth0::Types::LogStreamSegmentResponseSchema }
      member -> { Auth0::Types::LogStreamMixpanelResponseSchema }
    end
  end
end
