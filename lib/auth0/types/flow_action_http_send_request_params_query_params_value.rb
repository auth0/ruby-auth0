# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionHTTPSendRequestParamsQueryParamsValue < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Integer }
      member -> { String }
    end
  end
end
