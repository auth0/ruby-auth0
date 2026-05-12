# frozen_string_literal: true

module Auth0
  module Types
    module EventStreamCloudEventErrorCodeEnum
      extend Auth0::Internal::Types::Enum

      INVALID_CURSOR = "invalid_cursor"
      CURSOR_EXPIRED = "cursor_expired"
      TIMEOUT = "timeout"
      PAYLOAD_TOO_LARGE = "payload_too_large"
      PROCESSING_ERROR = "processing_error"
      CONNECTION_TIMEOUT = "connection_timeout"
    end
  end
end
