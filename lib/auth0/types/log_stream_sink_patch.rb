# frozen_string_literal: true

module Auth0
  module Types
    class LogStreamSinkPatch < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::LogStreamHTTPSink }
      member -> { Auth0::Types::LogStreamDatadogSink }
      member -> { Auth0::Types::LogStreamSplunkSink }
      member -> { Auth0::Types::LogStreamSumoSink }
      member -> { Auth0::Types::LogStreamSegmentSink }
      member -> { Auth0::Types::LogStreamMixpanelSinkPatch }
    end
  end
end
