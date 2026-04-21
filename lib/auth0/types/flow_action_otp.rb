# frozen_string_literal: true

module Auth0
  module Types
    class FlowActionOtp < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { Auth0::Types::FlowActionOtpGenerateCode }
      member -> { Auth0::Types::FlowActionOtpVerifyCode }
    end
  end
end
