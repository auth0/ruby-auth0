# frozen_string_literal: true

module Auth0
  module Types
    class CreateLogStreamRequestContent < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::CreateLogStreamHTTPRequestBody }
      member -> { Auth0::Types::CreateLogStreamEventBridgeRequestBody }
      member -> { Auth0::Types::CreateLogStreamEventGridRequestBody }
      member -> { Auth0::Types::CreateLogStreamDatadogRequestBody }
      member -> { Auth0::Types::CreateLogStreamSplunkRequestBody }
      member -> { Auth0::Types::CreateLogStreamSumoRequestBody }
      member -> { Auth0::Types::CreateLogStreamSegmentRequestBody }
      member -> { Auth0::Types::CreateLogStreamMixpanelRequestBody }
    end
  end
end
